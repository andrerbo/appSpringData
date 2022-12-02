<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <c:import url="/WEB-INF/views/header.jsp" />
  <body>
    <c:import url="/WEB-INF/views/navbar.jsp" />
    <div class="container mt-3">
      <div class="row align-items-center">
        <div class="col">
          <h3 class="display-3">New Session</h3>
        </div>
        <div class="col text-end mt-3">
          <a href="/session/main" class="display-6 text-black" style="text-decoration: none">
              <i class="fas fa-arrow-left"></i> back
          </a>
        </div>
      </div>
      <hr>
      <form action="/session" method="post">
          <div class="form-group row mt-2">
            <label for="name" class="col-sm-2 col-form-label display-5">Name:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control rounded-0" id="name" placeholder="Input session name" name="name">
            </div>
          </div>
          <div class="form-group row mt-2">
            <label for="description" class="col-sm-2 col-form-label display-5">Description:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control rounded-0" id="description" placeholder="Input session description" name="description">
            </div>
          </div>
          <div class="d-grid gap-2 mt-5">
            <button type="submit" class="btn btn-dark rounded-0">Enter</button>
          </div>
      </form>
      <c:import url="/WEB-INF/views/footer.jsp" />
    </div>
  </body>
</html>