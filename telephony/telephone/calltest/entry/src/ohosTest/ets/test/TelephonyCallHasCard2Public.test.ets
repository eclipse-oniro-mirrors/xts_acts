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

import { describe, it, expect, beforeAll, Level, TestType, Size } from '@ohos/hypium'
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

export default function HasCard2PublicTest() {
  describe('TelephonyCallHasCard2PublicTest', () => {
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerHasVoiceCapability0100
     * @tc.number SUB_Telephony_CallManager_HasVoiceCapability_0100
     * @tc.desc   Check that the current device has a voice call capability api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerHasVoiceCapability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasVoiceCapability0100';
      console.info(`${caseName} test start`);
      try {
        let hasVoiceCapability: boolean = call.hasVoiceCapability();
        console.info(`${caseName}  success, hasVoiceCapability->${JSON.stringify(hasVoiceCapability)}`);
        ExpectTrue(hasVoiceCapability == true);
        done();
      } catch (err) {
        console.info(`${caseName}  failed, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0100
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0100
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0100';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber(phoneNumber, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectTrue(data == false);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0300
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0300
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0300';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber("abcde", (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0400
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0400';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber("", (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0500
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0500
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0500';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber("156179228080000", (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectTrue(data == false);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0600
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0600
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0600';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber("!@#$%", (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectTrue(data == false);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0700
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0700
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0700';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber("abc12345678", (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectTrue(data == false);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber0800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber0800';
      console.info(`${caseName} test start`);
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          ExpectTrue(data == false);
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1000
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1000
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1000';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "abcde";
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1100
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1100
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1100';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "";
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          done();
        } else {
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }
      });
      console.info(`${caseName} test start`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1200
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1200
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1200';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "156179228080000";
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          ExpectTrue(data == false);
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1300
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1300
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1300';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "!@#$%";
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          ExpectTrue(data == false);
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1400
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1400';
      console.info(`${caseName} test start`);
      const options: call.EmergencyNumberOptions = {
        slotId: 0
      };
      call.isEmergencyPhoneNumber("abc12345678", options, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          ExpectTrue(data == false);
          console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
          done();
        }
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber1800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber1800';
      console.info(`${caseName} test start`);
      if(sim.getMaxSimCount()>1){
        const phoneNumber: string = "";
        const options: call.EmergencyNumberOptions = {
          slotId: 1
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 8300001);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            done();
          }
        });
      }else{
        console.info(`${caseName}：Not support dual SIM cards.`);
        ExpectTrue(true);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2000
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2000
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2000';
      console.info(`${caseName} test start`);
      if(sim.getMaxSimCount()>1){
        const phoneNumber: string = "!@#$%";
        const options: call.EmergencyNumberOptions = {
          slotId: 1
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            ExpectTrue(data == false);
            console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            done();
          }
        });
      }else{
        console.info(`${caseName}：Not support dual SIM cards.`);
        ExpectTrue(true);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2200
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2200
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2200';
      console.info(`${caseName} test start`);
      call.isEmergencyPhoneNumber(phoneNumber).then((data: boolean) => {
        ExpectTrue(data == false);
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
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2400
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2400';
      console.info(`${caseName} test start`);
      let options: call.EmergencyNumberOptions = {
        slotId: 0
      }
      call.isEmergencyPhoneNumber(phoneNumber, options).then((data: boolean) => {
        ExpectTrue(data == false);
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
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2600
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2600
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2600';
      console.info(`${caseName} test start`);
      let options: call.EmergencyNumberOptions = {
        slotId: 3
      }
      call.isEmergencyPhoneNumber(emergencyPhoneNumber, options).then((data: boolean) => {
        ExpectFail();
        console.info(`${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 8300001);
        done();
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2700
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2700
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2700';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "!@#$%";
      call.isEmergencyPhoneNumber(phoneNumber).then((data: boolean) => {
        ExpectTrue(data == false);
        console.info(`${caseName} isEmergencyPhoneNumber,promise data->${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} isEmergencyPhoneNumber fail,promise err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber2800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2800';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "!@#$%";
      let options: call.EmergencyNumberOptions = {
        slotId: 0
      }
      call.isEmergencyPhoneNumber(phoneNumber, options).then((data: boolean) => {
        ExpectTrue(data == false);
        console.info(`${caseName} isEmergencyPhoneNumber,promise data->${JSON.stringify(data)}`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} isEmergencyPhoneNumber fail,promise err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      });
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0100
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0100';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber(phoneNumber, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${err.message}`);
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0200
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0200';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber(zonePhoneNumber, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${err.message}`);
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0300
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0300';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber(formatPhoneNumber, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${err.message}`);
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0400
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0400';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber("", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 8300001);
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0450
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0450
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0450';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber("10000000000", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${err.message}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0500
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0500';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber(landlineNumber, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err = ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0600
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0600';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0700
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0700
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0700';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: ""
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0800
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0800
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0800';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "abcd"
      };
      try {
        call.formatPhoneNumber(landlineNumber, options, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0900
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0900
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0900';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "adcde";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1000
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1000
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1000';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 8300001);
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1100
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1100';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1200
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1200';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: ""
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1300
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1300';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "abcd"
      };
      try {
        call.formatPhoneNumber(landlineNumber, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1400
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1400';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "adcde";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1500
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1500';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber("", options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1600
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1600';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "cn"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}