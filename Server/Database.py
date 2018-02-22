import TempoDict
import json
import user_pb2
import boto3

from google.protobuf.json_format import MessageToJson
from google.protobuf.json_format import Parse

# Get the service resource.
# Don't use this directly. Access the database through the DynamoDB helpers
dynamodb = boto3.resource('dynamodb', endpoint_url='http://localhost:8000')


class DynamoDBHelper:

    def deleteTable(self):
        table = dynamodb.Table('users')
        table.delete()

    def generateDummyData(self):
        brandsList = []
        for brandDict in TempoDict.brands:
            brand = user_pb2.Brand(
                brand_name=brandDict['brand_name'],
                type=brandDict['type']
            )
            brandsList.append(brand)
        user = user_pb2.User(
            username='keisenbrand',
            userID='000',
            type=user_pb2.User.MANAGER,
            brands=brandsList
        )
        self.table('users').put(user)

        brandsList = []
        for brandDict in TempoDict.brands2:
            brand = user_pb2.Brand(
                brand_name=brandDict['brand_name'],
                type=brandDict['type']
            )
            brandsList.append(brand)
        user = user_pb2.User(
            username='kdoyle',
            userID='111',
            type=user_pb2.User.MANAGER,
            brands=brandsList
        )
        self.table('users').put(user)

        brandsList = []
        for brandDict in TempoDict.brands3:
            brand = user_pb2.Brand(
                brand_name=brandDict['brand_name'],
                type=brandDict['type']
            )
            brandsList.append(brand)
        user = user_pb2.User(
            username='wlee',
            userID='222',
            type=user_pb2.User.MANAGER,
            brands=brandsList
        )
        self.table('users').put(user)

        brandsList = []
        for brandDict in TempoDict.brands4:
            brand = user_pb2.Brand(
                brand_name=brandDict['brand_name'],
                type=brandDict['type']
            )
            brandsList.append(brand)
        user = user_pb2.User(
            username='amurray',
            userID='333',
            type=user_pb2.User.MANAGER,
            brands=brandsList
        )
        self.table('users').put(user)

    def table(self, table):
        return DynamoDBTableHelper(table)


class DynamoDBTableHelper:
    def __init__(self, table):
        self.table = dynamodb.Table(table)

    def put(self, proto):
        protoJson = MessageToJson(proto)
        dbMap = json.loads(protoJson)
        responseMap = self.table.put_item(
            Item=dbMap
        )
        responseJson = json.dumps(responseMap)
        return responseJson

    def get(self, key, proto):
        protoMap = self.table.get_item(
            Key=key
        )['Item']
        protoJson = json.dumps(protoMap)
        return Parse(protoJson, proto)

    # Update Brand preferences by username
    def update(self, key, newBrandsList):
        print(newBrandsList)
        response = self.table.update_item(
            Key=key,  # username
            UpdateExpression="set brands = :b",
            ExpressionAttributeValues={
                ':b': []
            },
            ReturnValues="UPDATED_NEW"
        )
        print(json.dumps(response))
        return response

    def remove(self, key):
        responseMap = self.table.delete_item(
            Key=key
        )
        responseJson = json.dumps(responseMap)
        return responseJson
