class elasticsearch::params {
    $elasticsearch_archive = "elasticsearch-2.3.5.tar.gz"
    $elasticsearch_user = "elastic"
    $elasticsearch_group = "elastic"
    $elasticsearch_user_pwd = "elasticsearch"
    $elasticsearch_user_dir = "/home/${elasticsearch_user}"
    $elasticsearch_dir = "/opt/elastic_dir"
    $cluster_name = "elasticsearch-devops"
    $test_test = ['10.18.1.100', '10.18.23.64', '10.18.22.146', '10.18.22.149']
}
