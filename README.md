# Erlang Counter Server

Proceso Erlang que conserva un contador y acepta mensajes `increment`, `value` y `stop`.

```powershell
erlc counter.erl
erl -noshell -s counter start -s init stop
```
