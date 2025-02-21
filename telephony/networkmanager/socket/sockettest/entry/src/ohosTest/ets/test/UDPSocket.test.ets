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

import { describe, it } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import {
  expectFail,
  expectEqual,
  expectTrue,
  expectFalse,
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';

let UDPAddr1: socket.NetAddress = {
  address: '127.0.0.1',
  port: 0,
  family: 1
};

let UDPAddr2: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8080,
  family: 1
};

export default function UDPSocketTest() {
  describe('UDPSocketTest', () => {

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_ConstructUDPSocketInstance_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketConstructUDPSocketInstance0100
     * @tc.desc  :  Create a UDPSocket object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketConstructUDPSocketInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketConstructUDPSocketInstance0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        console.info(`${caseName} ${JSON.stringify(udp)}`);
        expectTrue(udp != null);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(UDPAddr1, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          }
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0200
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '4564646',
          port: 0,
          family: 1
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0400
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0500
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0600
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0700
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        udp.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_0900
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind0900
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind0900';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1000
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1000
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1000';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1100
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(UDPAddr1).then(() => {
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1200
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1200
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '4564646',
          port: 0,
          family: 1
        };
        udp.bind(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1300
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        udp.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1400
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        udp.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1500
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        udp.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1600
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        udp.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1700
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        udp.bind(addr).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1800
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1800
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1800';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 1
        };
        udp.bind(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_1900
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind1900
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind1900';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(null).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Bind_2000
     * @tc.name  :  testNetworkMgrSocketUDPSocketBind2000
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketUDPSocketBind2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketBind2000';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.bind(undefined).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0100
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0200
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0500
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0500
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '4564646',
            port: 0,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301022);
          } else {
            expectFail();
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0700
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0700
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: -1,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0800
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0800
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0800';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_0900
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend0900
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend0900';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 0,
            family: 3
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectTrue(true, caseName);
          } else {
            expectTrue(false, caseName);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(true, caseName);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1200
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1200
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.send(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1300
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1300
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.send(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1500
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1500
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1600
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1600
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1700
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1700
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: '',
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1800
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1800
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1800';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: new ArrayBuffer(0),
          address: UDPAddr2
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_1900
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend1900
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend1900';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '4564646',
            port: 0,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2100
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2100
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: -1,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2200
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2200
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 6565656,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2300
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2300
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 0,
            family: 3
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2500
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2500
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '::1',
            port: 0,
            family: 1
          }
        };
        await udp.bind(UDPAddr1);
        udp.send(sendOptions).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2600
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2600
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.send(null).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Send_2700
     * @tc.name  :  testNetworkMgrSocketUDPSocketSend2700
     * @tc.desc  :  Sending data through UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSend2700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSend2700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.send(undefined).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Close_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketClose0100
     * @tc.desc  :  Close UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketClose0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.close((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Close_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketClose0200
     * @tc.desc  :  Close UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketClose0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2300999);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Close_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketClose0300
     * @tc.desc  :  Close UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketClose0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketClose0300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.close().then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Close_0400
     * @tc.name  :  testNetworkMgrSocketUDPSocketClose0400
     * @tc.desc  :  Close UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketClose0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketClose0400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close().then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2300999);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0100
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
            udp.close();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectTrue(data.isBound);
            expectFalse(data.isClose);
            expectFalse(data.isConnected);
            udp.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0200
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        await udp.close();
        udp.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data.isBound);
            expectTrue(data.isClose);
            expectFalse(data.isConnected);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0300
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data.isBound);
            expectFalse(data.isClose);
            expectFalse(data.isConnected);
            udp.close();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0400
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0400
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectTrue(data.isBound);
          expectFalse(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0500
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0500
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        await udp.close();
        udp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectFalse(data.isBound);
          expectTrue(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_GetState_0600
     * @tc.name  :  testNetworkMgrSocketUDPSocketGetState0600
     * @tc.desc  :  Get UDPSocket status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketGetState0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketGetState0600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectFalse(data.isBound);
          expectFalse(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0100
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 6000,
          broadcast: true
        }
        udp.setExtraOptions(udpextraoptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0200
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          sendBufferSize: 100,
        }
        udp.setExtraOptions(udpextraoptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} setExtraOptions err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          udp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0300
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 0,
          sendBufferSize: 0,
          reuseAddress: true,
          socketTimeout: 0,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0400
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0400
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: true,
          socketTimeout: 0,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0500
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0500
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0500';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 0,
          sendBufferSize: 0,
          reuseAddress: true,
          socketTimeout: -1,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301033);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0600
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0600
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0600';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.setExtraOptions(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0700
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0700
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0700';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.setExtraOptions(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0800
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0800
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0800';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 6000,
          broadcast: true
        }
        udp.setExtraOptions(udpextraoptions).then(() => {
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_0900
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions0900
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions0900';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          sendBufferSize: 100,
        }
        udp.setExtraOptions(udpextraoptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} setExtraOptions err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1000
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions1000
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions1000';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 0,
          sendBufferSize: 0,
          reuseAddress: true,
          socketTimeout: 0,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} setExtraOptions err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1100
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions1100
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions1100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: true,
          socketTimeout: 0,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} setExtraOptions err: ${JSON.stringify(err)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1200
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions1200
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions1200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 0,
          sendBufferSize: 0,
          reuseAddress: true,
          socketTimeout: -1,
          broadcast: false
        }
        udp.setExtraOptions(udpextraoptions).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} setExtraOptions err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301033);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1300
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions1300
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions1300';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.setExtraOptions(null).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_SetExtraOptions_1400
     * @tc.name  :  testNetworkMgrSocketUDPSocketSetExtraOptions1400
     * @tc.desc  :  Set other properties of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketSetExtraOptions1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketSetExtraOptions1400';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp.bind(UDPAddr1);
        udp.setExtraOptions(undefined).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          udp.close();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          udp.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_On_Message_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketOnMessage0100
     * @tc.desc  :  Subscription to receive message events for UDPSocket connections
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOnMessage0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOnMessage0100';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        await udp2.bind(UDPAddr2);
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        udp2.on('message', (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} message: ${str}`);
          console.info(`${caseName} remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectEqual(str, sendOptions.data as string);
          console.info(`${caseName} test end`);
          udp1.close();
          udp2.close();
          done();
        });
        udp1.send(sendOptions);
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketOffMessage0100
     * @tc.desc  :  Unsubscribe from receiving message events for UDPSocket connections
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOffMessage0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage0100';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        await udp2.bind(UDPAddr2);
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        let callback: Callback<socket.SocketMessageInfo> = (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} message: ${str}`);
          console.info(`${caseName} remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectFail();
          console.info(`${caseName} test end`);
          udp1.close();
          udp2.close();
          done();
        };
        udp2.on('message', callback);
        udp2.off('message', callback);
        await udp1.send(sendOptions);
        expectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketOffMessage0200
     * @tc.desc  :  Unsubscribe from receiving message events for UDPSocket connections
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOffMessage0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage0200';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        await udp2.bind(UDPAddr2);
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        let callback1: Callback<socket.SocketMessageInfo> = (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} cb1 message: ${str}`);
          console.info(`${caseName} cb1 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        let callback2: Callback<socket.SocketMessageInfo> = (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} cb2 message: ${str}`);
          console.info(`${caseName} cb2 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        udp2.on('message', callback1);
        udp2.on('message', callback2);
        udp2.off('message', callback2);
        await udp1.send(sendOptions);
        expectTrue(true);
        console.info(`${caseName} test end`);
        udp1.close();
        udp2.close();
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Off_Message_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketOffMessage0300
     * @tc.desc  :  Unsubscribe from receiving message events for UDPSocket connections
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOffMessage0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOffMessage0300';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        let udp2: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        await udp2.bind(UDPAddr2);
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: UDPAddr2
        };
        let callback1: Callback<socket.SocketMessageInfo> = (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} cb1 message: ${str}`);
          console.info(`${caseName} cb1 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        let callback2: Callback<socket.SocketMessageInfo> = (value: SocketInfo) => {
          let str: string = ArrayBufferToString(value.message);
          console.info(`${caseName} cb2 message: ${str}`);
          console.info(`${caseName} cb2 remoteInfo: ${JSON.stringify(value.remoteInfo)}`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        udp2.on('message', callback1);
        udp2.on('message', callback2);
        udp2.off('message');
        await udp1.send(sendOptions);
        expectTrue(true);
        console.info(`${caseName} test end`);
        udp1.close();
        udp2.close();
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_On_Close_0100
     * @tc.name  :  testNetworkMgrSocketUDPSocketOnClose0100
     * @tc.desc  :  Subscription to UDPSocket connection closure event
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOnClose0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOnClose0100';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        let callback: Callback<void> = () => {
          console.info(`${caseName} closed`);
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        };
        udp1.on('close', callback);
        udp1.close();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Off_Close_0200
     * @tc.name  :  testNetworkMgrSocketUDPSocketOffClose0200
     * @tc.desc  :  Unsubscribe from the closing event of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOffClose0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOffClose0200';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        let callback1: Callback<void> = () => {
          console.info(`${caseName} cb1 closed`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        let callback2: Callback<void> = () => {
          console.info(`${caseName} cb2 closed`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        udp1.on('close', callback1);
        udp1.on('close', callback2);
        udp1.off('close', callback2);
        await udp1.close();
        expectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_UDPSocket_Off_Close_0300
     * @tc.name  :  testNetworkMgrSocketUDPSocketOffClose0300
     * @tc.desc  :  Unsubscribe from the closing event of UDPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketUDPSocketOffClose0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketUDPSocketOffClose0300';
      console.info(`${caseName} test start`);
      try {
        let udp1: socket.UDPSocket = socket.constructUDPSocketInstance();
        await udp1.bind(UDPAddr1);
        let callback1: Callback<void> = () => {
          console.info(`${caseName} closed`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        let callback2: Callback<void> = () => {
          console.info(`${caseName} closed`);
          expectFail();
          console.info(`${caseName} test end`);
          done();
        };
        udp1.on('close', callback1);
        udp1.on('close', callback2);
        udp1.off('close');
        await udp1.close();
        expectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });
  });
}
