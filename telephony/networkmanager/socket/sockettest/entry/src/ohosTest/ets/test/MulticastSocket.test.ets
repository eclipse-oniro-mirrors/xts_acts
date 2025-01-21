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
  SocketInfo,
  ArrayBufferToString,
  stringToArrayBuffer
} from './utils';

let addr: socket.NetAddress = {
  address: '239.255.0.1',
  port: 0,
  family: 1
};

export default function MulticastSocket() {
  describe('MulticastSocket', () => {

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_ConstructMulticastSocketInstance_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance0100
     * @tc.desc  :  Create a MulticastSocket object
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 2
     */
    it('testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketConstructMulticastSocketInstance0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        console.info(`${caseName} ${JSON.stringify(multicast)}`);
        expectTrue(multicast != null);
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
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0100
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.addMembership(addr, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            await multicast.dropMembership(addr);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0200
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1'
        };
        multicast.addMembership(addr, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            await multicast.dropMembership(addr);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0300
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: -1,
          family: 1
        };
        multicast.addMembership(addr, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            await multicast.dropMembership(addr);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0400
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0400
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0400';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 100000,
          family: 1
        };
        multicast.addMembership(addr, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            await multicast.dropMembership(addr);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0500
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 0,
          family: -1
        };
        multicast.addMembership(addr, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectTrue(true);
            await multicast.dropMembership(addr);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0600
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        multicast.addMembership(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301022);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_0700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership0700
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership0700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '23424253',
          port: 0,
          family: 1
        };
        multicast.addMembership(addr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301022);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership1200
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership1200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.addMembership(addr).then(async () => {
          expectTrue(true);
          await multicast.dropMembership(addr);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership1300
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership1300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1'
        };
        multicast.addMembership(addr).then(async () => {
          expectTrue(true);
          await multicast.dropMembership(addr);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership1600
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership1600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 0,
          family: -1
        };
        multicast.addMembership(addr).then(async () => {
          expectTrue(true);
          await multicast.dropMembership(addr);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership1700
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership1700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        multicast.addMembership(addr).then(async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_1800
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership1800
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership1800';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '23424253',
          port: 0,
          family: 1
        };
        multicast.addMembership(addr).then(async () => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_2100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership2100
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership2100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: 'fe80::95f1:6adf:b93c:d39a%11', // todo 填写正确的ipv6地址
        };
        multicast.addMembership(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectEqual(err.code, 2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_AddMembership_2200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketAddMembership2200
     * @tc.desc  :  Join a multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketAddMembership2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketAddMembership2200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: 'fe80::95f1:6adf:b93c:d39a%11', // todo 填写正确的ipv6地址
          port: 0,
          family: 1
        };
        multicast.addMembership(addr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectEqual(err.code, 2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership0100
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.dropMembership(addr, (err: BusinessError) => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership0500
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership0500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 0,
          family: -1
        };
        multicast.dropMembership(dropAddr, (err: BusinessError) => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership0600
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership0600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        multicast.dropMembership(dropAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_0700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership0700
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership0700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: '23424243',
          port: 0,
          family: 1
        };
        multicast.dropMembership(dropAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1000
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership1000
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership1000';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: 'fe80::95f1:6adf:b93c:d39a%11' // todo 填写正确的ipv6地址
        };
        multicast.dropMembership(dropAddr, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership1200
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership1200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.dropMembership(addr).then(() => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership1700
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership1700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        multicast.dropMembership(dropAddr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_1800
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership1800
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership1800';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: '23424243',
          port: 0,
          family: 1
        };
        multicast.dropMembership(dropAddr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_DropMembership_2100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketDropMembership2100
     * @tc.desc  :  Exit multicast group
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketDropMembership2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketDropMembership2100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let dropAddr: socket.NetAddress = {
          address: 'fe80::95f1:6adf:b93c:d39a%11' // todo 填写正确的ipv6地址
        };
        multicast.dropMembership(dropAddr).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0100
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 8;
        multicast.setMulticastTTL(ttl, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            let value: number = await multicast.getMulticastTTL();
            expectEqual(value, ttl);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0200
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = -1;
        multicast.setMulticastTTL(ttl, async (err: BusinessError) => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0300
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 256;
        multicast.setMulticastTTL(ttl, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301022);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0400
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0400
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0400';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let ttl: number = 8;
        multicast.setMulticastTTL(ttl, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301009);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0700
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 8;
        multicast.setMulticastTTL(ttl).then(async () => {
          let value: number = await multicast.getMulticastTTL();
          expectEqual(value, ttl);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0800
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0800
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0800';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = -1;
        multicast.setMulticastTTL(ttl).then(() => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_0900
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL0900
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL0900';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 256;
        multicast.setMulticastTTL(ttl).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301022);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetMulticastTTL_1000
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetMulticastTTL1000
     * @tc.desc  :  Set the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetMulticastTTL1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetMulticastTTL1000';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let ttl: number = 8;
        multicast.setMulticastTTL(ttl).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301009);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0100
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 8;
        await multicast.setMulticastTTL(ttl)
        multicast.getMulticastTTL((err: BusinessError, value: number) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectEqual(value, ttl);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0200
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.getMulticastTTL((err: BusinessError, value: number) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301009);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0300
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.getMulticastTTL((err: BusinessError, value: number) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectEqual(value, 1);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0400
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0400
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0400';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let ttl: number = 8;
        await multicast.setMulticastTTL(ttl)
        multicast.getMulticastTTL().then((value: number) => {
          expectEqual(value, ttl);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0500
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.getMulticastTTL().then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301009);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetMulticastTTL_0600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetMulticastTTL0600
     * @tc.desc  :  Get the maximum number of hops for the router
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetMulticastTTL0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetMulticastTTL0600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.getMulticastTTL().then((value: number) => {
          expectEqual(value, 1);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0100
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = true;
        multicast.setLoopbackMode(mode, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            let value: boolean = await multicast.getLoopbackMode();
            expectEqual(value, mode);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0200
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = false;
        multicast.setLoopbackMode(mode, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            let value: boolean = await multicast.getLoopbackMode();
            expectEqual(value, mode);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0300
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let mode: boolean = false;
        multicast.setLoopbackMode(mode, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301009);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0600
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = true;
        multicast.setLoopbackMode(mode).then(async () => {
          let value: boolean = await multicast.getLoopbackMode();
          expectEqual(value, mode);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0700
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = false;
        multicast.setLoopbackMode(mode).then(async () => {
          let value: boolean = await multicast.getLoopbackMode();
          expectEqual(value, mode);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_SetLoopbackMode_0800
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSetLoopbackMode0800
     * @tc.desc  :  Set the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSetLoopbackMode0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSetLoopbackMode0800';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let mode: boolean = false;
        multicast.setLoopbackMode(mode).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301009);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0100
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0100
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = false;
        await multicast.setLoopbackMode(mode)
        multicast.getLoopbackMode((err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectEqual(value, mode);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0200
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.getLoopbackMode((err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectFail();
          } else {
            expectEqual(value, true);
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0300
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.getLoopbackMode((err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 2301009);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0400
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0400
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0400';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let mode: boolean = false;
        await multicast.setLoopbackMode(mode)
        multicast.getLoopbackMode().then((value: boolean) => {
          expectEqual(value, mode);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0500
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.getLoopbackMode().then((value: boolean) => {
          expectEqual(value, true);
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_GetLoopbackMode_0600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketGetLoopbackMode0600
     * @tc.desc  :  Get the loopback mode flag in multicast communication
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketGetLoopbackMode0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketGetLoopbackMode0600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        multicast.getLoopbackMode().then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 2301009);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_0700
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend0700
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend0700';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let sendOption: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: {
            address: '239.255.0.1',
            port: -1,
            family: 1
          }
        };
        multicast.send(sendOption, (err: BusinessError) => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_0800
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend0800
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend0800';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let sendOption: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: {
            address: '239.255.0.1',
            port: 100000,
            family: 1
          }
        };
        multicast.send(sendOption, (err: BusinessError) => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_1500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend1500
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend1500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.send(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_1600
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend1600
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend1600';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.send(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} err: ${JSON.stringify(err)}`);
            expectEqual(err.code, 401);
          } else {
            expectFail();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_2400
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend2400
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend2400';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let sendOption: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: {
            address: '239.255.0.1',
            port: -1,
            family: 1
          }
        };
        multicast.send(sendOption).then(() => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_2500
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend2500
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend2500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend2500';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        let sendOption: socket.UDPSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          address: {
            address: '239.255.0.1',
            port: 100000,
            family: 1
          }
        };
        multicast.send(sendOption).then(() => {
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
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_3200
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend3200
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend3200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend3200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.send(null).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Socket_MulticastSocket_Send_3300
     * @tc.name  :  testNetworkMgrSocketMulticastSocketSend3300
     * @tc.desc  :  Send data
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  Level 3
     */
    it('testNetworkMgrSocketMulticastSocketSend3300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketMulticastSocketSend3300';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        await multicast.addMembership(addr);
        multicast.send(undefined).then(() => {
          expectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err: ${JSON.stringify(err)}`);
          expectEqual(err.code, 401);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}