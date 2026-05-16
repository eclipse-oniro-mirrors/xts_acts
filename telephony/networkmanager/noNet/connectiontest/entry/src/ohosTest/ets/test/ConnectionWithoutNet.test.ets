/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level, beforeEach} from '@ohos/hypium';
import socket from '@ohos.net.socket';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

let isNetLost = false;
let isNetAvailable = false;
let isNetUnavailable = false;
let isNetConnectionPropertiesChange = false;
let isNetCapabilitiesChange = false;
let netCapInfo: connection.NetCapabilityInfo | undefined = undefined;
let netPropertyInfo: connection.NetConnectionPropertyInfo | undefined = undefined;
let availableNet: connection.NetHandle | undefined = undefined;
let lostNet: connection.NetHandle | undefined = undefined;
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

let netConnOnEventAll = async (caseName: string, netConn: connection.NetConnection) => {
  console.info(caseName + ": ==  Subscribing to Events start  === ")
  netConn.on('netAvailable', (value: connection.NetHandle) => {
    ListenTimes += 1;
    isNetAvailable = true;
    availableNet = value;
    console.info(caseName+ " === on netAvailable " + JSON.stringify(value));
  });
  netConn.on('netConnectionPropertiesChange', (value: connection.NetConnectionPropertyInfo) => {
    ListenTimes += 10;
    isNetConnectionPropertiesChange = true;
    netPropertyInfo = value;
    console.info(caseName +" ===on netConnectionPropertiesChange" + JSON.stringify(value));
  });
  netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
    ListenTimes += 100;
    isNetCapabilitiesChange = true;
    netCapInfo = value;
    console.info(caseName + " ===on netCapabilitiesChange " + JSON.stringify(value));
  });
  netConn.on('netLost', (value: connection.NetHandle) => {
    ListenTimes += 1000;
    isNetLost = true;
    lostNet = value;
    console.info(caseName +" === on netLost" + JSON.stringify(value));
  });
  netConn.on('netUnavailable', () => {
    ListenTimes += 10000;
    isNetUnavailable = true;
    console.info(caseName +" ===on netUnavailable ");
  });
  console.info(caseName + ": ==  Subscribing to Events end  === ");
}

const ExpectFail: (caseName:string) => void = (caseName:string) => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};
const ExpectTrue: ( caseName:string, n: boolean | undefined) => void = (caseName:string, n: boolean | undefined) => {
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

export default function ConnectionWithoutNetTest() {
  describe('ConnectionWithoutNetTest', () => {
    beforeEach(() => {
      ListenTimes = 0;
      isNetLost = false;
      isNetAvailable = false;
      isNetUnavailable = false;
      isNetConnectionPropertiesChange = false;
      isNetCapabilitiesChange = false;
      netCapInfo = undefined;
      netPropertyInfo = undefined;
      availableNet = undefined;
    })

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0100
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0100
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
                if (error) {
                  console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                  ExpectTrue(caseName, error?.code == 2100001);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  console.info(`${caseName} bindSocket success data: ${JSON.stringify(data)}`);
                  ExpectFail(caseName);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0200
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0200
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(udp, (error: BusinessError, data: void) => {
                if (error) {
                  console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                  ExpectTrue(caseName, error?.code == 2100001);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  console.info(`${caseName} bindSocket success data: ${JSON.stringify(data)}`);
                  ExpectFail(caseName);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0300
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0300
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0300';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(tcp).then().catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectTrue(caseName, error?.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0400
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0400
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0400';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(udp).then().catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectTrue(caseName, error?.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0500
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0500
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0500';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
                if (error) {
                  ExpectFail(caseName);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(caseName, true);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0600
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0600
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0600';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(udp, (error: BusinessError, data: void) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
                if (error) {
                  ExpectFail(caseName);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(caseName, true);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0700
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0700
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0700';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(tcp).then((data: void) => {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectTrue(caseName, true);
                console.info(`${caseName}---End`);
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectFail(caseName);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionBindSocketWithoutNet0800
     * @tc.number SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0800
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionBindSocketWithoutNet0800';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.bind({
            address: "127.0.0.1",
            port: 8080,
            family: 1
          } as socket.NetAddress, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} bind fail error: ${JSON.stringify(error)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(udp).then((data: void) => {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectTrue(caseName, true);
                console.info(`${caseName}---End`);
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectFail(caseName);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionHasDefaultNet0400
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0400
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionHasDefaultNet0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet0400";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet((error: BusinessError, data: boolean) => {
          if (error) {
            console.error(`${caseName} hasDefaultNet: BusinessError>${JSON.stringify(error)}`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
            ExpectTrue(caseName, data == false);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionHasDefaultNet0700
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0700
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionHasDefaultNet0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet0700";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
          ExpectTrue(caseName, data == false);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} hasDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionHasDefaultNetSync0400
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNetSync_0400
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionHasDefaultNetSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNetSync0400";
      console.info(`${caseName} test start`);
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(caseName, isDefaultNet == false);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionGetDefaultNetCallback0400
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0400
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionGetDefaultNetCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetCallback0400";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError<void>, data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err) {
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectTrue(caseName, data.netId == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionGetDefaultNetPromise0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0200
     * @tc.desc   test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionGetDefaultNetPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetPromise0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet: data->${JSON.stringify(data)}`);
          ExpectTrue(caseName, data.netId == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetSync0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNetSync_0200
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultNetSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync0200";
      console.info(`${caseName} test start`);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(caseName, netHandle.netId == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAppNet0300
     * @tc.number SUB_NetworkMgr_ConnectionGetAppNet_0300
     * @tc.desc   Obtain network information bound to the app and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAppNet0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0300";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(caseName, data.netId == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.name   testNetworkMgrConnectionGetAppNet0700
     * @tc.number SUB_NetworkMgr_ConnectionGetAppNet_0700
     * @tc.desc   Obtain network information bound to the app and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAppNet0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0700";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getAppNet: success data->${JSON.stringify(data)}`);
          ExpectTrue(caseName, data.netId == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAppNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAppNetSync0300
     * @tc.number SUB_NetworkMgr_ConnectionGetAppNetSync_0300
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAppNetSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNetSync0300";
      console.info(`${caseName} test start `);
      try {
        let netHandle = connection.getAppNetSync();
        console.info(`${caseName} GetAppNetSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(caseName, netHandle.netId == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets0300
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNets_0300
     * @tc.desc   Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAllNets0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0300";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets((error: BusinessError, data: connection.NetHandle[]) => {
          if (error) {
            console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
            ExpectTrue(caseName, data.length == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets0800
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNets_0800
     * @tc.desc   Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetAllNets0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0800";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
          ExpectTrue(caseName, data.length == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNetsSync0400
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNetsSync_0400
     * @tc.desc   Use synchronization method to obtain a list of all connected networks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNetsSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle = connection.getAllNetsSync();
        console.info(`${caseName} GetAllNetsSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(caseName, netHandle.length == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties0400
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0400
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetConnectionProperties0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(caseName, error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties0500
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0500
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetConnectionProperties0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(caseName, error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync0400
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0400
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(caseName, err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities0400
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0400
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetNetCapabilities0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} getNetCapabilities: err->${JSON.stringify(error)}`);
              ExpectTrue(caseName, error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getNetCapabilities: success data->${JSON.stringify(data)}`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities0500
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0500
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} getNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(caseName, error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync0400
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0400
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(caseName, err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected0200
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0200
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionReportNetConnected0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(caseName, error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected0300
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0300
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionReportNetConnected0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected0300";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectTrue(caseName, err.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected0200
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0200
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionReportNetDisconnected0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(caseName, error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectFail(caseName);
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected1100
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1100
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionReportNetDisconnected1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected1100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectTrue(caseName, error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail(caseName);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0400
     * @tc.number SUB_NetworkMgr_Connection_On_0400
     * @tc.desc   Subscription network connection information change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionOn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionOn0400";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.on('netUnavailable', () => {
          console.info(`${caseName} Succeeded netUnavailable`);
          ExpectTrue(caseName, true);
          console.info(`${caseName}---End`);
        });
        netCon.register((error: BusinessError) => {
          console.log(`${caseName} register error ${JSON.stringify(error)}`);
          if (error) {
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          }
        });
        await sleep(50)
        netCon.unregister(()=>{
          done()
        })
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail(caseName);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0500
     * @tc.number testNetworkMgrConnectionOn0500
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn0500";
      try {
        let netConn = connection.createNetConnection();
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await sleep(50);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);
        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 10000);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        ExpectFail(caseName);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0600
     * @tc.number testNetworkMgrConnectionOn0600
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn0600";
      try {
        let netConn = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          },
        }, 100);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await sleep(150);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);
        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 10000);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        ExpectFail(caseName);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0700
     * @tc.number testNetworkMgrConnectionOn0700
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionOn0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn0700";
      try {
        let netConn = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        }, 100);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await sleep(150);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);
        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 10000);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        ExpectFail(caseName);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0800
     * @tc.number testNetworkMgrConnectionOn0800
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionOn0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn0800";
      try {
        let netConn = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          },
        }, 100);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });

        let netConn2 = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          },
        }, 100);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn2);
        netConn2.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        console.info(`${caseName}---start sleep 50ms`);
        await sleep(50);
        console.info(caseName + " ListenTimes is :" + ListenTimes);
        ExpectTrue(caseName, ListenTimes === 0);
        console.info(`${caseName}---start sleep 1000ms`);
        await sleep(100);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);
        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 20000);
          }
        });
        netConn2.unregister((error: BusinessError) => {
          console.info(`${caseName}---End`);
          done()
        })
      } catch (err) {
        ExpectFail(caseName);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn0900
     * @tc.number testNetworkMgrConnectionOn0900
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionOn0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn0900";
      try {
        let netConn = connection.createNetConnection();
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });

        let netConn2 = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        }, 100);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn2);
        netConn2.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        console.info(`${caseName}---start sleep 50ms`);
        await sleep(50);
        console.info(caseName + " ListenTimes is :" + ListenTimes);
        ExpectTrue(caseName, ListenTimes === 10000);
        console.info(`${caseName}---start sleep 100ms`);
        await sleep(100);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);
        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 20000);
          }
        });
        netConn2.unregister((error: BusinessError) => {
          console.info(`${caseName}---End`);
          done()
        })
      } catch (err) {
        ExpectFail(caseName);
        done();
      }
    });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0100
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0100
     * @tc.desc    getAddressesByNameWithOptions Cannot connect to service
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0100';
      console.info(`${caseName}---Start`);
      let host = "www.baidu.com";
      await connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(caseName, error.code == 2100002);
        console.info(`${caseName}---End`);
        done();
      });
    });
  });
}
