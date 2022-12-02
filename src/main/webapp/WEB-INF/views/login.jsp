<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <c:import url="/WEB-INF/views/header.jsp" />
    <body>
      <div class="container mt-3">
        <div class="row">
          <div class="col p-3">
          </div>
        </div>
        <div class="row">
          <div class="col p-3">
          </div>
          <div class="col p-3">
            <div class="container mt-3">
              <div class="container mt-3 text-center">
                <h2 class="display-4 mt-3">Authentication</h2>
                <hr>
              </div>
            <form action="/login" method="post">
              <div class="mb-2 mt-3">
                <label for="email">Email:</label>
                <input type="email" class="form-control rounded-0" id="email" placeholder="Enter email" name="email">
              </div>
              <div class="mb-3">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control rounded-0" id="pwd" placeholder="Enter password" name="password">
              </div>
              <div class="d-grid gap-2 mt-3">
                <button type="submit" class="btn btn-dark rounded-0">Login</button>
              </div>
              <hr>
              <a href="#">Forgot your password?</a>
            </form>
            <c:if test="${not empty message}" >
              <div class="container alert alert-danger alert-dismissible fade show rounded-0 mt-3 ">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Error</strong>: ${message}
              </div>
            </c:if>  
          </div>
          </div>
          <div class="col p-3">
            <!-- <div class="col text-end mt-4">
              <a href="/" class="display-6 text-black" style="text-decoration: none">
                <i class="fas fa-home"></i> home
              </a>
            </div> -->
          </div>
          <c:import url="/WEB-INF/views/footer.jsp" />
      </div>

    </body>
</html>