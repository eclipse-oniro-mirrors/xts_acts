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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium'
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';
import { ArrayBufferToString } from './utils';


function expectSuccess(): void {
  expect(true).assertTrue();
}


function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
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


export default function TCPSocketConnectionTest() {
  describe('ActsTCPSocketConnectionTest', () => {

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0100
     * @tc.desc   Sending data through TCP Socket Connection connection,Sending data as a string;callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14000,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!'
          };
          client.on('error',(err:BusinessError) => {
            console.error("on error,err:" + JSON.stringify(err));
          });
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            client.off('error',(err:BusinessError) => {
              console.error("off error,err:" + JSON.stringify(err));
            });
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0200
     * @tc.desc   Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer;callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14001,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: new ArrayBuffer(234)
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0300
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is an empty string; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14002,
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: ''
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0400
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-8; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14003,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-8'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0500
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14004,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16BE'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0600
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14005,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16LE'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0700
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14006,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0800
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is US-AECII; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14007,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'US-AECII'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend0900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0900
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14008,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'ISO-8859-1'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1000
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is GB2312; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14009,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'GB2312'
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1100
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is undefined; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14010,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: undefined
          };
          client.send(tcpSendOption, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1200
     * @tc.desc   Sending data through TCP Socket Connection connection,Sending data as a string; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14011,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1300
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1300
     * @tc.desc   Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14012,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: new ArrayBuffer(234)
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1400
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1400
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is an empty string; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14013,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: ''
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1500
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1500
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-8; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14014,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-8'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1600
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1600
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14015,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16BE'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1700
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1700
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14016,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16LE'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1800
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1800
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is UTF-16; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14017,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'UTF-16'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend1900
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1900
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is US-AECII;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14018,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'US-AECII'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend2000
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2000
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14019,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'US-AECII'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend2100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2100
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is GB2312; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14020,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: 'GB2312'
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionSend2200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2200
     * @tc.desc   Sending data through TCP Socket Connection connection,Encoding format is undefined; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14021,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!',
            encoding: undefined
          };
          client.send(tcpSendOption).then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionClose0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0100
     * @tc.desc   Close a connection established with TCP Socket; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14022,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          client.close((err: BusinessError) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionClose0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0200
     * @tc.desc   Close a connection established with TCP Socket; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14023,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          client.close().then(() => {
            console.info(`${caseName} success`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0100
     * @tc.desc   Get the Opposite Socket Address; callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14024,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          client.getRemoteAddress((err: BusinessError, data: socket.NetAddress) => {
            if (err) {
              console.info(`${caseName} fail err:${JSON.stringify(err)}`);
              expectFail();
              done();
            } else {
              console.info(`${caseName} success data:${JSON.stringify(data)}`);
              expectSuccess();
              done();
            };
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0200
     * @tc.desc   Get the Opposite Socket Address; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14025,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          client.getRemoteAddress().then((data: socket.NetAddress) => {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectSuccess();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetSocketFd_0100
     * @tc.desc   Get TCPSocketConnection FD; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetSocketFd0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14050,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err: BusinessError) => {
          console.info('fail to listen' + err.code.toString());
        });
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          await client.getSocketFd().then((fd: number) => {
            console.info(`${caseName} success fd:${fd}`);
            expectTrue(fd !== -1);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcp.connect(tcpConnectOptions).catch((err: BusinessError) => {
          console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionGetSocketFd0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_GetSocketFd_0200
     * @tc.desc   Get TCPSocketConnection FD; promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetSocketFd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetSocketFd0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14051,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err: BusinessError) => {
          console.info('fail to listen' + err.code.toString());
        });
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          await client.close().catch(() => {});
          await client.getSocketFd().then((fd: number) => {
            console.info(`${caseName} success fd:${fd}`);
            expectTrue(fd === -1);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          }).finally(() => {
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          });
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcp.connect(tcpConnectOptions).catch((err: BusinessError) => {
          console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffMessage0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0100
     * @tc.desc   UnSubscription to receive message events for TCPSocketConnection connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14026,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          let clientSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          const callback: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            console.info(`${caseName} test end`);
            done();
          };
          client.on('message', callback);
          client.off('message', callback);
          await tcp.send(clientSendOptions).catch((err:BusinessError) => {
            console.info('fail to send' + err.code.toString());
        });
          await client.close().catch((err:BusinessError) => {
            console.info('fail to close' + err.code.toString());
        });
          expectSuccess();
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffMessage0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0200
     * @tc.desc   Cancel multiple subscriptions to receive message events for TCP Socket Connection connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14027,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          let clientSendOptions: socket.TCPSendOptions = {
            data: 'Hello, server!'
          };
          const callback1: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            console.info(`${caseName} test end`);
            done();
          };
          const callback2: Callback<socket.SocketMessageInfo> = () => {
            expectFail();
            console.info(`${caseName} test end`);
            done();
          };
          client.on('message', callback1);
          client.on('message', callback2);
          client.off('message');
          await tcp.send(clientSendOptions).catch((err:BusinessError) => {
            console.info('fail to send' + err.code.toString());
        });
          await client.close().catch((err:BusinessError) => {
            console.info('fail to close' + err.code.toString());
        });
          expectSuccess();
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOnClose0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OnClose_0100
     * @tc.desc   Subscription to the closure event of TCPSocketConnection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOnClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOnClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14028,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          const callback: Callback<void> = () => {
            expectSuccess();
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          };
          client.on('close', callback);
          await client.close().catch((err:BusinessError) => {
            console.info('fail to close' + err.code.toString());
        });
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffClose0100
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0100
     * @tc.desc   UnSubscription to the closure event of TCPSocketConnection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14029,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          const callback: Callback<void> = () => {
            expectFail();
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          };
          client.on('close', callback);
          client.off('close', callback);
          await client.close().catch((err:BusinessError) => {
            console.info('fail to close' + err.code.toString());
        });
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTCPSocketConnectionOffClose0200
     * @tc.number SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0200
     * @tc.desc   Cancel multiple subscriptions to the TCP Socket Connection shutdown event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 14030,
          family: 1
        };
        await tcpServer.listen(listenAddress).catch((err:BusinessError) => {
            console.info('fail to listen' + err.code.toString());
        });
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          const callback1: Callback<void> = () => {
            expectFail();
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          };
          const callback2: Callback<void> = () => {
            expectFail();
            tcpServer.off('connect');
            console.info(`${caseName} test end`);
            done();
          };
          client.on('close', callback1);
          client.on('close', callback2);
          client.off('close');
          await client.close().catch((err:BusinessError) => {
            console.info('fail to close' + err.code.toString());
        });
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions).catch((err:BusinessError) => {
            console.info('fail to connect' + err.code.toString());
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}