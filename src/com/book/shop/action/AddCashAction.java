package com.book.shop.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.shop.delegate.BookDelegate;
import com.book.shop.delegate.OldLedgerDelegate;
import com.book.shop.delegate.OrderDelegate;
import com.book.shop.delegate.TotalDetailDelegate;
import com.book.shop.delegate.UserInfoDelegate;
import com.book.shop.to.BookTo;
import com.book.shop.to.OrderTo;
import com.book.shop.to.TotalDetailTo;
import com.book.shop.to.UserInfoTo;
import com.book.shop.to.UserTo;
import com.book.shop.util.GetTotalAmount;
import com.book.shop.validator.BOOKDataValidator;

public class AddCashAction {

    public static String getAddCash(HttpServletRequest req,
                                    HttpServletResponse res) {

        String page="addBillDef.jsp";
        String shopName=req.getParameter("shopname");
        String paymentMode=req.getParameter("payment");
        String cashDate=req.getParameter("cashdate");
        String cashbillNumber=req.getParameter("cashbillnumber");
        String cashamount=req.getParameter("cashamount");
        int cashAmount=0;
        float dueAmount=0.0f;
        boolean convertCashAmount=true;
        boolean isError=false;




        //VALIDATING AMOUNT PAID

        if(!BOOKDataValidator.validateRequired(cashamount)){
            req.setAttribute("cashamount", "Amount Paid is required");
            isError=true;
        }

        if(convertCashAmount){
            try {
                cashAmount=Integer.parseInt(cashamount);
            } catch (Exception e) {
                req.setAttribute("amountpaid", "Amount Paid is not valid");
                isError=true;
            }
        }




        if(!isError){
            UserInfoTo userInfoTo=UserInfoDelegate.getUserInfoByShopName(shopName);
            dueAmount=(userInfoTo.getDueAmount()-cashAmount);

            Set selectedBookList=null;
            selectedBookList=new HashSet();
            BookTo bto=BookDelegate.getBookById("676");
            selectedBookList.add(bto);

            OrderTo oto=new OrderTo();
            oto.setShopName(userInfoTo.getShopName());
            oto.setStreet(userInfoTo.getStreet());
            oto.setCity(userInfoTo.getCity());
            oto.setPhone(userInfoTo.getPhone());
            oto.setUserId(userInfoTo.getUserId());
            oto.setOrderDate(cashDate);
            oto.setOrderItemList(selectedBookList);
            oto.setTotalAmount(0);
            oto.setTotalItem(1);
            oto.setTotalDiscountAmount(0);
            oto.setExtraDiscount(0);
            oto.setFrightAmount(0);
            oto.setDueAmount(dueAmount);
            oto.setGrandTotal(0);
            oto.setAmountPaid(cashAmount);
            oto.setPaymentMode(paymentMode);
            oto.setReturnAmount(0);
            oto.setBillNumber(Integer.parseInt(cashbillNumber));
            String orderId=OrderDelegate.placeOrder(oto,req.getLocalAddr());
            OrderDelegate.updateDueAmount(userInfoTo.getUserId(), dueAmount);

            if(orderId.length()>0){
                page="customerDetailDef.jsp";


                List orderList=OrderDelegate.getOrderByShopName(shopName);
                TotalDetailTo totdtl=TotalDetailDelegate.getTotalDetailByShopName(shopName);
                float totalBill=totdtl.getTotalBill();
                float totalPaid=totdtl.getTotalPaid();
                float totalReturn=totdtl.getTotalReturn();

                if(orderList!=null){

                    req.setAttribute("ORDER_FOUND", orderList);
                    req.setAttribute("SHOP_NAME", shopName);
                    req.setAttribute("TOTAL_BILL", totalBill);
                    req.setAttribute("TOTAL_PAID", totalPaid);
                    req.setAttribute("TOTAL_RETURN", totalReturn);

                }

                int openingBalance=OldLedgerDelegate.getOpeningBalanceByShopName(shopName);

                if(openingBalance!=0){
                    req.setAttribute("GET_OPENING_BALANCE", openingBalance);
                }
            }

        }

        return page;
    }

}