from flask import Flask

app = Flask(__name__)

@app.route('/one')
def one():
    return 'One', 201

@app.route('/two')
def two():
    return 'Two', 202

@app.route('/three')
def three():
    return 'Three', 203

@app.route('/four')
def four():
    return 'Four', 204

@app.route('/five')
def five():
    return 'Five', 205

@app.route('/error')
def error():
    return 'Error', 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
