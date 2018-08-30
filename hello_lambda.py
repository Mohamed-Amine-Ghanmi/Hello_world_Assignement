def handler(event, context):
    return { "message": "Hello, World!" }

def post_handler(event, context):
    name=''
    if "query" in event:
        if "name" in event['query']:
            name = event['query']['name']
    return { "message": "Hello " +name+ " World!"  }
