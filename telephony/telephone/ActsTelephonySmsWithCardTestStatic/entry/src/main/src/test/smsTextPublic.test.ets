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
import sms from '@ohos.telephony.sms';
import { AsyncCallback, BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function smsTextPublic() {
  describe('smsTextPublic', (): void => {

    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<int> = [];
    let pdu: Array<int> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let pdu1: Array<int> = [0x01];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic1000
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1000
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic1000';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, '').then((shortMessage: sms.ShortMessage|undefined) => {
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          ExpectTrue((error as BusinessError).code === 8300001);
          hilog.info(domain, tag, `${caseName} fail :${JSON.stringify(error as BusinessError)}`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic1100
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1100
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic1100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu, '', (err: BusinessError<void>|null, shortMessage: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail :${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic1200
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1200
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic1200'
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, '').then((shortMessage:sms.ShortMessage|undefined) => {
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          ExpectFail();
          done();
        }).catch((error: Error) => {
          expect((error as BusinessError)?.code).assertEqual(8300001);
          hilog.error(domain, tag, `${caseName} fail :${JSON.stringify(error as BusinessError)}`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic1300
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1300
     * @tc.desc   Send a text message. 8300003
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic1300'
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu1, specification, (err: BusinessError<void>|null, shortMessage: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail:${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(8300003);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success :${JSON.stringify(shortMessage)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${(err as BusinessError).code}`);
        expect((err as BusinessError)?.code).assertEqual(8300003);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic1500
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1500
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic1500'
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu, "[0x1]").then((shortMessage: sms.ShortMessage|undefined) => {
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          ExpectFail();
          done();
        }).catch((error:Error) => {
          let err = error as BusinessError;
          expect(err?.code).assertEqual(8300003);
          hilog.error(domain, tag, `${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect((err as BusinessError)?.code).assertEqual(8300003);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotIdStatic0100
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0100
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use callback for asynchronous callback.
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsGetDefaultSmsSlotIdStatic0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotIdStatic0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.getDefaultSmsSlotId((err: BusinessError<void>|null, data: int|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName}: getDefaultSmsSlotId err->${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            expect(data).assertEqual(0);
            hilog.info(domain, tag, `${caseName}: data->${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotIdStatic0200
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0200
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use Promise asynchronous callback. version 7
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsGetDefaultSmsSlotIdStatic0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotIdStatic0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.getDefaultSmsSlotId().then((data: int) => {
          hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
          expect(data).assertEqual(0);
          done();
        }).catch((err: Error) => {
          hilog.error(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err as BusinessError)}`);
          expect().assertFail();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotIdStatic0800
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0800
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use Promise asynchronous callback. version 7
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsGetDefaultSmsSlotIdStatic0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotIdStatic0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expect(hasSim).assertTrue();
        if (hasSim) {
          sms.setDefaultSmsSlotId(-1).then(() => {
            hilog.info(domain, tag, `${caseName} setDefaultSmsSlotId success.`);
            sms.getDefaultSmsSlotId().then((data: int) => {
              hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
              expect(data).assertEqual(0);
              done();
            }).catch((err: Error) => {
              hilog.error(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
              expect().assertFail();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} setDefaultSmsSlotId failed, promise: err->${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          });
        } else {
          hilog.info(domain, tag, `${caseName} no sim`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsHasSmsCapabilityStatic0100
     * @tc.number testTelephonySmsMmsHasSmsCapabilityStatic_0100
     * @tc.desc   Check if the current device has the ability to send and receive text messages, which is a synchronization method. version 7
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsHasSmsCapabilityStatic0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsHasSmsCapabilityStatic0100'
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result = sms.hasSmsCapability();
        hilog.info(domain, tag, `${caseName} : ${JSON.stringify(result)}`);
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}  test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSimIdStatic0100
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSimId_0100
     * @tc.desc   Obtain SMS formats supported on IMS. Use callback for asynchronous callback.
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsGetDefaultSmsSimIdStatic0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSimIdStatic0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expect(hasSim).assertTrue();
        if (hasSim) {
          sms.getDefaultSmsSimId((err: BusinessError<void>|null, data: int|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} callback: err->${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} callback: data->${JSON.stringify(data)}`);
              expect(true).assertEqual(data !== null);
              done();
            }
          });
        } else {
          hilog.info(domain, tag, `${caseName} no sim`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSimIdStatic0200
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSimId_0200
     * @tc.desc   Obtain SMS formats supported on IMS. Use Promise asynchronous callback.
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsGetDefaultSmsSimIdStatic0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSimIdStatic0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        hilog.info(domain, tag, `${caseName} hasSim->${hasSim}`);
        expect(true).assertEqual(hasSim === true);
        if (hasSim) {
          sms.getDefaultSmsSimId().then((data: int|undefined) => {
            hilog.info(domain, tag, `${caseName} promise: data->${JSON.stringify(data)}`);
            expect(true).assertEqual(data !== null);
            done();
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} promise: err->${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          });
        } else {
          hilog.info(domain, tag, `${caseName} no sim`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} err:${err}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Telephony_SmsMms_getSendSmsResult_Async_0100
     * @tc.number Telephony_SmsMms_getSendSmsResult_Async_0100
     * @tc.desc   Function test
     * @tc.level  Level 1
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it('Telephony_SmsMms_getSendSmsResult_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(sms.SendSmsResult.SEND_SMS_SUCCESS == 0).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_UNKNOWN == 1).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF == 2).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE == 3).assertTrue();
      done();
    });

    /**
     * @tc.name   Telephony_SmsMms_ShortMessageClass_Async_0100
     * @tc.number Telephony_SmsMms_ShortMessageClass_Async_0100
     * @tc.desc   Function test
     * @tc.level  Level 1
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it('Telephony_SmsMms_ShortMessageClass_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(sms.ShortMessageClass.UNKNOWN == 0).assertTrue();
      expect(sms.ShortMessageClass.INSTANT_MESSAGE == 1).assertTrue();
      expect(sms.ShortMessageClass.OPTIONAL_MESSAGE == 2).assertTrue();
      expect(sms.ShortMessageClass.SIM_MESSAGE == 3).assertTrue();
      expect(sms.ShortMessageClass.FORWARD_MESSAGE == 4).assertTrue();
      done();
    });
  });
}