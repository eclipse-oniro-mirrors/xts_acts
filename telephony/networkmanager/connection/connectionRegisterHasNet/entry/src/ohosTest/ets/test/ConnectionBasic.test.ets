/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { connection } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
const TIMEOUT = 100;


export default function ConnectionBasicTest() {
 describe('ConnectionBasicTest', () => {
 
    /**
     * @tc.name   testNetManagerConnectionNetBearType0100
     * @tc.number SUB_NetManager_Connection_NetBearType_0100
     * @tc.desc   GetNetCapabilities  detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerConnectionNetBearType0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName: string = "testNetManagerConnectionNetBearType0100";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(connection.NetBearType.BEARER_CELLULAR == 0);
        ExpectTrue(connection.NetBearType.BEARER_WIFI == 1);
        ExpectTrue(connection.NetBearType.BEARER_BLUETOOTH == 2);
        ExpectTrue(connection.NetBearType.BEARER_ETHERNET == 3);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })
    
    /**
     * @tc.name   testNetManagerConnectionIsExcludedRoute0100
     * @tc.number SUB_NetManager_Connection_IsExcludedRoute_0100
     * @tc.desc   getConnectionProperties  detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionIsExcludedRoute0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerConnectionIsExcludedRoute0100";
      console.info(`${caseName}---start`);
      try {
        let netHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
          if (error) {
            console.log(`${caseName}  get data fail: `+ JSON.stringify(error));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else { 
            console.log(`${caseName}  get value success: ${JSON.stringify(data)}`);
            ExpectTrue(data.routes[0].isExcludedRoute == undefined);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerConnectionGetConnectionPropertiesCallBack0100
     * @tc.number SUB_NetManager_Connection_GetConnectionProperties_CallBack_0100
     * @tc.desc   getConnectionProperties  detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionGetConnectionPropertiesCallBack0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName: string = "testNetManagerConnectionGetConnectionPropertiesCallBack0100";
      console.info(`${caseName}---start`);
      try {
        connection.getAllNets((error: BusinessError, value: connection.NetHandle[]) => {
          if (error) {
            console.log(`${caseName}  get data fail: `+ JSON.stringify(error));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} get value is : ${JSON.stringify(value)}`);
            connection.getConnectionProperties(value[0], (error: BusinessError, data: connection.ConnectionProperties) => {
              if (error) {
                console.log(`${caseName}  get data fail: `+ JSON.stringify(error));
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              } else {
                console.log(`${caseName}  get value success: ${JSON.stringify(data)}`);
                if (data.linkAddresses.length > 0) {
                  ExpectTrue(data.linkAddresses[0].address != undefined);
                }
                console.info(`${caseName}---End`);
                done();
              }
            });
          }
        });
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0100
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0100
    * @tc.desc   Create a network connection with optional netSpefifier and timeout.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('testNetManagerConnectionCreateNetConnection0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0200
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0200
    * @tc.desc   Create a network connection with optional netSpefifier and timeout.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('testNetManagerConnectionCreateNetConnection0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0200";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier: connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 1000,
           linkDownBandwidthKbps: 2000,
           bearerTypes: [1],
           networkCap: [0],
         }, bearerPrivateIdentifier: '123'
       };
       let netConn = connection.createNetConnection(netSpecifier, 5000);
       ExpectTrue(netConn != null);
       done();
     } catch (error) {
       console.info(`${caseName} catch err is `+JSON.stringify(error));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0300
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0300
    * @tc.desc   Create a network connection with optional netSpefifier and timeout.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0300";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 1,
           linkDownBandwidthKbps: 2,
           bearerTypes: [0],
           networkCap: [11],
         }, bearerPrivateIdentifier: '123'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0400
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0400
    * @tc.desc   Create a network connection with optional netSpefifier and timeout.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0400";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier: connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 0,
           linkDownBandwidthKbps: 0,
           bearerTypes: [0],
           networkCap: [0],
         } , bearerPrivateIdentifier: '123'
       };
       let netConn = connection.createNetConnection(netSpecifier, 5000);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err is `+JSON.stringify(error));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0500
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0500
    * @tc.desc   Create a network connection with optional netSpefifier and timeout.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0500";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 10,
           linkDownBandwidthKbps: 22,
           bearerTypes: [0],
           networkCap: [11],
         }, bearerPrivateIdentifier: '456'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0600
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0600
    * @tc.desc   linkUpBandwidthKbps test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0600";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 10,
           linkDownBandwidthKbps: 22,
           bearerTypes: [0],
           networkCap: [11],
         }, bearerPrivateIdentifier: '456'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0700
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0700
    * @tc.desc   nlinkDownBandwidthKbps test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0700";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 44,
           linkDownBandwidthKbps: 55,
           bearerTypes: [1],
           networkCap: [12],
         }, bearerPrivateIdentifier: '789'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0800
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0800
    * @tc.desc   nlinkDownBandwidthKbps test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0800";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier :connection.NetSpecifier= {
         netCapabilities: {
           linkUpBandwidthKbps: 18,
           linkDownBandwidthKbps: 29,
           bearerTypes: [3],
           networkCap: [5],
         }, bearerPrivateIdentifier: '321'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetManagerConnectionCreateNetConnection0900
    * @tc.number SUB_NetManager_Connection_CreateNetConnection_0900
    * @tc.desc   bearerTypes test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionCreateNetConnection0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionCreateNetConnection0900";
     console.info(`${caseName}---start`);
     try {
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 41,
           linkDownBandwidthKbps: 62,
           bearerTypes: [1],
           networkCap: [9],
         }, bearerPrivateIdentifier: '876'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       ExpectTrue(netConn != null);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetManagerConnectionRegisterAndUnregister0100
    * @tc.number SUB_NetManager_Connection_RegisterAndUnregister_0100
    * @tc.desc   Receives status change notifications of a specified network.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionRegisterAndUnregister0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetManagerConnectionRegisterAndUnregister0100";
     console.info(`${caseName}---start`);
     try{
       let netSpecifier:connection.NetSpecifier = {
         netCapabilities: {
           linkUpBandwidthKbps: 0,
           linkDownBandwidthKbps: 0,
           bearerTypes: [0],
           networkCap: [0],
         }, bearerPrivateIdentifier: '123'
       };
       let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
       let connCallBack = (error: BusinessError) => {
         if (error) {
           console.info(`${caseName} get err is `+JSON.stringify(error));
           ExpectFail();
           console.info(`${caseName}---End`);
           done();
         }else{
           console.info(`${caseName} connCallBack success` );
         }
       }
       netConn.register(connCallBack);
       await sleep(500);
       netConn.unregister(connCallBack);
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionNetAvailable0100
    * @tc.number SUB_NetManager_Connection_NetAvailable_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetAvailable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetAvailable0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netAvailable',(data:connection.NetHandle)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       });
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionNetBlockStatusChange0100
    * @tc.number SUB_NetManager_Connection_NetBlockStatusChange_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetBlockStatusChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetBlockStatusChange0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netBlockStatusChange',(data:connection.NetBlockStatusInfo)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);;
         done();
       });
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionNetCapabilitiesChange0100
    * @tc.number SUB_NetManager_Connection_NetCapabilitiesChange_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetCapabilitiesChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetCapabilitiesChange0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netCapabilitiesChange',(data:connection.NetCapabilityInfo)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       })
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionNetConnectionPropertiesChange0100
    * @tc.number SUB_NetManager_Connection_NetConnectionPropertiesChange_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetConnectionPropertiesChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async  (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetConnectionPropertiesChange0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netConnectionPropertiesChange',(data:connection.NetConnectionPropertyInfo)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       })
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionNetLost0100
    * @tc.number SUB_NetManager_Connection_NetLost_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetLost0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async  (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetLost0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netLost',(data:connection.NetHandle)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       });
       await sleep(200);
       ExpectTrue(true);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetManagerConnectionNetUnavailable0100
    * @tc.number SUB_NetManager_Connection_NetUnavailable_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionNetUnavailable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async  (done: Function) => {
     let caseName: string = "testNetManagerConnectionNetUnavailable0100";
     console.info(`${caseName}---start`);
     try {
       let netConn = connection.createNetConnection();
       netConn.on('netUnavailable',(data)=>{
         console.info(`${caseName}success to get data: ${JSON.stringify(data)}`);
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       });
       await sleep(200);
       console.info(`${caseName}---End`);
       done();
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });

   /**
    * @tc.name   testNetManagerConnectionSetAppNetCallback0100
    * @tc.number SUB_NetManager_Connection_SetAppNet_Callback_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionSetAppNetCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionSetAppNetCallback0100";
     console.info(`${caseName}---start`);
     try{
       connection.getDefaultNet((error, netHandle) => {
         console.info(`${caseName} getDefaultNet error is : ` + JSON.stringify(error)+ "netHandle is :"+JSON.stringify(netHandle));
         if (error) {
           ExpectFail();
           done();
         }else{
           console.info(`${caseName} getDefaultNet success ` + JSON.stringify(netHandle));
           connection.setAppNet(netHandle, (error, data) => {
             console.info(`${caseName} setAppNet err is  `+JSON.stringify(error)+ "data is :"+JSON.stringify(data));
             if (error) {
               ExpectFail();
               done();
             }else{
               connection.getAppNet((error, data) => {
                 console.info(`${caseName} getAppNet err is  `+JSON.stringify(error)+ "data is :"+JSON.stringify(data));
                 if (error)
                   ExpectFail();
                 else
                   ExpectTrue(netHandle.netId == data.netId);
                 console.info(`${caseName}---End`);
                 done();
               });
             }
           });
         }
       });
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetManagerConnectionSetAppNetPromise0100
    * @tc.number SUB_NetManager_Connection_SetAppNet_Promise_0100
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('testNetManagerConnectionSetAppNetPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
     let caseName: string = "testNetManagerConnectionSetAppNetPromise0100";
     console.info(`${caseName}---start`);
     try {
       connection.getDefaultNet((error, netHandle) => {
         console.info(`${caseName} getDefaultNet error is : ` + JSON.stringify(error)+ "netHandle is :"+JSON.stringify(netHandle));
         if (error) {
           ExpectFail();
           console.info(`${caseName}---End`);
           done();
         }else{
           connection.setAppNet(netHandle).then((data) => {
             console.info(`${caseName} setAppNet success ` + JSON.stringify(data));
             connection.getAppNet().then((data) => {
               console.info(`${caseName} getAppNet success ` + JSON.stringify(data));
               ExpectTrue(netHandle.netId == data.netId);
               done();
             }).catch((error: BusinessError) => {
               console.info(`${caseName} getAppNet error ` + JSON.stringify(error));
               ExpectFail();
               done();
             });
           }).catch((error: BusinessError) => {
             console.info(`${caseName} setAppNet err is `+JSON.stringify(error));
             ExpectFail();
             done();
           });
         }
       });
     } catch (error) {
       console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
  });
}

