from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello world!'

@app.route('/time')
def get_time():
    # Format the current time as YYYY-MM-DD HH:MM:SS
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return f"Current server time is: {now}"

if __name__ == '__main__':
    app.run(host='0.0.0.0',
            port=8080,
            debug=True)
