package com.book.shop.action;

import java.util.*;

import javax.servlet.http.*;

import com.book.shop.delegate.BookDelegate;
import com.book.shop.to.*;
import com.book.shop.validator.BOOKDataValidator;

public class AddBookToCartAction {

    public String addBookToCart(HttpServletRequest req,HttpServletResponse res){
        String page="searchBookDef.jsp";
        String bid=req.getParameter("bookId");
        String quantity=req.getParameter("quantityNeed");
        String stk=req.getParameter("stock");
        int stock=Integer.parseInt(stk);
        int bqty=0;
        boolean convertQuantity=true;
        boolean executeQuery=true;
        int bookId=Integer.parseInt(bid);
        HttpSession sess=req.getSession();
        Object obj=sess.getAttribute("SELECTED_BOOK_LIST");
        Set selectedBookList=null;
        BookTo bto=null;

        //VALIDATING Quantity

        if(!BOOKDataValidator.validateRequired(quantity)){
            req.setAttribute("quantityNeed", "Quantity is required");
            convertQuantity=false;
            executeQuery=false;
        }else if(!(quantity.charAt(0)>=0 ||quantity.charAt(0)<=9)){
            req.setAttribute("quantityNeed", "Numeric value is allowed");
            convertQuantity=false;
            executeQuery=false;
        }else if(quantity.charAt(0)==45){
            req.setAttribute("quantityNeed", "Negative value is not allowed");
            convertQuantity=false;
            executeQuery=false;
        }

        if(convertQuantity){
            try {
                bqty=Integer.parseInt(quantity);
                if(bqty>stock){
                    executeQuery=false;
                    req.setAttribute("quantityNeed", "Out of Stock");
                }

            } catch (Exception e) {
                req.setAttribute("quantityNeed", "Only Numeric value is required");
                executeQuery=false;
            }
        }


        if(executeQuery){
            if(obj!=null){
                selectedBookList=(Set)obj;
                Iterator it=selectedBookList.iterator();
                boolean avail=false;
                while (it.hasNext()) {
                    BookTo bookTo = (BookTo) it.next();
                    if(bookTo.getBookId()==bookId){
                        bto=bookTo;
                        avail=true;
                        break;
                    }
                }if(!avail){
                    bto=BookDelegate.getBookById(bid);
                }
            }else{
                selectedBookList=new HashSet();
                bto=BookDelegate.getBookById(bid);
            }

            bto.setSelectedNumberOfBook(bqty);
            req.setAttribute("ADDED_TO_CART_MESSAGE", "ADDED");
            req.setAttribute("ADDED_BOOK", bto);
            selectedBookList.add(bto);
            sess.setAttribute("SELECTED_BOOK_LIST", selectedBookList);
        }else{
            req.setAttribute("CURRENT_BOOK_ID", bookId);
            req.setAttribute("INVALID", executeQuery);
        }
        return page;
    }
}