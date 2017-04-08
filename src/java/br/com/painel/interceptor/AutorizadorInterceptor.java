/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Rafael Monteiro
 */
public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

    @Override
  public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object controller) throws Exception {

      String uri = request.getRequestURI();
      if(uri.endsWith("recuperarSenha") || uri.endsWith("recuperar") || uri.endsWith("registrar") || uri.endsWith("index") || uri.endsWith("registro") || uri.endsWith("login") || uri.endsWith("efetuaLogin") || uri.contains("resources") || uri.contains("uploads")){
        return true;
      }

      if(request.getSession().getAttribute("usuarioLogado") != null) {
        return true;
      }

      response.sendRedirect("login");
      return false;
  }
}
