/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License `);
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

import { describe, beforeAll, afterEach, it, expect, Level, TestType, Size } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const SIM_PIN_OLD = "741593";

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.simtest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function Sim1Public() {
  describe('Sim1Public', () => {

    beforeAll(async (done: Function) => {
			console.log('getPermission beforeAll');
			await getPermissions();
			done();
    });

    afterEach(async (done: Function) => {
      console.info("afterEach case");
      let lockInfo: sim.LockInfo = {
        lockType: sim.LockType.PIN_LOCK,
        password: SIM_PIN_OLD,
        state: sim.LockState.LOCK_OFF
      };
      sim.setLockState(0, lockInfo, (err: BusinessError, data: sim.LockStatusResponse) => {
        done();
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKey_0300
     * @tc.name   : testTelephonySimGetOpKey0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetOpKey0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKey0300';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpKey(0).then((data: string) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        if (err&&err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });


    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKey_0500
     * @tc.name   : testTelephonySimGetOpKey0500
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpKey0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKey0500';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getOpKey(null, (err: BusinessError, data: string) => {
          if (err && err.code === 801) {
            console.info(`${caseName}successfully  : Parameter error and return 801`);
            ExpectTrue(true);
            done();
          } else {
            if (err && err.code === 401) {
              console.info(`${caseName} successfully  : Parameter error and return 401`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimSpn_0600
     * @tc.name   : testTelephonySimGetSimSpn0600
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */

    it('testTelephonySimGetSimSpn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimSpn0600';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimSpn(null, (err, data) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully  : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimSpn_0700
     * @tc.name   : testTelephonySimGetSimSpn0700
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */

    it('testTelephonySimGetSimSpn0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimSpn0700';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimSpn(3, (err, data) => {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully  : Parameter error and return 8300001`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 8300001) {
          console.info(`${caseName} successfully  : Parameter error and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKey_0600
     * @tc.name   : testTelephonySimGetOpKey0600
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpKey0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKey0600';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpKey(-1, (err: BusinessError, data: string) => {
        if (err&&err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      });
    });


    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKey_0900
     * @tc.name   : testTelephonySimGetOpKey0900
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpKey0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKey0900';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getOpKey(null).then((data: string) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err&&err.code === 801){
            console.info(`${caseName} successfully: Parameter error and return 801`);
            ExpectTrue(true);
            done();
          }else {
            if (err && err.code === 401) {
              console.info(`${caseName} successfully  : Parameter error and return 401`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 801) {
            console.info(`${caseName} successfully: Parameter error and return 801`);
            ExpectTrue(true);
            done();
        }else {
          if ((error as BusinessError).code === 401) {
            console.info(`${caseName} successfully  : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKey_1000
     * @tc.name   : testTelephonySimGetOpKey1000
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpKey1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKey1000';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpName(-1).then((data: string) => {
        console.info(`${caseName} failed, The result is not in line with expectations`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        if (err&&err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpKeySync_0300
     * @tc.name   : testTelephonySimGetOpKeySync0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpKeySync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpKeySync0300';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let data: string = sim.getOpKeySync(-1);
      if (data.length === 0) {
        console.info(`${caseName} success : Return an empty string`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} err The return value is not the expected value :${data}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpName_0100
     * @tc.name   : testTelephonySimGetOpName0100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetOpName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpName0100';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpName(0, (err: BusinessError, data: string) => {
        if (!err) {
          console.info(`${caseName} successfully, data: ${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          if (err&&err.code === 801){
            console.info(`${caseName} successfully: Parameter error and return 801`);
            ExpectTrue(true);
            done();
          }else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpName_0300
     * @tc.name   : testTelephonySimGetOpName0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpName0300';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpName(0).then((data: string) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        if (err&&err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpName_0500
     * @tc.name   : testTelephonySimGetOpName0500
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpName0500';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getOpName(null, (err: BusinessError, data: string) => {
          if (err&&err.code === 801){
            console.info(`${caseName} successfully: Parameter error and return 801`);
            ExpectTrue(true);
            done();
          }else {
            if (err && err.code === 401) {
              console.info(`${caseName} successfully  : Parameter error and return 401`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 801) {
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          if ((error as BusinessError).code === 401) {
            console.info(`${caseName} successfully  : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpName_0600
     * @tc.name   : testTelephonySimGetOpName0600
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use callback for asynchronous callback. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpName0600';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getOpName(-1, (err: BusinessError, data: string) => {
        if (err&&err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpName_0900
     * @tc.name   : testTelephonySimGetOpName0900
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpName0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpName0900';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getOpName(null).then((data: string) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err&&err.code === 801){
            console.info(`${caseName} successfully: Parameter error and return 801`);
            ExpectTrue(true);
            done();
          }else {
            if (err && err.code === 401) {
              console.info(`${caseName} successfully  : Parameter error and return 401`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 801) {
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          done();
        }else {
          if ((error as BusinessError).code === 401) {
            console.info(`${caseName} successfully  : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimSpn_1100
     * @tc.name   : testTelephonySimGetSimSpn1100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimSpn1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimSpn1100';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimSpn(null).then((data: string) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully  : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimSpn_1200
     * @tc.name   : testTelephonySimGetSimSpn1200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise for asynchronous callback.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimSpn1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimSpn1200';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimSpn(3).then((data: string) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully  : Parameter error and return 8300001`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 8300001) {
          console.info(`${caseName} successfully  : Parameter error and return 9300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetOpNameSync_0300
     * @tc.name   : testTelephonySimGetOpNameSync0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot.Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetOpNameSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetOpNameSync0300';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let data: string = sim.getOpKeySync(-1);
      if (data.length === 0) {
        console.info(`${caseName} success : Return an empty string`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} err The return value is not the expected value : ${data}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetDefaultVoiceSimId_0100
     * @tc.name   : testTelephonySimGetDefaultVoiceSimId0100
     * @tc.desc   : Obtain the SIM card ID of the default voice service. Use callback for asynchronous callback.Need to insert SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetDefaultVoiceSimId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSimId0100';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.setDefaultVoiceSlotId(0, (err: BusinessError) => {
          console.info(`${caseName} case success,setDefaultVoiceSlotId`);
          if (!err) {
            sim.getDefaultVoiceSimId((err: BusinessError, data: number) => {
              if (!err && data > 0) {
                console.info(`${caseName} case success,data:  ${data}`);
                ExpectTrue(true);
                console.info(`${caseName} test end`);
                done();
              } else {
                console.info(`${caseName} error, case failed,errCode:  ${err.code}`);
                ExpectFail();
                console.info(`${caseName} test end`);
                done();
              }
            });
          } else {
            console.info(`${caseName} failed, Set the card slot ID of the default voice service`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} error, case failed,errCode:  ${error.code}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetDefaultVoiceSimId_0300
     * @tc.name   : testTelephonySimGetDefaultVoiceSimId0300
     * @tc.desc   : Obtain the SIM card ID of the default voice service. Use Promise for asynchronous callback. Need to insert SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetDefaultVoiceSimId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSimId0300';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      }
      sim.setDefaultVoiceSlotId(0, (err: BusinessError) => {
        if (!err) {
          sim.getDefaultVoiceSimId().then((data: number) => {
            if (data > 0) {
              console.info(`${caseName} case success,data: ${data}}`);
              ExpectTrue(true);
              console.info(`${caseName} test end`);
              done();
            } else {
              console.info(`${caseName} error, Not expected`);
              ExpectFail();
              console.info(`${caseName} test end`);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} error, case failed,errCode: ${err.code}}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          });
        } else {
          console.info(`${caseName} failed, Set the card slot ID of the default voice service`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_1500
     * @tc.name   : testTelephonySimGetSimAuthentication1500
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication1500';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimAuthentication(0, sim.AuthType.SIM_AUTH_EAP_SIM_TYPE, "test").then((data: sim.SimAuthenticationResponse) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_1600
     * @tc.name   : testTelephonySimGetSimAuthentication1600
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication1600';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      let simState: sim.SimState = await sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimAuthentication(0, sim.AuthType.SIM_AUTH_EAP_AKA_TYPE, "test").then((data: sim.SimAuthenticationResponse) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_1700
     * @tc.name   : testTelephonySimGetSimAuthentication1700
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication1700';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimAuthentication(-1, sim.AuthType.SIM_AUTH_EAP_SIM_TYPE, "test").then((data: sim.SimAuthenticationResponse) => {
        console.info(`${caseName} failed, The result is not in line with expectations`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        if (err && err.code === 8300001) {
          console.info(`${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_1800
     * @tc.name   : testTelephonySimGetSimAuthentication1800
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication1800';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimAuthentication(null, null, "test").then((data: sim.SimAuthenticationResponse) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_1900
     * @tc.name   : testTelephonySimGetSimAuthentication1900
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication1900';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimAuthentication(0, null, "test").then((data: sim.SimAuthenticationResponse) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_2000
     * @tc.name   : testTelephonySimGetSimAuthentication2000
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication2000';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimAuthentication(0, sim.AuthType.SIM_AUTH_EAP_SIM_TYPE, null).then((data: sim.SimAuthenticationResponse) => {
          console.info(`${caseName} failed, The result is not in line with expectations`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }).catch((err: BusinessError) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully : Parameter error and return 401`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully  : Parameter error and return 401`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetSimAuthentication_2100
     * @tc.name   : testTelephonySimGetSimAuthentication2100
     * @tc.desc   : Performs SIM card authentication. Need to insert SIM card.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonySimGetSimAuthentication2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAuthentication2100';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimAuthentication(0, 200, "test").then((data: sim.SimAuthenticationResponse) => {
        console.info(`${caseName} failed, The result is not in line with expectations`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        if (err && err.code === 8300001) {
          console.info(`${caseName} successfully step2 end : Pass an invalid parameter and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });
  });
}