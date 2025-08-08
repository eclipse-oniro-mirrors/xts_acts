/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import connection from '@ohos.net.connection';
import { describe, expect, it , TestType, Size, Level, beforeEach } from '@ohos/hypium';

let ListenTimes : number = 0;
const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;

let netConnOnEvent6 =async  (caseName: string,netConn: connection.NetConnection) =>{
  console.info(caseName + ": ==  Subscribing to Events start  === ")
  netConn.on('netAvailable', (value) => {
    ListenTimes+=1;
    console.info(caseName+ " ===on netAvailable " + JSON.stringify(value));
  });
  netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
    ListenTimes+=10;
    console.info(caseName + " ===on netCapabilitiesChange " + JSON.stringify(value));
  });
  netConn.on('netLost', (value) => {
    ListenTimes+=100;
    console.info(caseName +" ===on netLost" + JSON.stringify(value));
  });
  netConn.on('netUnavailable', (value) => {
    ListenTimes+=1000;
    console.info(caseName +" ===on netUnavailable " + JSON.stringify(value));
  });
  netConn.on('netBlockStatusChange', (value) => {
    ListenTimes+=10000;
    console.info(caseName +" ===on netBlockStatusChange " + JSON.stringify(value));
  });
  console.info(caseName + ": ==  Subscribing to Events end  === ")
}
let netConnOnEvent4 =async  (caseName: string,netConn: connection.NetConnection) =>{
  console.info(caseName + ": ==  Subscribing to Events start  === ")
  netConn.on('netAvailable', (value) => {
    ListenTimes+=1;
    console.info(caseName+ " ===on netAvailable " + JSON.stringify(value));
  });
  netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
    ListenTimes+=10;
    console.info(caseName + " ===on netCapabilitiesChange " + JSON.stringify(value));
  });
  netConn.on('netLost', (value) => {
    ListenTimes+=100;
    console.info(caseName +" ===on netLost" + JSON.stringify(value));
  });
  console.info(caseName + ": ==  Subscribing to Events end  === ");;
}

let netConnOnEvent3 =async  (caseName: string,netConn: connection.NetConnection) =>{
  console.info(caseName + ": ==  Subscribing to Events start  === ")
  netConn.on('netAvailable', (value) => {
    ListenTimes+=1;
    console.info(caseName+ " ===on netAvailable " + JSON.stringify(value));
  });
  netConn.on('netConnectionPropertiesChange', (value) => {
    ListenTimes+=10;
    console.info(caseName +" ===on netConnectionPropertiesChange" + JSON.stringify(value));
  });
  netConn.on('netLost', (value) => {
    ListenTimes+=100;
    console.info(caseName +" ===on netLost" + JSON.stringify(value));
  });
  console.info(caseName + ": ==  Subscribing to Events end  === ");;
}

const ExpectFail: (caseName:string) => void = (caseName:string) => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};
const ExpectTrue: ( caseName:string, n: boolean) => void = (caseName:string, n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function ConnectionRegisterTest() {
  describe('Telephony_NetworkManagerRegisterTest', () => {
    beforeEach(() => {
      ListenTimes = 0;
    })
    const TIMEOUT = 1000;

    /**
     * @tc.number SUB_NetworkManager_Register_Async_0100
     * @tc.name testNetworkManagerRegisterAsync0100
     * @tc.desc activate the default network, and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync0100';
        console.info(`${caseName}---Start`);
        try {
          let netConn = connection.createNetConnection();
          console.info(caseName+ " register start");
           netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent4(caseName, netConn);
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + "unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 11);
            }
            console.info(`${caseName}---End`);
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch err is `, JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_NetworkManager_Register_Async_0200
     * @tc.name testNetworkManagerRegisterAsync0200
     * @tc.desc activate the default network, and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync0200';
        console.info(`${caseName}---Start`);
        try {
          let netSpecifier: connection.NetSpecifier = {
            netCapabilities: {
              bearerTypes: [NetBearTypeBEARER_WIFI,NetBearTypeBEARER_CELLULAR],
            }
          }
          let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 11);
            }
            console.info(`${caseName}---End`);
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch err is `, JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_NetworkManager_Register_Async_0300
     * @tc.name testNetworkManagerRegisterAsync0300
     * @tc.desc activate the default network,and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync0300';
        console.info(`${caseName}---Start`);
        try {
          let netSpecifier: connection.NetSpecifier = {
            netCapabilities: {
              linkUpBandwidthKbps: 0,
              linkDownBandwidthKbps: 0,
              bearerTypes: [NetBearTypeBEARER_CELLULAR],
              networkCap: [NetCapNET_CAPABILITY_NOT_METERED],
            }, bearerPrivateIdentifier: '123'
          }
          let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch err is `, JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });
    /**
     *@tc.number SUB_NetworkManager_Register_Async_0400
     *@tc.name testNetworkManagerRegisterAsync0400
     *@tc.desc activate the default network,and see if the callback information is generated
     *@tc.level Level0
     *@tc.type: Function
     *@tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync0400';
      console.info(`${caseName}---Start`);
      try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_CAPABILITY_INTERNET],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent6(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 0);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     *@tc.number SUB_NetworkManager_Register_Async_0500
     *@tc.name testNetworkManagerRegisterAsync0500
     *@tc.desc  activate the default network,and see if the callback information is generated
     *@tc.level Level0
     *@tc.type: Function
     *@tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync0500';
      console.info(`${caseName}---Start`);
      try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_CAPABILITY_NOT_VPN],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        await netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent6(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 0);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     *@tc.number SUB_NetworkManager_Register_Async_0600
     *@tc.name testNetworkManagerRegisterAsync0600
     *@tc.desc  activate the default network,and see if the callback information is generated
     *@tc.level Level0
     *@tc.type: Function
     *@tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync0600';
      console.info(`${caseName}---Start`);
      try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_NET_CAPABILITY_VALIDATED],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        await netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent6(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 0);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     *@tc.number SUB_NetworkManager_Register_Async_0700
     *@tc.name testNetworkManagerRegisterAsync0700
     *@tc.desc  activate the default network,and see if the callback information is generated
     *@tc.level Level0
     *@tc.type: Function
     *@tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync0700';
      console.info(`${caseName}---Start`);
      try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_CAPABILITY_PORTAL],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        await netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent6(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 0);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     *@tc.number SUB_NetworkManager_Register_Async_0800
     *@tc.name testNetworkManagerRegisterAsync0800
     *@tc.desc  activate the default network,and see if the callback information is generated
     *@tc.level Level0
     *@tc.type: Function
     *@tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync0800';
      console.info(`${caseName}---Start`);
      try{
      let netSpecifier: connection.NetSpecifier = {
        netCapabilities: {
          linkUpBandwidthKbps: 0,
          linkDownBandwidthKbps: 0,
          bearerTypes: [NetBearTypeBEARER_WIFI],
          networkCap: [NetCapNET_CAPABILITY_MMS],
        }, bearerPrivateIdentifier: '123'
      }
      let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        await netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent6(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 0);
          }
          console.info(`${caseName}---End`);
          
          done();
        });
    }catch (err){
      console.info(`${caseName} catch err is `,JSON.stringify(err));
      ExpectFail(caseName);
      console.info(`${caseName} --test end`);
      done();
    }
  });
        /**
         *@tc.number SUB_NetworkManager_Register_Async_0900
         *@tc.name testNetworkManagerRegisterAsync0900
         *@tc.desc  activate the default network,and see if the callback information is generated
         *@tc.level Level0
         *@tc.type: Function
         *@tc.size: SmallTest
         */
        it('testNetworkManagerRegisterAsync0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
          let caseName = 'testNetworkManagerRegisterAsync0900';
          console.info(`${caseName}---Start`);
          try{
            let netSpecifier : connection.NetSpecifier= {
              netCapabilities: {
                linkUpBandwidthKbps: 0,
                linkDownBandwidthKbps: 0,
                bearerTypes: [NetBearTypeBEARER_WIFI],
                networkCap: [NetCapNET_CAPABILITY_INTERNET],
              }, bearerPrivateIdentifier: '123'
            }
            let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
            console.info(caseName+ " register start");
            await netConn.register(async (error) => {
              if (error) {
                console.info(caseName + " register fail: " + JSON.stringify(error));
                ExpectFail(caseName);
                console.info(`${caseName}---End`);
                done();
              }else{
                console.info(caseName+ " register success");
              }
            });
            await netConnOnEvent6(caseName, netConn)
            await sleep(500);
            console.info(caseName+ " unregister start");
            netConn.unregister(async (error) => {
              if (error) {
                console.info(caseName + " unregister fail: " + JSON.stringify(error));
                ExpectFail(caseName);
              } else {
                console.info(caseName + " unregister success ");
                console.info(caseName + " ListenTimes is :" +ListenTimes);
                ExpectTrue(caseName, ListenTimes == 0);
              }
              console.info(`${caseName}---End`);
              done();
            });
        }catch (err){
          console.info(`${caseName} catch err is `,JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1000
       *@tc.name testNetworkManagerRegisterAsync1000
       *@tc.desc  activate the default network,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1000';
        console.info(`${caseName}---Start`);
        try{
          let netSpecifier : connection.NetSpecifier= {
            netCapabilities: {
              linkUpBandwidthKbps: 0,
              linkDownBandwidthKbps: 0,
              bearerTypes: [NetBearTypeBEARER_WIFI],
              networkCap: [NetCapNET_CAPABILITY_INTERNET],
            }, bearerPrivateIdentifier: '123'
          }
          let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
        }catch (err){
          console.info(`${caseName} catch err is `,JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1100
       *@tc.name testNetworkManagerRegisterAsync1100
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1100';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_WIFI],
            networkCap: [NetCapNET_CAPABILITY_NOT_VPN],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1200
       *@tc.name testNetworkManagerRegisterAsync1200
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1200';
        console.info(`${caseName}---Start`);
        try{
          let netSpecifier: connection.NetSpecifier = {
            netCapabilities: {
              linkUpBandwidthKbps: 0,
              linkDownBandwidthKbps: 0,
              bearerTypes: [NetBearTypeBEARER_WIFI],
              networkCap: [NetCapNET_NET_CAPABILITY_VALIDATED],
            }, bearerPrivateIdentifier: '123'
          }
          let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
        }catch (err){
          console.info(`${caseName} catch err is `,JSON.stringify(err));
          ExpectFail(caseName);
          console.info(`${caseName} --test end`);
          done();
        }
      });


      /**
       *@tc.number SUB_NetworkManager_Register_Async_1300
       *@tc.name testNetworkManagerRegisterAsync1300
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1300';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_WIFI],
            networkCap: [NetCapNET_CAPABILITY_PORTAL],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });


      /**
       *@tc.number SUB_NetworkManager_Register_Async_1400
       *@tc.name testNetworkManagerRegisterAsync1400
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1400';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_BLUETOOTH],
            networkCap: [NetCapNET_CAPABILITY_INTERNET],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1500
       *@tc.name testNetworkManagerRegisterAsync1500
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1500';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_ETHERNET],
            networkCap: [NetCapNET_CAPABILITY_INTERNET],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });


      /**
       *@tc.number SUB_NetworkManager_Register_Async_1600
       *@tc.name testNetworkManagerRegisterAsync1600
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1600';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_VPN],
            networkCap: [NetCapNET_CAPABILITY_INTERNET],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1700
       *@tc.name testNetworkManagerRegisterAsync1700
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1700';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier : connection.NetSpecifier= {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [5],
            networkCap: [NetCapNET_CAPABILITY_PORTAL],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_1900
       *@tc.name testNetworkManagerRegisterAsync1900
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync1900';
        console.info(`${caseName}---Start`);
        try{
          let netSpecifier: connection.NetSpecifier = {
            netCapabilities: {
              linkUpBandwidthKbps: 0,
              linkDownBandwidthKbps: 0,
              bearerTypes: [6],
              networkCap: [18],
            }, bearerPrivateIdentifier: '123'
          }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
           await netConn.register( (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectTrue(caseName, error.code == 401);
            }else{
              console.info(caseName+ " register success");
              ExpectFail(caseName);
            }
            done();
            console.info(`${caseName}---End`);
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_Register_Async_2000
       *@tc.name testNetworkManagerRegisterAsync2000
       *@tc.desc  activate the default network ,and see if the callback information is generated
       *@tc.level Level0
       *@tc.type: Function
       *@tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync2000';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_CAPABILITY_MMS],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });

          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });


      /**
       *@tc.number SUB_NetworkManager_Register_Async_2300
       *@tc.name testNetworkManagerRegisterAsync2300
       *@tc.desc  activate the default network ,and see if the callback information is generated
       * @tc.level Level0
       * @tc.type: Function
       * @tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync2300';
        console.info(`${caseName}---Start`);
        try{
        let netConn = connection.createNetConnection();
          console.info(caseName+ " register start");
          await netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 11);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

      /**
       *@tc.number SUB_NetworkManager_register_Async_2400
       *@tc.name testNetworkManagerRegisterAsync2400
       *@tc.desc  activate the default network ,and see if the callback information is generated
       * @tc.level Level0
       * @tc.type: Function
       * @tc.size: SmallTest
       */
      it('testNetworkManagerRegisterAsync2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testNetworkManagerRegisterAsync2400';
        console.info(`${caseName}---Start`);
        try{
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0,
            bearerTypes: [NetBearTypeBEARER_CELLULAR],
            networkCap: [NetCapNET_CAPABILITY_MMS],
          }, bearerPrivateIdentifier: '123'
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
          console.info(caseName+ " register start");
          netConn.register(async (error) => {
            if (error) {
              console.info(caseName + " register fail: " + JSON.stringify(error));
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }else{
              console.info(caseName+ " register success");
            }
          });
          await netConnOnEvent6(caseName, netConn)
          await sleep(500);
          console.info(caseName+ " unregister start");
          netConn.unregister(async (error) => {
            if (error) {
              console.info(caseName + " unregister fail: " + JSON.stringify(error));
              ExpectFail(caseName);
            } else {
              console.info(caseName + " unregister success ");
              console.info(caseName + " ListenTimes is :" +ListenTimes);
              ExpectTrue(caseName, ListenTimes == 0);
            }
            console.info(`${caseName}---End`);
            done();
          });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
      });

    /**
     * @tc.number SUB_NetworkManager_Register_Async_2500
     * @tc.name testNetworkManagerRegisterAsync2500
     * @tc.desc activate the default network, and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync2500';
      console.info(`${caseName}---Start`);
      try {
        let netConn = connection.createNetConnection();
        console.info(caseName+ " register start");
        netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent3(caseName, netConn);
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 11);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_Register_Async_2600
     * @tc.name testNetworkManagerRegisterAsync2600
     * @tc.desc activate the default network, and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync2600';
      console.info(`${caseName}---Start`);
      try {
        let netSpecifier: connection.NetSpecifier = {
          netCapabilities: {
            bearerTypes: [NetBearTypeBEARER_WIFI,NetBearTypeBEARER_CELLULAR],
          }
        }
        let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
        console.info(caseName+ " register start");
        netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent3(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 11);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     *@tc.number SUB_NetworkManager_Register_Async_2700
     *@tc.name testNetworkManagerRegisterAsync2700
     *@tc.desc  activate the default network ,and see if the callback information is generated
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerRegisterAsync2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testNetworkManagerRegisterAsync2700';
      console.info(`${caseName}---Start`);
      try{
        let netConn = connection.createNetConnection();
        console.info(caseName+ " register start");
        netConn.register(async (error) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }else{
            console.info(caseName+ " register success");
          }
        });
        await netConnOnEvent3(caseName, netConn)
        await sleep(500);
        console.info(caseName+ " unregister start");
        netConn.unregister(async (error) => {
          if (error) {
            console.info(caseName + " unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" +ListenTimes);
            ExpectTrue(caseName, ListenTimes == 11);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });
 })
}
