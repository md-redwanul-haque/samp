class APIs {
  APIs._();

  static const String mainBaseUrl = "https://dev.nnur.ca/api";
  //static const String mainBaseUrl = "https://niam-backend.onrender.com/api";
  static const String orgDomainfindUrl =
      "$mainBaseUrl/organization/validate-domain";
  static const String loginAPI = "$mainBaseUrl/auth/login";
  static const String dashboard = "$mainBaseUrl/organization/organization";
  static const String org_stat = "$mainBaseUrl/orgstat/currentstat";
  static const String app_list = "$mainBaseUrl/app/app";
  static const String access_Ticket = "$mainBaseUrl/ticket/fallraised";
  static const String access_List = "$mainBaseUrl/access/accesslist";
  static const String access_Info = "$mainBaseUrl/access/accessInfo";
  static const String access_List_post = "$mainBaseUrl/ticket/fticket";
  static const String sendMail = "$mainBaseUrl/email/sendemail";
  static const String sendSMS = "$mainBaseUrl/ticket/fmessage";
  static const String bulkApprove = "$mainBaseUrl/ticket/bulkapprove";
  static const String bulkreject = "$mainBaseUrl/ticket/bulkreject";
  static const String my_approval_pending = "$mainBaseUrl/ticket/fpending";
  static const String my_approval_pending_bulk_ticket =
      "$mainBaseUrl/ticket/bulkpending";
  static const String my_bulk_ticket_inner_list =
      "$mainBaseUrl/ticket/childtickets";
  static const String pending_list_approval = "$mainBaseUrl/ticket/fapprove";
  static const String pending_list_revoke = "$mainBaseUrl/ticket/freject";
  static const String new_access_request_app_list = "$mainBaseUrl/app/app";
  static const String new_access_request_system = "$mainBaseUrl/system/system";
  static const String new_access_request_host = "$mainBaseUrl/host/allhost";
  static const String new_access_request_role_host =
      "$mainBaseUrl/host/hostroles";
  static const String new_access_request_role_system =
      "$mainBaseUrl/system/sysroles";
  static const String new_access_request_right_system =
      "$mainBaseUrl/system/selectedright";
  static const String user_check_list = "$mainBaseUrl/user/checkuser";
  static const String new_access_request_right_host =
      "$mainBaseUrl/host/selectedright";
  static const String bulk_ticket_approve = "$mainBaseUrl/ticket/bulkapprove";
}
