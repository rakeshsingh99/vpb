package com.book.shop.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.shop.delegate.BookDelegate;
import com.book.shop.delegate.OrderDelegate;
import com.book.shop.delegate.TotalDetailDelegate;
import com.book.shop.delegate.UserDelegate;
import com.book.shop.delegate.UserInfoDelegate;
import com.book.shop.to.BookTo;
import com.book.shop.to.OrderTo;
import com.book.shop.to.TotalDetailTo;
import com.book.shop.to.UserInfoTo;
import com.book.shop.to.UserTo;
import com.book.shop.validator.BOOKDataValidator;

public class AddOpeningBalanceAction {

    public static String getOpeningBalance(HttpServletRequest req,
                                           HttpServletResponse res) {


        String page="oldLedgerBalanceDef.jsp";
        String shopName=req.getParameter("shopname");
        String ledgerYear=req.getParameter("ledgeryear");
        String openingbalance=req.getParameter("openingbalance");

        int openingBalance=0;
        boolean convertOpeningBalance=true;
        boolean isError=false;

        if(!BOOKDataValidator.validateRequired(openingbalance)){
            req.setAttribute("openingbalance", "Opening Balance is required");
            isError=true;
        }

        if(convertOpeningBalance){
            try {
                openingBalance=Integer.parseInt(openingbalance);
            } catch (Exception e) {
                req.setAttribute("openingbalance", "Opening Balance is not valid");
                isError=true;
            }
        }

        if(!isError){

            boolean updated=false;
            updated=UserInfoDelegate.updateOpeningBalance(shopName, openingBalance);

            if(updated){
                List openingBalanceList=UserInfoDelegate.getCustomerOldLedgerBalance();
                if(openingBalanceList!=null){
                    req.setAttribute("OPENING_BALANCE", openingBalanceList);
                    req.setAttribute("ADD_OPENING", updated);
                }
                req.setAttribute("updateError", "Information updated successfully");
            }else{
                req.setAttribute("updateError", "Error occured while updating the information.Please try later");
            }
        }

        return page;
    }

}