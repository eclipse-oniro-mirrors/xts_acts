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

import { describe, expect, it } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function ConnectionWithoutNetTest() {
  describe('ConnectionWithoutNetTest', () => {

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0100
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0100
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0100', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
                if (error) {
                  console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                  ExpectTrue(error?.code == 2100001);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  console.info(`${caseName} bindSocket success data: ${JSON.stringify(data)}`);
                  ExpectFail();
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0200
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0200
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0200', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(udp, (error: BusinessError, data: void) => {
                if (error) {
                  console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                  ExpectTrue(error?.code == 2100001);
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  console.info(`${caseName} bindSocket success data: ${JSON.stringify(data)}`);
                  ExpectFail();
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0300
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0300
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0300', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(tcp).then().catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectTrue(error?.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0400
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0400
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0400', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.bindSocket(udp).then().catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectTrue(error?.code == 2100001);
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0500
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0500
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0500', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(tcp, (error: BusinessError, data: void) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
                if (error) {
                  ExpectFail();
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(true);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0600
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0600
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0600', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(udp, (error: BusinessError, data: void) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
                if (error) {
                  ExpectFail();
                  console.info(`${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(true);
                  console.info(`${caseName}---End`);
                  done();
                }
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0700
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0700
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0700', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(tcp).then((data: void) => {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_BindSocket_WithoutNet_0800
     * @tc.name   : testNetworkMgrConnectionBindSocketWithoutNet0800
     * @tc.desc   : Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionBindSocketWithoutNet0800', 0, async (done: Function) => {
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
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              netHandle.netId = 100;
              netHandle.bindSocket(udp).then((data: void) => {
                console.info(`${caseName} bindSocket data: ${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName}---End`);
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} bindSocket error: ${JSON.stringify(error)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              });
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0400
     * @tc.name       : testNetConnectionHasDefaultNet0400
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNet0400', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet0400";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet((error: BusinessError, data: boolean) => {
          if (error) {
            console.error(`${caseName} hasDefaultNet: BusinessError>${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
            ExpectTrue(data == false);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0700
     * @tc.name       : testNetConnectionHasDefaultNet0700
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNet0700', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet0700";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
          ExpectTrue(data == false);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} hasDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNetSync_0400
     * @tc.name       : testNetConnectionHasDefaultNetSync0400
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNetSync0400', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNetSync0400";
      console.info(`${caseName} test start`);
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(isDefaultNet != true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0400
     * @tc.name       : testNetConnectionGetDefaultNetCallback0400
     * @tc.desc       : test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionGetDefaultNetCallback0400', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetCallback0400";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError<void>, data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectTrue(data.netId == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0200
     * @tc.name       : testNetConnectionGetDefaultNetPromise0200
     * @tc.desc       : test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionGetDefaultNetPromise0200', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetPromise0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet: data->${JSON.stringify(data)}`);
          ExpectTrue(data.netId == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNetSync_0200
     * @tc.name       : testNetConnectionGetDefaultNetSync0200
     * @tc.desc       : test use synchronization method to obtain default activated data network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionGetDefaultNetSync0200', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetSync0200";
      console.info(`${caseName} test start`);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(netHandle.netId == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0300
     * @tc.name       : testNetworkMgrConnectionGetAppNet0300
     * @tc.desc       : Obtain network information bound to the app and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAppNet0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0300";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.netId == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0700
     * @tc.name       : testNetworkMgrConnectionGetAppNet0700
     * @tc.desc       : Obtain network information bound to the app and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAppNet0700', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet0700";
      console.info(`${caseName} test start `);
      try {
        connection.getAppNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getAppNet: success data->${JSON.stringify(data)}`);
          ExpectTrue(data.netId == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAppNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNetSync_0300
     * @tc.name       : testNetworkMgrConnectionGetAppNetSync0300
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAppNetSync0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAppNetSync0300";
      console.info(`${caseName} test start `);
      try {
        let netHandle = connection.getAppNetSync();
        console.info(`${caseName} GetAppNetSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle.netId == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0300
     * @tc.name       : testNetworkMgrConnectionGetAllNets0300
     * @tc.desc       : Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNets0300', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0300";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets((error: BusinessError, data: connection.NetHandle[]) => {
          if (error) {
            console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length == 0);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0800
     * @tc.name       : testNetworkMgrConnectionGetAllNets0800
     * @tc.desc       : Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNets0800', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets0800";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
          ExpectTrue(data.length == 0);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getAllNets: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNetsSync_0400
     * @tc.name       : testNetworkMgrConnectionGetAllNetsSync0400
     * @tc.desc       : Use synchronization method to obtain a list of all connected networks.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNetsSync0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle = connection.getAllNetsSync();
        console.info(`${caseName} GetAllNetsSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle.length == 0);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0400
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0400
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error) {
              console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0500
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties0500
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            console.info(`${caseName} getConnectionProperties: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getConnectionProperties: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0400
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync0400
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        console.info(`${caseName} GetConnectionPropertiesSync: success data->${JSON.stringify(connectionProperties)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error) {
              console.info(`${caseName} getNetCapabilities: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} getNetCapabilities: success data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0500
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities0500
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            console.info(`${caseName} getNetCapabilities: success data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} getNetCapabilities: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2100001);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync0400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync0400', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        console.info(`${caseName} getNetCapabilitiesSync: success data->${JSON.stringify(getNetCapAbilitiesSync)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0200
     * @tc.name       : testNetConnectionReportNetConnected0200
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionReportNetConnected0200', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionReportNetConnected0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetConnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0300
     * @tc.name       : testNetConnectionReportNetConnected0300
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionReportNetConnected0300', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionReportNetConnected0300";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetConnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0200
     * @tc.name       : testNetConnectionReportNetDisconnected0200
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionReportNetDisconnected0200', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionReportNetDisconnected0200";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (error: BusinessError) => {
            if (error) {
              console.info(`${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2101006);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1100
     * @tc.name       : testNetConnectionReportNetDisconnected1100
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionReportNetDisconnected1100', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionReportNetDisconnected1100";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            console.info(`${caseName}: reportNetDisconnected: success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2101006);
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0400
     * @tc.name       : testNetConnectionOn0400
     * @tc.desc       : Subscription network connection information change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionOn0400', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionOn0400";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError) => {
          console.log(`${caseName} register error ${JSON.stringify(error)}`);
          if (error) {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
        netCon.on('netUnavailable', () => {
          console.info(`${caseName} Succeeded netUnavailable`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}
