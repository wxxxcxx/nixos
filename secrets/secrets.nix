let
  wx = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCf9fgwYsVE+E+bdzRkn/ecq9sT9PKryvUn6r8K5gtSGFWPhB+BmFx7M8j2Nhfyufge8BFFCaSO+crRuHG8+XmwmC+xfMHhOabdRuVxCy6DwSR9ej8TOSS8pH9ZqgPE2WTHMFYgup4uTi+NpX1kurpDFujv8k4gjfJkLqyYB4oL417xS+O/PgPfCeraegG5Qh8H/LdGevH1Bn1DQoNb2wWK2MD0XvKB89Cb5TcuYoQFuGKuqcO88HTCFQKGu7zt/EUOigkTDvSSJMt/5cAwj8+AO0E+oqOsRo+XiUseJF5GWx3bBh7SlnwEVUvTkgG3QxMX9tjsbU9LRszUe8BmSRIYz8vhmrXOK70sr8cYkAdfcvl4NcjzRsJXrjr6Hht1BWn738CqMvxbzHcXnTscztM/9xDMzr8qo2HDuHW1/FsueBru/KbvKYXBhMO8oD8GOaWl0jBdBed3yZgo1zCHw8H+CoVwnKm+OUpkd+hrBslRG6ALYgCGGs8KbJpHBvHMc5g9Ta/ZC5S1uYA3u3HOeUCTqNv7toZoGc9cUYDeqoUG08s58cCMLc8vIjwnyGWNVacsdXDZlkgyCAe3qYijXq6JuJQqlqIkqY3qkIS4zb0OIjDnl/RdU+O+3GwsShLZb5bNP64LbfUdlRqI6gk66rqRAPPHUpVvMXe1IdImcZ+MuQ==";
  users = [ wx ];

  mx = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC96vdaMgTeqbahtQ1wJiuVu3JVSUN6PvxtDr2UwrasM6evPRcLeQlqQFcC02XVq1sjB37fSdEZ5rayhHhYAt1Lh54xAmp4tm0zD+5AVn0BpIFR11F2Xg0yxqxS7zWML88hoNi7ZcbllY0dnGwo/95EAfppg0Cdvkb+1KYaivMETXlXqAgK0ZXYl7x0v7r7IP4/FQ6zntVDpum/5IOHx7G0n6Xm9jhxQQv9SnCIl/NWA4YTLllIcBAyV+Xd0JBQDe/zXDWgDzoB7ZY0FwNQjLseIpQFSxZxH7USAyhSjCbz3xOA9XkBjK/pWcOZfhbb02sEf/4RbMyBm/cw/ECgFEarjdYOa4FqEpflMYZBlDLHHn5HSSv8zNqqk4CqJ/iHDL7dLsATquecEx2AQU66I8OESWVpWTFnm8gmHX1fReYAb0lShRRA801S1RJLt/hIdnxRpwmcZe710dJ2JgWX8dS3orX8PgG58kYgA+7Iduu8Wyx0Yk2K4bsmUUDHYsZ59UaZ6yxJWcgv6QAytBZktHYBth+wgHWM7sIzcunRAlK9AWfbypokfC7/FS/JbteS/o0rUlA+JurMCKBr+H3+wagAprLt091XiaIVgFQL2/y0p6BwsFi2x/oMyvipsmRCx9XaThEmxs8ZV1PbZUeKVNvIWmUA+J8OwfrxH9SYAIi4nQ==";
  systems = [ mx ];
in
{
  "proxy.json.age".publicKeys = [ wx mx ];
}