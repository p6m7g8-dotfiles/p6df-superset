# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::superset::deps()
#
#>
######################################################################
p6df::modules::superset::deps() {

  # shellcheck disable=2034
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::superset::mcp()
#
#>
#/ Synopsis
#/    Installs Apache Superset MCP server
#/
######################################################################
p6df::modules::superset::mcp() {

  p6_js_npm_global_install "superset-mcp"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::superset::profile::on(profile, [env_or_url=http://localhost:8088], [username=admin], [password=])
#
#  Args:
#	profile -
#	OPTIONAL env_or_url - [http://localhost:8088]
#	OPTIONAL username - [admin]
#	OPTIONAL password - []
#
#  Environment:	 P6_DFZ_PROFILE_SUPERSET SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
#>
######################################################################
p6df::modules::superset::profile::on() {
  local profile="$1"
  local env_or_url="${2:-http://localhost:8088}"
  local username="${3:-admin}"
  local password="${4:-}"

  local url="$env_or_url"

  if p6_string_match_regex "$env_or_url" '(^|[[:space:]])export[[:space:]]+SUPERSET'; then
    p6_run_code "$env_or_url"
    url="${SUPERSET_URL:-http://localhost:8088}"
    username="${SUPERSET_USERNAME:-$username}"
    password="${SUPERSET_PASSWORD:-$password}"
  fi

  p6_env_export "P6_DFZ_PROFILE_SUPERSET" "$profile"
  p6_env_export "SUPERSET_URL"            "$url"
  p6_env_export "SUPERSET_USERNAME"       "$username"

  if p6_string_blank_NOT "$password"; then
    p6_env_export "SUPERSET_PASSWORD" "$password"
  else
    p6_env_export_un SUPERSET_PASSWORD
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::superset::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_SUPERSET SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
#>
######################################################################
p6df::modules::superset::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_SUPERSET
  p6_env_export_un SUPERSET_URL
  p6_env_export_un SUPERSET_USERNAME
  p6_env_export_un SUPERSET_PASSWORD

  p6_return_void
}
