<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="en">
  <c:import url="/WEB-INF/views/header.jsp" />
  <body>
    <c:import url="/WEB-INF/views/navbar.jsp" />
    <div class="container mt-3">
      <div class="row align-items-center">
        <div class="col">
          <h3 class="display-3">Student List</h3>
        </div>
        <div class="col text-end mt-3">
          <span type=button class="btn rounded-0" data-bs-toggle="modal" data-bs-target="#addStudent">
            <i class="fas fa-plus fa-3x"> </i>
          </span>
          <form action="/student" method="post">
            <div class="modal fade" id="addStudent">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content rounded-0">
                  <div class="modal-header">
                    <h3 class="modal-title display-6">New Student</h3>
                    <button type="button" class="btn-close rounded-0" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                    <div class="form-group row">
                      <label for="name" class="col-sm-2 col-form-label display-5">Name:</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control rounded-0" id="name" placeholder="Input student name" name="name">
                      </div>
                    </div>
                    <div class="form-group row mt-2">
                      <label for="email" class="col-sm-2 col-form-label display-5">Email:</label>
                      <div class="col-sm-10">
                        <input type="email" class="form-control rounded-0" id="email" placeholder="Input student email" name="email">
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-dark rounded-0">Add New Student</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div> 
      </div>

      <c:if test="${not empty message}">
        <div class="alert ${messageType} rounded-0 alert-dismissible fade show in" role="alert"> <!-- style="margin-top: 15px; padding: 10px;" -->
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          <strong>Info: </strong>${message}
        </div>
      </c:if>     

      <hr> 

      <ol class="list-group rounded-0">
        <c:forEach var="std" items="${studentList}" varStatus="loop">
          <li class="list-group-item d-flex justify-content-between align-items-start">
            <div class="ms-2 me-auto">
              <div class="fw-bold">${std.name}</div>
              ${std.email}
            </div>
            <div class="row">
              <div class="col">

                <span>
                  <a class="btn btn-outline-dark border-0" role="button" data-bs-toggle="modal" data-bs-target="#showSubjects${loop.count}">
                    <i class="fas fa-info-circle"></i>
                  </a>
                </span>

                <div class="modal fade" id="showSubjects${loop.count}">
                  <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content rounded-0">
                      <div class="modal-header">
                        <h3 class="modal-title display-6">Subject List</h3>
                        <button type="button" class="btn-close rounded-0" data-bs-dismiss="modal"></button>
                      </div>
                      <div class="modal-body">
                        <c:choose>
                          <c:when test="${std.getSubjectList().size() gt 0}">
                            <ol class="list-group rounded-0">
                              <c:forEach var="sbj" items="${std.subjectList}">
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                  <div class="ms-2 me-auto">
                                    <div class="fw-bold">${sbj.name}</div>
                                    ${sbj.description}
                                  </div>
                                  <span>
                                    <a href="/student/${std.id}/unsubscribe/${sbj.id}" class="btn btn-outline-dark border-0">
                                      <i class="fas fa-minus-circle"></i>
                                    </a>
                                  </span>
                                </li>
                              </c:forEach>
                            </ol>                    
                          </c:when>
                          <c:otherwise>
                            <div class="alert alert-warning rounded-0" role="alert"> <!-- style="margin-top: 10px; margin-bottom: 10px; padding: 10px;" -->
                              This student doesn't have subject subscribed!
                            </div>                  
                          </c:otherwise>
                        </c:choose> 
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="col">
                <span>
                  <a class="btn btn-outline-dark border-0" role="button" data-bs-toggle="modal" data-bs-target="#subscriptionModal${loop.count}">
                    <i class="fas fa-book"></i>
                  </a>
                </span>

                <form action="/student/${std.id}/subscription" method="post">
                  <div class="modal fade" id="subscriptionModal${loop.count}">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                      <div class="modal-content rounded-0">
                        <div class="modal-header">
                          <h3 class="modal-title display-6">Subscription Page</h3>
                          <button type="button" class="btn-close rounded-0" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                          <div class="form-group row">
                            <label for="subject" class="col-sm-2 col-form-label">Subject:</label>
                            <div class="col-sm-10">
                              <select class="form-select rounded-0" name="subjectId">
                                <c:forEach var="sb" items="${subjectList}">
                                <option value="${sb.id}">${sb.name}</option>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-dark rounded-0">Subscribe</button>
                        </div>
                      </div>
                    </div>
                  </div>
              </form>

              </div>
              <div class="col">
                <span>
                  <c:choose>
                    <c:when test="${std.getSubjectList().size() eq 0}">
                      <a href="/student/${std.id}/delete" class="btn btn-outline-dark border-0 rounded-0" role="button">
                        <i class="far fa-trash-alt"></i>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <a href="#" class="btn btn-outline-dark disabled border-0 rounded-0 role="button" aria-disabled="true">
                        <i class="far fa-trash-alt"></i>
                      </a>
                    </c:otherwise>
                  </c:choose>
                </span>
              </div>
            </div>
          </li>
        </c:forEach>
      </ol>

      <c:import url="/WEB-INF/views/footer.jsp" />
    </div>
  </body>
</html>