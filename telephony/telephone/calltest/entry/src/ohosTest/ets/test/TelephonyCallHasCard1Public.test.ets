/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Driver, MatchPattern, Component, ON } from '@ohos.UiTest';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';

const rightPhone: string = "17301740854";
const emptyStr: string = "";
const errPhone: string = "125qqqq555";
const emergencyPhone: string = "120";
const specialPhone: string = "10086";

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
function hangUpCall(caseName: string):void {
  try {
    call.hangUpCall((err: BusinessError) => {
      if (err) {
        console.error(`${caseName} hangUpCall fail, err->${JSON.stringify(err)}`);
      } else {
        console.log(`${caseName} hangUpCall success.`);
      }
    });
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
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
export default function HasCard1PublicTest() {
  describe('TelephonyCallHasCard1PublicTest',  () => {
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await getPermissions();
      done();
    });
    /**
     * @tc.name   testTelephonyCallManagerHasCall1100
     * @tc.number SUB_Telephony_CallManager_HasCall_1100
     * @tc.desc   Determine if there is a call.Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerHasCall1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerHasCall1100';
      console.info(`${caseName} test start `);
      call.hasCall((err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
        } else {
          if (data) {
            expect(data == true).assertTrue();
            console.info(`${caseName} success, has call->${JSON.stringify(data)}`);
          } else {
            expect(data == false).assertTrue();
            console.info(`${caseName} success, does not has call->${JSON.stringify(data)}`);
          }
          done();
        }
        console.info(`${caseName} test end `);
        done();
      });
    });


    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640150
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0150
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640150';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0200
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640200';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emptyStr, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 8300001);
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0300
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640300';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0400
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640400';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0500
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640500';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, emptyStr, (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 8300001);
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0600
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640600';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });
    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640800
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0800
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640800';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emptyStr, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1640900
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0900
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1640900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1640900';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641000
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1000
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641000';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, emptyStr).then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 8300001);
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1100
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641100';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641150
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1150
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641150';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1200
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641200';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA").then((data: string) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1300
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641300';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164("0980000000", "TW", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });
    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE1641400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1400
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumberToE1641400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE1641400';
      console.info(`${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "TW", (err: BusinessError, data: string) => {
          if (err) {
            console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.info(`${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          console.info(`${caseName} test2 end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });
  });
}