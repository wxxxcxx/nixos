let
  wx = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCms53zX5KriTS8vLNLGnPoaWKOtdxTK01vBgJ42OrB+TB2QqdqMsxQBpjVD756RMbJoHMwiBgQfZmh9A4drnkw+k/NiQTe//IaGdJ/Qzf68aoPQDLeB7BKvyx1k7DVd55JiLQhxr+iWIvb0Ynp4Yo2zX7cSmRYgbUt1+iZ+KQuoMGvfBS6eWP4qUzhgkvHI0ThCcqCZIvopNi9SjaZNGUwZjZ/1ZA+AqKjjoShwvi0rRQ99DaGcf3Jn3zCyaq6veJ36m5BXiZe2os8lPME/ZxZh/FP4+0alGiFcjxeBFcKugJJyumJtJ8UENjuKgiVOjPxyn3o3ym1g769ZucwAskp2bPYKfvvbt5gvlqoxEYXcE3EMsWYIOzxMnKRBSM8XrtUh48SczMnRKJxxylRwnAYDhahkVsyYlxh4dQjb+vOP8dqeJGrEYzQT3YACzoHgbhdHbG9kxlfQbHnMCiUujJrGApEqSYlF6RPFp/5qAdttPJZn7oZvqTHapLYgCZQ2NfdBdAyhmmrJdXFCd0VzR/ekU+vbMaEOuAhE786IC3Vd3cHxp2+LbmMS4GJ8b5rpDrKdBYEkrsd6Xtee/DiV1o1YnGP/UzdbvjuYr4l7egelAvVpWesAKroUg9jOQ+OVPh43o0RnQgRjwxnq/szKY0gA6P41MV3Et+GWLP9PT0Jrw==";

in {
  "wx.age".publicKeys = [ wx ]
}