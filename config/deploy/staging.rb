server '139.162.149.53', user: 'prium', roles: %w{app db web}, primary: true

set :stage, :staging
set :rails_env,       'staging'
set :branch,          fetch(:branch, 'staging')

set :linked_dirs, %w{tmp/pids}
set :delayed_job_workers, 5