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
import { describe, it, expect } from '@ohos/hypium'
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

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0100
     * @tc.desc  : Sending data through TCP Socket Connection connection,Sending data as a string;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8000,
          family: 1
        };
        await tcpServer.listen(listenAddress)
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        tcpServer.on('connect', (client: socket.TCPSocketConnection) => {
          let tcpSendOption: socket.TCPSendOptions = {
            data: 'Hello, client!'
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0200
     * @tc.desc  : Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8003,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0300
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is an empty string; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8004,
          family: 1
        };
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0400
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-8; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8005,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0500
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8006,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0600
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8008,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0700
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8009,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0800
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is US-AECII; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8010,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend0900
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend0900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8099,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1000
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is GB2312; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8011,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1100
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8012,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1200
     * @tc.desc  : Sending data through TCP Socket Connection connection,Sending data as a string; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8013,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1300
     * @tc.desc  : Sending data through TCP Socket Connection connection,input parameter type is arrayBuffer; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8016,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1400
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is an empty string; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8017,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1500
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-8; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8018,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1600
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16BE; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8019,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1700
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16LE; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8021,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1800
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is UTF-16; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8022,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend1900
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is US-AECII;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend1900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8023,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend2000
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is ISO-8859-1;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9023,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend2100
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is GB2312; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8024,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Send_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionSend2200
     * @tc.desc  : Sending data through TCP Socket Connection connection,Encoding format is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionSend2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionSend2200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8025,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionClose0100
     * @tc.desc  : Close a connection established with TCP Socket; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8026,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_Close_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionClose0200
     * @tc.desc  : Close a connection established with TCP Socket; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8027,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100
     * @tc.desc  : Get the Opposite Socket Address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8028,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_GetRemoteAddress_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200
     * @tc.desc  : Get the Opposite Socket Address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionGetRemoteAddress0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8029,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionOffMessage0100
     * @tc.desc  : UnSubscription to receive message events for TCPSocketConnection connections
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8031,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
          await tcp.send(clientSendOptions);
          await client.close();
          expectSuccess();
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_OffMessage_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionOffMessage0200
     * @tc.desc  : Cancel multiple subscriptions to receive message events for TCP Socket Connection connections
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffMessage0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffMessage0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8032,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
          await tcp.send(clientSendOptions);
          await client.close();
          expectSuccess();
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_OnClose_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionOnClose0100
     * @tc.desc  : Subscription to the closure event of TCPSocketConnection
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOnClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOnClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8033,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
          await client.close();
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnectionOffClose0100
     * @tc.desc  : UnSubscription to the closure event of TCPSocketConnection
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8034,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
          await client.close();
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
      * @tc.number: SUB_NetworkMgr_Socket_TCPSocketConnection_OffClose_0200
      * @tc.name  : testNetworkMgrSocketTCPSocketConnectionOffClose0200
      * @tc.desc  : Cancel multiple subscriptions to the TCP Socket Connection shutdown event
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 2
      */
    it('testNetworkMgrSocketTCPSocketConnectionOffClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnectionOffClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8035,
          family: 1
        };
        await tcpServer.listen(listenAddress);
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
          await client.close();
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        });
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}