<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
  <c:import url="/WEB-INF/views/header.jsp" />
  <body>
    <c:import url="/WEB-INF/views/navbar.jsp" />
    <div class="container text-center mt-5">
      <hr>
      <div class="row">
        <div class="col">
          <h2 class="display-3 mt-3">User Profile</h2>
        </div>
      </div>
      <div class="row">
        <div class="col p-3">
        
          <div class="form-group row mt-2">
            <label for="name" class="col-sm-2 col-form-label display-5">Name:</label>
            <div class="col-sm-9">
              <input type="text" class="form-control rounded-0" id="name" name="name" value=${user.name} disabled>
            </div>
          </div>
          <div class="form-group row mt-2">
            <label for="email" class="col-sm-2 col-form-label display-5">Email:</label>
            <div class="col-sm-9">
              <input type="text" class="form-control rounded-0" id="email" name="email" value=${user.email} disabled>
            </div>
          </div>
          <div class="form-group row mt-2">
            <label for="lastlogin" class="col-sm-2 col-form-label display-5">Last login:</label>
            <div class="col-sm-9">
              <input type="text" class="form-control rounded-0" id="lastlogin" name="lastlogin" value="${user.lastLogin}" disabled>
            </div>
          </div>

        </div>
        <div class="row">
          <div class="col">
            <h2 class="display-6">beta version</h2>
          </div>
        </div>
      </div>
    <c:import url="/WEB-INF/views/footer.jsp" />
  </body>
</html>