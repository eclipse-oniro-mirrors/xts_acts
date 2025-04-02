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
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const NOT_PERMISSION = 201

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

export default function ConnectionWithoutPermissionTest() {
  describe('ConnectionWithoutPermissionTest', () => {

    /**
     * @tc.number     : SUB_NetworkMgr_CONNECTION_Register_0800
     * @tc.name       : testNetConnectionRegister0800
     * @tc.desc       : test subscribe to notifications of specified network status changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionRegister0800', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionRegister0800";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} register callback: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} register success`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_Connection_Unregister_0700
     * @tc.name       : testNetConnectionUnregister0700
     * @tc.desc       : test unsubscribe from notifications of default network state changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionUnregister0700', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionUnregister0700";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.unregister((err: BusinessError) => {
          if (err) {
            console.info(`${caseName} unregister callback: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} unregister success`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0600
     * @tc.name       : testNetConnectionGetDefaultNetCallback0600
     * @tc.desc       : test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionGetDefaultNetCallback0600', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetCallback0600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet((err: BusinessError<void>, data: connection.NetHandle) => {
          if (err) {
            console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} getDefaultNet success data->${JSON.stringify(data)}`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0600
     * @tc.name       : testNetConnectionGetDefaultNetPromise0600
     * @tc.desc       : test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionGetDefaultNetPromise0600', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionGetDefaultNetPromise0600";
      console.info(`${caseName} test start`);
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          console.info(`${caseName} getDefaultNet: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
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
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0600
     * @tc.name       : testNetConnectionIsDefaultNetMeteredCallback0600
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionIsDefaultNetMeteredCallback0600', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionIsDefaultNetMeteredCallback0600";
      console.info(`${caseName} test start`);
      try {
        connection.isDefaultNetMetered((err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} isDefaultNetMetered callback: data->${JSON.stringify(data)}`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0600
     * @tc.name       : testNetConnectionIsDefaultNetMeteredPromise0600
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionIsDefaultNetMeteredPromise0600', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionIsDefaultNetMeteredPromise0600";
      console.info(`${caseName} test start`);
      try {
        connection.isDefaultNetMetered().then((data: boolean) => {
          console.info(`${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
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
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0200
     * @tc.name       : testNetConnectionIsDefaultNetMeteredSync0200
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and return it using synchronous mode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionIsDefaultNetMeteredSync0200', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionIsDefaultNetMeteredSync0200";
      console.info(`${caseName} test start`);
      try {
        let isMetered: boolean = connection.isDefaultNetMeteredSync();
        console.info(`${caseName} isMetered ->${JSON.stringify(isMetered)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0500
     * @tc.name       : testNetConnectionHasDefaultNet0500
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionHasDefaultNet0500', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet0500";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet((error: BusinessError, data: boolean) => {
          if (error) {
            console.info(`${caseName} hasDefaultNet: BusinessError>${JSON.stringify(error)}`);
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_1000
     * @tc.name       : testNetConnectionHasDefaultNet1000
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionHasDefaultNet1000', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNet1000";
      console.info(`${caseName} test start`);
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          console.info(`${caseName} hasDefaultNet: data>${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} hasDefaultNet: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
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
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNetSync_0500
     * @tc.name       : testNetConnectionHasDefaultNetSync0500
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionHasDefaultNetSync0500', 0, async (done: Function) => {
      const caseName: string = "testNetConnectionHasDefaultNetSync0500";
      console.info(`${caseName} test start`);
      try {
        let isDefaultNet = connection.hasDefaultNetSync();
        console.info(`${caseName} isDefaultNet ${isDefaultNet}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_5000
     * @tc.name       : testNetworkMgrConnectionGetAllNets5000
     * @tc.desc       : Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNets5000', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets5000";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets((error: BusinessError, data: connection.NetHandle[]) => {
          if (error) {
            console.info(`${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
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
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_5100
     * @tc.name       : testNetworkMgrConnectionGetAllNets5100
     * @tc.desc       : Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNets5100', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets5100";
      console.info(`${caseName} test start `);
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          console.info(`${caseName} getAllNets: success data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} hasDefaultNet: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
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
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNetsSync_0500
     * @tc.name       : testNetworkMgrConnectionGetAllNetsSync0500
     * @tc.desc       : Use synchronization method to obtain a list of all connected networks.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetAllNetsSync0500', 0, async (done: Function) => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync0500";
      console.info(`${caseName} test start `);
      try {
        let netHandle = connection.getAllNetsSync();
        console.info(`${caseName} GetAllNetsSync: success data->${JSON.stringify(netHandle)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0700
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0700
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0700';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${caseName} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0800
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule0800
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionAddCustomDnsRule0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule0800';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then((data: void) => {
          console.error(`${caseName} data:${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0700
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0700
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0700', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0700';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError, data: void) => {
          console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0800
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule0800
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule0800', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule0800';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule("127.0.0.1").then((data: void) => {
          console.error(`${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0300
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules0300
     * @tc.desc   : Delete all custom DNS rules for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionClearCustomDnsRules0300', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules0300';
      console.info(`${caseName}---Start`);
      try {
        connection.clearCustomDnsRules((error: BusinessError, data: void) => {
          console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0400
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules0400
     * @tc.desc   : Delete all custom DNS rules for the current application . Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionClearCustomDnsRules0400', 0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules0400';
      console.info(`${caseName}---Start`);
      try {
        connection.clearCustomDnsRules().then((data: void) => {
          console.error(`${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /*
    * @tc.number:SUB_NetworkMgr_Connection_GetAddressByName_Callback_Nop_100
    * @tc.name: testNetworkMgrConnectionGetAddressByNameCallbackNop100
    * @tc.desc:Using the on method without permission
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it('testNetworkMgrConnectionGetAddressByNameCallbackNop100', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop100 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync().getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
          if (error) {
            hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop100 fail' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNameCallbackNop100 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetAddressByName_Promise_Nop_200
     * @tc.name: testNetworkMgrConnectionGetAddressByNamePromiseNop200
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetAddressByNamePromiseNop200', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop200 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync().getAddressByName(host).then((data: connection.NetAddress) => {
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop200 success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop200 fail' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressByNamePromiseNop200 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetAddressesByName_Promise_Array_NetAddress_Nop_300
     * @tc.name: testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync().getAddressesByName(host).then((data: connection.NetAddress[]) => {
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300 success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300 fail' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNamePromiseArrayNetAddressNop300 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetAddressesByName_Callback_Array_NetAddress_Nop_400
     * @tc.name: testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400 begin');
      try {
        let host = "xxxx";
        connection.getDefaultNetSync()
          .getAddressesByName(host, (error: BusinessError, data: connection.NetAddress[]) => {
            if (error) {
              hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400 fail' + JSON.stringify(error));
              expect(Number(error.code)).assertEqual(NOT_PERMISSION);
              done();
            } else {
              hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400 success');
              expect().assertFail();
              done();
            }
          });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetAddressesByNameCallbackArrayNetAddressNop400 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetNetCapabilities_Callback_Nop_500
     * @tc.name: testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500 begin');
      try {
        let netHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
          if (error) {
            hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500 fail ' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500 success');
            expect().assertFail();
            done();
          }
        })
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesCallbackNop500 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetNetCapabilities_Promise_Nop_600
     * @tc.name: testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600 begin');
      try {
        let netHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600 success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600 fail ' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetNetCapabilitiesPromiseNop600 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetConnectionProperties_Promise_Nop_700
     * @tc.name: testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700 begin');
      try {
        let netHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
          hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700 success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700 fail ' + JSON.stringify(err));
          expect(Number(err.code)).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesPromiseNop700 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_NetworkMgr_Connection_GetConnectionProperties_Callback_Nop_800
     * @tc.name: testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800', 0, async (done: Function) => {
      hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800 begin');
      try {
        let netHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
          if (error) {
            hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800 fail ' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800 success');
            expect().assertFail();
            done();
          }
        })
      } catch (error) {
        hilog.error(0x0000, 'ConnectionTag', '%{public}s', 'testNetworkMgrConnectionGetConnectionPropertiesCallbackNop800 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });
  });
}
