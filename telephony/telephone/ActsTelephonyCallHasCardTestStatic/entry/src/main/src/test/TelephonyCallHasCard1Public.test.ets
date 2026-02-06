/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import call from '@ohos.telephony.call';
import { BusinessError, AsyncCallback } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import sms from '@ohos.telephony.sms';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'

const rightPhone: string = "17301740854";
const emptyStr: string = "";
const errPhone: string = "125qqqq555";
const emergencyPhone: string = "120";
const specialPhone: string = "10086";


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
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
  let list: Array<string> = ['ohos.permission.ANSWER_CALL', 'ohos.permission.WRITE_CALL_LOG', 'ohos.permission.READ_CALL_LOG'];
  try {
    let userId: int = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: int = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo =  bundleManager.getApplicationInfoSync('com.example.calltest.static', applicationFlags, userId);
    let tokenId: long = applicationInfo.accessTokenId;
    let tokenValue:int = tokenId as int;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenValue,list[index] as Permissions, 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`)
  }
  console.info('getPermission end');
}

export default function HasCard1PublicTest() {
  describe('TelephonyCallHasCard1PublicTest', (): void => {
      beforeAll(async (done: () => void) => {
        console.info('getPermission beforeAll');
        await getPermissions();
        done();
      });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0150
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0150
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0150';
      hilog.info(domain, tag, `${caseName} test start `);
      done();
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0200
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0200';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emptyStr, "CN", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code == 8300001);
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectFail();
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0300
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0300';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0400
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0400';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0500
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0500';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, emptyStr, (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code == 8300001);
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectFail();
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0600
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0600';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0800
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0800
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0800';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emptyStr, "CN").then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          ExpectTrue((error as BusinessError)?.code === 8300001);
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_0900
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_0900
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_0900';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(errPhone, "CN").then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1000
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1000
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1000';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, emptyStr).then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          expect(true).assertEqual((error as BusinessError)?.code == 8300001);
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1100
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1100';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(emergencyPhone, "CN").then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1150
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1150
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1150';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(specialPhone, "CN").then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1200
     * @tc.desc   Format the phone number in E.164 representation. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1200';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "AAA").then((data: string) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1300
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1300';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164("0980000000", "TW", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumberToE164_static_1400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumberToE164_1400
     * @tc.desc   Format the phone number in E.164 representation. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerFormatPhoneNumberToE164_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumberToE164_static_1400';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        call.formatPhoneNumberToE164(rightPhone, "TW", (err: BusinessError<void> | null, data: string | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} success, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName} test2 end `);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
    });

  });
}