<%@ page language="java" contentType="text/html; charset=UTF-8" session="false"
         pageEncoding="UTF-8" %>

<%@ page import="ca.nrc.cadc.search.form.Date" %>
<%@ page import="ca.nrc.cadc.search.form.FormConstraint" %>
<%@ page import="ca.nrc.cadc.search.form.DatePreset" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
  final String utype = request.getParameter("utype");
  final String labelKey = utype + "_FORM_LABEL";
  final String tipSide = request.getParameter("tipSide");
  final String name = utype + Date.VALUE;
  final String presetName = utype + "_PRESET" + Date.VALUE;
  final String formName = utype + Date.NAME;
  final String detailsID = utype + "_details";

  // For the select list.  These MUST be put into variables as they cannot be
  // built in the fmt:message because who the heck knows.
  // jenkinsd 2015.01.05
  final String presetLabelkey = utype + "_PRESET_FORM_LABEL";
  final String presetPast24HoursLabelKey =
      utype + "_PRESET_PAST_24_HOURS_FORM_LABEL";
  final String presetPastWeekLabelKey =
      utype + "_PRESET_PAST_WEEK_FORM_LABEL";
  final String presetPastMonthLabelKey =
      utype + "_PRESET_PAST_MONTH_FORM_LABEL";
%>

<li class="label_tooltip_<%= tipSide %>">
  <details id="<%= detailsID %>">
    <summary class="search_criteria_label_container">
      <span class="search_criteria_label <%= detailsID %>"><fmt:message key="<%= labelKey %>" bundle="${langBundle}"/></span>
      <span class="search_criteria_label_contents color-accent"></span>
    </summary>
    <label for="<%= utype %>" class="wb-invisible">
      <fmt:message key="<%= labelKey %>" bundle="${langBundle}"/>
    </label>
    <div id="<%= utype %>_input_decorate">
      <input id="<%= utype %>"
             name="<%= name %>" value="" size="20"
             type="text" data-assoc-field="<%= utype %>_PRESET"
             class="search_criteria_input width-100
                    ui-form-input-validate
                    ui_unitconversion_input"/>
    </div>
    <div class="align-center margin-top-none margin-bottom-none">
      <span class="font-large">- <fmt:message key="OR_LABEL" bundle="${langBundle}"/> -</span>
    </div>
    <div class="form-inline">
      <label class="sub-label" for="<%= utype %>_PRESET"><fmt:message key="<%= presetLabelkey %>" bundle="${langBundle}"/></label>
      <select size="1" id="<%= utype%>_PRESET"
              data-assoc-field="<%= utype %>" name="<%= presetName %>"
              class="search_criteria_input ui_unitconversion_input preset-date width-100">
        <option value=""></option>
        <option value="<%= DatePreset.PAST_24_HOURS.name() %>"><fmt:message key="<%= presetPast24HoursLabelKey %>" bundle="${langBundle}"/></option>
        <option value="<%= DatePreset.PAST_WEEK.name() %>"><fmt:message key="<%= presetPastWeekLabelKey %>" bundle="${langBundle}"/></option>
        <option value="<%= DatePreset.PAST_MONTH.name() %>"><fmt:message key="<%= presetPastMonthLabelKey %>" bundle="${langBundle}"/></option>
      </select>
    </div>
    <input type="hidden"
           name="<%= FormConstraint.FORM_NAME %>"
           value="<%= formName %>"/>
  </details>
</li>