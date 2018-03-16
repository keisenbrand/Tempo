from Database import DynamoDBHelper
from Schema import DynamoDBSchemaHelper
from flask import Flask
from flask import request

import user_pb2
import BrandsDict

DEBUG = False

app = Flask(__name__)

dynamoDbSchemaHelper = DynamoDBSchemaHelper()
dynamoDbHelper = DynamoDBHelper()

# Get current user - treat this as whoever is logged into the app


@app.route("/getCurrentUser", methods=['POST'])
def getCurrentUser():
    getCurrentUserRequest = user_pb2.GetCurrentUserRequest()
    getCurrentUserRequest.ParseFromString(request.get_data())

    user = dynamoDbHelper.table('users') \
        .get({
            'username': getCurrentUserRequest.username
        }, user_pb2.User())

    return user_pb2.GetCurrentUserResponse(user=user).SerializeToString()


@app.route("/getAllUsers", methods=['POST'])
def getAllUsers():
    getAllUsersRequest = user_pb2.GetAllUsersRequest()
    getAllUsersRequest.ParseFromString(request.get_data())

    #users = dynamoDbHelper.table('users')

    return user_pb2.GetAllUsersResponse().SerializeToString()


@app.route("/deleteUser", methods=['POST'])
def deleteUser():
    deleteUserRequest = user_pb2.DeleteUserRequest()
    deleteUserRequest.ParseFromString(request.get_data())

    dynamoDbHelper.table('users') \
        .remove({
            'username': deleteUserRequest.username
        })

    return user_pb2.DeleteUserResponse().SerializeToString()


@app.route("/addUser", methods=['POST'])
def addUser():
    addUserRequest = user_pb2.AddUserRequest()
    addUserRequest.ParseFromString(request.get_data())

    user = user_pb2.User(
        username=addUserRequest.username,
        userID=addUserRequest.user_id,
        type=addUserRequest.user_type,
        brands=addUserRequest.brands
    )

    dynamoDbHelper.table('users') \
        .put(user)

    addedUser = dynamoDbHelper.table('users') \
        .get({
            'username': addUserRequest.username
        }, user_pb2.User())

    return user_pb2.AddUserResponse(user=addedUser).SerializeToString()


@app.route("/updateUser", methods=['POST'])
def updateUser():
    updateUserRequest = user_pb2.UpdateUserRequest()
    updateUserRequest.ParseFromString(request.get_data())

    user = dynamoDbHelper.table('users').get({
        'username': updateUserRequest.username
        }, user_pb2.User())
    brands = user.brands

    finalBrands = []
    for brand in brands:
        if brand in updateUserRequest.brands_to_remove:
            continue
        if brand not in updateUserRequest.brands_to_add:
            finalBrands.append(brand)
    for brand in updateUserRequest.brands_to_add:
        finalBrands.append(brand)

    dynamoDbHelper.table('users') \
        .update({
            'username': "keisenbrand"
            }, finalBrands)

    updatedUser = dynamoDbHelper.table('users') \
        .get({
            'username': "keisenbrand"
        }, user_pb2.User())

    return user_pb2.UpdateUserResponse(user=updatedUser).SerializeToString()


@app.route("/getAllBrands", methods=['POST'])
def getAllBrands():
    getAllBrandsRequest = user_pb2.GetAllBrandsRequest()
    getAllBrandsRequest.ParseFromString(request.get_data())

    allBrands = []
    for brandDict in BrandsDict.brands:
        brand = user_pb2.Brand(
            brand_name=brandDict['brand_name'],
            type=brandDict['type']
            )
        allBrands.append(brand)

    return user_pb2.GetAllBrandsResponse(brands=allBrands).SerializeToString()

if __name__ == "__main__":
    dynamoDbHelper.deleteTable()
    dynamoDbSchemaHelper.generateTables()
    dynamoDbHelper.generateDummyData()
    app.run()
