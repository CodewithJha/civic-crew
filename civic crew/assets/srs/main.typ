#set page(
paper: "a4",
number-align: center,
numbering: "1",
margin: 1in)
#set text(lang: "en")
#set par(justify: true)
#set heading(numbering: "1.1.")
#set text(11pt)
#set text(font: "Liberation Sans")

#v(15%)
#text(25pt, red)[*CROWDSOURCED\ CIVIC ISSUE REPORTING AND\ RESOLUTION SYSTEM*]

#text(20pt, gray)[*Software Requirement Specifications*]

#pagebreak()
#outline(indent: 3em)
#pagebreak()

= INTRODUCTION

The introduction of the Software Requirements Specification (SRS) provides an overview of the entire SRS with purpose, scope, definitions, acronyms, abbreviations, references and overview of the SRS. The aim of this document is to gather and analyze and give an in-depth insight of the complete *Crowdsourced Issue Reporting and Resolution System* by defining the problem statement in detail. Nevertheless, it also concentrates on the capabilities required by stakeholders and their needs while defining high-level product features. The detailed requirements of the *Crowdsourced Issue Reporting and Resolution System* are provided in this document.


= PURPOSE

The purpose of the document is to collect and analyze all assorted ideas that have come up to define the system, its requirements with respect to consumers. Also, we shall predict and sort out how we hope this product will be used in order to gain a better understanding of the project, outline concepts that may be developed later, and document ideas that are being considered, but may be discarded as the product develops. In short, the purpose of this SRS document is to provide a detailed overview of our software product, its parameters and goals. This document describes the project's target audience and its user interface, hardware and software requirements. It defines how our client, team and audience see the product and its functionality. Nonetheless, it helps any designer and developer to assist in software delivery lifecycle (SDLC) processes.

= SCOPE

This Software Requirements Specification (SRS) defines the technical and functional specifications for the Crowdsourced Issue Reporting and Resolution System The scope of this document is to:
- Provide a detailed description of the functional, non-functional, data, interface, and workflow requirements for the system.

- Serve as a single source of reference for all stakeholders involved in design, development, testing, and deployment.
- Establish a technical baseline that can be traced through design, implementation, and verification activities.


= DEFINITIONS, ACRONYMS, AND ABBREVIATIONS

== Definitions

*Citizen User* : An individual who submits civic issues using the mobile application.

*Report* : A structured record of a civic issue submitted by a citizen, including metadata such as description, photo(s), geolocation, and timestamps.

*Administrative Portal (Admin Portal)* : The web-based dashboard used by municipal staff to view, filter, assign, and track reports.

*Field Worker Interface* : A mobile-optimized interface used by staff or contractors in the field to receive tasks, update progress, and upload resolution evidence.

*Routing Engine* : The backend component responsible for assigning submitted reports to the appropriate department based on rules and metadata.

*Priority Area* : A location highlighted in the system for attention due to high volume, severity, or administrator-configured criteria.

*Workflow Lifecycle* : The defined process states a report passes through: Submitted → Validated → Routed → Assigned → In-progress → Resolved → Closed.

*Duplicate Detection* : A mechanism for identifying multiple reports referring to the same or nearby issue.

*Feedback* : Citizen input after resolution, including satisfaction rating or comments.

*Audit Trail* : A secure, immutable record of actions taken on reports, configurations, and workflows.

== Acronyms

*API* : Application Programming Interface

*BRD* : Business Requirements Document

*CIRRP* : Civic Issue Reporting and Resolution Platform

*CSV* : Comma-Separated Values

*ERP* : Enterprise Resource Planning

*FR* : Functional Requirement

*GIS* : Geographic Information System

*GPS* : Global Positioning System

*JSON* : JavaScript Object Notation

*NFR* : Non-Functional Requirement

*PWA* : Progressive Web Application

*RBAC* : Role-Based Access Control

*RPO* : Recovery Point Objective

*RTO* : Recovery Time Objective

*SLA* : Service Level Agreement

*SRS* : Software Requirements Specification

*SSO* : Single Sign-On

*UI* : User Interface

*UTC* : Coordinated Universal Time

== Abbreviations

*Ack.* : Acknowledged

*In-Progress* : Task assigned and being worked on

*Res.* : Resolved

*Closed* : Report verified and completed

= FUNCTIONAL REQUIREMENTS

== Citizen/ User Mobile Application

- *FR-1:* The system shall provide a cross-platform mobile application,for Android, iOS and as PWA(Progressive Web App).

- *FR-2:* The system shall allow users to submit civic issue reports in real time through the mobile application.
- *FR-3:* The system shall require each report to contain at least one image file in JPEG or PNG format with a maximum file size of 5 MB.
- *FR-4:* The system shall automatically capture the GPS latitude, longitude, and accuracy metadata of the user’s location during report submission.
- *FR-5:* The system shall allow users to manually adjust the pinned location on a map interface before submission.
- *FR-6:* The system shall allow users to attach a short text description of up to 500 characters to a report.
- *FR-7:* The system shall allow users to record and attach a voice note of up to 60 seconds to a report.
- *FR-8:* The system shall assign a unique identifier to each submitted report.
- *FR-9:* The system shall allow users to track the lifecycle status of their report, including Submitted, Validated, Routed, Assigned, In-progress, Resolved, and Closed.
- *FR-10:* The system shall generate notifications to the reporting user upon report confirmation, acknowledgment, and resolution.
- *FR-11:* The system shall provide offline submission capability, queuing reports locally, and automatically synchronizing them when connectivity is restored.

== Administrator / Municipal Staff Web Portal

- *FR-12:* The system shall provide a web-based administrative portal accessible via modern browsers including Chrome, Firefox, and Edge.

- *FR-13:* The system shall allow administrators to view, filter, and categorize reports by category, location, and priority.
- *FR-14:* The system shall allow administrators to update the status of issues as Acknowledged, In-progress, Resolved, or Closed.
- *FR-15:* The system shall allow administrators to assign issues to individual staff members, field workers, or departments.
- *FR-16:* The system shall provide a live interactive map displaying all active reports with clustering and heatmap visualization.
- *FR-17:* The system shall provide list and Kanban views of reports in the administrative portal.
- *FR-18:* The system shall allow administrators to configure prioritization rules based on volume of submissions, urgency inferred from user inputs, and other configurable criteria.
- *FR-19:* The system shall provide analytics dashboards that include reporting trends, departmental response times, and citizen satisfaction metrics.

== Backend/Core System Requirements
- *FR-20:* The system shall include a backend routing engine that maps reports to responsible departments using location polygons, issue categories, and administrator-defined rules.

- *FR-21:* The system shall support real-time updates of report status using WebSockets or Server-Sent Events (SSE).
- *FR-22:* The system shall provide APIs for integration with external systems including ERP, SMS gateways, and GIS services.
- *FR-23:* The system shall store all reports, metadata, and associated media files in a secure database with CDN-backed media storage and automatic thumbnail generation.
- *FR-24:* The system shall implement duplicate detection using geospatial proximity, time window, and media similarity heuristics.
- *FR-25:* The system shall maintain an immutable audit trail of all workflow transitions and administrative actions.

= NON-FUNCTIONAL REQUIREMENTS

- *NFR-1:* The system shall support at least 1,000 concurrent users submitting and tracking reports without degradation of service.

- *NFR-2:* The system shall process and persist new reports within 3 seconds under normal operating conditions.
- *NFR-3:* The system shall support spikes of up to 5x the average reporting load without failure or data loss.
- *NFR-4:* The system shall provide an image upload feature that completes within 5 seconds for files ≤ 5 MB under standard broadband/mobile network conditions.
- *NFR-5:* The system shall deliver near real-time updates of report status changes to users and staff, with an end-to-end latency of less than 2 seconds.
- *NFR-6:* The system shall maintain a minimum uptime of 99.9% measured on a monthly basis.
- *NFR-7:* The system shall ensure resilience by queuing offline submissions locally on the device and automatically synchronizing them once connectivity is restored.
- *NFR-8:* The system shall provide responsive performance across devices, ensuring that pages and screens load in less than 2 seconds on average.
- *NFR-9:* The mobile application shall comply with usability and accessibility guidelines, including WCAG 2.1 Level AA for color contrast and screen-reader support.
- *NFR-10:* The administrative portal shall support modern browsers (Chrome, Firefox, Edge, Safari) with no additional plugins required.
- *NFR-11:* The system shall enforce role-based access control (RBAC) for all users including citizens, administrators, supervisors, and field workers.
- *NFR-12:* The system shall encrypt all personally identifiable information (PII) and media in transit using TLS 1.2 or higher.
- *NFR-13:* The system shall encrypt stored data, including reports and media, using AES-256 or equivalent.
- *NFR-14:* The system shall store all system logs, audit records, and user actions in an immutable log database for a minimum retention period of 7 years.
- *NFR-15:* The system shall provide APIs with JSON responses for integration with third-party services, including SMS/email gateways and municipal ERP systems.
- *NFR-16:* The system shall provide CDN-backed media storage to ensure scalable, distributed delivery of images and media.
- *NFR-17:* The system shall support configuration of retention policies for citizen reports and media files, with automatic archival or deletion after the defined period.
- *NFR-18:* The system shall implement monitoring and alerting for application performance, uptime, and error rates, notifying system administrators within 1 minute of incident detection.
- *NFR-19:* The system shall be designed with modular architecture to enable maintainability and future feature extensions without major system redesign.
- *NFR-20:* The system shall provide automated test coverage of at least 80% of backend services to ensure maintainability and reliability.
- *NFR-21:* The system shall comply with applicable data privacy and protection regulations, including GDPR principles where relevant, and the Indian IT Act.
- *NFR-22:* The system shall provide audit logs for all administrative and staff actions, accessible only by authorized roles.

= DATA REQUIREMENTS

== Citizen Data
- *DR-1:* The system shall allow optional citizen profiles including:
  - Name (string, max 100 chars)

  - Phone number (string, 15 chars, unique)
  - Authentication credentials

- *DR-2:* The system shall store citizen consent for sharing location and media when submitting reports.

== Report Data

- *DR-3:* Each report shall have a unique identifier generated by the system.

- *DR-4:* The system shall store the following attributes for each report:
  - Report ID
  - Timestamp of submission (UTC)

  - Report status (Submitted, Validated, Routed, Assigned, In-progress, Resolved, Closed)
  - Category of issue (e.g., pothole, streetlight, trash bin)
  - Priority (Low, Medium, High, Critical)
  - Description text (≤ 500 characters)

  - Voice note (≤ 60 seconds, stored as audio file reference)
  - Image(s)/media reference (one or more file URIs)
  - GPS coordinates (latitude, longitude, accuracy in meters)
  - Ward/zone mapping (derived from geolocation)
  - Assigned department or staff reference

== Staff & Department Data

- *DR-5:* The system shall store staff profiles, including:
  - Staff ID

  - Name
  - Role (e.g., admin, supervisor, field worker)
  - Department association
  - Contact details (email, phone)
  - Authentication credentials (role-based access)

- *DR-6:* The system shall store department metadata including:
  - Department ID

  - Department name
  - Jurisdiction boundaries (polygon data)
  - Associated categories of issues

== Workflow & Audit Data

- *DR-7:* The system shall log every workflow transition with:
  - Actor (citizen, staff, system)
  - Timestamp
  - Action performed (e.g., Routed, Assigned, Status updated)

  - Notes or justification (if provided)

- *DR-8:* The system shall maintain an immutable audit trail of all administrative actions (login, configuration changes, task assignments, status updates).

== Analytics & Reporting Data

- *DR-9:* The system shall store aggregated operational metrics including:
  - Number of reports per category, location, and time period

  - Average time to acknowledgment and resolution
  - Staff workload distribution (tasks per staff/department)
  - Hotspot maps of recurring issues

- *DR-10:* The system shall allow export of reports and analytics data in CSV, PDF, and GeoJSON formats.

== System & Integration Data

- *DR-11:* The system shall store API tokens, webhook configurations, and integration settings securely.

- *DR-12:* The system shall log API requests and responses with timestamp, endpoint, and status code for debugging and auditing.

= PROCESS REQUIREMENTS

- *PR-1:* The system shall define and enforce an issue lifecycle with states:\ Submitted → Validated → Routed → Assigned → In-progress → Resolved → Closed.
- *PR-2:* The system shall automatically validate report completeness (e.g., mandatory fields present) before routing.
- *PR-3:* The system shall automatically route reports to the correct department using configurable rules.
- *PR-4:* The system shall queue reports with low routing confidence into a triage list for manual staff review.
- *PR-5:* The system shall allow supervisors to assign routed reports to field workers or teams for resolution.
- *PR-6:* The system shall allow duplicate reports to be detected and flagged for manual merge or linking.
- *PR-7:* The system shall allow citizens to dispute or re-open closed reports, creating a follow-up workflow.
- *PR-8:* The system shall record all workflow transitions with actor ID, timestamp, and action type as part of the process audit.
- *PR-9:* The system shall notify citizens at key workflow milestones: submission confirmation, staff acknowledgment, and resolution.
- *PR-10:* The system shall notify staff when new reports are routed or assigned to them.
- *PR-11:* The system shall highlight recurring or clustered reports as potential priority areas in the admin dashboard.
- *PR-12:* The system shall allow administrators to configure escalation rules for unresolved reports (e.g., raise to supervisor after threshold time).

= INTERFACES

== User Interfaces
+ Mobile application interface for citizens.
+ Web-based administrative portal interface for staff and supervisors.
+ Mobile-optimized field staff interface for task execution.

== External System Interfaces
+ APIs (JSON/HTTPS) for third-party system integrations.
+ SMS and Email gateway interfaces for notifications.
+ GIS system interface for ward/zone boundary import.
+ Webhook interface for event notifications.
+ SSO/Identity provider interface for staff authentication.

== Hardware Interfaces
+ GPS receiver for location tagging.
+ Camera for image/video capture.
+ Microphone for voice note capture.
+ Local device storage for offline submission queue.

== Software Interfaces

+ Relational database interface for structured data (reports, users, workflow).
+ Object storage/CDN interface for multimedia content.
+ Authentication service interface (OAuth2/JWT).
+ Logging and monitoring service interface.
