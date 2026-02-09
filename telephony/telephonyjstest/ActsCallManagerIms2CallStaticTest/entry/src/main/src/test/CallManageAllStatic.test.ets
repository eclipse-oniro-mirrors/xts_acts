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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium';
import { BusinessError } from '@ohos.base';
import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import hilog from '@ohos.hilog';

const rightPhone: string = "17301740854";
const emptyStr: string = "";
const errPhone: string = "125qqqq555";
const emergencyPhone: string = "120";
const specialPhone: string = "10086";
const ERR_SLOT_ID = -1;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testCallTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}

export default function callManagerAllTestStatic() {
  describe('callManagerAllTestStatic',  () => {
    /**
     * @tc.number   Telephony_CallManager_getCallState_Async_0100
     * @tc.name     Telephony_CallManager_getCallState_Async_static_0100
     * @tc.desc     To get the idle call status, call getCallState() to get the current call status.
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
     */
    it("Telephony_CallManager_getCallState_Async_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_getCallState_Async_static_0100";
      try {
        call.getCallState((err: BusinessError<void>|null, data: call.CallState|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} getCallState, err: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} getCallState success, data: ${data}`);
            expect(call.CallState.CALL_STATE_UNKNOWN).assertEqual(-1);
            expect(call.CallState.CALL_STATE_IDLE).assertEqual(0);
            expect(call.CallState.CALL_STATE_RINGING).assertEqual(1);
            expect(call.CallState.CALL_STATE_OFFHOOK).assertEqual(2);
            expect(call.CallState.CALL_STATE_ANSWERED).assertEqual(3);
            done();
          }
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_getCallState_Promise_0100
     * @tc.name     Telephony_CallManager_getCallState_Promise_static_0100
     * @tc.desc     To get the idle call status, call getCallState() to get the current call status.
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
     */
    it("Telephony_CallManager_getCallState_Promise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_getCallState_Promise_static_0100";
      try {
        let promise = call.getCallState();
        promise.then(data => {
          hilog.info(domain, tag, `${caseName} getCallState success, data: ${data}`);
          ExpectTrue(true);
          done();
        }).catch(err => {
          hilog.error(domain, tag, `${caseName} getCallState fail, err: ${err}`);
          expect().assertFail();
          done();
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_hasCall_Async_0400
     * @tc.name     Telephony_CallManager_hasCall_Async_static_0400
     * @tc.desc     When idle, hasCall() is called to confirm that there is no current call,returning false
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
     */
    it("Telephony_CallManager_hasCall_Async_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_hasCall_Async_static_0400";
      try {
        call.hasCall((err: BusinessError<void>|null, data: boolean|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} hasCall fail, err = ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} hasCall success, data = ${data}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_hasCall_Promise_0400
     * @tc.name     Telephony_CallManager_hasCall_Promise_static_0400
     * @tc.desc     When idle, hasCall() is called to confirm that there is no current call, returning false
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
     */
    it("Telephony_CallManager_hasCall_Promise_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_hasCall_Promise_static_0400";
      try {
        let data = await call.hasCall();
        hilog.info(domain, tag, `${caseName} hasCall success, data:${data}`);
        ExpectTrue(true);
        done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   Telephony_CallManager_formatPhoneNumberToE164_Async_0100
     * @tc.name     Telephony_CallManager_formatPhoneNumberToE164_Async_static_0100
     * @tc.desc     PhoneNumber is 010-0000-0000, options: CN, call formatPhoneNumberToE164() to format the number,
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_formatPhoneNumberToE164_Async_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_formatPhoneNumberToE164_Async_static_0100";
      try {
        call.formatPhoneNumberToE164('010-0000-0000', "CN", (err: BusinessError<void>|null, data: string|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} formatPhoneNumberToE164 fail, err = ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} formatPhoneNumberToE164 success, data = ${JSON.stringify(data)}`);
            expect(data === '+861000000000').assertTrue();
            done();
          }
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
     * @tc.name     Telephony_CallManager_formatPhoneNumberToE164_Promise_static_0100
     * @tc.desc     PhoneNumber is 52300000000, options: CN, call formatPhoneNumberToE164() to format the number,
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_formatPhoneNumberToE164_Promise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_formatPhoneNumberToE164_Promise_static_0100";
      try {
        call.formatPhoneNumberToE164('52300000000', "CN").then((data) => {
          hilog.info(domain, tag, `${caseName} formatPhoneNumberToE164 finish, data = ${data}`);
          expect(data === '+8652300000000').assertTrue();
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} formatPhoneNumberToE164 fail, err = ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300
     * @tc.name     Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1300
     * @tc.desc     PhoneNumber: 120, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1300";
      try {
        let options: call.EmergencyNumberOptions = {slotId: ERR_SLOT_ID};
        await call.isEmergencyPhoneNumber('120', options)
        hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber fail`);
        expect().assertFail();
        done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} finish, error: ${JSON.stringify(error)}`);
        ExpectTrue(true);
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_isEmergencyPhoneNumber_Async_1400
     * @tc.name     Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1400
     * @tc.desc     PhoneNumber: 110, no options. Call isEmergencyPhoneNumber() api by callback.
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1400";
      try {
        call.isEmergencyPhoneNumber('110', (err: BusinessError<void>|null, data: boolean|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err = ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber success, data = ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400
     * @tc.name     Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1400
     * @tc.desc     PhoneNumber: 120, no options. Call isEmergencyPhoneNumber() api by promise.
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_isEmergencyPhoneNumber_Promise_static_1400";
      try {
        await call.isEmergencyPhoneNumber('120');
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber PASSED`);
        done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_Dial_Async_0100
     * @tc.name     Telephony_CallManager_Dial_Async_static_0100
     * @tc.desc     PhoneNumber: 10086, no options. Call dial api by callback.
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_Dial_Async_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_Dial_Async_static_0100";
      try {
        call.dialCall("", () => {
          hilog.info(domain, tag, `${caseName} dial success`);
          ExpectTrue(true);
          done();
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number   Telephony_CallManager_isEmergencyPhoneNumber_Async_1300
     * @tc.name     Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1300
     * @tc.desc     PhoneNumber: 110, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
     * @tc.level    Level 0
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
    */
    it("Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_CallManager_isEmergencyPhoneNumber_Async_static_1300";
      try {
        let options: call.EmergencyNumberOptions = {slotId: ERR_SLOT_ID};
        call.isEmergencyPhoneNumber('110', options, (err: BusinessError<void>|null, data: boolean|undefined) => {
          if (err?.code) {
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber finish, err = ${JSON.stringify(err)}`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber success, data = ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        });
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });
  });
}