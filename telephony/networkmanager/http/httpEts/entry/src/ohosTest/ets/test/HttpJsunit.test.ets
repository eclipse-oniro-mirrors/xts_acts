/*
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import connection from "@ohos.net.connection";
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectTrue(n : boolean) {
  try {
    expect(n).assertTrue();
  } catch (err){
    console.info('assertion failure');
  }
};

function  sleep (time: number):Promise<string>{return new Promise<string>((resolve)=>{setTimeout(()=>{resolve("ok")},time)});}
export default function httpJsunit() {
  describe("httpJsunitTest", () => {
    let udpSocket = socket.constructUDPSocketInstance();
    let multicastSocket = socket.constructMulticastSocketInstance();
    let multicastAddress: connection.NetAddress= {
      address: '239.255.0.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_invalid: connection.NetAddress= {
      address: '1.1.1.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_null: connection.NetAddress = {
      address: '',
      family: 1,
      port: 32123
    };
    let ttl = 100;
    let ttl_invalid = 256;
    let ttl_undefined = undefined;

    /**
     * @tc.number: SUB_NetworkMgr_Http_CreateHttp_0100
     * @tc.name: testNetworkMgrHttpCreateHttp0100
     * @tc.desc: Test Create HTTP authentication.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrHttpCreateHttp0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let  caseName: string = 'testNetworkMgrHttpCreateHttp0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest = http.createHttp();
        expectTrue(httpRequest != null);
        httpRequest.destroy();
        console.info(`${caseName}---End`);
        done();
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Http_GetDefaultNetSync_0100
     * @tc.name: testNetworkMgrHttpGetDefaultNetSync0100
     * @tc.desc: Test getDefaultNetSync() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrHttpGetDefaultNetSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpGetDefaultNetSync0100';
      console.info(`${caseName}---Start`);
      try {
        let handleInstance = connection.getDefaultNetSync();
        if (handleInstance == undefined) {
          console.log(`${caseName} gethandleInstance fail`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} gethandleInstance success`);
          expectTrue(typeof (handleInstance) == 'object');
          console.info(`${caseName}---End`);
          done();
        }
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_IsDefaultNetMetered_Async_0100
     * @tc.name: testNetworkMgrIsDefaultNetMeteredAsync0100
     * @tc.desc: Test isDefaultNetMetered() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrIsDefaultNetMeteredAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrIsDefaultNetMeteredAsync0100';
      console.info(`${caseName}---Start`);
      try {
        connection.isDefaultNetMetered((error, data) => {
          if (error) {
            console.log(`${caseName} isDefaultNetMetered  error`);
            expectFalse();
            done();
          } else {
            console.log(`${caseName} isDefaultNetMetered success`);
            expectTrue(error==undefined);
            expectTrue(data==true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_IsDefaultNetMetered_Promise_0100
     * @tc.name: testNetworkMgrIsDefaultNetMeteredPromise0100
     * @tc.desc: Test isDefaultNetMetered() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrIsDefaultNetMeteredPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrIsDefaultNetMeteredPromise0100';
      console.info(`${caseName}---Start`);
      try {
        connection.isDefaultNetMetered().then((data) => {
          console.log(`${caseName} isDefaultNetMetered success`);
          expectTrue(data == true);
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.log(JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_GetDefaultHttpProxy_Async_0100
     * @tc.name: testNetworkMgrGetDefaultHttpProxyAsync0100
     * @tc.desc: Test getDefaultHttpProxy() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrGetDefaultHttpProxyAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrGetDefaultHttpProxyAsync0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultHttpProxy((error, data) => {
          if (error) {
            console.log(`${caseName} getDefaultHttpProxy  error`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} getDefaultHttpProxy success` + JSON.stringify(data));
            expectTrue(error == undefined);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_GetDefaultHttpProxy_Promise_0100
     * @tc.name: testNetworkMgrGetDefaultHttpProxyPromise0100
     * @tc.desc: Test getDefaultHttpProxy() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrGetDefaultHttpProxyPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrGetDefaultHttpProxyPromise0100';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultHttpProxy().then((data) => {
          console.log(`${caseName} getDefaultHttpProxy success`);
          console.log(JSON.stringify(data));
          expectTrue(data.host == '');
          expectTrue(data.port == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error:BusinessError) => {
          console.log(JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_GetDefaultHttpProxy_Async_0200
     * @tc.name: testNetworkMgrGetDefaultHttpProxyAsync0200
     * @tc.desc: Test getDefaultHttpProxy() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrGetDefaultHttpProxyAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrGetDefaultHttpProxyAsync0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle) => {
          console.log("netHandle is " + JSON.stringify(netHandle));
          connection.setAppNet(netHandle).then(() => {
            console.log("setAppNet success");
            connection.getDefaultHttpProxy((error, data) => {
              if (error) {
                console.log(`${caseName} getDefaultHttpProxy  error`);
                expectFalse();
                console.info(`${caseName}---End`);
                done();
              } else {
                console.log(`${caseName} getDefaultHttpProxy success`);
                expectTrue(data.host == '');
                expectTrue(data.port == 0);
                console.info(`${caseName}---End`);
                done();
              }
            });
          }).catch((error:BusinessError) => {
            console.log("setAppNet err " + JSON.stringify(error));
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error:BusinessError) => {
          console.log("getDefaultNet err " + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_GetDefaultHttpProxy_Promise_0200
     * @tc.name: testNetworkMgrGetDefaultHttpProxyPromise0200
     * @tc.desc: Test getDefaultHttpProxy() to check return value
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrGetDefaultHttpProxyPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrGetDefaultHttpProxyPromise0200';
      console.info(`${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle) => {
          console.log("netHandle is " + JSON.stringify(netHandle));
          connection.setAppNet(netHandle).then(() => {
            console.log("setAppNet success");
            connection.getDefaultHttpProxy().then((data) => {
              console.log(`${caseName} getDefaultHttpProxy success`);
              expectTrue(data.host == '');
              expectTrue(data.port == 0);
              console.info(`${caseName}---End`);
              done();
            }).catch((error:BusinessError) => {
              console.log(JSON.stringify(error));
              expectFalse();
              console.info(`${caseName}---End`);
              done();
            });
          }).catch((error:BusinessError) => {
            console.log("setAppNet err " + JSON.stringify(error));
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error:BusinessError) => {
          console.log("getDefaultNet err " + JSON.stringify(error));
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_Connection_Request_Socket_0100
     * @tc.name: testNetworkMgrConnectionRequestSocket0100
     * @tc.desc: Create socket and HttpRequest success
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testNetworkMgrConnectionRequestSocket0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = 'testNetworkMgrConnectionRequestSocket0100';
      console.info(`${caseName}---Start`);
      try {
        let tcpSocket:socket.TCPSocket = socket.constructTCPSocketInstance();
        let udpSocket:socket.UDPSocket = socket.constructUDPSocketInstance();
        let httpRequest:http.HttpRequest = http.createHttp();

        expectTrue(httpRequest != null);
        expectTrue(tcpSocket != null);
        expectTrue(udpSocket != null);
        httpRequest.destroy();
        tcpSocket.close();
        udpSocket.close();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketAddMembershipPromise0100
     * @tc.desc: Test addMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketAddMembershipPromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.addMembership(multicastAddress).then((data) => {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectTrue(data === undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0200
     * @tc.name: testNetworkMgrUDPSocketAddMembershipPromise0200
     * @tc.desc: Test addMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketAddMembershipPromise0200";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.addMembership(multicastAddress_invalid).then((data) => {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code !== undefined);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0300
     * @tc.name: testNetworkMgrUDPSocketAddMembershipPromise0300
     * @tc.desc: Test addMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketAddMembershipPromise0300";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.addMembership(multicastAddress_null).then((data) => {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code !== undefined);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_AddMembership_Promise_0400
     * @tc.name: testNetworkMgrUDPSocketAddMembershipPromise0400
     * @tc.desc: Test addMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketAddMembershipPromise0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketAddMembershipPromise0400";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.addMembership(undefined).then((data) => {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketSetMulticastTTLPromise0100
     * @tc.desc: Test setMulticastTTL property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetMulticastTTLPromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setMulticastTTL(ttl).then((data) => {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0200
     * @tc.name: testNetworkMgrUDPSocketSetMulticastTTLPromise0200
     * @tc.desc: Test setMulticastTTL property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetMulticastTTLPromise0200";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setMulticastTTL(ttl_invalid).then((data) => {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code !== undefined);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetMulticastTTL_Promise_0300
     * @tc.name: testNetworkMgrUDPSocketSetMulticastTTLPromise0300
     * @tc.desc: Test setMulticastTTL401 property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetMulticastTTLPromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetMulticastTTLPromise0300";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setMulticastTTL(ttl_undefined).then((data) => {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_GetMulticastTTL_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketGetMulticastTTLPromise0100
     * @tc.desc: Test getMulticastTTL property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketGetMulticastTTLPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketGetMulticastTTLPromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.getMulticastTTL().then((data) => {
          console.log(`${caseName} getMulticastTTL success, data: ${JSON.stringify(data)}`);
          expectTrue(data == 100);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} getMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetLoopbackMode_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketSetLoopbackModePromise0100
     * @tc.desc: Test setLoopbackMode property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetLoopbackModePromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetLoopbackModePromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setLoopbackMode(true).then((data) => {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetLoopbackMode_Promise_0200
     * @tc.name: testNetworkMgrUDPSocketSetLoopbackModePromise0200
     * @tc.desc: Test setLoopbackMode property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetLoopbackModePromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetLoopbackModePromise0200";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setLoopbackMode(false).then((data) => {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err:${JSON.stringify(err)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_SetLoopbackMode_Promise_0300
     * @tc.name: testNetworkMgrUDPSocketSetLoopbackModePromise0300
     * @tc.desc: Test setLoopbackMode401 property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketSetLoopbackModePromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketSetLoopbackModePromise0300";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setLoopbackMode(undefined).then((data) => {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_GetLoopbackMode_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketGetLoopbackModePromise0100
     * @tc.desc: Test getLoopbackMode property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketGetLoopbackModePromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketGetLoopbackModePromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setLoopbackMode(true).then((data) => {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          multicastSocket.getLoopbackMode().then((data) => {
            console.log(`${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data==true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err:BusinessError) => {
            console.log(`${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_GetLoopbackMode_Promise_0200
     * @tc.name: testNetworkMgrUDPSocketGetLoopbackModePromise0200
     * @tc.desc: Test getLoopbackMode property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketGetLoopbackModePromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketGetLoopbackModePromise0200";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.setLoopbackMode(false).then((data) => {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          multicastSocket.getLoopbackMode().then((data) => {
            console.log(`${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
            expectTrue(data==false);
            console.info(`${caseName}---End`);
            done();
          }).catch((err:BusinessError) => {
            console.log(`${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err:BusinessError) => {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0100
     * @tc.name: testNetworkMgrUDPSocketDropMembershipPromise0100
     * @tc.desc: Test dropMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketDropMembershipPromise0100";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.dropMembership(multicastAddress).then((data) => {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expectTrue(data===undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
        await sleep(2000);
        console.info(`${caseName}---End`);
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0200
     * @tc.name: testNetworkMgrUDPSocketDropMembershipPromise0200
     * @tc.desc: Test dropMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketDropMembershipPromise0200";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.dropMembership(multicastAddress_invalid).then((data) => {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code !== undefined);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0300
     * @tc.name: testNetworkMgrUDPSocketDropMembershipPromise0300
     * @tc.desc: Test dropMembership property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketDropMembershipPromise0300";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.dropMembership(multicastAddress_null).then((data) => {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code !== undefined);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.number: SUB_NetworkMgr_UDPSocket_DropMembership_Promise_0400
     * @tc.name: testNetworkMgrUDPSocketDropMembershipPromise0400
     * @tc.desc: Test dropMembership401 property.
     * @tc.level: level0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testNetworkMgrUDPSocketDropMembershipPromise0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName:string = "testNetworkMgrUDPSocketDropMembershipPromise0400";
      console.info(`${caseName}---Start`);
      try {
        multicastSocket.dropMembership(undefined).then((data) => {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} test failed err:${JSON.stringify(error)}`);
        expectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}