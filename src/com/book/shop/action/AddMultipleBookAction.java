package com.book.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.shop.delegate.BookDelegate;
import com.book.shop.to.BookTo;
import com.book.shop.validator.BOOKDataValidator;

public class AddMultipleBookAction {

    public String addMultipleBookInfo(HttpServletRequest req,
                                      HttpServletResponse res) {


        String page="multipleAddBookDef.jsp";

        String  []bname=req.getParameterValues("bname");
        String []pub=req.getParameterValues("publication");
        String []cls=req.getParameterValues("class");
        String []edi=req.getParameterValues("edition");
        String []cost=req.getParameterValues("cost");
        String []qty=req.getParameterValues("quantity");
        int bqty[]=new int[qty.length];
        float bcost[]=new float[cost.length];
        boolean convertQuantity=true;
        boolean convertCost=true;
        boolean intractWithDB=true;


        //VALIDATING BOOK NAME

        if(!BOOKDataValidator.validateRequired(bname)){
            req.setAttribute("bname", "Book name is required");
            intractWithDB=false;
        }else if (!BOOKDataValidator.minLength(bname, 3)) {
            req.setAttribute("bname", "Book name must be minimum 3 character");
            intractWithDB=false;
        }else if (!BOOKDataValidator.maxLength(bname, 60)) {
            req.setAttribute("bname", "Book name must be maximum 60 character");
            intractWithDB=false;
        }


        //VALIDATING PUBLICATION

        if(!BOOKDataValidator.validateRequired(pub)){
            req.setAttribute("publication", "Publication is required");
            intractWithDB=false;
        }

        //VALIDATING Class

        if(!BOOKDataValidator.validateRequired(cls)){
            req.setAttribute("class", "Class is required");
            intractWithDB=false;
        }

        //VALIDATING EDITION

        if(!BOOKDataValidator.validateRequired(edi)){
            req.setAttribute("edition", "Edition is required");
            intractWithDB=false;
        }

        //VALIDATING COST

        if(!BOOKDataValidator.validateRequired(cost)){
            req.setAttribute("cost", "Cost is required");
            intractWithDB=false;
            convertCost=false;
        }

        //VALIDATING Quantity

        if(!BOOKDataValidator.validateRequired(qty)){
            req.setAttribute("quantity", "Quantity is required");
            intractWithDB=false;
            convertQuantity=false;
        }else if(!BOOKDataValidator.validateIsNumber(qty)){
            req.setAttribute("quantity", "Quantity is required");
            intractWithDB=false;
            convertQuantity=false;
        }

        if(convertCost){
            try {

                int max=cost.length;
                for(int i=0;i<max;i++){
                    bcost[i]=Float.parseFloat(cost[i]);
                    System.out.println(bcost[i]);
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("cost", "Cost is not valid");
                intractWithDB=false;
            }
        }

        if(convertQuantity){
            try {
                int max=qty.length;
                for(int i=0;i<max;i++){
                    bqty[i]=Integer.parseInt(qty[i]);
                    System.out.println(bqty[i]);
                }
            } catch (Exception e) {
                req.setAttribute("quantity", "Quantity is not valid");
                intractWithDB=false;
            }
        }

        if(intractWithDB){

            BookTo bto=new BookTo(bname,cls,pub,edi,bcost,bqty);

            boolean added=BookDelegate.addMultipleBook(bto);
            if(added){
                req.setAttribute("addingBookError", "Book information added successfully");
                req.setAttribute("SHOW_ADD_BOOK", "OK");
            }else{
                req.setAttribute("addingBookError", "Error in adding book information ");
            }

        }

        return page;
    }

}