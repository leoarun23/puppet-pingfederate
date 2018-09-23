# default values
class pingfederate::params {
  $install_dir                         = '/opt/pingfederate'
  $package_list                        = 'pingfederate-server'
  $package_ensure                      = 'installed'
  $package_java_list                   = undef
  $package_java_ensure                 = 'installed'
  $package_java_redhat                 = 'java-1.8.0-oracle'
  $package_java_centos                 = 'java-1.8.0-openjdk'
  $service_name                        = 'pingfederate'
  $service_ensure                      = true
  $log_retain_days                     = 30
  $log_levels                          = []
  $log_files                           = []
  $license_content                     = undef
  $license_file                        = undef
  $owner                               = 'pingfederate'
  $group                               = 'pingfederate'
  # run.properties defaults
  # see https://documentation.pingidentity.com/pingfederate/pf82/index.shtml#adminGuide/concept/changingConfigurationParameters.html
  # and /opt/pingfederate-$PF_VERSION/pingfederate/bin/run.properties
  $admin_https_port                    = 9999
  $admin_hostname                      = undef
  $console_bind_address                = '0.0.0.0'
  $console_title                       = 'PingFederate'
  $console_session_timeout             = 30
  $console_login_mode                  = 'multiple'
  $console_authentication              = 'native'
  $admin_api_authentication            = 'native'
  $http_port                           = -1
  $https_port                          = 9031
  $secondary_https_port                = -1
  $engine_bind_address                 = '0.0.0.0'
  $monitor_bind_address                = '0.0.0.0'
  $log_dir                             = "${install_dir}/pingfederate/log"
  $log_eventdetail                     = false
  $heartbeat_system_monitoring         = false
  $operational_mode                    = 'STANDALONE'
  $cluster_node_index                  = 0
  $cluster_auth_pwd                    = undef
  $cluster_encrypt                     = false
  $cluster_bind_address                = 'NON_LOOPBACK'
  $cluster_bind_port                   = 7600
  $cluster_failure_detection_bind_port = 7700
  $cluster_transport_protocol          = 'tcp'
  $cluster_mcast_group_address         = '239.16.96.69'
  $cluster_mcast_group_port            = 7601
  $cluster_tcp_discovery_initial_hosts = undef
  $cluster_diagnostics_enabled         = false
  $cluster_diagnostics_addr            = '224.0.75.75'
  $cluster_diagnostics_port            = 7500
  $adm_user                            = 'Administrator'
  $adm_pass                            = 'p@Ssw0rd'
  $adm_hash                            = 'k1H1o2jc66sgkDjJKq85Sr22QNk143S20oR2Yyt2kqo.5Cu-mnqB.2'
  $adm_api_baseURL                     = "https://${facts['fqdn']}:${admin_https_port}/pf-admin-api/v1"
  $service_api_baseURL                 = "https://${facts['fqdn']}:${https_port}"
  $saml2_local_entityID                = "${facts['hostname']}-ping:urn:saml2"
  $saml1_local_issuerID                = "${facts['hostname']}-ping:urn:saml1"
  $wsfed_local_realm                   = "${facts['hostname']}-ping:urn:wsfed"
  $http_forwarded_for_header           = undef
  $http_forwarded_host_header          = undef
  $auth_policy_contract                = []
  $auth_policy_contract_default        = {
    'name' => undef,
    'core_attrs' => ['subject'],
    'extd_attrs' => []
  }
  $saml2_idp                           = []
  $saml2_idp_default                   = {
    'url' => undef,
    'post' => 'idp/profile/SAML2/POST/SSO',
    'redirect' => 'idp/profile/SAML2/Redirect/SSO',
    'name' => undef,
    'metadata' => '',           # apparently undef comes through in ERB templates as 'undef'!
    'virtual' => [],
    'entityID' => undef,
    'contact' => {'firstName' => '', 'lastName' => '', 'email' => ''},
    'profiles' => ['SP_INITIATED_SSO'],
    'sp_auth_policy_name' => undef,
    'id_mapping' => 'ACCOUNT_MAPPING',
    'core_attrs' => ['SAML_SUBJECT'],
    'extd_attrs' => [],
    'attr_map' => [],
    'oauth_map' => [],
    'cert_file' => undef,
    'cert_content' => undef,
    'oauth_token_map' => undef
  }
  $social_adapter                      = {}  # hash of hashes keyed by adapter name
  $social_adapter_default              = {   # default hash values
    'enable' => false,
    'package_list' => undef,
    'package_ensure' => undef,
    'app_id' => undef,
    'app_secret' => undef,
    'oauth_token_map' => [],
    'oauth_idp_map' => []
  }
  $cors_allowedOrigins                 = '*'
  $cors_allowedMethods                 = 'GET,OPTIONS,POST'
  $cors_allowedHeaders                 = 'X-Requested-With,Content-Type,Accept,Origin,Authorization'
  $cors_filter_mapping                 = '/*'
  $ognl_expressions_enable             = true
  $oauth_jdbc_type                     = undef
  $oauth_jdbc_host                     = 'localhost'
  $oauth_jdbc_port                     = undef
  $oauth_jdbc_db                       = 'pingfed'
  $oauth_jdbc_user                     = 'pingfed'
  $oauth_jdbc_pass                     = 'pingfed'
  $oauth_jdbc_url                      = undef
  $oauth_jdbc_driver                   = undef
  $oauth_jdbc_package_list             = undef
  $oauth_jdbc_package_ensure           = 'installed'
  $oauth_jdbc_jar_dir                  = undef
  $oauth_jdbc_jar                      = undef
  $oauth_jdbc_nexus                    = undef
  $oauth_jdbc_validate                 = undef
  $oauth_jdbc_create_cmd               = undef
  $oauth_jdbc_client_ddl_cmd           = undef
  $oauth_jdbc_access_ddl_cmd           = undef
  $acct_jdbc_linking_ddl_cmd           = undef
  $oauth_client_mgr_user               = 'clientmgr'
  $oauth_client_mgr_pass               = 'ProviderP@55'
  $oauth_svc_scopes                    = []
  $oauth_svc_scope_groups              = []
  $oauth_svc_grant_core_attrs          = ['USER_KEY','USER_NAME']
  $oauth_svc_grant_extd_attrs          = []
  $oauth_scope_selectors               = []
  $oauth_scope_fail_no_selection       = false
  $oauth_svc_acc_tok_mgr_id            = undef
  $oauth_svc_acc_tok_mgr_core_attrs    = []
  $oauth_svc_acc_tok_mgr_extd_attrs    = []
  $oauth_authn_policy_map              = []
  $oauth_oidc_policy_id                = undef
  $oauth_oidc_id_userinfo              = false
  $oauth_oidc_policy_core_map          = []
  $oauth_oidc_policy_extd_map          = []
  $oauth_oidc_policy_scope_attr_map    = {}
  $oauth_client                        = {}
  $oauth_client_default                = {
    'redirectUris' => [],
    'grantTypes' => [],
    'name' => '',
    'description' => '',
    'logoUrl' => '',
    'validateUsingAllEligibleAtms' => false,
    'refreshRolling' => 'SERVER_DEFAULT',
    'persistentGrantExpirationType' => 'SERVER_DEFAULT',
    'persistentGrantExpirationTime' => 0,
    'persistentGrantExpirationTimeUnit' => 'DAYS',
    'bypassApprovalPage' => true,
    'restrictScopes' => true,
    'restrictedScopes' => [],
    'oidcPolicy' => {
      'grantAccessSessionRevocationApi' => false,
      'pingAccessLogoutCapable' => false,
      'logoutUris'  => [],
    },
    'clientAuth' => {
      'type' => 'SECRET',
      'secret' => '',
      'clientCertIssuerDn'  => '',
      'clientCertSubjectDn'  => '',
    }
  }
}
