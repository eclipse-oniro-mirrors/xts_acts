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
import { describe, it, expect } from '@ohos/hypium';
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';
import { ArrayBufferToString } from './utils/index';

function expectSuccess(): void {
  expect(true).assertTrue();
}

function sleep(ms: number) {
    return new Promise<void>(resolve => setTimeout(resolve, ms));
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    console.info('JSON.stringify(exp),JSON.stringify(assert)' + JSON.stringify(exp), JSON.stringify(assert))
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

export default function TCPSocketTest() {
  describe('ActsTCPSocketTest', () => {

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_ConstructTCPSocketInstance_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100
     * @tc.desc  : Create a TCP Socket object
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100';
      console.info(`${caseName} test start `);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        console.info(`${caseName} success`);
        expect(tcp).assertInstanceOf('Object');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0100
     * @tc.desc  : Bind IP address and port,Only fill in IPV4 address;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 1
     */
    it('testNetworkMgrSocketTCPSocketBind0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0300
     * @tc.desc  : Bind IP address and port,the address and protocol are both IPV6;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 1
     */
    it('testNetworkMgrSocketTCPSocketBind0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===2301022);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0500
     * @tc.desc  : Bind IP address and port,bad address;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0500';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '100.0.0.0',
          port: 4444,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0600
     * @tc.desc  : Bind IP address and port,Port is boundary -1;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0600';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0700
     * @tc.desc  : Bind IP address and port,port is boundary 0;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0700';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0800
     * @tc.desc  : Bind IP address and port,Port is boundary 65535;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0800';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0900
     * @tc.desc  : Bind IP address and port,Port is boundary 65536;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0900';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1000
     * @tc.desc  : Bind IP address and port, bad family;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1000';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4554,
          family: 3
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1100
     * @tc.desc  : Bind IP address and port,Input parameter is null;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1200
     * @tc.desc  : Bind IP address and port,Input parameter is undefined;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1200';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1300
     * @tc.desc  : Bind IP address and port,Only fill in IPV4 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1400
     * @tc.desc  : Bind IP address and port,Only fill in IPV6 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1400';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12'
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1500
     * @tc.desc  : Bind IP address and port,The address and protocol are both IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1500';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301022);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1600
     * @tc.desc  : Bind IP address and port,Address and protocol inversion; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1600';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 7458,
          family: 2
        };
        tcp.bind(bindAddress).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1700
     * @tc.desc  : Bind IP address and port, bad address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '100.0.0.1',
          port: 7586,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          done();
        }).finally(() => {
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1800
     * @tc.desc  : Bind IP address and port,Port number is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1800';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1900
     * @tc.desc  : Bind IP address and port,Port number is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1900';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2000
     * @tc.desc  : Bind IP address and port,Port number is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2000';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2100
     * @tc.desc  : Bind IP address and port,Port number is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2200
     * @tc.desc  : Bind IP address and port, bad family; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2200';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6335,
          family: 3
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2300
     * @tc.desc  : Bind IP address and port with null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(null).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2400
     * @tc.desc  : Bind IP address and port with undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2400';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(undefined).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
    
        /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2500
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2500
     * @tc.desc  : Bind IP address and port,Address is Domain name ; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2500';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'www.baidu.com',
          port: 80,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0100
     * @tc.desc  : Connect to the specified server IP address and port; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4001,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:listenAddress
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0200
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is null; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4002,
          family: 1
        };
        await tcp.bind(bindAddress);
        tcp.connect(null, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0300
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4003,
          family: 1
        };
        await tcp.bind(bindAddress);
        tcp.connect(undefined, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0400
     * @tc.desc  : Connect to the specified IP address and port,Set timeout and address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4004,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4004,
            family: 1
          },
          timeout:5000
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0500
     * @tc.desc  : Connect to the specified IP address and port,hour is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4005,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
          timeout:undefined
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0600
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV4 address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4006,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1'
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301115);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0700
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV6 address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4007,
          family: 2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: 'fe80::b3b:ecb5:77f:88dc%12'
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch  fail ${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0800
     * @tc.desc  : Connect to the specified IP address and port,The address and protocol  are both IPV6; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4008,
          family: 2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1000
     * @tc.desc  : Connect to the specified IP address and port,bad address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4010,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '100.0.0.0',
            port: 4010,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301022);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1100
     * @tc.desc  : Connect to the specified IP address and port,Port is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: -1,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1200
     * @tc.desc  : Connect to the specified IP address and port,Port is -0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 0,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err.code === 2301115) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectSuccess();
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1300
     * @tc.desc  : Connect to the specified IP address and port,Port is 65535; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err.code === 2301115) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectSuccess();
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1400
     * @tc.desc  : Connect to the specified IP address and port,Port is 65536; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} success`);
            expectSuccess();
          } else {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectSuccess();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1500
     * @tc.desc  : Connect to the specified IP address and port,bad family; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4015,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4015,
            family: 3
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1600
     * @tc.desc  : Connect to the specified IP address and port,Connect without binding or listening; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4016,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301115);
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1700
     * @tc.desc  : Connect to the specified server IP address and port; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4017
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4017
          },
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1800
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4018
        };
        await tcp.bind(bindAddress);
        tcp.connect(null).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1900
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1900';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4019
        };
        await tcp.bind(bindAddress);
        tcp.connect(undefined).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2000
     * @tc.desc  : Connect to the specified IP address and port,Set timeout and address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4020,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:  {
            address: '127.0.0.1',
            port: 4020,
            family:1
          },
          timeout:5000
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2100
     * @tc.desc  : Connect to the specified IP address and port,hour is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4021,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:  {
            address: '127.0.0.1',
            port: 4021
          },
          timeout:undefined
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2200
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV4 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4022,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1'
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301115);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2300
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV6 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4023,
          family:2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address:'fe80::b3b:ecb5:77f:88dc%12'
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2400
     * @tc.desc  : Connect to the specified IP address and port,The address and protocol  are both IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4024,
          family:2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2500
     * @tc.desc  : Connect to the specified IP address and port,Address and protocol inversion; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4025,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4025,
            family: 2
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2600
     * @tc.desc  : Connect to the specified IP address and port,bad address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4026,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '100.0.0.0',
            port: 4026,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301022);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2700
     * @tc.desc  : Connect to the specified IP address and port,Port is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: -1,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2800
     * @tc.desc  : Connect to the specified IP address and port,Port is -0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 0,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2900
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2900
     * @tc.desc  : Connect to the specified IP address and port,Port is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2900';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_3000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect3000
     * @tc.desc  : Connect to the specified IP address and port,Port is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect3000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect3000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_3100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect3100
     * @tc.desc  : Connect to the specified IP address and port,bad family; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect3100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect3100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4031,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4031,
            family: 3
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_3200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect3200
     * @tc.desc  : Connect to the specified IP address and port,Connect without binding or listening; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect3200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect3200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4032,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301115);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0100
     * @tc.desc  : Sending data through TCP Socket connection,To the client; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4033
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0200
     * @tc.desc  : Sending data through TCP Socket connection,To the server; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4034
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0400
     * @tc.desc  : Sending data through TCP Socket connection,Input parameter is null; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4036
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        tcp.send(null, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===401);
            done();
          } else {
            console.info(`${caseName} success`);
            expectFail();
            done();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0500
     * @tc.desc  : Sending data through TCP Socket connection,Input parameter is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4037
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        tcp.send(undefined, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===401);
          } else {
            console.info(`${caseName} success`);
            expectFail()
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0600
     * @tc.desc  : Sending data through TCP Socket connection,Send data of arraybuffer type; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4038
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: new ArrayBuffer(123)
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0700
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to empty string; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4039
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: ''
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0800
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-8; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4040
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-8'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketSend0900
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16BE; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend0900';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4041
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16BE'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1000
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16LE; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4042
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16LE'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1100
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4043
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1200
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to US-AECII; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4044
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'US-AECII'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1300
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to ISO-8859-1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4045
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'ISO-8859-1'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1400
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to GB2312; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4046
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'GB2312'
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1500
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4047
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: undefined
        };
        tcp.send(tcpSendOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1600
     * @tc.desc  : Sending data through TCP Socket connection,To the client; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4049
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1700
     * @tc.desc  : Sending data through TCP Socket connection,To the server; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4048
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:listenAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketSend1900
     * @tc.desc  : Sending data through TCP Socket connection,Input parameter is null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend1900';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4050
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:listenAddress
        };
        await tcp.connect(tcpConnectOptions);
        tcp.send(null).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2000
     * @tc.desc  : Sending data through TCP Socket connection,Input parameter is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4051
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:listenAddress
        };
        await tcp.connect(tcpConnectOptions);
        tcp.send(undefined).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2100
     * @tc.desc  : Sending data through TCP Socket connection,Send data of arraybuffer type; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2100';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4052
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: new ArrayBuffer(123)
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2200
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to empty string; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4053
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: ''
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2300
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-8; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4054
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-8'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2400
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16BE; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4055
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16BE'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2500
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2500
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16LE; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2500';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4056
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16LE'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2600
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2600
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to UTF-16; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2600';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4057
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-16'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2700
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2700
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to US-AECII; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4058
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'US-AECII'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2800
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2800
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to ISO-8859-1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4059
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'ISO-8859-1'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_2900
     * @tc.name  : testNetworkMgrSocketTCPSocketSend2900
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to GB2312; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend2900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend2900';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4060
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'GB2312'
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Send_3000
     * @tc.name  : testNetworkMgrSocketTCPSocketSend3000
     * @tc.desc  : Sending data through TCP Socket connection,Set data format to undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSend3000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSend3000';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4061
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:bindAddress
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: undefined
        };
        tcp.send(tcpSendOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0100
     * @tc.desc  : Close the TCP Socket connection,Call close before binding or listening; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.close((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===2300999);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0200
     * @tc.desc  : Close the TCP Socket connection,After bind and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4062
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.close((err: BusinessError) => {
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0300
     * @tc.desc  : Close the TCP Socket connection ,after listen and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4063,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.close((err: BusinessError) => {
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0400
     * @tc.desc  : Close the TCP Socket connection,Call close before binding or listening; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0400';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.close().then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2300999);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0500
     * @tc.desc  : Close the TCP Socket connection,after bind and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0500';
      console.info(`${caseName} test start`);
      await sleep(500);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4064
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.close().then(() => {
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Close_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketClose0600
     * @tc.desc  : Close the TCP Socket connection,after listen and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketClose0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketClose0500';
      console.info(`${caseName} test start`);
      await sleep(500);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4065,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.close().then(() => {
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0100
     * @tc.desc  : Get the Opposite Socket Address,before bind or listen; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getRemoteAddress(async (err: BusinessError, data: socket.NetAddress) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectEqual(err.code, 2301009);
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0200
     * @tc.desc  : Get the Opposite Socket Address,after bind and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4066,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getRemoteAddress(async (err: BusinessError, data: socket.NetAddress) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.address as string, '127.0.0.1');
            expectEqual(data.port as number, 4066);
            expectEqual(data.family as number, 1);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0300
     * @tc.desc  : Get the Opposite Socket Address, after listen and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4067,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getRemoteAddress(async (err: BusinessError, data: socket.NetAddress) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.address as string, '127.0.0.1');
            expectEqual(data.port as number, 4067);
            expectEqual(data.family as number, 1);
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`)
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0400
     * @tc.desc  : Get the Opposite Socket Address,before bind or listen; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0400';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getRemoteAddress().then((data: socket.NetAddress) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301009);
          done();
        }).finally(async () => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_2 fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0500
     * @tc.desc  : Get the Opposite Socket Address, after bind and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0500';
      console.info(`${caseName} test start`);
      await sleep(500);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4068,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getRemoteAddress().then((data: socket.NetAddress) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.address as string, '127.0.0.1');
          expectEqual(data.port as number, 4068);
          expectEqual(data.family as number, 1);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetRemoteAddress_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketGetRemoteAddress0600
     * @tc.desc  : Get the Opposite Socket Address,after listen and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetRemoteAddress0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetRemoteAddress0600';
      console.info(`${caseName} test start`);
      await sleep(500);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4069,
          family:1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getRemoteAddress().then((data: socket.NetAddress) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.address as string, '127.0.0.1');
          expectEqual(data.port as number, 4069);
          expectEqual(data.family as number, 1);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0100
     * @tc.desc  : Get TCPSocket status,before bind or listen; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound as boolean, false);
            expectEqual(data.isClose as boolean, false);
            expectEqual(data.isConnected as boolean, false);
          }
          console.info(`${caseName} test end`);
          tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0200
     * @tc.desc  : Get TCPSocket status,after bind; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4070
        };
        await tcp.bind(bindAddress);
        tcp.getState(async (err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound as boolean, true);
            expectEqual(data.isClose as boolean, false);
            expectEqual(data.isConnected as boolean, false);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0300
     * @tc.desc  : Get TCPSocket status,after bind and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4071
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getState(async (err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound as boolean, true);
            expectEqual(data.isClose as boolean, false);
            expectEqual(data.isConnected as boolean, true);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0400
     * @tc.desc  : Get TCPSocket status,after listen and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4072,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getState(async (err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectEqual(data.isBound as boolean, true);
            expectEqual(data.isClose as boolean, false);
            expectEqual(data.isConnected as boolean, true);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0500
     * @tc.desc  : Get TCPSocket status,before bind or listen; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound as boolean, false);
          expectEqual(data.isClose as boolean, false);
          expectEqual(data.isConnected as boolean, false);
          tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0600
     * @tc.desc  : Get TCPSocket status; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0600'
      console.info(`${caseName} test start`);
      await sleep(500);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4073
        };
        await tcp.bind(bindAddress);
        await tcp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound as boolean, true);
          expectEqual(data.isClose as boolean, false);
          expectEqual(data.isConnected as boolean, false);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} Fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0700
     * @tc.desc  : Get TCPSocket status; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0700';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4074
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound as boolean, true);
          expectEqual(data.isClose as boolean, false);
          expectEqual(data.isConnected as boolean, true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} Fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetState_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketGetState0800
     * @tc.desc  : Get TCPSocket status; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetState0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetState0800';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4075,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectEqual(data.isBound as boolean, true);
          expectEqual(data.isClose as boolean, false);
          expectEqual(data.isConnected as boolean, true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} Fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0100
     * @tc.desc  : Get TCPSocket status,before bind or listen; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getSocketFd((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success: ${JSON.stringify(data)}`);
            expectTrue(data === undefined);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0200
     * @tc.desc  : Get TCPSocket status,after bind; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0200';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4076
        };
        await tcp.bind(bindAddress);
        tcp.getSocketFd(async (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0300
     * @tc.desc  : Get TCPSocket status,after bind and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0300';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4077
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getSocketFd(async (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0400
     * @tc.desc  : Get TCPSocket status,after listen and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0400';
      try {
        console.info(`${caseName} test start`);
        await sleep(500);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4078,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getSocketFd(async (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success data:${JSON.stringify(data)}`);
            expectTrue(data !== undefined);
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0500
     * @tc.desc  : Get TCPSocket status, before bind or listen; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.getSocketFd().then((data: number) => {
          console.info(`${caseName} fail data:${JSON.stringify(data)}`);
          expectTrue(data === undefined);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0600
     * @tc.desc  : Get TCPSocket status,after bind; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4079
        };
        await tcp.bind(bindAddress);
        tcp.getSocketFd().then((data: number) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectTrue(data !== undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0700
     * @tc.desc  : Get TCPSocket status,after bind and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4080
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getSocketFd().then((data: number) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectTrue(data !== undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_GetSocketFd_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketGetSocketFd0800
     * @tc.desc  : Get TCPSocket status,after listen and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketGetSocketFd0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketGetSocketFd0800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object')
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4081,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
        tcp.getSocketFd().then((data: number) => {
          console.info(`${caseName} success data:${JSON.stringify(data)}`);
          expectTrue(data !== undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0100
     * @tc.desc  : Get TCPSocket status,after bind;  callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4082
        };
        await tcp.bind(bindAddress);
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
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0200
     * @tc.desc  : Get TCPSocket status,after bind and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4083
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
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
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0300
     * @tc.desc  : Get TCPSocket status,after listen and connect; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4084,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
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
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0400
     * @tc.desc  : Get TCPSocket status,Input parameter is null; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4085
        };
        await tcp.bind(bindAddress);
        tcp.setExtraOptions(null, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail 111 err:${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0500
     * @tc.desc  : Get TCPSocket status,Input parameter is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4086
        };
        await tcp.bind(bindAddress);
        tcp.setExtraOptions(undefined, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail 111 err:${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0600
     * @tc.desc  : Get TCPSocket status,Input parameter keepAlive is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9001
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0700
     * @tc.desc  : Get TCPSocket status,Input parameter keepAlive is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9002
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0800
     * @tc.desc  : Get TCPSocket status,Input parameter OOBlnLine is false ; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9003
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions0900
     * @tc.desc  : Get TCPSocket status, Input parameter OOBlnLine is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions0900';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9004
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1000
     * @tc.desc  : Get TCPSocket status,Input parameter TCPNoDelay is false;  callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1000';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9005
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1100
     * @tc.desc  : Get TCPSocket status,Input parameter TCPNoDelay is true;  callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9006
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1200
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9007
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1300
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9008
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1400
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9009
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1500
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9010
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1600
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9011
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1700
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9012
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1800
     * @tc.desc  : Get TCPSocket status,Input parameter reuseAddress is true; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9013
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: true,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions1900
     * @tc.desc  : Get TCPSocket status,Input parameter reuseAddress is false; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions1900';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9014
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: false,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2000
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2000';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9014
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: -1,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===2301033);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2100
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9014
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 0,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2200
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is 100; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9015
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 100,
          socketLinger: {
            on: true, linger: 10
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2300
     * @tc.desc  : Get TCPSocket status,Input parameter linger is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9016
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger:-1
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2400
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9017
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger:0
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2500
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2500
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 65535; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9018
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger:65535
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2600
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2600
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 65536; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9019
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger:65536
          }
        };
        tcp.setExtraOptions(tcpExtraOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2700
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2700
     * @tc.desc  : Get TCPSocket status,after bind; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions2700';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 9004
        };
        await tcp.bind(bindAddress);
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
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2800
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2800
     * @tc.desc  : Get TCPSocket status,after bind and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2800', 0, async (done: Function) => {
      let caseName: String = 'testNetworkMgrSocketTCPSocketSetExtraOptions2800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4088
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
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
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}_1 fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_2900
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions2900
     * @tc.desc  : Get TCPSocket status,after listen and connect; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions2900', 0, async (done: Function) => {
      let caseName: String = 'testNetworkMgrSocketTCPSocketSetExtraOptions2900';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4089,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        await tcp.connect(tcpConnectOptions);
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
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3000
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3000
     * @tc.desc  : Get TCPSocket status,Input parameter is null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3000';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4090
        };
        await tcp.bind(bindAddress);
        tcp.setExtraOptions(null).then(() => {
          console.info(`${caseName} success `);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3100
     * @tc.desc  : Get TCPSocket status,Input parameter is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3100';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4091
        };
        await tcp.bind(bindAddress);
        tcp.setExtraOptions(undefined).then(() => {
          console.info(`${caseName} success `);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3200
     * @tc.desc  : Get TCPSocket status,Input parameter keepAlive is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3200';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10001
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3300
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3300
     * @tc.desc  : Get TCPSocket status,Input parameter keepAlive is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3300';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10002
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          socketLinger: {
            on: false, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3400
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3400
     * @tc.desc  : Get TCPSocket status,Input parameter OOBlnLine is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3400';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10003
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: false,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3500
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3500
     * @tc.desc  : Get TCPSocket status, Input parameter OOBlnLine is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3500';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10003
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          OOBInline: true,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3600
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3600
     * @tc.desc  : Get TCPSocket status,Input parameter TCPNoDelay is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3600';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10004
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3700
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3700
     * @tc.desc  : Get TCPSocket status,Input parameter TCPNoDelay is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3700';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10004
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          TCPNoDelay: false,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3800
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3800
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3800';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10005
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_3900
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions3900
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions3900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions3900';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10006
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4000
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4000
     * @tc.desc  : Get TCPSocket status,Input parameter receiveBufferSize is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4000';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10007
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          receiveBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4100
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4100';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10008
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: -1,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4200
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4200';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10008
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 0,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4300
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4300
     * @tc.desc  : Get TCPSocket status,Input parameter sendBufferSize is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4300';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10008
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          sendBufferSize: 100,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4400
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4400
     * @tc.desc  : Get TCPSocket status,Input parameter reuseAddress is true; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4400';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10009
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: true,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4500
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4500
     * @tc.desc  : Get TCPSocket status,Input parameter reuseAddress is false; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4500';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10010
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          reuseAddress: false,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4600
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4600
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4600';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10011
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: -1,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301033);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4700
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4700
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4700';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10012
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 0,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4800
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4800
     * @tc.desc  : Get TCPSocket status,Input parameter socketTimeout is 100; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4800';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10013
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketTimeout: 100,
          socketLinger: {
            on: true, linger: 10
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_4900
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions4900
     * @tc.desc  : Get TCPSocket status,Input parameter linger is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions4900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions4900';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10014
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: -1
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5000
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions5000
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions5000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions5000';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10015
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 0
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5100
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions5100
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions5100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions5100';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10017
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65535
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_SetExtraOptions_5200
     * @tc.name  : testNetworkMgrSocketTCPSocketSetExtraOptions5200
     * @tc.desc  : Get TCPSocket status,Input parameter linger is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketSetExtraOptions5200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketSetExtraOptions5200';
      console.info(`${caseName} test start`);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object')
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 10018
        };
        await tcp.bind(bindAddress);
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: {
            on: true, linger: 65536
          },
        };
        tcp.setExtraOptions(tcpExtraOptions).then(() => {
          console.info(`${caseName} success `);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnMessage_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOnMessage0100
     * @tc.desc  : Subscription to receive message events for TCPSocket connections,after bind and connect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnMessage0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnMessage0100';
       try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4092
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        let clientSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-8'
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          await client.send(clientSendOptions);
        });
        await tcp.connect(tcpConnectOptions);
        class SocketInfo {
          message: ArrayBuffer = new ArrayBuffer(1);
          remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
        };
        const callback: Callback<socket.SocketMessageInfo> = async (value: SocketInfo) => {
          console.info(`${caseName} value:${ArrayBufferToString(value.message)}`);
          expectTrue(ArrayBufferToString(value.message) === 'Hello, server!');
          tcpServer.off('connect');
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('message', callback);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnMessage_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketOnMessage0200
     * @tc.desc  : Subscription to receive message events for TCPSocket connections,after listen and connect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnMessage0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnMessage0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4093
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        let clientSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!',
          encoding: 'UTF-8'
        };
        tcpServer.on('connect', async (client: socket.TCPSocketConnection) => {
          await client.send(clientSendOptions);
        });
        await tcp.connect(tcpConnectOptions);
        class SocketInfo {
          message: ArrayBuffer = new ArrayBuffer(1);
          remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
        };
        const callback: Callback<socket.SocketMessageInfo> = async (value: SocketInfo) => {
          console.info(`${caseName} value:${ArrayBufferToString(value.message)}`);
          expectTrue(ArrayBufferToString(value.message) === 'Hello, server!');
          tcpServer.off('connect');
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('message', callback);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffMessage_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOffMessage0100
     * @tc.desc  : Unsubscribe from receiving message events for TCPSocket connections,After a subscription
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffMessage0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffMessage0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4094
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, client!',
          encoding: 'UTF-8'
        };
        const callback: Callback<socket.SocketMessageInfo> = () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('message', callback);
        tcp.off('message', callback);
        await tcp.send(tcpSendOptions);
        await tcp.close();
        expectSuccess();
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffMessage_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketOffMessage0200
     * @tc.desc  : Unsubscribe from receiving message events for TCPSocket connections,After Subscribing multiple times
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffMessage0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffMessage0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4095
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        await tcp.connect(tcpConnectOptions);
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, client!',
          encoding: 'UTF-8'
        };
        const callback1: Callback<socket.SocketMessageInfo> = () => {
          expectFail();
          console.info(`${caseName} callback1 test end`);
          done();
        };
        const callback2: Callback<socket.SocketMessageInfo> = () => {
          expectFail();
          console.info(`${caseName} callback2 test end`);
          done();
        };
        tcp.on('message', callback1);
        tcp.on('message', callback2);
        tcp.off('message');
        await tcp.send(tcpSendOptions);
        expectSuccess();
        await tcp.close();
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnConnect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOnConnect0100
     * @tc.desc  : Subscription to connection events for TCPSocket after bind
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnConnect0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4096
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        const callback: Callback<void> = async () => {
          expectSuccess();
          console.info(`${caseName} test end`);
          await tcp.close();
          done();
        };
        tcp.on('connect', callback);
        await tcp.connect(tcpConnectOptions);
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnConnect_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketOnConnect0200
     * @tc.desc  : Subscription to connection events for TCPSocket,after listen
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnConnect0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnConnect0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4097
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
        };
        const callback: Callback<void> = async () => {
          console.info(`${caseName} test end`);
          await tcp.close();
          expectSuccess();
          done();
        };
        tcp.on('connect', callback);
        await tcp.connect(tcpConnectOptions);
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffConnect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOffConnect0100
     * @tc.desc  : Unsubscribe from TCP Socket connection events,After a subscription
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffConnect0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4098
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        const callback: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('connect', callback);
        tcp.off('connect', callback);
        await tcp.connect(tcpConnectOptions);
        expectSuccess();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffConnect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOffConnect0100
     * @tc.desc  :  Unsubscribe from TCP Socket connection events,After Subscribing multiple times
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffConnect0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffConnect0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4099
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
        };
        const callback1: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        const callback2: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('connect', callback1);
        tcp.on('connect', callback2);
        tcp.off('connect');
        await tcp.connect(tcpConnectOptions);
        expectSuccess();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnClose_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOnClose0100
     * @tc.desc  : Subscribe to the closure event of TCPSocket, after bind
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4100
        };
        await tcp.bind(bindAddress);
        const callback: Callback<void> = async () => {
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('close', callback);
        await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OnClose_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketOnClose0200
     * @tc.desc  : Subscribe to the closure event of TCPSocket,after listen
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOnClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOnClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4101
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: listenAddress,
          timeout: 6000
        };
        await tcp.connect(tcpConnectOptions);
        const callback: Callback<void> =  () => {
          expectSuccess();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('close', callback);
        await tcp.close();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffClose_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketOffClose0100
     * @tc.desc  : Unsubscribe from the closing event of TCPSocket,After a subscription
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffClose0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4102
        };
        await tcp.bind(bindAddress);
        const callback: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('close', callback);
        tcp.off('close', callback);
        await tcp.close();
        expectSuccess();
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
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_OffClose_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketOffClose0200
     * @tc.desc  : Unsubscribe from the closing event of TCPSocket,After Subscribing multiple times
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketOffClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketOffClose0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4103
        };
        await tcp.bind(bindAddress);
        const callback1: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        const callback2: Callback<void> = async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        tcp.on('close', callback1);
        tcp.on('close', callback2);
        tcp.off('close');
        await tcp.close();
        expectSuccess();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });


  })
}
