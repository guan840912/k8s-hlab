from flask import Flask , request
import requests


app = Flask(__name__)

@app.route('/', methods=['GET'])
def root():
  return "hello wolrd"

@app.route('/geturl', methods=['GET'])
def geturl():
  res = 'something error'
  try:
    host = request.args.get('host')
    res = requests.get(host).content
  except:
    pass
  return res

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=8000)