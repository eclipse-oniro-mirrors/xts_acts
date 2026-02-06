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
import socket from '@ohos.net.socket'
import { describe, it, expect, Level, Size, TestType, afterEach } from '@ohos/hypium';
import { BusinessError } from "@kit.BasicServicesKit";

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

export default function LocalSocketServerCloseTest() {
  describe("LocalSocketServerCloseTest", () => {

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0100';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket01';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (localSocketConnection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          localServer.close().then(()=>{
            console.info(`${caseName} localServer close success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0200';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket02';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (localSocketConnection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          await localServer.close().then(()=>{
            console.info(`${caseName} localServer close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
          let sendOptions: socket.LocalSendOptions = {
            data: 'Hello, client!'
          }
          localSocketConnection.send(sendOptions).then(()=>{
            console.info(`${caseName} localSocketConnection send success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} connection send err is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        let sendOpt: socket.LocalSendOptions = {
          data: 'Hello world!'
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0300
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0300';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket03';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          await localServer.close().then(()=>{
            console.info(`${caseName} localServer close success`);
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!'
          }
          await localClient.send(sendOpt).then(()=>{
            console.info(`${caseName} localClient send success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} localClient send failed, error is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })

        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0400
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0400';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket04';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          await localServer.close().then(()=>{
            console.info(`${caseName} localServer close success`);
            localServer.listen(listenAddr).then(() => {
              console.info(`${caseName} localServer again listen success`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: Object) => {
              console.info(`${caseName}  again listen catch err is `+ JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
            });
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} localServer close get err is `+JSON.stringify(err));
            ExpectFail();
            console.info(`${caseName} ---End`);
            done();
          })
        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0500
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0500';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket05';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (localSocketConnection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          localClient.close().then(()=>{
            console.info(`${caseName} localClient close success`);
            localServer.close().then(()=>{
              console.info(`${caseName} localServer close success`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.info(`${caseName} localServer close failed err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0600
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0600';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket06';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        localServer.on('connect', async (localSocketConnection: socket.LocalSocketConnection) => {
          console.info(`${caseName} localServer on connect`);
          localSocketConnection.close().then(()=>{
            console.info(`${caseName} localSocketConnection close success`);
            localServer.close().then(()=>{
              console.info(`${caseName} localServer close success`);
              ExpectTrue(true);
              console.info(`${caseName}---End`);
              done();
            }).catch((err: BusinessError)=>{
              console.info(`${caseName} localServer close failed err is `+JSON.stringify(err));
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
          })
        });
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        let localAddress : socket.LocalAddress = {
          address: sandboxPath
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddress,
        }
        await localClient.connect(connectOpt).then(() => {
          console.info(`${caseName} localClient connect success`);
        }).catch((err: BusinessError) => {
          console.log(`${caseName} localClient connect fail , err is` + JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0700
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0700
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0700';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket07';
        console.info(`${caseName} --- sandboxPath is ` + sandboxPath)
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        await localServer.close().then(()=>{
          console.info(`${caseName} localServer close success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0800
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0800
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0800';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let context = getContext();
        let sandboxPath: string = context.filesDir + '/testSocket08';
        let listenAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await localServer.listen(listenAddr).then(() => {
          console.info(`${caseName} localServer listen success`);
        }).catch((err: Object) => {
          console.info(`${caseName} catch listen err is `+ JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
        });
        await localServer.close().then(()=>{
          console.info(`${caseName} localServer close success`);
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} localServer close get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName} ---End`);
          done();
        })
        await localServer.close().then(()=>{
          console.info(`${caseName} localServer close success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} localServer close get err is `+JSON.stringify(err));
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerClose0900
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Close_0900
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerClose0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerClose0900';
      console.info(`${caseName} test start`);
      try {
        let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        localServer.close().then(()=>{
          console.info(`${caseName} localServer close success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectTrue(err.code == 2300002);
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} catch fail err:${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

  });
}

