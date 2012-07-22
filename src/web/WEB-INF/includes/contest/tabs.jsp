<%--
  - Author: isv, Veve, morehappiness, TCSASSEMBLER
  - Version: 1.5
  - Copyright (C) 2010 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page fragment renders the tabs for dashboard and contest pages.
  -
  - Version 1.1 (Submission Viewer Release 1 assembly) changes: linked Submissions tab to submission pages
  - for Studio contests.
  - Version 1.2 (Direct Replatforming Release 4) changes: remove the condition test on whether it's studio contest or not.
  - Version 1.3 (TC Cockpit Bug Tracking R1 Contest Tracking  assembly) changes: Add new tab for the issue tracking for
  - software and studio contest.
  - Version 1.4 (Release Assembly - TC Direct Cockpit Release One) changes: Add milestone submission number and final submission
  - number in the submission tab title for multiple round contest
  - Version 1.5 (Release Assembly - TopCoder Cockpit Software Milestone Management) changes:
  - Add milestoneRound parameter for the submissions tab link of studioSubmissionsGrid and softwareSubmissionsList.
  -
  - Version 1.5.1 (Release Assembly - TC Direct Cockpit Release Five) changes:
  - - Remove the round information in the submission tab link, the link will automatically detect the milestone/final sub tab.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>
<s:set var="contestStats" value="viewData.contestStats" scope="page"/>
<s:push value="viewData.contestStats">
    <jsp:include page="/WEB-INF/includes/contest/link.jsp"/>
    <div id="tabs3">
        <ul>
            <li class="firstItem <c:if test="${requestScope.CURRENT_SUB_TAB eq 'details'}">on</c:if>">
                    <a href="<s:url action="contest/detail" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>" class="first">
                    <span class="left"><span class="right">Details</span></span></a>
            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'specReview'}">class="on"</c:if>>
                <a href="<s:url action="contest/viewSpecReview" namespace="/">
                    <s:param name="projectId" value="contest.id"/>
                    <s:param name="studio" value="viewData.contestStats.isStudio"/>
                </s:url>" >
            
                <span class="left"><span class="right">Spec Review</span></span></a>
            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'registrants'}">class="on"</c:if>>

                    <a href="<s:url action="contest/contestRegistrants" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>">
                    <span class="left"><span class="right">Registrants (<s:property value="registrantsNumber"/>)</span></span></a>

            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'submissions'}">class="on"</c:if> style="min-width:190px">
                <if:isStudioContest contestStats="${contestStats}">
                    <s:if test="viewData.contestStats.multipleRound">
                        <span class="submissionTabSpan">
                            <span class="noCursor left">
                                    <span class="noCursor right"><link:studioSubmissionsGrid contestId="${contestStats.contest.id}" styleClass="submissionClick">Submissions</link:studioSubmissionsGrid> (
                                        <link:studioSubmissionsGrid contestId="${contestStats.contest.id}" milestoneRound="true" styleClass="submissionClick">M:${viewData.contestStats.milestoneSubmissionNumber}</link:studioSubmissionsGrid>/
                                        <link:studioSubmissionsGrid contestId="${contestStats.contest.id}" milestoneRound="false" styleClass="submissionClick">F:${viewData.contestStats.finalSubmissionNumber}</link:studioSubmissionsGrid>
                                        )
                                    </span>
                            </span>
                        </span>
                    </s:if>
                    <s:else>
                        <link:studioSubmissionsGrid contestId="${contestStats.contest.id}">
                            <span class="left">
                                    <span class="right">Submissions (<s:property value="submissionsNumber"/>)</span>
                            </span>
                        </link:studioSubmissionsGrid>
                    </s:else>
                </if:isStudioContest>
                <if:isStudioContest contestStats="${contestStats}" negate="true">
                    <s:if test="viewData.contestStats.multipleRound">
                        <span class="submissionTabSpan">
                            <span class="noCursor left">
                                    <span class="noCursor right"><link:softwareSubmissionsList contestId="${contestStats.contest.id}" styleClass="submissionClick">Submissions</link:softwareSubmissionsList> (
                                         <link:softwareSubmissionsList contestId="${contestStats.contest.id}" milestoneRound="true" styleClass="submissionClick">M:${viewData.contestStats.milestoneSubmissionNumber}</link:softwareSubmissionsList>/
                                        <link:softwareSubmissionsList contestId="${contestStats.contest.id}" milestoneRound="false" styleClass="submissionClick">F:${viewData.contestStats.finalSubmissionNumber}</link:softwareSubmissionsList>
                                        )
                                    </span>
                            </span>
                        </span>
                    </s:if>
                    <s:else>
                        <link:softwareSubmissionsList contestId="${contestStats.contest.id}">
                            <span class="left">
                                    <span class="right">Submissions (<s:property value="submissionsNumber"/>)</span>
                            </span>
                        </link:softwareSubmissionsList>
                    </s:else>
                </if:isStudioContest>
            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'issueTracking'}">class="on"</c:if>>
                <a href="<s:url action="contest/contestIssuesTracking" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>">
                <span class="left"><span class="right">Issue Tracking (<s:property value="totalJiraIssuesNumber"/>)</span></span></a>
            </li>
            <li id="rReceiptTab" class="lastItem <c:choose>
                <c:when test="${requestScope.CURRENT_SUB_TAB eq 'receipt'}">on</c:when>
                </c:choose>">
                    <a class="last" href="<s:url action="contest/receipt" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>">
                <span class="left"><span class="right">Receipt</span></span></a>
            </li>

        </ul>
    </div>
    <!-- End #tabs3 -->
</s:push>
