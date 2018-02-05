from flask import Flask
import user_pb2
import TempoDict

app = Flask(__name__)

# Get current user - treat this as whoever is logged into the app
@app.route("/currentUser")
def getCurrentUser():
    user = user_pb2.User()
    user.username = "eisenbrk"
    user.userID = "8059901289"
    brands = []
    for brandDict in TempoDict.brands:
        brand = user_pb2.Brand()
        brand.brand_name = brandDict['brand_name']
        brand.type = user_pb2.Brand.PEOPLE
        brands.append(brand)
    user.brands.extend(brands)
    user.type = user_pb2.User.WRITER
    str = user.SerializeToString()

    return str

if __name__ == "__main__":
    app.run()
