from chalice import Chalice
#import user_pb2
#import TempoDict

app = Chalice(app_name='tempo-chalice')
app.debug = True

# # Helper method to convert a string to a User Type
# def stringToUserType(string):
#     return {
#         'MANAGER' : user_pb2.User.MANAGER,
#         'EDITOR' : user_pb2.User.EDITOR,
#         'WRITER' : user_pb2.User.WRITER
#     }[string]


# Get current user - treat this as whoever is logged into the app
# @app.route("/currentUser")
# def getCurrentUser():
#     user = user_pb2.User()
#     user.username = "eisenbrk"
#     user.userID = "8059901289"
#     brands = []
#     for brandDict in TempoDict.brands:
#         brand = brand_pb2.Brand()
#         brand.brand_name = brandDict['brand_name']
#         brand.type = stringToBrandType(brandDict['type'])
#         brands.append(brand)
#     user.type = user_pb2.User.WRITER
#     str = user.SerializeToString()

#     return str

@app.route('/')
def index():
    return {'hello': 'world'}
