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
import { BusinessError, AsyncCallback } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';
import sms from '@ohos.telephony.sms';

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
const emergencyPhoneNumber: string = "911";
const landlineNumber: string = "057126885879";
const telphoneErr: string = '+861xxxxxxxxxxx';
const CALL_NUMBER = '10086';

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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerHasCallSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerGetCallState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerGetCallState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerGetCallStateSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

     /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1500
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641500
     * @tc.desc   : Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
    */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641500';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(null, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectFail();
          }
        })
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end `);
        done();
      }
    });

    /*
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumberToE164_1600
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumberToE1641600
     * @tc.desc   : Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
    */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641600';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(null, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2900
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber2900
     * @tc.desc   : Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber2900';
      console.info(`${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber(null, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.info(`${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        })
      }catch (err) {
        console.info(`222${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_3000
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber3000
     * @tc.desc   : Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber3000';
      console.info(`${caseName} test start`);
      let options: call.EmergencyNumberOptions = {
        slotId: 0
      }
      try {
        call.isEmergencyPhoneNumber(null, options).then((data: boolean) => {
          ExpectFail();
          console.info(`${caseName} isEmergencyPhoneNumber,promise data->${JSON.stringify(data)}`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} isEmergencyPhoneNumber fail,promise err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        });
      }catch (err) {
        console.info(`222${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_IsEmergencyPhoneNumber_3100
     * @tc.name   : testTelephonyCallManagerIsEmergencyPhoneNumber3100
     * @tc.desc   : Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerIsEmergencyPhoneNumber3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber3100';
      console.info(`${caseName} test start`);
      let options: call.EmergencyNumberOptions = {
        slotId: 0
      }
      try {
        call.isEmergencyPhoneNumber(null, options, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`000${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            ExpectFail();
            console.info(`111${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            done();
          }
        })
      }catch (err) {
        console.info(`222${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumber_1700
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumber1700
     * @tc.desc   : Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1700';
      console.info(`${caseName} test start`);
      const phoneNumber: string = "";
      try {
        call.formatPhoneNumber(phoneNumber, null, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumber_1800
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumber1800
     * @tc.desc   : Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1800';
      console.info(`${caseName} test start`);
      let options: call.NumberFormatOptions = {
        countryCode: "cn"
      };
      try {
        call.formatPhoneNumber(null, options).then((data: string) => {
          console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} formatPhoneNumber fail promise, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_FormatPhoneNumber_1900
     * @tc.name   : testTelephonyCallManagerFormatPhoneNumber1900
     * @tc.desc   : Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1900';
      console.info(`${caseName} test start`);
      try {
        call.formatPhoneNumber(null, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} formatPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.info(`${caseName} formatPhoneNumber finish + ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}  fail, err->${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Telephony_SmsMms_NoPermission_0100
     * @tc.name      : testTelephonySmsNoPermission0100
     * @tc.desc      : 201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTelephonySmsNoPermission0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySmsNoPermission0100';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim);
        if (hasSim) {
          let sendCallback: AsyncCallback<sms.ISendShortMessageCallback> = (err: BusinessError, data: sms.ISendShortMessageCallback) => {
            if (err) {
              console.info(`${caseName} sendCallback: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} sendCallback: data->${JSON.stringify(data)}`);
              ExpectTrue(data.result == 1);
              done();
            }
          };
          let deliveryCallback: AsyncCallback<sms.IDeliveryShortMessageCallback> = (err: BusinessError, data: sms.IDeliveryShortMessageCallback) => {
            console.info(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          };
          let options: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationPort: 1000,
            destinationHost: telphoneErr,
            serviceCenter: telphoneErr,
            sendCallback: sendCallback,
            deliveryCallback: deliveryCallback
          };
          sms.sendMessage(options)
        } else {
          console.info(`${caseName} no sim`);
          ExpectFail();
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err.code}`);
        ExpectTrue(err.code === 201);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Telephony_SmsMms_NoPermission_0200
     * @tc.name      : testTelephonySmsNoPermission0200
     * @tc.desc      : Send a text message. Use Promise asynchronous callback. version 10
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTelephonySmsNoPermission0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySmsNoPermission0200';
      console.info(`${caseName} test start`);
      if(sim.getMaxSimCount()>1){
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 1,
            content: '',
            destinationHost: '',
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          ExpectFail();
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        ExpectFail();
        done();
      }
      }else{
        console.info(`${caseName}：Not support dual SIM cards.`);
        ExpectTrue(true);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Telephony_SmsMms_NoPermission_0200
     * @tc.name      : testTelephonySmsNoPermission0300
     * @tc.desc      : Send a text message. Use callback for asynchronous callback. version 10
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTelephonySmsNoPermission0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySmsNoPermission0300';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: "SMS message content",
            destinationHost: telphoneErr,
            destinationPort: 1000,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${caseName}: success`);
              ExpectFail();
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          ExpectFail();
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number Telephony_CallManager_Dial_Promise_0200
     * @tc.name testTelephonyCallManagerDialPromise_0200
     * @tc.desc PhoneNumber: 10086, has options. Call dila api by permise
     *         The return value is true
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 0
     */
    it('Telephony_CallManager_Dial_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let CaseName = 'Telephony_CallManager_Dial_Promise_0200';
      call.dial(CALL_NUMBER).then((data) => {
        console.info(CaseName + " case success" + JSON.stringify(data));
        expect(data == true).assertTrue();
        done();
        return;
      }).catch((err: BusinessError) => {
        console.info(CaseName + ' case error' + JSON.stringify(err));
        done();
      });
    });
  });
}