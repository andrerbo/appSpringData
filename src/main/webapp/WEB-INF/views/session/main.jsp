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
            <h3 class="display-3">Session List</h3>
          </div>
          <div class="col text-end mt-3">
            <span type=button class="btn rounded-0" data-bs-toggle="modal" data-bs-target="#addSession">
              <i class="fas fa-plus fa-3x"> </i>
            </span>
            <form action="/session" method="post">
              <div class="modal fade" id="addSession">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                  <div class="modal-content rounded-0">
                    <div class="modal-header">
                      <h3 class="modal-title display-6">New Session</h3>
                      <button type="button" class="btn-close rounded-0" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                      <div class="form-group row mt-2">
                        <label for="name" class="col-sm-2 col-form-label display-5">Name:</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control rounded-0" id="name" placeholder="Input subject name" name="name">
                        </div>
                      </div>
                      <div class="form-group row mt-2">
                        <label for="description" class="col-sm-2 col-form-label display-5">Description:</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control rounded-0" id="description" placeholder="Input subject description" name="description">
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-dark rounded-0">Add New Session</button>
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
          <c:forEach var="sss" items="${sessionList}" varStatus="loop">
            <li class="list-group-item d-flex justify-content-between align-items-start">
              <div class="ms-2 me-auto">
                <div class="fw-bold">${sss.subject.name}</div>
                <strong>Start</strong>: ${sss.startDate}<br><strong>End</strong>: ${sss.endDate}
              </div>
              <span>
                <a href="/session/${sss.id}/delete" class="btn btn-outline-dark border-0" role="button">
                  <i class="far fa-trash-alt"></i>
                </a>
              </span>
            </li>
          </c:forEach>
        </ol>
      </div>

      <c:import url="/WEB-INF/views/footer.jsp" />
    </div>
  </body>
</html>