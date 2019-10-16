from flask import Flask, request, jsonify
from flask_expects_json import expects_json
from google.cloud import firestore

db = firestore.Client()

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
    jobs_ref = db.collection(u'jobs')
    jobs_stream = jobs_ref.stream()
    return [
        j.to_dict() for j in jobs_stream
    ]


def create_job(job):
    jobs_ref = db.collection(u'jobs')
    ret = jobs_ref.add(job)
    print(ret)
    return ret


@app.route('/jobs', methods=['GET'])
def jobs_list():
    jobs = list_jobs()
    return jsonify(jobs)

@app.route('/jobs/create', methods=['POST'])
@expects_json(create_job_schema)
def jobs_create():
    return create_job(request.get_json())

@app.route('/')
def hello_world():
    return 'Hello, World!'


if __name__ == '__main__':
    app.run('0.0.0.0')