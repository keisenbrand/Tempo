from Database import DynamoDBHelper
from Schema import DynamoDBSchemaHelper
from flask import Flask
from google.protobuf.json_format import MessageToJson

import user_pb2

DEBUG = True

app = Flask(__name__)

dynamoDbSchemaHelper = DynamoDBSchemaHelper()
dynamoDbHelper = DynamoDBHelper()

# Get current user - treat this as whoever is logged into the app


@app.route("/currentUser")
def getCurrentUser():
    user = dynamoDbHelper.table('users') \
        .get({
            'username': "amurray"
        }, user_pb2.User())

    if DEBUG:
        return MessageToJson(user)
    return user.SerializeToString()


@app.route("/deleteUser")
def getUsers():
    user = dynamoDbHelper.table('users') \
        .delete({
            'username': "amurray"
        }, user_pb2.User())
    print("deleted")
    deletedUser = dynamoDbHelper.table('users') \
        .get({
            'username': "amurray"
        }, user_pb2.User())
    print(deletedUser)
    if DEBUG:
        return MessageToJson(user)
    return user.SerializeToString()

if __name__ == "__main__":
    dynamoDbHelper.deleteTable()
    dynamoDbSchemaHelper.generateTables()
    dynamoDbHelper.generateDummyData()
    app.run()
