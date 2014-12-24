-ifndef(_cassandra_types_included).
-define(_cassandra_types_included, yeah).

-define(CASSANDRA_CONSISTENCYLEVEL_ONE, 1).
-define(CASSANDRA_CONSISTENCYLEVEL_QUORUM, 2).
-define(CASSANDRA_CONSISTENCYLEVEL_LOCAL_QUORUM, 3).
-define(CASSANDRA_CONSISTENCYLEVEL_EACH_QUORUM, 4).
-define(CASSANDRA_CONSISTENCYLEVEL_ALL, 5).
-define(CASSANDRA_CONSISTENCYLEVEL_ANY, 6).
-define(CASSANDRA_CONSISTENCYLEVEL_TWO, 7).
-define(CASSANDRA_CONSISTENCYLEVEL_THREE, 8).
-define(CASSANDRA_CONSISTENCYLEVEL_SERIAL, 9).
-define(CASSANDRA_CONSISTENCYLEVEL_LOCAL_SERIAL, 10).
-define(CASSANDRA_CONSISTENCYLEVEL_LOCAL_ONE, 11).

-define(CASSANDRA_INDEXOPERATOR_EQ, 0).
-define(CASSANDRA_INDEXOPERATOR_GTE, 1).
-define(CASSANDRA_INDEXOPERATOR_GT, 2).
-define(CASSANDRA_INDEXOPERATOR_LTE, 3).
-define(CASSANDRA_INDEXOPERATOR_LT, 4).

-define(CASSANDRA_INDEXTYPE_KEYS, 0).
-define(CASSANDRA_INDEXTYPE_CUSTOM, 1).
-define(CASSANDRA_INDEXTYPE_COMPOSITES, 2).

-define(CASSANDRA_COMPRESSION_GZIP, 1).
-define(CASSANDRA_COMPRESSION_NONE, 2).

-define(CASSANDRA_CQLRESULTTYPE_ROWS, 1).
-define(CASSANDRA_CQLRESULTTYPE_VOID, 2).
-define(CASSANDRA_CQLRESULTTYPE_INT, 3).

%% struct 'Column'

-record('Column', {'name' :: string() | binary(),
                   'value' :: string() | binary(),
                   'timestamp' :: integer(),
                   'ttl' :: integer()}).
-type 'Column'() :: #'Column'{}.

%% struct 'SuperColumn'

-record('SuperColumn', {'name' :: string() | binary(),
                        'columns' = [] :: list()}).
-type 'SuperColumn'() :: #'SuperColumn'{}.

%% struct 'CounterColumn'

-record('CounterColumn', {'name' :: string() | binary(),
                          'value' :: integer()}).
-type 'CounterColumn'() :: #'CounterColumn'{}.

%% struct 'CounterSuperColumn'

-record('CounterSuperColumn', {'name' :: string() | binary(),
                               'columns' = [] :: list()}).
-type 'CounterSuperColumn'() :: #'CounterSuperColumn'{}.

%% struct 'ColumnOrSuperColumn'

-record('ColumnOrSuperColumn', {'column' :: 'Column'(),
                                'super_column' :: 'SuperColumn'(),
                                'counter_column' :: 'CounterColumn'(),
                                'counter_super_column' :: 'CounterSuperColumn'()}).
-type 'ColumnOrSuperColumn'() :: #'ColumnOrSuperColumn'{}.

%% struct 'NotFoundException'

-record('NotFoundException', {}).
-type 'NotFoundException'() :: #'NotFoundException'{}.

%% struct 'InvalidRequestException'

-record('InvalidRequestException', {'why' :: string() | binary()}).
-type 'InvalidRequestException'() :: #'InvalidRequestException'{}.

%% struct 'UnavailableException'

-record('UnavailableException', {}).
-type 'UnavailableException'() :: #'UnavailableException'{}.

%% struct 'TimedOutException'

-record('TimedOutException', {'acknowledged_by' :: integer(),
                              'acknowledged_by_batchlog' :: boolean(),
                              'paxos_in_progress' :: boolean()}).
-type 'TimedOutException'() :: #'TimedOutException'{}.

%% struct 'AuthenticationException'

-record('AuthenticationException', {'why' :: string() | binary()}).
-type 'AuthenticationException'() :: #'AuthenticationException'{}.

%% struct 'AuthorizationException'

-record('AuthorizationException', {'why' :: string() | binary()}).
-type 'AuthorizationException'() :: #'AuthorizationException'{}.

%% struct 'SchemaDisagreementException'

-record('SchemaDisagreementException', {}).
-type 'SchemaDisagreementException'() :: #'SchemaDisagreementException'{}.

%% struct 'ColumnParent'

-record('ColumnParent', {'column_family' :: string() | binary(),
                         'super_column' :: string() | binary()}).
-type 'ColumnParent'() :: #'ColumnParent'{}.

%% struct 'ColumnPath'

-record('ColumnPath', {'column_family' :: string() | binary(),
                       'super_column' :: string() | binary(),
                       'column' :: string() | binary()}).
-type 'ColumnPath'() :: #'ColumnPath'{}.

%% struct 'SliceRange'

-record('SliceRange', {'start' :: string() | binary(),
                       'finish' :: string() | binary(),
                       'reversed' = false :: boolean(),
                       'count' = 100 :: integer()}).
-type 'SliceRange'() :: #'SliceRange'{}.

%% struct 'SlicePredicate'

-record('SlicePredicate', {'column_names' :: list(),
                           'slice_range' :: 'SliceRange'()}).
-type 'SlicePredicate'() :: #'SlicePredicate'{}.

%% struct 'IndexExpression'

-record('IndexExpression', {'column_name' :: string() | binary(),
                            'op' :: integer(),
                            'value' :: string() | binary()}).
-type 'IndexExpression'() :: #'IndexExpression'{}.

%% struct 'IndexClause'

-record('IndexClause', {'expressions' = [] :: list(),
                        'start_key' :: string() | binary(),
                        'count' = 100 :: integer()}).
-type 'IndexClause'() :: #'IndexClause'{}.

%% struct 'KeyRange'

-record('KeyRange', {'start_key' :: string() | binary(),
                     'end_key' :: string() | binary(),
                     'start_token' :: string() | binary(),
                     'end_token' :: string() | binary(),
                     'row_filter' :: list(),
                     'count' = 100 :: integer()}).
-type 'KeyRange'() :: #'KeyRange'{}.

%% struct 'KeySlice'

-record('KeySlice', {'key' :: string() | binary(),
                     'columns' = [] :: list()}).
-type 'KeySlice'() :: #'KeySlice'{}.

%% struct 'KeyCount'

-record('KeyCount', {'key' :: string() | binary(),
                     'count' :: integer()}).
-type 'KeyCount'() :: #'KeyCount'{}.

%% struct 'Deletion'

-record('Deletion', {'timestamp' :: integer(),
                     'super_column' :: string() | binary(),
                     'predicate' :: 'SlicePredicate'()}).
-type 'Deletion'() :: #'Deletion'{}.

%% struct 'Mutation'

-record('Mutation', {'column_or_supercolumn' :: 'ColumnOrSuperColumn'(),
                     'deletion' :: 'Deletion'()}).
-type 'Mutation'() :: #'Mutation'{}.

%% struct 'EndpointDetails'

-record('EndpointDetails', {'host' :: string() | binary(),
                            'datacenter' :: string() | binary(),
                            'rack' :: string() | binary()}).
-type 'EndpointDetails'() :: #'EndpointDetails'{}.

%% struct 'CASResult'

-record('CASResult', {'success' :: boolean(),
                      'current_values' :: list()}).
-type 'CASResult'() :: #'CASResult'{}.

%% struct 'TokenRange'

-record('TokenRange', {'start_token' :: string() | binary(),
                       'end_token' :: string() | binary(),
                       'endpoints' = [] :: list(),
                       'rpc_endpoints' :: list(),
                       'endpoint_details' :: list()}).
-type 'TokenRange'() :: #'TokenRange'{}.

%% struct 'AuthenticationRequest'

-record('AuthenticationRequest', {'credentials' = dict:new() :: dict()}).
-type 'AuthenticationRequest'() :: #'AuthenticationRequest'{}.

%% struct 'ColumnDef'

-record('ColumnDef', {'name' :: string() | binary(),
                      'validation_class' :: string() | binary(),
                      'index_type' :: integer(),
                      'index_name' :: string() | binary(),
                      'index_options' :: dict()}).
-type 'ColumnDef'() :: #'ColumnDef'{}.

%% struct 'TriggerDef'

-record('TriggerDef', {'name' :: string() | binary(),
                       'options' = dict:new() :: dict()}).
-type 'TriggerDef'() :: #'TriggerDef'{}.

%% struct 'CfDef'

-record('CfDef', {'keyspace' :: string() | binary(),
                  'name' :: string() | binary(),
                  'column_type' = "Standard" :: string() | binary(),
                  'comparator_type' = "BytesType" :: string() | binary(),
                  'subcomparator_type' :: string() | binary(),
                  'comment' :: string() | binary(),
                  'read_repair_chance' :: float(),
                  'column_metadata' :: list(),
                  'gc_grace_seconds' :: integer(),
                  'default_validation_class' :: string() | binary(),
                  'id' :: integer(),
                  'min_compaction_threshold' :: integer(),
                  'max_compaction_threshold' :: integer(),
                  'key_validation_class' :: string() | binary(),
                  'key_alias' :: string() | binary(),
                  'compaction_strategy' :: string() | binary(),
                  'compaction_strategy_options' :: dict(),
                  'compression_options' :: dict(),
                  'bloom_filter_fp_chance' :: float(),
                  'caching' = "keys_only" :: string() | binary(),
                  'dclocal_read_repair_chance' = 0 :: float(),
                  'memtable_flush_period_in_ms' :: integer(),
                  'default_time_to_live' :: integer(),
                  'speculative_retry' = "NONE" :: string() | binary(),
                  'triggers' :: list(),
                  'cells_per_row_to_cache' = "100" :: string() | binary(),
                  'min_index_interval' :: integer(),
                  'max_index_interval' :: integer(),
                  'row_cache_size' :: float(),
                  'key_cache_size' :: float(),
                  'row_cache_save_period_in_seconds' :: integer(),
                  'key_cache_save_period_in_seconds' :: integer(),
                  'memtable_flush_after_mins' :: integer(),
                  'memtable_throughput_in_mb' :: integer(),
                  'memtable_operations_in_millions' :: float(),
                  'replicate_on_write' :: boolean(),
                  'merge_shards_chance' :: float(),
                  'row_cache_provider' :: string() | binary(),
                  'row_cache_keys_to_save' :: integer(),
                  'populate_io_cache_on_flush' :: boolean(),
                  'index_interval' :: integer()}).
-type 'CfDef'() :: #'CfDef'{}.

%% struct 'KsDef'

-record('KsDef', {'name' :: string() | binary(),
                  'strategy_class' :: string() | binary(),
                  'strategy_options' :: dict(),
                  'replication_factor' :: integer(),
                  'cf_defs' = [] :: list(),
                  'durable_writes' = true :: boolean()}).
-type 'KsDef'() :: #'KsDef'{}.

%% struct 'CqlRow'

-record('CqlRow', {'key' :: string() | binary(),
                   'columns' = [] :: list()}).
-type 'CqlRow'() :: #'CqlRow'{}.

%% struct 'CqlMetadata'

-record('CqlMetadata', {'name_types' = dict:new() :: dict(),
                        'value_types' = dict:new() :: dict(),
                        'default_name_type' :: string() | binary(),
                        'default_value_type' :: string() | binary()}).
-type 'CqlMetadata'() :: #'CqlMetadata'{}.

%% struct 'CqlResult'

-record('CqlResult', {'type' :: integer(),
                      'rows' :: list(),
                      'num' :: integer(),
                      'schema' :: 'CqlMetadata'()}).
-type 'CqlResult'() :: #'CqlResult'{}.

%% struct 'CqlPreparedResult'

-record('CqlPreparedResult', {'itemId' :: integer(),
                              'count' :: integer(),
                              'variable_types' :: list(),
                              'variable_names' :: list()}).
-type 'CqlPreparedResult'() :: #'CqlPreparedResult'{}.

%% struct 'CfSplit'

-record('CfSplit', {'start_token' :: string() | binary(),
                    'end_token' :: string() | binary(),
                    'row_count' :: integer()}).
-type 'CfSplit'() :: #'CfSplit'{}.

%% struct 'ColumnSlice'

-record('ColumnSlice', {'start' :: string() | binary(),
                        'finish' :: string() | binary()}).
-type 'ColumnSlice'() :: #'ColumnSlice'{}.

%% struct 'MultiSliceRequest'

-record('MultiSliceRequest', {'key' :: string() | binary(),
                              'column_parent' :: 'ColumnParent'(),
                              'column_slices' :: list(),
                              'reversed' = false :: boolean(),
                              'count' = 1000 :: integer(),
                              'consistency_level' = 1 :: integer()}).
-type 'MultiSliceRequest'() :: #'MultiSliceRequest'{}.

-endif.
