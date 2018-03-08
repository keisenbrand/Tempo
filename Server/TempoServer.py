from Database import DynamoDBHelper
from Schema import DynamoDBSchemaHelper
from flask import Flask
from google.protobuf.json_format import MessageToJson

import user_pb2
import BrandsDict

DEBUG = False

app = Flask(__name__)

dynamoDbSchemaHelper = DynamoDBSchemaHelper()
dynamoDbHelper = DynamoDBHelper()

# Get current user - treat this as whoever is logged into the app


@app.route("/currentUser/<username>")
def getCurrentUser(username):
    user = dynamoDbHelper.table('users') \
        .get({
            'username': username
        }, user_pb2.User())

    if DEBUG:
        return MessageToJson(user)
    return user.SerializeToString()


@app.route("/getUsers")
def getUsers():
    users = dynamoDbHelper.table('users')
    return MessageToJson(users)


@app.route("/deleteUser/<username>")
def deleteUser(username):
    response = dynamoDbHelper.table('users') \
        .remove({
            'username': username
        })
    return response


@app.route("/addUser")
def addUser():
    # TODO: replace with real data
    brandsList = []
    brand = user_pb2.Brand(
        brand_name='LIFE VR',
        type='LIFE_VR'
        )
    brandsList.append(brand)
    user = user_pb2.User(
        username='newbie',
        userID='n00b',
        type=user_pb2.User.WRITER,
        brands=brandsList
    )
    response = dynamoDbHelper.table('users') \
        .put(user)
    print(dynamoDbHelper.table('users')
          .get({
              'username': "newbie"
          }, user_pb2.User()))
    return response


@app.route("/updateUser")
def updateUser():
    brandsList = []
    brand = user_pb2.Brand(
        brand_name='LIFE VR',
        type='LIFE_VR'
        )
    brandsList.append(brand)
    response = dynamoDbHelper.table('users') \
        .update({
            'username': "keisenbrand"
            }, brandsList)
    print(dynamoDbHelper.table('users')
          .get({
              'username': "keisenbrand"
          }, user_pb2.User()))
    return response


@app.route("/getBrands")
def getBrands():
    brandsList = []
    for brandDict in BrandsDict.brands:
        brand = user_pb2.Brand(
            brand_name=brandDict['brand_name'],
            type=brandDict['type']
            )
        brandsList.append(brand)

    return brandsList

if __name__ == "__main__":
    dynamoDbHelper.deleteTable()
    dynamoDbSchemaHelper.generateTables()
    dynamoDbHelper.generateDummyData()
    app.run()
