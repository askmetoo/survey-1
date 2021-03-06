class NetConfig {
  static const DEBUG = true;
  static const baseUrl = "https://city-microdev1-api.sensoro.com/riskcompapi/";
  //查询风险点的变量列表
  static const riskUrl = "comp_variable/list?risk_id=1";
  //查询风险点的变量列表和值
  static const riskValueUrl = "variable_value/list?risk_id=1";
  //查询场所列表分页
  static const siteListPageUrl = "/site_info/page?parent_id=0&limit=5&offset=5";

  //创建风险点 POST
  static const updateRiskUrl = "comp_variable/saveOrUpate";
  //提交一组数据 POST
  static const updateRiskValueUrl = "variable_value/saveOrUpate";

  //项目列表
  static const projectListUrl = "/project_info/list";
  static const projectDetailUrl = "/project_info/detail/";
  //新增项目信息 POST
  static const addProjectUrl = "/project_info/create";

  static const deleteProjectUrl = "project_info/delete/";
  static const updateProjectUrl = "/project_info/update/";

  //新增勘察点信息 POST
  static const addPointUrl = "/prospect_info/create";
  //区域列表接口
  static const siteListUrl = "site_info/list?";
  static const createUrl = "site_info/create";
  static const editeUrl = "site_info/update/";
  static const getSiteUrl = "/site_info/detail/";
  static const deleteSiteUrl = "/site_info/delete/";

  static const pointListUrl = "prospect_info/list?project_id=";
  static const deletePointUrl = "/prospect_info/delete/";
  static const pointDetailUrl = "prospect_info/detail/";
  static const updatePointUrl = "prospect_info/update/";

  //勘察点任务
  static const prospectTaskListUrl =
      "/prospect_task/list?task_type=fire_danger&keyword=";
  static const createProspectTaskUrl = "/prospect_task/create";
  static const prospectTaskDetailurl = "prospect_task/detail/";
  static const updateprospectTaskurl = "prospect_task/update/";
  static const deleteprospectTaskurl = "prospect_task/delete/";

  static const fire_resourceprospectTaskListUrl =
      "/prospect_task/list?task_type=fire_resource&keyword=";
//  static const createProspectTaskUrl = "/prospect_task/detail/";
}
