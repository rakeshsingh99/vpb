package com.book.shop.action;


import javax.servlet.http.*;

import com.book.shop.delegate.BookDelegate;
import com.book.shop.to.BookTo;
import com.book.shop.validator.BOOKDataValidator;


public class AddBookAction {

    public String addBookInfo(HttpServletRequest req,HttpServletResponse res){

        String page="addBookDef.jsp";
        String bnm=req.getParameter("bname");
        String cls=req.getParameter("class");
        String author=req.getParameter("author");
        String cost=req.getParameter("cost");
        String pub=req.getParameter("publication");
        String edi=req.getParameter("edition");
        String qty=req.getParameter("quantity");
        int bqty=0;
        float bcost=0.0f;
        boolean convertQuantity=true;
        boolean convertCost=true;
        boolean intractWithDB=true;

        //VALIDATING BOOK NAME

        if(!BOOKDataValidator.validateRequired(bnm)){
            req.setAttribute("bname", "Book name is required");
            intractWithDB=false;
        }else if (!BOOKDataValidator.minLength(bnm, 3)) {
            req.setAttribute("bname", "Book name must be minimum 3 character");
            intractWithDB=false;
        }else if (!BOOKDataValidator.maxLength(bnm, 60)) {
            req.setAttribute("bname", "Book name must be maximum 60 character");
            intractWithDB=false;
        }

        //VALIDATING AUTHOR NAME

        if(!BOOKDataValidator.validateRequired(author)){
            req.setAttribute("author", "Author name is required");
            intractWithDB=false;
        }else if (!BOOKDataValidator.minLength(author, 3)) {
            req.setAttribute("author", "Author name must be minimum 3 character");
            intractWithDB=false;
        }else if (!BOOKDataValidator.maxLength(author, 50)) {
            req.setAttribute("author", "Author name must be maximum 50 character");
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
        }else if(!(qty.charAt(0)>=0 ||qty.charAt(0)<=9)){
            req.setAttribute("quantity", "Numeric value is allowed");
            intractWithDB=false;
            convertQuantity=false;
        }

        //VALIDATING EDITION

        if(!BOOKDataValidator.validateRequired(edi)){
            req.setAttribute("edition", "Edition is required");
            intractWithDB=false;
        }

        //VALIDATING Class

        if(!BOOKDataValidator.validateRequired(cls)){
            req.setAttribute("class", "Class is required");
            intractWithDB=false;
        }

        //VALIDATING PUBLICATION

        if(!BOOKDataValidator.validateRequired(pub)){
            req.setAttribute("publication", "Publication is required");
            intractWithDB=false;
        }

        if(convertCost){
            try {
                bcost=Float.parseFloat(cost);
            } catch (Exception e) {
                req.setAttribute("cost", "Cost is not valid");
                intractWithDB=false;
            }
        }

        if(convertQuantity){
            try {
                bqty=Integer.parseInt(qty);
                System.out.println(bqty);
            } catch (Exception e) {
                req.setAttribute("quantity", "Quantity is not valid");
                intractWithDB=false;
            }
        }

        if(intractWithDB){
            BookTo bto=new BookTo(bnm,cls,author,pub,edi,bcost,bqty);
            if(BookDelegate.allreadyExist(bto)){
                req.setAttribute("addingBookError", "Book information already available");
            }else{
                boolean added=BookDelegate.addBook(bto);
                if(added){
                    req.setAttribute("addingBookError", "Book information added successfully");
                    req.setAttribute("SHOW_ADD_BOOK", "OK");
                }else{
                    req.setAttribute("addingBookError", "Error in adding book information ");
                }
            }
        }

        return page;

    }
}