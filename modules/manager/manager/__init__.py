from flask import Flask, request
from flask_expects_json import expects_json

app = Flask(__name__)

create_job_schema = {
    'type': 'object',
    'properties': {
        'name': {'type': 'string'},
        'image': {'type': 'string'},
    },
    'required': ['name', 'image']
}


def list_jobs():
    return []


def create_job():
    job_req = request.get_json()
    print(job_req)


@app.route('/jobs', methods=['POST', 'GET'])
@expects_json(create_job_schema)
def jobs_create_list():
    if request.method == 'GET':
        return list_jobs()
    else:
        return create_job()

@app.route('/')
def hello_world():
    return 'Hello, World!'


if __name__ == '__main__':
    app.run('0.0.0.0')