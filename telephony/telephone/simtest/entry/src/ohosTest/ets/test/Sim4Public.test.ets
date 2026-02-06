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

export default function Sim4Public() {
  describe('Sim4Public', () => {

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
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_0100
     * @tc.name   : testTelephonySimGetSimLabelCallback0100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback0100';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimLabel(-1, (err: BusinessError, data: sim.SimLabel) => {
          console.info(`${caseName} jin qu la: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          if (err && err.code === 8300001) {
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });  
      } catch (err) {
        if (err&&err.code === 8300001){
          console.info(`${caseName} successfully: Parameter error and return 8300001`);
          ExpectTrue(true);
          done();
        }else {
          console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_0200
     * @tc.name   : testTelephonySimGetSimLabelCallback0200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback0200';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimLabel(0, (err: BusinessError, data: sim.SimLabel) => {
          if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
            console.info(`${caseName} sim card is PSIM, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });  
      } catch (err) {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_0300
     * @tc.name   : testTelephonySimGetSimLabelCallback0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback0300';
      let hasSimCard: Boolean = await sim.hasSimCardSync(1);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimLabel(1, (err: BusinessError, data: sim.SimLabel) => {
          if (!err && data.index <= 2 && data.simType == sim.SimType.PSIM) {
            console.info(`${caseName} sim card2 is PSIM, success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} 01 test end`);
            done();
          } else if (!err && data.index <= 10 && data.simType == sim.SimType.ESIM){
            console.info(`${caseName} sim card2 is ESIM, success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} 02 test end`);
            done();
          } else {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} 03 test end`);
            done();
          }
        });  
      } catch (err) {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_0400
     * @tc.name   : testTelephonySimGetSimLabelCallback0400
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback0400';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimLabel(2, (err: BusinessError, data: sim.SimLabel) => {
          if (err && err.code === 8300001) {
            console.info(`${caseName} successfully: Parameter error and return 8300001, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch(err) {
        if ((err as BusinessError).code === 8300001) {
          console.info(`${caseName} successfully: Parameter error and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_callback_0500
     * @tc.name   : testTelephonySimGetSimLabelCallback0500
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelCallback0500';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        sim.getSimLabel(null, (err: BusinessError, data: sim.SimLabel) => {
          if (err && err.code === 401) {
            console.info(`${caseName} successfully: Parameter error and return 8300001, err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end`);
            done();
          } else {
            console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch(error)  {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName} successfully: Parameter error and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, error->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      };
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_0100
     * @tc.name   : testTelephonySimGetSimLabelPromise0100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise0100';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimLabel(-1).then((data: sim.SimLabel) => {
        console.info(`${caseName} failed, The result is not in line with expectations, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) =>{
        if (err && err.code === 8300001){
          console.info(`${caseName} successfully: Parameter error and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_0200
     * @tc.name   : testTelephonySimGetSimLabelPromise0200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise0200';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimLabel(0).then((data: sim.SimLabel) => {
        if (data.index <= 2 && data.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,data -> ${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }).catch((err: BusinessError) =>{
        if (err && err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_0300
     * @tc.name   : testTelephonySimGetSimLabelPromise0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise0300';
      let hasSimCard: Boolean = await sim.hasSimCardSync(1);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 1`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimLabel(1).then((data: sim.SimLabel) => {
        if (data.index <= 2 && data.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,data -> ${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else if (data.index <= 10 && data.simType == sim.SimType.ESIM){
          console.info(`${caseName} sim card is ESIM,data -> ${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} 02 test end`);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} 03 test end`);
          done();
        }
      }).catch((err: BusinessError) =>{
        if (err && err.code === 801){
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_promise_0400
     * @tc.name   : testTelephonySimGetSimLabelPromise0400
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelPromise0400';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      sim.getSimLabel(2).then((data: sim.SimLabel) => {
        console.info(`${caseName} failed, The result is not in line with explections, data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) =>{
        if (err && err.code === 8300001){
          console.info(`${caseName} successfully: Parameter error and return 8300001`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_0100
     * @tc.name   : testTelephonySimGetSimLabelSync0100
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync0100';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try{
        let simLabel: sim.SimLabel = sim.getSimLabelSync(-1);
        if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} 02 test end`);
          done();
        }
      } catch (err) {
        console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_0200
     * @tc.name   : testTelephonySimGetSimLabelSync0200
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync0200';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try{
        let simLabel: sim.SimLabel = sim.getSimLabelSync(0);
        if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} 02 test end`);
          done();
        }
      } catch (err) {
        console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_0300
     * @tc.name   : testTelephonySimGetSimLabelSync0300
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonySimGetSimLabelSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync0300';
      let hasSimCard: Boolean = await sim.hasSimCardSync(1);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 1`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try{
        let simLabel: sim.SimLabel = sim.getSimLabelSync(1);
        if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else if (simLabel.index <= 10 && simLabel.simType == sim.SimType.ESIM) {
            console.info(`${caseName} sim card is ESIM,simLabel -> ${JSON.stringify(simLabel)}`);
            ExpectTrue(true);
            console.info(`${caseName} 01 test end`);
            done();
        } else {
          ExpectFail();
          console.info(`${caseName} 02 test end`);
          done();
        }
      } catch (err) {
        if (err.code == 801) {
          console.info(`${caseName} successfully: Parameter error and return 801`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_0400
     * @tc.name   : testTelephonySimGetSimLabelSync0400
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync0400';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try{
        let simLabel: sim.SimLabel = sim.getSimLabelSync(2);
        if (simLabel.index <= 2 && simLabel.simType == sim.SimType.PSIM) {
          console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
          ExpectTrue(true);
          console.info(`${caseName} 01 test end`);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} 02 test end`);
          done();
        }
      } catch (err) {
          console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_getSimLabel_sync_0500
     * @tc.name   : testTelephonySimGetSimLabelSync0500
     * @tc.desc   : Obtain the opkey of the SIM card in the specified slot. Use Promise asynchronous callbacks. Need to insert  SIM card
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testTelephonySimGetSimLabelSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimLabelSync0500';
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try{
        let simLabel: sim.SimLabel = sim.getSimLabelSync(null);
        console.info(`${caseName} sim card is PSIM,simLabel -> ${JSON.stringify(simLabel)}`);
        ExpectTrue(true);
        console.info(`${caseName} 01 test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}