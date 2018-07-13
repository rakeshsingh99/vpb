package com.book.shop.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class AddBillAction {

    public static String getAddBill(HttpServletRequest req,
                                    HttpServletResponse res) {

        String page="addBillDef.jsp";
        String shopName=req.getParameter("shopname");
        String billDate=req.getParameter("billdate");
        String billNumber=req.getParameter("billnumber");
        String billamount=req.getParameter("billamount");
        String amtPaid=req.getParameter("amountpaid");
        String returnamount=req.getParameter("returnAmount");
        int billAmount=0;
        int amountPaid=0;
        int returnAmount=0;
        float dueAmount=0.0f;
        boolean convertBillAmount=true;
        boolean convertAmountPaid=true;
        boolean convertReturnAmount=true;
        boolean isError=false;



        //VALIDATING BILL AMOUNT

        if(!BOOKDataValidator.validateRequired(billamount)){
            req.setAttribute("billamount", "Bill Amount is required");
            isError=true;
        }

        if(convertBillAmount){
            try {
                billAmount=Integer.parseInt(billamount);
            } catch (Exception e) {
                req.setAttribute("billamount", "Bill Amount is not valid");
                isError=true;
            }
        }

        //VALIDATING AMOUNT PAID

        if(!BOOKDataValidator.validateRequired(amtPaid)){
            req.setAttribute("amountpaid", "Amount Paid is required");
            isError=true;
        }

        if(convertAmountPaid){
            try {
                amountPaid=Integer.parseInt(amtPaid);
            } catch (Exception e) {
                req.setAttribute("amountpaid", "Amount Paid is not valid");
                isError=true;
            }
        }


        //VALIDATING RETURN AMOUNT

        if(!BOOKDataValidator.validateRequired(returnamount)){
            req.setAttribute("returnAmount", "Return Amount is required");
            isError=true;
        }

        if(convertReturnAmount){
            try {
                returnAmount=Integer.parseInt(returnamount);
            } catch (Exception e) {
                req.setAttribute("returnAmount", "Return Amount is not valid");
                isError=true;
            }
        }


        if(!isError){
            System.out.println(billAmount);
            System.out.println(amountPaid);
            System.out.println(billAmount-amountPaid);
            UserInfoTo userInfoTo=UserInfoDelegate.getUserInfoByShopName(shopName);
            dueAmount=userInfoTo.getDueAmount()+(billAmount - (amountPaid+returnAmount));

            Set selectedBookList=null;
            selectedBookList=new HashSet();
            BookTo bto=BookDelegate.getBookById("874");
            selectedBookList.add(bto);

            OrderTo oto=new OrderTo();
            oto.setShopName(userInfoTo.getShopName());
            oto.setStreet(userInfoTo.getStreet());
            oto.setCity(userInfoTo.getCity());
            oto.setPhone(userInfoTo.getPhone());
            oto.setUserId(userInfoTo.getUserId());
            oto.setOrderDate(billDate);
            oto.setOrderItemList(selectedBookList);
            oto.setTotalAmount(billAmount);
            oto.setTotalItem(1);
            oto.setTotalDiscountAmount(billAmount);
            oto.setExtraDiscount(0);
            oto.setFrightAmount(0);
            oto.setDueAmount(dueAmount);
            oto.setGrandTotal(billAmount);
            oto.setAmountPaid(amountPaid);
            oto.setPaymentMode("");
            oto.setReturnAmount(returnAmount);
            oto.setBillNumber(Integer.parseInt(billNumber));
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