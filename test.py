import requests

for i in range(1, 200):
    requests.get("http://127.0.0.1:8080/function/test-fn")