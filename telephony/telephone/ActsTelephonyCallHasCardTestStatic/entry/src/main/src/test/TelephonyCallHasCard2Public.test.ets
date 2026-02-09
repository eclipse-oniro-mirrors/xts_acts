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
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'

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
const emergencyPhoneNumber: string = "120";
const landlineNumber: string = "057126885879";


export default function HasCard2PublicTest() {
  describe('TelephonyCallHasCard2PublicTest', (): void => {

    /**
     * @tc.name   testTelephonyCallManagerHasVoiceCapability0100
     * @tc.number SUB_Telephony_CallManager_HasVoiceCapability_0100
     * @tc.desc   Check that the current device has a voice call capability api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerHasVoiceCapability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerHasVoiceCapability0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let hasVoiceCapability: boolean = call.hasVoiceCapability();
        hilog.info(domain, tag, '%{public}s', caseName +'success, hasVoiceCapability->'+JSON.stringify(hasVoiceCapability));
        ExpectTrue(hasVoiceCapability == true);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'failed, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0100
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber(phoneNumber, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber fail, err = '+JSON.stringify(err.message));
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish, data->'+JSON.stringify(data));
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0200
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber(zonePhoneNumber, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber fail, err = '+JSON.stringify(err.message));
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber finish, data->'+JSON.stringify(data));
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0300
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber(formatPhoneNumber, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber fail, err = '+JSON.stringify(err.message));
            ExpectFail();
            done();
          } else {
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber finish, data->'+JSON.stringify(data));
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0400
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber("", (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err = '+JSON.stringify(err));
            ExpectTrue(err.code == 8300001);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber finish, data->'+JSON.stringify(data));
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0450
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0450
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0450';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber("10000000000", (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber fail, err = '+JSON.stringify(err.message));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber finish, data->'+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0500
     * @tc.desc   Formatting the phone numbers. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        call.formatPhoneNumber(landlineNumber, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err = '+JSON.stringify(err));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'formatPhoneNumber finish, data->'+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0600
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0600';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err->'+JSON.stringify(err));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0700
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0700
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0700';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: ""
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err->'+JSON.stringify(err));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0800
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0800
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0800';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "abcd"
      };
      try {
        call.formatPhoneNumber(landlineNumber, options, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err->'+JSON.stringify(err));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber0900
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_0900
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber0900';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      const phoneNumber: string = "adcde";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err->'+JSON.stringify(err));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
            ExpectTrue(true);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1000
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1000
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the callback asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1000';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      const phoneNumber: string = "";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options, (err: BusinessError<void>|null, data: String|undefined) => {
          if (err) {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail, err->'+JSON.stringify(err));
            ExpectTrue(err.code == 8300001);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1100
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1100
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectTrue(true);
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1200
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1200
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: ""
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectTrue(true);
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1300
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1300
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "abcd"
      };
      try {
        call.formatPhoneNumber(landlineNumber, options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectTrue(true);
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1400
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1400
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      const phoneNumber: string = "adcde";
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectTrue(true);
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1500
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1500
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "CN"
      };
      try {
        call.formatPhoneNumber("", options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectFail();
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectTrue(err.code == 8300001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerFormatPhoneNumber1600
     * @tc.number SUB_Telephony_CallManager_FormatPhoneNumber_1600
     * @tc.desc   Format the phone number, and you can set the formatting parameters. Use the Promise asynchronous callback api7+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerFormatPhoneNumber1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerFormatPhoneNumber1600';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      let options: call.NumberFormatOptions = {
        countryCode: "cn"
      };
      try {
        call.formatPhoneNumber(phoneNumber, options).then((data: string) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber finish + '+JSON.stringify(data));
          ExpectTrue(true);
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName +' formatPhoneNumber fail promise, err-'+JSON.stringify(err));
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  fail, err->'+JSON.stringify(err));
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0100
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0100
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber(phoneNumber, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0300
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0300
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber("abcde", (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0400
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber("", (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0500
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0500
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber("156179228080000", (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0600
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0600
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber("!@#$%", (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0700
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0700
     * @tc.desc   Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber("abc12345678", (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_0800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1000
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1000
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1000';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "abcde";
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1100
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1100
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "";
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1200
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1200
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "156179228080000";
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1300
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1300
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "!@#$%";
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            expect(true).assertEqual(err?.code === 8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1400
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const options: call.EmergencyNumberOptions = {
          slotId: 0
        };
        call.isEmergencyPhoneNumber("abc12345678", options, (err: BusinessError<void> | null, data: boolean | undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data === false);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_1800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_1800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_1800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        if (sim.getMaxSimCount() > 1) {
          const phoneNumber: string = "";
          const options: call.EmergencyNumberOptions = {
            slotId: 1
          };
          call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (err?.code) {
              hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
              ExpectFail();
              done();
            }
          });
        } else {
          hilog.error(domain, tag, `${caseName}：Not support dual SIM cards.`);
          ExpectTrue(true);
          done();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2000
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2000
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2000';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        if (sim.getMaxSimCount() > 1) {
          const phoneNumber: string = "!@#$%";
          const options: call.EmergencyNumberOptions = {
            slotId: 1
          };
          call.isEmergencyPhoneNumber(phoneNumber, options, (err: BusinessError<void> | null, data: boolean | undefined) => {
            if (err?.code) {
              hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 8300001);
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
              done();
            }
          });
        } else {
          hilog.info(domain, tag, `${caseName}：Not support dual SIM cards.`);
          ExpectTrue(true);
          done();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2200
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2200
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        call.isEmergencyPhoneNumber(phoneNumber).then((data: boolean) => {
          hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
          expect(true).assertEqual(data === false);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(error)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2400
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2400
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let options: call.EmergencyNumberOptions = {
          slotId: 0
        }
        call.isEmergencyPhoneNumber(phoneNumber, options).then((data: boolean) => {
          hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
          expect(true).assertEqual(data === false);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(error)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2600
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2600
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0-1
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let options: call.EmergencyNumberOptions = {
          slotId: 3
        }
        call.isEmergencyPhoneNumber(emergencyPhoneNumber, options).then((data: boolean) => {
          hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(error)}`);
          expect(true).assertEqual((error as BusinessError)?.code === 8300001);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2700
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2700
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "!@#$%";
        call.isEmergencyPhoneNumber(phoneNumber).then((data: boolean) => {
          hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise err->${JSON.stringify(error)}`);
          ExpectTrue((error as BusinessError)?.code == 8300001);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerIsEmergencyPhoneNumber_static_2800
     * @tc.number SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2800
     * @tc.desc   Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumber_static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumber_static_2800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const phoneNumber: string = "!@#$%";
        let options: call.EmergencyNumberOptions = {
          slotId: 0
        }
        call.isEmergencyPhoneNumber(phoneNumber, options).then((data: boolean) => {
          ExpectFail();
          hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise data->${JSON.stringify(data)}`);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise err->${JSON.stringify(error)}`);
          expect(true).assertEqual((error as BusinessError)?.code == 8300001);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName} test end `);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

  });
}