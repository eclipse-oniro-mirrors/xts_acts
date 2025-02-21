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


function expectSuccess(): void {
  try {
    expect(true).assertTrue();
  } catch (err) {
    console.info(`${err} test failed`);
  }

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


export default function TCPSocketServerTest() {
  describe('ActsTCPSocketServerTest', () => {

    /* *
    * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_ConstructTCPSocketServerInstance_0100
    * @tc.name  : testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance0100
    * @tc.desc  : Create a TCP Socket Server object; callback
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 2
    */
    it('testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerConstructTCPSocketServerInstance0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        console.info('testConstructTCPSocketInstance0100 success');
        expect(tcpServer).assertInstanceOf('Object');
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
    * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0100
    * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0100
    * @tc.desc  : Bind IP address and port,Only fill in the address for IPV4; callback
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 2
    */
    it('testNetworkMgrSocketTCPSocketServerListen0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectSuccess();
            console.info(`${caseName} success`);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0300
     * @tc.desc  : Bind IP address and port,The address and protocol are both IPV6; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===2303122);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0500
     * @tc.desc  : Bind IP address and port, bad address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '100.0.0.1',
          port: 5001,
          family: 1
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectEqual(err.code, 2303199);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0600
     * @tc.desc  : Bind IP address and port,Port number is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0700
     * @tc.desc  : Bind IP address and port,Port number is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0800
     * @tc.desc  : Bind IP address and port,Port number is 65535; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen0900
     * @tc.desc  : Bind IP address and port,Port number is 65536; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen0900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1000
     * @tc.desc  : Bind IP address and port,bad family; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5002,
          family: 4
        };
        tcpServer.listen(listenAddress, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1100
     * @tc.desc  : Bind IP address and port, pass in null parameters; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.listen(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${err}`);
            expectTrue(err.code == 401)
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1200
     * @tc.desc  : Bind IP address and port, pass in undefined parameters; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.listen(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${err}`);
            expectTrue(err.code == 401)
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code == 401)
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1300
     * @tc.desc  : Bind IP address and port,Only fill in the address for IPV4; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1400
     * @tc.desc  : Bind IP address and port,Only fill in the address for IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12'
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1500
     * @tc.desc  : Bind IP address and port,The address and protocol are both IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2303122);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1600
     * @tc.desc  : Bind IP address and port,Address and protocol inversion; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5003,
          family: 2
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1700
     * @tc.desc  : Bind IP address and port, bad address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '100.0.0.1',
          port: 65535,
          family: 1
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} fail`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectEqual(err.code, 2303199);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1800
     * @tc.desc  : Bind IP address and port,Port number is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen1900
     * @tc.desc  : Bind IP address and port,Port number is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen1900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen2000
     * @tc.desc  : Bind IP address and port,Port number is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen2000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen2100
     * @tc.desc  : Bind IP address and port,Port number is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen2100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen2200
     * @tc.desc  : Bind IP address and port,bad family; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen2200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5010,
          family: 4
        };
        tcpServer.listen(listenAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`)
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        })
      } catch (err) {
        console.info(`${caseName} fail err:${JSON.stringify(err)}`)
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen2300
     * @tc.desc  : Bind IP address and port, pass in null parameters; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen2300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.listen(null).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code==401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Listen_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerListen2400
     * @tc.desc  : Bind IP address and port, pass in undefined parameters; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerListen2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerListen2400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.listen(undefined).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code==401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerGetState0100
     * @tc.desc  : Obtain TCPSocketService status without listening; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState0100'
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound, false);
            expectEqual(data.isClose, false);
            expectEqual(data.isConnected, false);
            done();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerGetState0300
     * @tc.desc  : Obtain the TCP Socket Server status after connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState0300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5013,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
          timeout: 2000
        };
        await tcp.connect(tcpConnectOptions);
        tcpServer.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
            done();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound, true);
            expectEqual(data.isClose, false);
            expectEqual(data.isConnected, true);
            done();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerGetState0400
     * @tc.desc  : Obtain TCPSocketService status without listening; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState0400'
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        tcpServer.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound, false);
          expectEqual(data.isClose, false);
          expectEqual(data.isConnected, false);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerGetState0500
     * @tc.desc  : Obtain the TCP Socket Server status after listening; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState0500'
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5014,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        tcpServer.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound, true);
          expectEqual(data.isClose, false);
          expectEqual(data.isConnected, true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_GetState_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerGetState0600
     * @tc.desc  : Obtain the TCP Socket Server status after connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerGetState0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerGetState0600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5015,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
          timeout: 2000
        };
        await tcp.connect(tcpConnectOptions);
        tcpServer.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound, true);
          expectEqual(data.isClose, false);
          expectEqual(data.isConnected, true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0100
     * @tc.desc  : Set other properties of the TCP Socket Server connection,before listen; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2303109);
            done();
          } else {
            console.info(`${caseName} success`);
            expectFail();
            done();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0200
     * @tc.desc  : Set other properties of the TCP Socket Server connection after listening; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5016,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0300
     * @tc.desc  : Set other properties of TCPSocketService connection in listen, input parameters are null;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5017,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        tcpServer.setExtraOptions(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code==401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0400
     * @tc.desc  : Set other properties of TCPSocketService connection in listen,input parameters are undefined;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5018,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        tcpServer.setExtraOptions(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code==401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0500
     * @tc.desc  : Set other properties of the TCP Socket Server connection,keepAlive is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11001,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0600
     * @tc.desc  : Set other properties of the TCP Socket Server connection,keepAlive is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11002,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0700
     * @tc.desc  : Set other properties of the TCP Socket Server connection,OOBlnLine is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11003,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: true,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0800
     * @tc.desc  : Set other properties of the TCP Socket Server connection,OOBlnLine is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11004,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions0900
     * @tc.desc  : Set other properties of the TCP Socket Server connection,TCPNoDelay is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions0900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11005,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1000
     * @tc.desc  : Set other properties of the TCP Socket Server connection,TCPNoDelay is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11006,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1100
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11007,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1200
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11008,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1300
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11009,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1400
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11010,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1500
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11011,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1600
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11012,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1700
     * @tc.desc  : Set other properties of the TCP Socket Server connection,reuseAddress is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11013,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: true,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1800
     * @tc.desc  : Set other properties of the TCP Socket Server connection,reuseAddress is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11014,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: false,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions1900
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions1900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11014,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: -1,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2000
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11015,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout:0,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2100
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11016,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout:100,
          socketLinger: {
            on: true, linger: 10
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2200
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11017,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: -1
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2300
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11018,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 0
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2400
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 65535; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11019,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65535
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2500
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 65536; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 11020,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65536
          }
        }
        tcpServer.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2600
     * @tc.desc  : Set other properties of the TCP Socket Server connection,before listen; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code===2303109);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2700
     * @tc.desc  : Set other properties of the TCP Socket Server connection after listening; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5019,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2800
     * @tc.desc  : Set other properties of TCPSocketService connection in listen, input parameters are null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 2020,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        tcpServer.setExtraOptions(null).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code==401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_2900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions2900
     * @tc.desc  : Set other properties of TCPSocketService connection in listen,input parameters are undefined;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions2900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions2900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5021,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        tcpServer.setExtraOptions(undefined).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code==401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectTrue(err.code==401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3000
     * @tc.desc  : Set other properties of the TCP Socket Server connection,keepAlive is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10101,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3100
     * @tc.desc  : Set other properties of the TCP Socket Server connection,keepAlive is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10102,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3200
     * @tc.desc  : Set other properties of the TCP Socket Server connection,OOBlnLine is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10103,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3300
     * @tc.desc  : Set other properties of the TCP Socket Server connection,OOBlnLine is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10104,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3400
     * @tc.desc  : Set other properties of the TCP Socket Server connection,TCPNoDelay is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10105,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3500
     * @tc.desc  : Set other properties of the TCP Socket Server connection,TCPNoDelay is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10106,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3600
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10107,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3700
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10108,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3800
     * @tc.desc  : Set other properties of the TCP Socket Server connection,receiveBufferSize is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10109,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_3900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions3900
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions3900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions3900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10110,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4000
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10111,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4100
     * @tc.desc  : Set other properties of the TCP Socket Server connection,sendBufferSize is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4100';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10112,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4200
     * @tc.desc  : Set other properties of the TCP Socket Server connection,reuseAddress is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4200';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10113,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4300
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4300
     * @tc.desc  : Set other properties of the TCP Socket Server connection,reuseAddress is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4300';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10114,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4400
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4400
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4400';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10115,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4500
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4500
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4500';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10116,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4600
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4600
     * @tc.desc  : Set other properties of the TCP Socket Server connection,socketTimeout is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4600';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10117,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4700
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4700
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4700';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10118,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: -1
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4800
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4800
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4800';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10119,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 0
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_4900
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions4900
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions4900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions4900';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10120,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65535
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_SetExtraOptions_5000
     * @tc.name  : testNetworkMgrSocketTCPSocketServerSetExtraOptions5000
     * @tc.desc  : Set other properties of the TCP Socket Server connection,linger is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerSetExtraOptions5000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerSetExtraOptions5000';
      try {
        console.info(`${caseName} test start`);
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10121,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65536
          }
        };
        tcpServer.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_OnConnect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerOnConnect0100
     * @tc.desc  : Subscription to TCP Socket Server connection events;
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerOnConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerOnConnect0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5022,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let callback: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection)=>{
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectTrue(data.clientId!==null);
          console.info(`${caseName} test end`);
          done();
        };
        tcpServer.on('connect',callback);
        let tcpConnectOptions:socket.TCPConnectOptions={
        address:listenAddress
        };
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_OffConnect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerOffConnect0100
     * @tc.desc  : Unsubscribe from TCP Socket Server connection events;
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerOffConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerOffConnect0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5023,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let callback: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection)=>{
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }
        tcpServer.on('connect',callback);
        let tcpConnectOptions:socket.TCPConnectOptions={
          address:listenAddress
        };
        tcpServer.off('connect');
        await tcp.connect(tcpConnectOptions);
        expectSuccess();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_OffConnect_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketServerOffConnect0200
     * @tc.desc  : Unsubscribe from all connection events of TCP Socket Server;
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketServerOffConnect0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerOffConnect0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 5024,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let callback1: Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection)=>{
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        let callback2 : Callback<socket.TCPSocketConnection> = (data: socket.TCPSocketConnection)=>{
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcpServer.on('connect',callback1);
        tcpServer.on('connect',callback2);
        let tcpConnectOptions:socket.TCPConnectOptions={
          address:listenAddress
        };
        tcpServer.off('connect');
        await tcp.connect(tcpConnectOptions);
        expectSuccess();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}
