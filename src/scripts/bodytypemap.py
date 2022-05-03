import csv
import json
import pandas as pd
import numpy as np
from cmath import e
import pymongo
from bson.son import SON
from pymongo import MongoClient, InsertOne
from getpass import getpass
from mysql.connector import connect, Error
import numpy as np
import pandas as pd
import configparser
from six.moves import configparser
import io
import csv
import psycopg2
import random
#import libraries
import cv2
from matplotlib import pyplot as plt
from os.path import exists
 

urlDocker="mongodb://localhost:49153/ProjectData225" # docker Instance
 
# Function to convert a CSV to JSON
# Takes the file paths as arguments
def make_json(csvFilePath, jsonFilePath):
     
    # create a dictionary
    data = {}
     
    # Open a csv reader called DictReader
    with open(csvFilePath, encoding='utf-8-sig') as csvf:
        csvReader = csv.DictReader(csvf)
         
        # Convert each row into a dictionary
        # and add it to data
        for rows in csvReader:
            print("roooows", rows)
            # Assuming a column named 'ratiosid' to
            # be the primary key
            key = rows['ratiosid']
            data[key] = rows
 
    # Open a json writer, and use the json.dumps()
    # function to dump data
    with open(jsonFilePath, 'w', encoding='utf-8') as jsonf:
        jsonf.write(json.dumps(data, indent=4))
         


def convertCSVtoJSON():
     
    # file paths
    csvFilePath = r'C:/Users/bhati/Documents/DB 225/DBSemProject/bodytypemapping.csv'
    jsonFilePath = r'C:/Users/bhati/Documents/DB 225/DBSemProject/bodytypemapping.json'
 
    # Call the make_json function
    make_json(csvFilePath, jsonFilePath)

def loadJSONtoMongoDB():
    myclient = pymongo.MongoClient(urlDocker)  
    print(myclient.list_database_names())
    mydb = myclient['ProjectData225']
    collection = mydb['bodytype']
    print(collection)

    with open(r"C:/Users/bhati/Documents/DB 225/DBSemProject/bodytypemapping.json") as file:
        file_data = json.load(file)
      
        # Inserting the loaded data in the Collection
        # if JSON contains data more than one entry
        # insert_many is used else inser_one is used
        if isinstance(file_data, list):
            collection.insert_many(file_data)  
        else:
            collection.insert_one(file_data)
            
    myclient.close()


def isHourglass(bustlen,waistLen,hiplen,bodytypemeasurements):
   # print("Inside isHourglass",bustlen,waistLen,hiplen)
   # print(bodytypemeasurements[0]['bodytype'],bodytypemeasurements[0]['bust-hips_max'],bodytypemeasurements[0]['hips-bust_max'],bodytypemeasurements[0]['bust-waist_min'],bodytypemeasurements[0]['hips-waist'])
    #(bust – hips) ≤ 1″ AND (hips – bust) < 3.6″ AND (bust – waist) ≥ 9″ OR (hips – waist) ≥ 10″
    if(bodytypemeasurements[0]['bodytype'] == 'hourglass'):
            if ((float(bustlen)-float(hiplen)) <= float(bodytypemeasurements[0]['bust-hips_max'])) and ((float(hiplen)-float(bustlen)) < float(bodytypemeasurements[0]['hips-bust_max']) ) and (((float(bustlen)-float(waistLen)) >= float(bodytypemeasurements[0]['bust-waist_min'])) or ((float(hiplen)-float(waistLen)) >= float(bodytypemeasurements[0]['hips-waist']))):
                print("hourglass")
                return True

def isTopHourglass(bustlen,waistLen,hiplen,bodytypemeasurements):
    print("Inside isTopHourglass",bustlen,waistLen,hiplen)
    print(bodytypemeasurements[2]['bodytype'],bodytypemeasurements[2]['bust-hips_min'],bodytypemeasurements[2]['bust-hips_max'],bodytypemeasurements[2]['bust-waist_min'])
    #top hourglass is: (bust – hips) > 1″ AND (bust – hips) < 10″ AND (bust – waist) ≥ 9″
    if(bodytypemeasurements[2]['bodytype'] == 'Top hourglass'):
        if ((float(bustlen)-float(hiplen)) > float(bodytypemeasurements[2]['bust-hips_min'])) and ((float(bustlen)-float(hiplen)) < float(bodytypemeasurements[2]['bust-hips_max'])) and ((float(bustlen)-float(waistLen)) >= float(bodytypemeasurements[2]['bust-waist_min'])):
                print("tophourglass")
                return True

def isBottomHourglass(bustlen,waistLen,highhiplen,hiplen,bodytypemeasurements):
    print("Inside isBottomHourglass",bustlen,waistLen,highhiplen,hiplen)
    print(bodytypemeasurements[1]['bodytype'],bodytypemeasurements[1]['hips-bust_min'],bodytypemeasurements[1]['hips-bust_max'],bodytypemeasurements[1]['bust-waist_min'],bodytypemeasurements[1]['hips-waist'],bodytypemeasurements[1]['high hip/waist'])
    #bottom hourglass is referred to as: (hips – bust) ≥ 3.6″ AND (hips – bust) < 10″ AND (hips – waist) ≥ 9″ AND (high hip/waist) < 1.193
    if(bodytypemeasurements[1]['bodytype'] == 'bottom hourglass'):
        if ((float(hiplen)-float(bustlen)) >= float(bodytypemeasurements[1]['hips-bust_min'])) and ((float(hiplen)-float(bustlen)) < float(bodytypemeasurements[1]['hips-bust_max'])) and ((float(hiplen)-float(waistLen)) >= float(bodytypemeasurements[1]['hips-waist'])) and ((float(highhiplen)/float(waistLen)) < float(bodytypemeasurements[1]['high hip/waist'])):
            print("bottomhourglass")
            return True


def isTriangle(bustlen,waistLen,highhiplen,hiplen,bodytypemeasurements):
    print("Inside isTriangle",bustlen,waistLen,highhiplen,hiplen)
    print(bodytypemeasurements[3]['bodytype'],bodytypemeasurements[3]['hips-bust_min'],bodytypemeasurements[3]['hips-waist'],bodytypemeasurements[3]['high hip/waist'])
    #Triangle/Spoon is referred to as: If (hips – bust) > 2″ AND (hips – waist) ≥ 7″ AND (high hip/waist) ≥ 1.193. 16/17/12/28
    if(bodytypemeasurements[3]['bodytype'] == 'Triangle'):
        if ((float(hiplen)-float(bustlen)) > float(bodytypemeasurements[3]['hips-bust_min'])) and ((float(hiplen)-float(waistLen)) >= float(bodytypemeasurements[3]['hips-waist'])) and ((float(highhiplen)/float(waistLen)) >= float(bodytypemeasurements[3]['high hip/waist'])):
            print("triangle")
            return True


def isInvertedTriangle(bustlen,waistLen,hiplen,bodytypemeasurements):
    print("Inside invertedTriangle",bustlen,waistLen,hiplen)
    print(bodytypemeasurements[4]['bodytype'],bodytypemeasurements[4]['bust-hips_min'],bodytypemeasurements[4]['bust-waist_max'])
    #If (bust – hips) ≥ 3.6″ AND (bust – waist) < 9″.
    if(bodytypemeasurements[4]['bodytype'] == 'Inverted Triangle'):
        if ((float(bustlen)-float(hiplen)) >= float(bodytypemeasurements[4]['bust-hips_min'])) and ((float(bustlen)-float(waistLen)) < float(bodytypemeasurements[4]['bust-waist_max'])):
            print("invertedtriangle")
            return True

def isRectange(bustlen,waistLen,hiplen,bodytypemeasurements):
    print("Inside isRectange",bustlen,waistLen,hiplen)
    print(bodytypemeasurements[5]['bodytype'],bodytypemeasurements[5]['bust-hips_max'],bodytypemeasurements[5]['hips-bust_max'],bodytypemeasurements[5]['bust-waist_max'],bodytypemeasurements[5]['hips-waist'])
    #(hips – bust) < 3.6″ AND (bust – hips) < 3.6″ AND (bust – waist) < 9″ AND (hips – waist) < 10″. 
    if(bodytypemeasurements[5]['bodytype'] == 'Rectangle'):
        if ((float(hiplen)-float(bustlen)) < float(bodytypemeasurements[5]['bust-hips_max'])) and ((float(bustlen)-float(hiplen)) < float(bodytypemeasurements[5]['hips-bust_max'])) and ((float(bustlen)-float(waistLen)) < float(bodytypemeasurements[5]['bust-waist_max'])) and ((float(hiplen)-float(waistLen)) < float(bodytypemeasurements[5]['hips-waist'] )):
            print("rectangle")
            return True

def isRound(bustlen,waistLen,hiplen,bodytypemeasurements):
    print("Inside isRound",bustlen,waistLen,hiplen)
    print(bodytypemeasurements[6]['bodytype'],bodytypemeasurements[6]['hips-bust_min'],bodytypemeasurements[6]['hips-waist'])
    #(hips – bust) ≥ 3.6″ AND (hips – waist) < 9.
    if(bodytypemeasurements[6]['bodytype'] == 'Round'):
        if ((float(hiplen)-float(bustlen)) >= float(bodytypemeasurements[6]['hips-bust_min'])) and ((float(hiplen)-float(waistLen)) < float(bodytypemeasurements[6]['hips-waist'])):
            print("round")
            return True


def importCustProfileCSV():
    
    client = pymongo.MongoClient("mongodb://localhost:49153/ProjectData225")
    
    bodytypemeasurements = []
    # Database Name
    db = client["ProjectData225"]
 
    # Collection Name
    col = db["bodytype"]
 
    # Fields with values as 1 will
    # only appear in the result
    x1 = col.find({},{'_id':0,'ratiosid': 1, 'bodytype': 1,'bust-hips_min':1,'bust-hips_max':1,'hips-bust_min':1,'hips-bust_max':1,
                    'bust-waist_min':1,'bust-waist_max':1,'hips-waist':1,'high hip/waist':1})
    
    for data in x1:
        #print(data)
        bodytypemeasurements.append((data))
    print(bodytypemeasurements)
    
    df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/bodymeasurements.csv',skiprows=1,header=None,usecols=[0,1,2,5,6,7,8]) #usecols=['Customer_id','Gender','Age','ChestWidth','Belly','Waist','Hips'])
   # print(df)
    i=0
    bodytype = ""
    bodytypeid = 1
    # creating list for adding bodytype and their ids
    bodytype_new = [] 
    bodytypeid_new = []
    skin_condition_level = []
    
    print("Checking size of dataframe :",df.shape[0])

    for x in range(df.shape[0]):
        
        waistLen = df[7][i]
        bustlen = df[5][i]
        highhiplen = df[6][i]
        hiplen = df[8][i]
        
        print("body",bustlen,waistLen,hiplen,highhiplen)

        if(isHourglass(bustlen,waistLen,hiplen,bodytypemeasurements)):
            bodytype = "hourglass"
            bodytypeid = 1
        elif(isTopHourglass(bustlen,waistLen,hiplen,bodytypemeasurements)):
            bodytype = "tophourglass"
            bodytypeid = 3
        elif(isBottomHourglass(bustlen,waistLen,highhiplen,hiplen,bodytypemeasurements)):
            bodytype = "bottomhourglass"
            bodytypeid = 2
        elif(isTriangle(bustlen,waistLen,highhiplen,hiplen,bodytypemeasurements)):
            bodytype = "triangle"
            bodytypeid = 4
        elif(isInvertedTriangle(bustlen,waistLen,hiplen,bodytypemeasurements)):
            bodytype = "invertedtriangle"
            bodytypeid = 6
        elif(isRectange(bustlen,waistLen,hiplen,bodytypemeasurements)):
            bodytype = "rectangle"
            bodytypeid = 7
        elif(isRound(bustlen,waistLen,hiplen,bodytypemeasurements)):
            bodytype = "round"
            bodytypeid = 5

        print("bodytype",bodytype)
        if (bodytype != ''):
            bodytype_new.append(bodytype)
            bodytypeid_new.append(bodytypeid)
            print("sshhhh",bodytype_new)
        else:
            bodytype_new.append("hourglass")
            bodytypeid_new.append(bodytypeid)
        
        i +=1   
        skin_level = random.randint(1, 3)
        skin_condition_level.append(skin_level)
        
        
    #print(data)
    df.insert(7, "Body_type", bodytype_new)
    df.insert(8,"Body_type_id",bodytypeid_new)
    df.insert(9,'Skin_condition_level',skin_condition_level)
    print(df)

    df.head()
    df.to_csv('C:/Users/bhati/Documents/DB 225/DBSemProject/bodyMeasureAndType_mongo.csv',header=['customer_id','gender','age','bust','belly','waist','highhip','bodytype','body_type_id','skin_condition_level'])
    #print(df)    
    
def cleanArticleTable():
    df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/modifiedArticleType.csv')#,skiprows=1,header=None,usecols=[0,1,2,3,4,5,8,9,24])
    print(df.shape)
    # Get names of indexes for which column product_group_name has value Accessories
    indexNames = df[ df['5'] == 'Accessories' ].index
    print(indexNames)
    # Delete these row indexes from dataFrame
    df.drop(df.loc[df['5']=='Accessories'].index, inplace=True)
    df.drop(df.loc[df['5'] == 'Underwear'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Socks & Tights'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Items'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Nightwear'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Unknown'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Underwear/nightwear'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Shoes'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Swimwear'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Cosmetic'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Interior textile'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Bags'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Furniture'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Garment and Shoe care'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Fun'].index,inplace=True)
    df.drop(df.loc[df['5'] == 'Stationery'].index,inplace=True)
                  
    #df.drop(indexNames , inplace=True)
     
    df.to_csv('C:/Users/bhati/Documents/DB 225/DBSemProject/delExtraGrpsArticleType_header.csv',header=['unnamed','article_id','product_code','product_name','product_type_id','product_type_name','prod_group_name','product_color_id','color_name','detail_desc'])

def checkColorValues():
    df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/delExtraGrpsArticleType.csv')#,skiprows=1,header=None,usecols=[0,1,2,3,4,5,8,9,24])
    print("abc",df.shape)
    print(df.head)
    print(df['9'].unique())
    new_df = df[['8','9']].copy()
    new_df.to_csv('C:/Users/bhati/Documents/DB 225/DBSemProject/colorType.csv',header=['product_color_id','color_name'])


def getConnection():
    config = configparser.RawConfigParser(allow_no_value=True)
        
    config.read('C:/Users/bhati/Documents/DB 225/DB HW/DB HW3/HW3/code_python/databasecfg.cnfg')
    configsec="mysql"

    hostcnfg =config.get(configsec, 'db.host') #localhost
    portcnfg =config.get(configsec,'db.port') #3306
    usercnfg = config.get(configsec, 'db.user') #input("Enter username: "),
    passwordcnfg = config.get(configsec, 'db.password') #getpass("Enter password: ")
    databasecnfg = config.get(configsec, 'db.current.database')
    print(configsec,hostcnfg,usercnfg,passwordcnfg,databasecnfg)
    connection = connect(user=usercnfg, password=passwordcnfg,
                              host=hostcnfg,
                              port=portcnfg,
                              database=databasecnfg)
    print("Mysql connection is..", connection); 
    create_db_query = "USE projectdata225"
    with connection.cursor() as cursor:
        cursor.execute(create_db_query)

    return connection


inserted_product_code=[]
inserted_article=[]
inserted_product_style_map=[()]
inserted_product_fabric_map=[()]

def insertProduct(connection , productInfo):
    checkcountquery = '''select count(*) from product'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print("inside product", result[0])
        if(result[0] == 0):
            for index, row in productInfo.iterrows():
                if row['1'] not in inserted_product_code :
                    datarow=[row['1'] , row['3'] , row['2'] , row['24']]
                    print("Inserting product " , str(datarow))
                    with connection.cursor() as cursor:
                        cursor.execute('INSERT INTO product(product_code, product_type_id, prod_name, detail_desc)' 'VALUES(%s, %s, %s, %s)', datarow)
                        connection.commit()
                    inserted_product_code.append(row['1'])
                insertProductColor(connection , row['0'] , row['1'] , row['8'])
    return 0


def insertProductColor(connection , articleid , productId , colorId):
    checkcountquery = '''select count(*) from product_color_map'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print('inside product_color_map',result[0])
        if(result[0] == 0):
            if articleid not in inserted_article :
                datarow=[articleid , productId , colorId ]
                print("Inserting product article with new color" , str(datarow))
                with connection.cursor() as cursor:
                    cursor.execute('INSERT INTO product_color_map(article_id , product_code, product_color_id)' 'VALUES(%s, %s, %s)', datarow)
                    connection.commit()
                inserted_article.append(articleid)
    return 0


def insertProductStyleMap(connection, productInfo , stypeInfo):
    checkcountquery = '''select count(*) from product_style_map'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print('inside product_style_map',result[0])
        if(result[0] == 0):
            #print("Inside Product Style    ", stypeInfo[0],stypeInfo[1], productInfo['1'],productInfo.shape)
            for index, row in productInfo.iterrows():
                if (stypeInfo[1],row['1']) not in inserted_product_style_map:
                    datarow=[stypeInfo[1],row['1']]
                    #print("Inserting product style map" , str(datarow))
                    #print("product_style_id,product_code",stypeInfo[1],row['1'])
                    with connection.cursor() as cursor:
                        cursor.execute('INSERT INTO product_style_map(product_style_id, product_code)' 'VALUES(%s, %s)', datarow)
                        connection.commit()
                    inserted_product_style_map.append((stypeInfo[1],row['1']))
    return 0





def findStyles(connection):

    queryfindStyle="""select style_name , product_style_id from product_style"""

    with connection.cursor() as cursor:
        cursor.execute(queryfindStyle)
        result = cursor.fetchall()
        df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/delExtraGrpsArticleType.csv')
        df_1 = []
        df = df.replace({np.nan: None})
        for c in df.columns:
            count = df[c].isnull().sum()
            #print(f'Col {c} has {count} missing values')
        #print('Done checking for missings')
        insertProduct(connection , df)  
        #print("Finding styles in articles:")
        for row in result:
            style = row[0]
            df_new = df[df['24'].str.contains(style, regex=True, na=False)]
            #print("Searching for Style : " + style)
            if df_new.empty == False :
                #print(df_new)
                insertProductStyleMap(connection , df_new , row)  
                df_1.append(df_new)
                
            #print(row)

        
        #print("xxxxxx: ", df_1)


#def loadCustomerTransactionDump(connection):
    # df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/transactions_train.csv',skiprows=1,header=None,usecols=[0,1,2,3])
    # #df.to_csv('C:/Users/bhati/Documents/DB 225/DBSemProject/transaction_train_wo_saleschannel.csv')
    # #df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/transaction_train_wo_saleschannel.csv',skiprows=1,header=None)
    # print(df.head)
    # for row in df.itertuples():
    # #     print("row..",row[0],row[1],row[2],row[3])
    #     datarow=[row[1] , row[2] , row[3] , row[4]]
    #     print("datarow:",datarow)
    #     with connection.cursor() as cursor:
    #         cursor.execute('INSERT INTO customer_transaction(t_dat,customer_id,article_id,price)' 'VALUES(%s, %s, %s,%s)', datarow)
    #         connection.commit()



def insertCustomer(connection):
    checkcountquery = '''select count(*) from customer'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print('inside customer',result[0])
        if(result[0] == 0):
            df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/bodyMeasureAndType.csv',skiprows=1,header=None)
            print(df)
            df = df.replace({np.nan: None})
            for row in df.itertuples():
                print("row..",row[2],row[3])
                datarow=[row[2] , row[3] , row[4] , row[5],row[6] , row[7] , row[8] , row[9],row[10],row[11]]
                print("datarow:",datarow)
                with connection.cursor() as cursor:
                    cursor.execute('INSERT INTO customer(customer_id,gender,age,bust,highhip,waist,hip,bodytype,body_type_id,skin_condition_level)' 'VALUES(%s, %s, %s,%s,%s,%s,%s,%s,%s,%s)', datarow)
                    connection.commit()

def insertFabric(connection):
    checkcountquery = '''select count(*) from fabric'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print('inside fabric',result[0])
        if(result[0] == 0):
            df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/fabrics_names.csv',skiprows=1,header=None)
            print(df)
            df = df.replace({np.nan: None})
            for row in df.itertuples():
                print("row..",row[1],row[2])
                datarow=[row[1] , row[2] , row[3] , row[4]]
                print("datarow:",datarow)
                with connection.cursor() as cursor:
                    cursor.execute('INSERT INTO fabric(fabric_id,fabric_name,level,fabric_desc)' 'VALUES(%s, %s, %s,%s)', datarow)
                    connection.commit()


def insertProductFabricMap(connection, productInfo , fabricInfo):
    checkcountquery = '''select count(*) from product_fabric_map'''
    with connection.cursor() as cursor:
        cursor.execute(checkcountquery)
        result = cursor.fetchone()
        print('inside product_fabric_map',result[0])
        if(result[0] == 0):
            #print("Inside fabric Style    ", fabricInfo[0],fabricInfo[1], productInfo['1'],productInfo.shape)
            for index, row in productInfo.iterrows():
                if (row['1'],fabricInfo[0]) not in inserted_product_fabric_map:
                    datarow=[row['1'],fabricInfo[0]]
                    print("Inserting product fabric map" , str(datarow))
                    print("product_code,fabric_id",row['1'],fabricInfo[0])
                    with connection.cursor() as cursor:
                        cursor.execute('INSERT INTO product_fabric_map(product_code,fabric_id)' 'VALUES(%s, %s)', datarow)
                        connection.commit()
                    inserted_product_fabric_map.append((row['1'],fabricInfo[0]))
    return 0

def checkProductfabric(connection):
    
    queryfabric="""select fabric_id,fabric_name from fabric"""

    with connection.cursor() as cursor:
        cursor.execute(queryfabric)
        result = cursor.fetchall()
        df = pd.read_csv(r'C:/Users/bhati/Documents/DB 225/DBSemProject/delExtraGrpsArticleType.csv')
        #df_1 = []
        df = df.replace({np.nan: None})
        print("df........",df)
        for c in df.columns:
            count = df[c].isnull().sum()
            print(f'Col {c} has {count} missing values')
        print('Done checking for missings')
        print("Finding fabrics in articles:")
        for row in result:
            fabric = row[1]
            df_fabric = df[(df['24'].str.contains(fabric, regex=True, na=False)) | (df['2'].str.contains(fabric, regex=True, na=False)) ]
            print("Searching for fabric : " + fabric)
            print (df_fabric)
            if df_fabric.empty == False :
                  print(df_fabric)
                  insertProductFabricMap(connection , df_fabric , row)  
                  #df_1.append(df_fabric)
                
      
        #print("xxxxxx: ", df_1)


def findTheBestFit(connection,product_type,bodytype,skin_condition_level):

    # This query fetches all the products from a certain product type based on body type and fabric quality based on skin condition level
    #BodyTypes = "round,rectangle,invertedtriangle,hourglass,bottomhourglass,tophourglass,triangle"
    #Product_type ="Vest top,Leggings/Tights,Sweater,Top,Trousers,Bodysuit,Hoodie,Skirt,T-shirt,Dress,Shorts,Shirt,Cardigan,Blazer,
                    #Jumpsuit/Playsuit,Jacket,Costumes,Coat,Polo shirt,Tailored Waistcoat,Blouse,Outdoor overall,Dungarees,Outdoor trousers
                    #Garment Set,Outdoor Waistcoat"
    #skin_condition_level = 1=severe,2=mild,3=no_issues
    #fabric_level = 1=highest quality, 2= medium quality 3= synthetics
      
    fabric_level = skin_condition_level
    queryFindTheBestStyle="""select distinct pcm.article_id, p.* 
	from product p join product_style_map psm on p.product_code=psm.product_code 
    join product_color_map pcm on pcm.product_code = p.product_code
    join product_style ps on ps.product_style_id=psm.product_style_id 
    join product_type pt on pt.product_type_id=p.product_type_id
    join body_style_map bsm on bsm.product_style_id=ps.product_style_id join customer c on c.body_type_id=bsm.body_type_id 
    join product_fabric_map pfm on p.product_code=pfm.product_code join fabric f on f.fabric_id=pfm.fabric_id   
    where pt.type_name like '%{pname}%' and c.bodytype = '{btype}' and c.skin_condition_level = {slevel} and f.level <= {flevel} """.format(pname = product_type , btype=bodytype , slevel=skin_condition_level , flevel=fabric_level)
    df=[]
    with connection.cursor() as cursor:
            cursor.execute(queryFindTheBestStyle)
            result = cursor.fetchall()
            for row in result:
                df.append(row)
                showimages(row[0])
                print(df)

    return 0

def showimages(imageId):
    
    
    # initialize figure
    fig = plt.figure(figsize=(10, 7))
    
    # setting values to rows and column variables
    rows = 1
    columns = 1
    #imagepath is the folder where all the images are kept and named as article_id.jpg
    imagepath="C:/Users/bhati/Documents/DB 225/DBSemProject/images/{}.jpg".format(imageId)
    print("displaying Image id :" , imagepath)
    file_exists = exists(imagepath)
    if file_exists == True:
        # reading images
        Image1 = cv2.imread(imagepath)
    
        print("reading image")
        # Adds a subplot at the position
        fig.add_subplot(rows, columns, 1)
    
        # display image located at the image path
        plt.imshow(Image1)
        plt.axis('off')
        plt.title("Product suggestion")
    else :
        # else display the message that it does not exist.
        print("Picture for the item does not exist " , imagepath)
        

def getCustomerBodyType(connection,customer_id):
    
    querygetbodytype = """select bodytype from customer where customer_id = {cid} """.format(cid = customer_id)

    with connection.cursor() as cursor:
        cursor.execute(querygetbodytype)
        result = cursor.fetchone()
        return result[0]


try:
    convertCSVtoJSON()
    loadJSONtoMongoDB()
    
    cleanArticleTable()
    checkColorValues()
    importCustProfileCSV()
    
    connection = getConnection()
    findStyles(connection)
    #loadCustomerTransactionDump(connection) #don't use this 
    insertCustomer(connection)
    insertFabric(connection)
    checkProductfabric(connection)
    customer_id = input("Enter your customer id :")
    product_type = input("Enter the product you are looking for : ")
    skin_condition_level = input("Enter if you have any skin condition: 1-severe,2-mild,3-noIssues :")
    custBodyType = getCustomerBodyType(connection,customer_id)
       
    #custBodyType = 'rectangle'
    #product_type = 'Hoodie'
    #skin_condition_level = 3
    findTheBestFit(connection,product_type,custBodyType,skin_condition_level)
    print(f'The above recommendations are for your bodytype = {custBodyType} for {product_type}')
    

except Exception as exception:
    print(exception)
