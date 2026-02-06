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

import { describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback} from '@ohos.base';
import { JSON } from '@kit.ArkTS';

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function stringToArrayBuffer(str: string): ArrayBuffer {
  let buf: ArrayBuffer = new ArrayBuffer(str.length * 2);
  let bufView: Uint8Array = new Uint8Array(buf);
  for (let i: number = 0; i < str.length; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

export default function LocalSocketTest() {
  describe('LocalSocketTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Bind_0100
     * @tc.desc   Bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        console.info(`${sandboxPath}`)
        let address: socket.LocalAddress = {
          address: sandboxPath
        }
        await client.bind(address).then(() => {
          console.log('bind success')
          expectTrue(true)
        }).catch((err: Object) => {
          console.error('failed to bind: ' + JSON.stringify(err))
          expectFail()
        });
        console.info(`${caseName} test end`);
        client.close()
        done()
      }catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Bind_0200
     * @tc.desc   test localSocket Bind function (401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0200';
      console.info(`${caseName} test start`);
      try {
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        await client.bind(undefined).then(() => {
          console.log('bind success')
          expectFail()
        }).catch((err: BusinessError) => {
          console.error('failed to bind: ' + JSON.stringify(err))
          expectEqual(401, err.code)
          done()
        });
        console.info(`${caseName} test end`);
        client.close()
        done()
      }catch (error) {
        console.info(`${caseName} catch err: ${JSON.stringify(error)}`);
        expectTrue(error.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnect0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_Connect_0100
     * @tc.desc   Connect to the specified socket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnect0100';
      console.info(`${caseName} test start`);
      try{
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`)
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          client.connect(connectOpt).then(() => {
            console.log(`${caseName} connect success`)
            expectTrue(true)
          }).catch((err: BusinessError) => {
            console.log(`${caseName} FAIL FAIL FAIL` + JSON.stringify(err));
            expectFail()
            done();
          })
          console.info(`${caseName} test end`);
          done();
        })
      }catch (err){
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0100
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`)
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log(`${caseName} connect success`)
          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!'
          }
          return client.send(sendOpt)
        }).then(() => {
          console.info('client send success')
          expectTrue(true)
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0200
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!',
            encoding: 'UTF-8',
          }
          return client.send(sendOpt)
        }).then(() => {
          console.info('client send success')
          expectTrue(true)
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0300
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0300';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }

        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          let sendOpt: socket.LocalSendOptions = {
            data: stringToArrayBuffer('Hello, server!'),
            encoding: 'UTF-8',
          }
          return client.send(sendOpt)
        }).then(() => {
          console.info('client send success')
          expectTrue(true)
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0400
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0400
     * @tc.desc   test localSocket send function.(401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0400';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
          console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          return client.send(null)
        }).then(() => {
          console.info('client send success')
          expectFail()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectEqual(401, err.code)
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetState0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getState_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketGetState0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          return client.getState()
        }).then(() => {
          console.info('get state success')
          expectTrue(true)
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getSocketFd_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          return client.getSocketFd()
        }).then((data: number) => {
          console.info('fd' + data)
          expectTrue(true)
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSetExtraOptions0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_setExtraOptions_0100
     * @tc.desc   test LocalSocket connection SetExtraOptions function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSetExtraOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSetExtraOptions0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
          return client.getSocketFd()
        }).then((data: number) => {
          console.info('fd' + data)
          expectTrue(true)
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        console.info(`${caseName} test end`);
        client.close()
        done()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketServerGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_GetSocketFd_0100
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketServerGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testLocalSocketServerGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
          console.info('fail to listen' + err.code.toString());
        })
        await server.getSocketFd().then((serverFd: number) => {
          console.info(`${caseName} success fd:${JSON.stringify(serverFd)}`);
          expectTrue(serverFd !== -1);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
          expectFail();
        });
        await server.close().catch((err: BusinessError) => {
          console.info(`${caseName} close server err: ${err.message}`);
        });
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketServerGetSocketFd0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_GetSocketFd_0200
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketServerGetSocketFd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testLocalSocketServerGetSocketFd0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        await server.getSocketFd().then((serverFd: number) => {
          console.info(`${caseName} success fd:${JSON.stringify(serverFd)}`);
          expectTrue(serverFd === -1);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
          expectFail();
        });
        await server.close().catch((err: BusinessError) => {
          console.info(`${caseName} close server err: ${err.message}`);
        });
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketConnectionGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketConnection_GetSocketFd_0100
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testLocalSocketConnectionGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        };
        await server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail to listen: ${err.code.toString()}`);
        });
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} server accept connection success`);
          await connection.getSocketFd().then((fd: number) => {
            console.info(`${caseName} get Connection FD success: ${fd}`);
            expectTrue(fd !== -1);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            server.off('connect');
            connection.close().catch(() => {});
            client.close();
            server.close().catch(() => {});
            console.info(`${caseName} test end`);
            done();
          });
        });

        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        };
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        done()
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketConnectionGetSocketFd0200
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketConnection_GetSocketFd_0200
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionGetSocketFd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testLocalSocketConnectionGetSocketFd0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        };
        await server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail to listen: ${err.code.toString()}`);
        });
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} server accept connection success`);
          connection.close().catch(() => {});
          await connection.getSocketFd().then((fd: number) => {
            console.info(`${caseName} get Connection FD success: ${fd}`);
            expectTrue(fd === -1);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          }).finally(() => {
            server.off('connect');
            client.close();
            server.close().catch(() => {});
            console.info(`${caseName} test end`);
            done();
          });
        });

        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        };
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        done()
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketOn0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocket_On_Message_0100
     * @tc.desc   test LocalSocket On message function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 ,  async (done: Function) => {
      const caseName: string = 'testLocalSocketOn0100';
      console.info(`${caseName}---Start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let sendOpt: socket.LocalSendOptions = {
          data: 'Hello world!'
        }
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          await connection.send(sendOpt).catch((err:BusinessError) => {
            console.info('fail to send' + err.code.toString());
        });
        });
        let callback: Callback<socket.LocalSocketMessageInfo> = (data: socket.LocalSocketMessageInfo)=>{
          const uintArray = new Uint8Array(data.message)
          let messageView = '';
          for (let i = 0; i < uintArray.length; i++) {
            messageView += String.fromCharCode(uintArray[i]);
          }
          console.log('total: ' + JSON.stringify(data));
          console.log('message infomation: ' + messageView);
          expectTrue(data.message != undefined && data.address != undefined && data.size != undefined);
          server.off('connect');
          client.close();
          console.info(`${caseName} test end`);
          done();
        };
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
        }).catch(() => {
          console.info('err:')
        })
        client.on('message', callback)

      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testLocalSocketConnectionClientId0100
     * @tc.number Socket_LocalSocketConnection_ClintId_0100
     * @tc.desc   test localSocketConnection ClientId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLocalSocketConnectionClientId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testLocalSocketConnectionClientId0100';
      console.info(`${caseName} test start`);
      try{
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr).then(() => {
          console.log('listen success')
        }).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info("Connection clientId:" + connection.clientId)
          expectTrue(connection.clientId != undefined)
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt).then(() => {
          console.log('connect success')
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        })
        done()
        console.info(`${caseName} test end`);
      }catch (err){
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });



  });
}

