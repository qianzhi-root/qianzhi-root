package com.itheima.ssm.controller;

import com.itheima.ssm.domain.Product;
import com.itheima.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

  /*  @RequestMapping("/save.do")
    public  void  save(Product product){

    }*/

    //查询全部产品
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {

        ModelAndView mv = new ModelAndView();
        List<Product> ps = productService.findAll();
        mv.addObject("productList",ps) ;
        mv.setViewName("product-list");
        return mv ;
    }

    //添加产品信息
    @RequestMapping("/save.do")
    public  String  save(Product product) throws  Exception{
        productService.save(product);
        return  "redirect:findAll.do";
    }

    //产品模糊查询
    @RequestMapping("/findByName.do")
    public  ModelAndView findByName(String productName)throws Exception{
        ModelAndView mv = new ModelAndView();
       List<Product> productList = productService.findByName(productName) ;
       mv.addObject("productList",productList);
       mv.setViewName("product-list1");
       return mv ;
    }
}
