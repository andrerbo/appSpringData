<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <c:import url="/WEB-INF/views/header.jsp" />
  <body>
    <nav class="navbar navbar-expand-sm bg-light">
      <div class="container-fluid">
        <ul class="navbar-nav">

          <a class="nav-link text-black rounded-0" href="/" role="button">
            <i class="fas fa-home"></i> Home
          </a>
          <c:if test="${not empty user}">
            <li class="nav-item">
              <a href="/subject/main" class="btn btn-light m-lg-1 rounded-0"><i class="fas fa-angle-double-right"></i> Subject</a>
            </li>
            <li class="nav-item">
              <a href="/student/main" class="btn btn-light m-lg-1 rounded-0"><i class="fas fa-angle-double-right"></i> Student</a>
            </li>
            <li class="nav-item">
              <a href="/session/main" class="btn btn-light m-lg-1 rounded-0"><i class="fas fa-angle-double-right"></i> Session</a>
            </li>

            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-black" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-chevron-right"></i> Entities
              </a>
              <ul class="dropdown-menu rounded-0" aria-labelledby="navbarScrollingDropdown" style="--bs-dropdown-link-active-bg: #ced4da; --bs-dropdown-link-active-color: #000000;">
                  <li><a class="dropdown-item" href="/subject/main"><i class="fas fa-angle-double-right"></i> Subject</a></li>
                  <li><a class="dropdown-item" href="/student/main"><i class="fas fa-angle-double-right"></i> Student</a></li>
                  <li><a class="dropdown-item" href="/session/main"><i class="fas fa-angle-double-right"></i> Session</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-black" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-chevron-right"></i> Actions
              </a>
              <ul class="dropdown-menu rounded-0" aria-labelledby="navbarScrollingDropdown" style="--bs-dropdown-link-active-bg: #ced4da; --bs-dropdown-link-active-color: #000000;">
                  <li><a class="dropdown-item" href="/subscription"><i class="fas fa-angle-double-right"></i> Subscribe</a></li>
                  <li><a class="dropdown-item" href="#"><i class="fas fa-angle-double-right"></i> Start Session</a></li>
              </ul>
            </li> -->
            
          </c:if>
        </ul>
        <ul class="navbar-nav">
          <c:if test="${empty user}">
            <a class="nav-link text-black" href="#" role="button">
              <i class="fas fa-user-plus"></i> Sign up
            </a>
            <a class="nav-link text-black" href="/login" role="button">
              <i class="fas fa-sign-in-alt"></i> login
            </a>
          </c:if>
          <c:if test="${not empty user}">
            <!-- <a class="nav-link text-black" href="#" role="button">
              <i class="fas fa-user"></i> ${user.email}
            </a> -->
            <!-- <a class="nav-link text-black" href="/login" role="button">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a> -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-black" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user"></i> ${user.email}
              </a>
              <ul class="dropdown-menu rounded-0" aria-labelledby="navbarScrollingDropdown" style="--bs-dropdown-link-active-bg: #ced4da; --bs-dropdown-link-active-color: #000000;">
                  <li><a class="dropdown-item" href="/profile"><i class="fas fa-info-circle"></i> Profile</a></li>
                  <li><a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
              </ul>
            </li>
            <!-- <li class="nav-item">
              <a href="#" class="btn btn-light m-lg-1"><i class="fas fa-user"></i> ${user.email}</a>
            </li>
            <li class="nav-item">
              <a href="/logout" class="btn btn-light m-lg-1"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </li> -->
          </c:if>
        </ul>
      </div> 
    </nav>
  </body>
</html>