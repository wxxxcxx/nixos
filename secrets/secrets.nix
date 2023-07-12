let
  wx = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCf9fgwYsVE+E+bdzRkn/ecq9sT9PKryvUn6r8K5gtSGFWPhB+BmFx7M8j2Nhfyufge8BFFCaSO+crRuHG8+XmwmC+xfMHhOabdRuVxCy6DwSR9ej8TOSS8pH9ZqgPE2WTHMFYgup4uTi+NpX1kurpDFujv8k4gjfJkLqyYB4oL417xS+O/PgPfCeraegG5Qh8H/LdGevH1Bn1DQoNb2wWK2MD0XvKB89Cb5TcuYoQFuGKuqcO88HTCFQKGu7zt/EUOigkTDvSSJMt/5cAwj8+AO0E+oqOsRo+XiUseJF5GWx3bBh7SlnwEVUvTkgG3QxMX9tjsbU9LRszUe8BmSRIYz8vhmrXOK70sr8cYkAdfcvl4NcjzRsJXrjr6Hht1BWn738CqMvxbzHcXnTscztM/9xDMzr8qo2HDuHW1/FsueBru/KbvKYXBhMO8oD8GOaWl0jBdBed3yZgo1zCHw8H+CoVwnKm+OUpkd+hrBslRG6ALYgCGGs8KbJpHBvHMc5g9Ta/ZC5S1uYA3u3HOeUCTqNv7toZoGc9cUYDeqoUG08s58cCMLc8vIjwnyGWNVacsdXDZlkgyCAe3qYijXq6JuJQqlqIkqY3qkIS4zb0OIjDnl/RdU+O+3GwsShLZb5bNP64LbfUdlRqI6gk66rqRAPPHUpVvMXe1IdImcZ+MuQ==";
  users = [ wx];

  mx = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUHmEdI+Xm2BTbg1Uw1Xd5I7Q/QKlUALRZcjFMG8j3urtvuqZxIGb+7yDCrw5pTPyB0I+u4y96MhUCUSWplpRsB3JtHfOWKsrr/8YE04bpZODrG6ZEu8hAmhHjuCCCqwd42zJOtjVkIi4JWTym1TY4bqA1FmV0DUtCGaF3nP21+3abtjyLzq+sfCS4PPdlhWeOS3DHZ1PWSJ0FBXBxXSGDzebi2J5K8QfIbyKJHWGGzcJ5uEFmRjLPhmqPLmPSoKxWi43PqshqZW0sS+bsJfvQtidgd96t/Yaw5A2wR8HTC6JlKmjMrCLfYWc24KjBWNzZSooM5N4OxYk9J5egmMYK7CMeNtNvXXVS37ZKlBmt/jhVxKGS2ofUjIdHup2nrso6VlhKv0Fhh7gLUqsXaRdlNOeoP5vsdxa4aoXbHKdXnbg5zyh51yX9QrtElApjAjt8TljAbQt2n2BgJEVkRU7gjctmHr/2iNAKmw6+ncQsP+/lJFDJtz35LmpNm2RuMm+lYlf1Zl6WN5r3Qa3JEGtlr3p6zWfecwV3RX3R7TAsgLRCB1F7ZG9k/bhC65aMjao6K2jOpYJAyv4L79ZDxXi9+P1AI/jYfUxKb7boooDS77rBRiLH/wAziijNKW3Fh3RT0MWQ94MuCftGEnxK2rYG7f+rQR1ElVCcUXDGcEbclw==";
  systems = [ mx ];
in
{
  "proxy.json.age".publicKeys = [ wx mx ];
}