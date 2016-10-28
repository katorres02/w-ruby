module Watson
  class Cluster
    attr_reader :solr_cluster_id, :cluster_name, :cluster_size, :solr_cluster_status

    def initialize(options = {})
      @solr_cluster_id     = options['solr_cluster_id']
      @cluster_name        = options['cluster_name']
      @cluster_size        = options['cluster_size']
      @solr_cluster_status = options['solr_cluster_status']
    end
  end
end