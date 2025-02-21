/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll } from '@ohos/hypium'
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';

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
let isSimActive: boolean = sim.isSimActiveSync(0);
const phoneNumber: string = "15617922808";
const zonePhoneNumber: string = "+8615617922808";
const formatPhoneNumber: string = "156-1792-2808";
const emergencyPhoneNumber: string = "120";
const landlineNumber: string = "057126885879";

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.READ_CALL_LOG" | "ohos.permission.WRITE_CALL_LOG" | "ohos.permission.ANSWER_CALL";
  let list: MyPermissions[] = ['ohos.permission.ANSWER_CALL', 'ohos.permission.WRITE_CALL_LOG', 'ohos.permission.READ_CALL_LOG'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.calltest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await  abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`)
  }
  console.info('getPermission end');
}

export default function HasCard2PublicNeedCardTest() {
  describe('TelephonyCallHasCard2PublicNeedCardTest', () => {
    /**
     * @tc.number : SUB_Telephony_CallManager_HasCallSync_0200
     * @tc.name   : testTelephonyCallManagerHasCallSync0200
     * @tc.desc   : Determine whether there is a phone call api10+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerHasCallSync0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCallSync0200';
      console.info(`${caseName} test start`);
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          console.info(`${caseName} success, has call is ${hasCall}`);
          ExpectTrue(hasCall == false);
          done();
        } catch (err) {
          console.info(`${caseName} catch fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_GetCallState_0200
     * @tc.name   : testTelephonyCallManagerGetCallState0200
     * @tc.desc   : Get the current call status. Use the callback asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyCallManagerGetCallState0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerGetCallState0200';
      console.info(`${caseName} test start`);
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          if (hasCall == false) {
            console.info(`${caseName} hasCallSync success, no call exists`);
            call.getCallState((err: BusinessError, data: call.CallState) => {
              if (err) {
                console.info(`${caseName} getCallState fail, err->${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                ExpectTrue(data == 0);
                console.info(`${caseName} getCallState success, data->${JSON.stringify(data)}`);
              }
              done();
            });
          } else {
            console.info(`${caseName} hasCallSync fail, call exists`);
            ExpectFail();
            done();
          }
        } catch (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_GetCallState_0800
     * @tc.name   : testTelephonyCallManagerGetCallState0800
     * @tc.desc   : Get the current call status. Use the Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerGetCallState0800', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerGetCallState0800';
      console.info(`${caseName} test start`);
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          if (hasCall == false) {
            console.info(`${caseName} hasCallSync success,promise: no call exists`);
            call.getCallState().then((data: call.CallState) => {
              ExpectTrue(data == 0);
              console.info(`${caseName} getCallState success, data->${JSON.stringify(data)}`);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} getCallState fail, err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          } else {
            console.info(`${caseName} hasCallSync fail,promise: call exists`);
            ExpectFail();
            done();
          }
        } catch (err) {
          console.info(`${caseName} fail,promise: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_GetCallStateSync_0200
     * @tc.name   : testTelephonyCallManagerGetCallStateSync0200
     * @tc.desc   : Get the current call status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerGetCallStateSync0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerGetCallStateSync0200';
      console.info(`${caseName} test start`);
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          if (hasCall == false) {
            console.info(`${caseName} hasCallSync success, no call exists`);
            let callState: number = call.getCallStateSync();
            console.info(`${caseName} getCallState success, data->${JSON.stringify(callState)}`);
            ExpectTrue(callState == 0);
            done();
          } else {
            console.info(`${caseName} hasCallSync fail, call exists`);
            ExpectFail();
            done();
          }
        } catch (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0200
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber0200
     * @tc.desc   : Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0200';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber(emergencyPhoneNumber, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectTrue(data == true);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0900
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber0900
     * @tc.desc   : Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0900', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0900';
      console.info(`${caseName} test start`);
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(emergencyPhoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          ExpectTrue(data == true);
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2300
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber2300
     * @tc.desc   : Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2300';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber(emergencyPhoneNumber).then((data: boolean) => {
        ExpectTrue(data == true);
        console.info(`${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      });
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2500
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber2500
     * @tc.desc   : Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2500';
      console.info(`${caseName} test start`);
      let options: call.EmergencyNumberOptions = {
        slotId: 0
      }
      call.isEmergencyPhoneNumber(emergencyPhoneNumber, options).then((data: boolean) => {
        ExpectTrue(data == true);
        console.info(`${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      });
      console.info(`${caseName} test end`);
    });
  });
}