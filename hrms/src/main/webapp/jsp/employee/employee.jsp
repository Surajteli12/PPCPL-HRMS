<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <jsp:include page="../../jsp/header/headerNew.jsp" />

    <c:if test="${action == 'getAllEmployeeData'}">

      <div class="page-content container container-plus">
        <div class="page-header mb-2 pb-2 flex-column flex-sm-row align-items-start align-items-sm-center py-25 px-1">
          <h1 class="page-title text-primary-d2 text-140">
            Employee Master
          </h1>

          <div class="page-tools mt-3 mt-sm-0 mb-sm-n1">
            <!-- dataTables search box will be inserted here dynamically -->
          </div>
        </div>

        <div class="card bcard h-auto">
          <form autocomplete="off" class="border-t-3 brc-blue-m2">

            <table id="datatable" class="d-style w-100 table text-dark-m1 text-95 border-y-1 brc-black-tp11 collapsed">
              <!-- add `collapsed` by default ... it will be removed by default -->
              <!-- thead with .sticky-nav -->
              <thead class="sticky-nav text-secondary-m1 text-uppercase text-85">
                <tr>
                  <th class="td-toggle-details border-0 bgc-white shadow-sm">
                  </th>

                  <th class="border-0 bgc-white pl-3 pl-md-4 shadow-sm">
                    No.
                  </th>

                  <th class="border-0 bgc-white pl-3 pl-md-4 shadow-sm">
                    Id
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    First Name 
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Middle Name
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Last Name
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Role Id
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Age
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Date Of Birth
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Branch
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Reporting Person Id
                  </th>

                  <th class="border-0 bgc-white bgc-h-yellow-l3 shadow-sm">
                    Ip Address
                  </th>

                  <th class="border-0 bgc-white shadow-sm w-8">
                    Action
                  </th>
                </tr>
              </thead>

              <tbody class="pos-rel">
                <c:forEach items="${employeeList}" var="item" varStatus="loop">

                  <tr class="d-style bgc-h-default-l4">
                    <td class="td-toggle-details pos-rel">
                      <!-- this empty table cell will show the `+` sign which toggles the hidden cells in responsive (collapsed) mode -->

                      <div class="position-lc h-95 ml-1px border-l-3 brc-purple-m1">
                        <!-- this decorative highlight border will be shown only when table is collapsed (responsive) -->
                      </div>
                    </td>

                    <td class="pl-3 pl-md-4 align-middle pos-rel">
                      ${loop.index +1}
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeId }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeFirstName }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeMiddleName }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeLastName }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.role.roleCode }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeAge }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeDob }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeBranch }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.reportingPersonEmployeeId }
                    </td>

                    <td class="text-105 align-middle">
                      ${item.employeeIpAddress }
                    </td>

                    <td class="align-middle">
                      <span class="d-none d-lg-inline">
                        <button id="editBtn-${item.employeeId}" class="btn btn-outline-light btn-h-light-blue btn-a-light-blue border-b-2 text-600 px-3 mb-1">
                          <i class="fa fa-pencil-alt text-110 text-blue-d2 mr-1"></i>
                        </button>
                        <button id="deleteBtn-${item.employeeId }" class="btn btn-outline-light btn-h-light-danger btn-a-light-danger border-b-2 text-600 px-3 mb-1">
                          <i class="fa fa-trash-alt text-110 text-danger-d2 mr-1"></i>
                        </button>
                      </span>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

          </form>
        </div>
      </div>
    </c:if>


    <c:if test="${action == 'insertEmployee' || action == 'updateEmployee'}">
      <div class="page-content container container-plus">
        <form autocomplete="off" class="mt-475">
          <div class="form-group row">
            <div class="col-lg-6">
              <div class="card h-100">
                <div class="card-header">
                  <span class="card-title text-125">
                    Employee Form
                  </span>
                </div>

                <div class="card-body">

                  <div class="form-group row">
                    <div class="col-sm-9">
                      <input type="hidden" class="form-control" id="idRoleCode" value="${selected.employeeId}"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="firstname" class="mb-0">
                        Name
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="firstname" value="${selected.employeeFirstName}"/>
                    </div>
                  </div>


                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="categoryOfEmployment" class="mb-0">
                        Category of Employment
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="categoryOfEmployment" value="${selected.employeeFirstName}"/>
                    </div>
                  </div>


                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="designation" class="mb-0">
                        Designation
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="designation">
                        <c:if test="${not empty roleList}">
                          <c:forEach items="${roleList}" var="item" varStatus="loop">
                            <option value='${item.roleCode}' <c:if test="${item.roleCode == selected.roleCode}">selected</c:if>>${item.roleName}</option>
                          </c:forEach>
                        </c:if>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="department" class="mb-0">
                        Department
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="department">
                        <option value="1">IT</option>
                        <option value="2">Management</option>
                        <option value="3">Printing</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="reportingTo" class="mb-0">
                        Reporting To
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="reportingTo">
                        <option value="1">xyz</option>
                        <option value="2">qas</option>
                        <option value="3">dws</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="doj" class="mb-0">
                        DOJ
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="date" class="form-control" id="doj" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="month" class="mb-0">
                        Month
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="month" value="jan" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="yearsOfCompletion" class="mb-0">
                        Years Of Completion
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="yearsOfCompletion" value="2.2" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="approxYrsCompletion" class="mb-0">
                        Approx Yrs Completion
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="approxYrsCompletion" value="2" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="probationPeriod" class="mb-0">
                        Probation Period
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="probationPeriod" value="" />
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="doc" class="mb-0">
                        DOC
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="doc" value="7-Jul-24" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="location" class="mb-0">
                        Location
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="location">
                        <option value="india">India</option>
                        <option value="usa">USA</option>
                        <option value="isreal">Isreal</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="dob" class="mb-0">
                        DOB
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="date" class="form-control" id="dob" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="ageTillDate" class="mb-0">
                        Age Till Date
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="ageTillDate" value="2.2" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="dateOfMonth" class="mb-0">
                        Date Of Month
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="dateOfMonth" value="2" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="appointmentLetter" class="mb-0">
                        Appointment Letter
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="appointmentLetter">
                        <option value="gujarat">Gujarat</option>
                        <option value="maharashtra">Maharashtra</option>
                        <option value="mp">Madhya Pradesh</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="nda" class="mb-0">
                        NDA
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="nda">
                        <option value="gujarat">Gujarat</option>
                        <option value="maharashtra">Maharashtra</option>
                        <option value="mp">Madhya Pradesh</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="confProb" class="mb-0">
                        Conformation/Probation
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="confProb">
                        <option value="conformation">Conformation</option>
                        <option value="probation">Probation</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="idCard" class="mb-0">
                        ID Card
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="idCard">
                        <option value="Issued">Issued</option>
                        <option value="Not Issued">Not Issued</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="account" class="mb-0">
                        Kotak Account/Axis Account
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="account" value="GGG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="bankAccount" class="mb-0">
                        Bank Account
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="bankAccount" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="ifscCode" class="mb-0">
                        IFSC Code
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="ifscCode" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="UanNum" class="mb-0">
                        UAN NUM
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="UanNum" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="pfNum" class="mb-0">
                        PF NUM
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="pfNum" value="563G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="married" class="mb-0">
                        Married/UnMarried
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="married">
                        <option value="married">Married</option>
                        <option value="unMarried">UnMarried</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="gender" class="mb-0">
                        Gender
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="officialContact" class="mb-0">
                        Official Contact No.
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="officialContact" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="personalNo" class="mb-0">
                        Personal No
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="personalNo" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="alternateNo" class="mb-0">
                        Alternate No
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="alternateNo" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="personalEmail" class="mb-0">
                        Personal Email ID
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="personalEmail" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="officialEmail" class="mb-0">
                        Official Email ID
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="officialEmail" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="bloodGroup" class="mb-0">
                        Blood Group
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <select
                              class="ace-select text-dark-m1 bgc-default-l5 bgc-h-warning-l3 brc-default-m3 brc-h-warning-m1"
                              id="bloodGroup">
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="currentAddress" class="mb-0">
                        Current Address
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="currentAddress" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="permanentAddress" class="mb-0">
                        Permanent Address
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="permanentAddress" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="qualification" class="mb-0">
                        Highest Qualification
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="qualification" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="totalExp" class="mb-0">
                        Total Exp
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="totalExp" value="9874563211"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="relevantExp" class="mb-0">
                        Relevant Exp
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="relevantExp" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="previousCompany" class="mb-0">
                        Previous Company
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="previousCompany" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="designationInPreviousCompany" class="mb-0">
                        Designation In Previous Company
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="designationInPreviousCompany" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="expWithPPT" class="mb-0">
                        Exp With PPT
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="expWithPPT" value="2" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="DOR" class="mb-0">
                        DOR
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="date" class="form-control" id="DOR" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="RetirementDate" class="mb-0">
                        Retirement Date
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="RetirementDate" value="2-Apr-24"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="exitDate" class="mb-0">
                        Exit Date
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="exitDate" value="2-Apr-24" disabled/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="educationCertificate" class="mb-0">
                        Education Certificate
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="educationCertificate" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="rationCard" class="mb-0">
                        Ration Card
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="rationCard" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="panCard" class="mb-0">
                        PAN Card
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="panCard" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="aadharCard" class="mb-0">
                        Aadhar Card
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="aadharCard" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="drivingLicense" class="mb-0">
                        Driving License
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="drivingLicense" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="passport" class="mb-0">
                        Passport
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="passport" value=""/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="bankName" class="mb-0">
                        Bank Name
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="bankName" value="GGG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="nameAsPerBank" class="mb-0">
                        Name As Per Bank
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="nameAsPerBank" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="accountNo" class="mb-0">
                        Account No
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="accountNo" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-3 col-form-label text-sm-left pr-0">
                      <label for="ifscCodeBankAccount" class="mb-0">
                        IFSC Code
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="ifscCodeBankAccount" value="G5662GG"/>
                    </div>
                  </div>

                  <div class="form-group text-center">
                    <button class="btn btn-info btn-bold px-4 text-sm-right" id="submitBtn" type="button">
                      <i class="fa fa-check mr-1"></i>Submit
                    </button>
                    <button class="btn btn-outline-lightgrey btn-bgc-white btn-bold ml-2 px-4" type="reset">
                      <i class="fa fa-undo mr-1"></i>Reset
                    </button>
                  </div>

                </div>
              </div><!-- /.card -->
            </div><!-- /.col -->
          </div>
        </form>
      </div>

    </c:if>

    <jsp:include page="../../jsp/footer/footerNew.jsp" />

    <script>
      jQuery(function ($) {
        var tableId = '#datatable'

        $.extend(true, $.fn.dataTable.defaults, {
          dom:
            "<'row'<'col-12 col-sm-6'l><'col-12 col-sm-6 text-right table-tools-col'f>>" +
            "<'row'<'col-12'tr>>" +
            "<'row'<'col-12 col-md-5'i><'col-12 col-md-7'p>>",
          renderer: 'bootstrap'
        })

        var $_table = $(tableId).DataTable({
          responsive: true,

          colReorder: {
            //disable column reordering for first and last columns
            fixedColumnsLeft: 1,
            fixedColumnsRight: 1
          },

          classes: {
            sLength: "dataTables_length text-left w-auto",
          },


          // first and last column are not sortable
          columnDefs: [
            {
              orderable: false,
              className: null,
              targets: 0
            },
            {
              orderable: false,
              className: null,
              targets: 1
            },
            {
              orderable: false,
              className: null,
              targets: -1
            },
            {
              responsivePriority: 1,
              targets: 2
            }
          ],


          // multiple row selection
          select: {
            style: 'multis'
          },

          // no specific initial ordering
          order: [],

          language: {
            search: '<i class="fa fa-search pos-abs mt-2 pt-3px ml-25 text-blue-m2"></i>',
            searchPlaceholder: " Search Roles..."
          }
        })

        // specify position of table buttons
        $('.table-tools-col')
          .append($_table.buttons().container())
          // move searchbox into table header
          .find('.dataTables_filter').appendTo('.page-tools').find('input').addClass('pl-45 radius-round').removeClass('form-control-sm')
          // and add a "+" button
          .end().append('<button id="addBtn" data-rel="tooltip" type="button" class="btn radius-round btn-outline-primary border-2 btn-sm ml-2" title="Add New"><i class="fa fa-plus"></i></button>')

        // helper methods to add/remove bgc-h-* class when selecting/deselecting rows
        var _highlightSelectedRow = function (row) {
          row.querySelector('input[type=checkbox]').checked = true
          row.classList.add('bgc-success-l3')
          row.classList.remove('bgc-h-default-l4')
        }
        var _unhighlightDeselectedRow = function (row) {
          row.querySelector('input[type=checkbox]').checked = false
          row.classList.remove('bgc-success-l3')
          row.classList.add('bgc-h-default-l4')
        }

        // listen to select/deselect event to highlight rows
        $_table
          .on('select', function (e, dt, type, index) {
            if (type == 'row') {
              var row = $_table.row(index).node()
              _highlightSelectedRow(row)
            }
          })
          .on('deselect', function (e, dt, type, index) {
            if (type == 'row') {
              var row = $_table.row(index).node()
              _unhighlightDeselectedRow(row)
            }
          })

        // when clicking the checkbox in table header, select/deselect all rows
        $(tableId)
          .on('click', 'th input[type=checkbox]', function () {
            if (this.checked) {
              $_table.rows().select().every(function () {
                _highlightSelectedRow(this.node())
              });
            }
            else {
              $_table.rows().deselect().every(function () {
                _unhighlightDeselectedRow(this.node())
              })
            }
          })

        // don't select row if we click on the "show details" `plus` sign (td)
        $(tableId).on('click', 'td.dtr-control', function (e) {
          e.stopPropagation()
        })


        // add/remove bgc-h-* class to TH when soring columns
        var previousTh = null
        var toggleTH_highlight = function (th) {
          th.classList.toggle('bgc-yellow-l2')
          th.classList.toggle('bgc-h-yellow-l3')
          th.classList.toggle('text-blue-d2')
        }

        $(tableId)
          .on('click', 'th:not(.sorting_disabled)', function () {
            if (previousTh != null) toggleTH_highlight(previousTh)// unhighlight previous TH
            toggleTH_highlight(this)
            previousTh = this
          })

        // don't select row when clicking on the edit icon
        $('a[data-action=edit').on('click', function (e) {
          e.preventDefault()
          e.stopPropagation()// don't select
        })

        // add a dark border
        $('.dataTables_wrapper')
          .addClass('border-b-1 border-x-1 brc-default-l2')

          // highlight DataTable header
          // also already done in CSS, but you can use custom colors here
          .find('.row:first-of-type')
          .addClass('border-b-1 brc-default-l3 bgc-blue-l4')
          .next().addClass('mt-n1px')// move the next `.row` up by 1px to go below header's border

        // highlight DataTable footer
        $('.dataTables_wrapper')
          .find('.row:last-of-type')
          .addClass('border-t-1 brc-default-l3 mt-n1px bgc-default-l4')


        // if the table has scrollbars, add ace styling to it
        $('.dataTables_scrollBody').aceScroll({ color: "grey" })


        //enable tooltips
        setTimeout(function () {
          $('.dt-buttons button')
            .each(function () {
              var div = $(this).find('span').first()
              if (div.length == 1) $(this).tooltip({ container: 'body', title: div.parent().text() })
              else $(this).tooltip({ container: 'body', title: $(this).text() })
            })
          $('[data-rel=tooltip').tooltip({ container: 'body' })
        }, 0)

        $('#addBtn').on('click', () => {
          window.location.href = "/hrms/employee?action=insertEmployee"
        });

        $('#submitBtn').on('click', () => {
    let url = "hrms/employee?action=insertEmployee";
    <c:if test="${action == 'updateEmployee'}">
        url = "hrms/employee?action=updateEmployee";
    </c:if>
    
    let employeeData = {
        "employeeId": $('#idRoleCode').val(),
        "employeeFirstName": $('#firstname').val(),
        "employeeMiddleName": $('#middlename').val(),
        "employeeLastName": $('#lastname').val(),
        "employeeAge": $('#age').val(),
        "employeeDob": "1995-04-15",
        "roleCode": $('#role').val(),
        "department": $('#department').val(),
        "employeeBranch": $('#homebranch').val(),
        "reportingPersonEmployeeId": $('#reportingperson').val(),
        "addressLine1": $('#address').val(),
        "addressLine": $('#address').val(),
        "country": $('#country').val(),
        "state": $('#state').val(),
        "city": $('#city').val(),
        "pinCode": $('#pincode').val(),
        "employeeIpAddress": "788787",
        "bankName": "sjfb",
        "bankAccNo": "6t8t",
        "ifscNo": "t67",
        "upiId": "tyu",
    };

    $.ajax({
        type: "POST",
        url: url,
        data: employeeData,
        cache: false,
        success: function(data){
            var jsonData = JSON.parse(data);
            if(jsonData["isSuccess"]){
                $.aceToaster.add({
                    placement: 'tr',
                    body: "<p class='p-3 mb-0 text-left text-white'><span class='text-125'>"+jsonData["message"]+"</span></p>",
                    width: 360,
                    delay: 4000,
                    close: true, 
                    className: 'bgc-green-d2 shadow ',
                    bodyClass: 'border-0 p-0 text-dark-tp2',
                    headerClass: 'd-none',
                    progress: 'position-bl bgc-black-tp6 py-2px m-1px'
                });
                setTimeout(function() {
                    window.location.href = "hrms/employee?action=getAllEmployee";  // Replace with the URL you want to redirect to
                }, 1500);
                console.log("success");
            }
        },
        error: function(data){
            console.error("An error occurred while processing the request.");
        }
    });
});

    // Edit button click handler
        $(document).on('click', '[id^=editBtn-]', function(e) {
            e.preventDefault(); // Prevent any default action
            e.stopPropagation(); // Stop the event from propagating to parent elements
            var id = $(this).attr('id').split('-')[1]; // Extract ID from the button's ID
            editRecord(id);
        });

    // Delete button click handler
    $(document).on('click', '[id^=deleteBtn-]', function(e) {
        e.preventDefault(); // Prevent any default action
        e.stopPropagation(); // Stop the event from propagating to parent elements
        var id = $(this).attr('id').split('-')[1]; // Extract ID from the button's ID
        deleteRecord(id);
    });

    // Edit function - Redirect to the edit page
    function editRecord(id) {
        // Redirect to edit page with the record ID
        window.location.href = 'hrms/employee?action=updateEmployee&employeeId=' + id;
    }

    // Delete function - Confirm and redirect
    function deleteRecord(id) {
        // Confirm with the user
        var confirmation = confirm('Are you sure you want to delete this record?');

        // If confirmed, redirect to delete action
        if (confirmation) {
            window.location.href = 'hrms/employee?action=deleteEmployee&employeeId=' + id;
        }
    }
      })
    </script>

    </body>

    </html>