[Environment]::SetEnvironmentVariable({ERLANG_HOME}, { %PROGRAMFILES%\{{erl_var}} }, [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable({ERLANG_HOME}, { %PROGRAMFILES%\{{erl_var}} }, [System.EnvironmentVariableTarget]::Process)

