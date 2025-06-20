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

import { describe, it, Level, Size, TestType } from '@ohos/hypium';
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

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 0,
  family: 1
};

export default function TLSSocketTest() {
  describe('TLSSocketTest', () => {

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_ConstructTLSSocketInstance_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100
     * @tc.desc  :  Create and return a TLSSocket object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketConstructTLSSocketInstance0100';
      console.info(`${caseName} test start`);
      try {
        let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();
        console.info(`${caseName} ${JSON.stringify(tlsClient)}`);
        expectTrue(tlsClient != null);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
          }
          console.info(`${caseName} test end`);
          done();
          tlsSocket.close();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectFail();
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind0700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1100
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1100
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1300
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1300
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1400
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1400
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1500
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1500
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6565656,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1600
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1600
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 3
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1700
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1700
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 2
        };
        tlsSocket.bind(addr).then(() => {
          expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1800
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1800
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: '::1',
          port: 0,
          family: 1
        };
        tlsSocket.bind(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectTrue(true);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(true);
        done();
      }
    });
    
        /*
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_Bind_1900
     * @tc.name  :  testNetworkMgrSocketTLSSocketBind1900
     * @tc.desc  :  Bind IP address and port
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketBind1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketBind1900';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        let addr: socket.NetAddress = {
          address: 'www.baidu.com',
        };
        tlsSocket.bind(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0100
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        tlsSocket.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectTrue(data.isBound);
            expectFalse(data.isClose);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0300
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.getState((err: BusinessError, data: socket.SocketStateBase) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            expectTrue(data != null);
            expectFalse(data.isBound);
            expectFalse(data.isClose);
            expectFalse(data.isConnected);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0500
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        tlsSocket.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectTrue(data.isBound);
          expectFalse(data.isClose);
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_GetState_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketGetState0700
     * @tc.desc  :  Get TLSSocket Status
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketGetState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketGetState0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        tlsSocket.getState().then((data: socket.SocketStateBase) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expectTrue(data != null);
          expectFalse(data.isBound);
          expectFalse(data.isClose);
          expectFalse(data.isConnected);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0100
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0100
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0200
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0200
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0200';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0300
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0300
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: { on: true, linger: 10 },
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0400
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0400
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0500
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0500
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 100000,
          sendBufferSize: 100000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0600
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0600
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: -1
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0700
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0700
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: -1 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_0800
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions0800
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions0800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: 100000 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} set err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1100
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1100
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1100';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1200
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1200
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1200';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1300
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1300
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1300';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          socketLinger: { on: true, linger: 10 },
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1400
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1400
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1400';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: -1,
          sendBufferSize: -1,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1500
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1500
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1500';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 100000,
          sendBufferSize: 100000,
          reuseAddress: false,
          socketTimeout: 3000
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1600
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1600
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1600';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: false, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: -1
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1700
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1700
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1700';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: -1 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
     * @tc.number:  SUB_NetworkMgr_Socket_TLSSocket_SetExtraOptions_1800
     * @tc.name  :  testNetworkMgrSocketTLSSocketSetExtraOptions1800
     * @tc.desc  :  Set other properties for TCPSocket connection
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketTLSSocketSetExtraOptions1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketSetExtraOptions1800';
      console.info(`${caseName} test start`);
      try {
        let tlsSocket: socket.TLSSocket = socket.constructTLSSocketInstance();
        await tlsSocket.bind(addr).catch((err:BusinessError) => {
            console.info('fail to bind' + err.code.toString());
        });
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: false,
          OOBInline: false,
          TCPNoDelay: false,
          socketLinger: { on: true, linger: 100000 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 0
        };
        tlsSocket.setExtraOptions(tcpExtraOptions).then(() => {
          expectTrue(true);
          console.info(`${caseName} test end`);
          tlsSocket.close();
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
  });
}
