class NetConfig {
  static const DEBUG = true;
  static const baseUrl = "https://city-microdev1-api.sensoro.com/riskcompapi/";
  //查询风险点的变量列表
  static const riskUrl = "comp_variable/list?risk_id=1";
  //查询风险点的变量列表和值
  static const riskValueUrl = "variable_value/list?risk_id=1";

  //创建风险点 POST
  static const updateRiskUrl = "comp_variable/saveOrUpate";
  //提交一组数据 POST
  static const updateRiskValueUrl = "variable_value/saveOrUpate";
  //区域列表接口
  static const siteListUrl = "/site_info/list?parent_id=";
  static const createUrl = "/site_info/create";
}
