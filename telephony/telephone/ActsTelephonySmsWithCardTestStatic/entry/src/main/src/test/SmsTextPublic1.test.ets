/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium'
import sms from '@ohos.telephony.sms';
import { AsyncCallback, BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SmsTestStaticTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function smsTextNoCardPublic() {
  describe("smsTextDoneCardPublic", () => {

    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<int> = [];
    let pdu: Array<int> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0100
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0100
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification, (err: BusinessError<void>|null, shortMessage: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} fail:${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(8300001);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success:${shortMessage}`);
            ExpectFail();
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
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0200
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0200
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu, specification, (err: BusinessError<void>|null, shortMessage: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail:${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success :${JSON.stringify(shortMessage)}`);
            expect(true).assertEqual(shortMessage !== null);
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
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0300
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0300
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification2, (err: BusinessError<void>|null, shortMessage: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.error(domain, tag, `${caseName} fail:${JSON.stringify(err)}`);
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
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0500
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0500
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification).then((shortMessage: sms.ShortMessage|undefined) => {
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          expect().assertFail();
          done();
        }).catch((error:Error) => {
          let err = error as BusinessError;
          expect(err?.code).assertEqual(8300001);
          hilog.error(domain, tag, `${caseName} fail :${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0600
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0600
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu, specification).then((shortMessage: sms.ShortMessage|undefined) => {
          expect(true).assertEqual(shortMessage !== null);
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          done();
        }).catch((error:Error) => {
          hilog.error(domain, tag, `${caseName} fail :${JSON.stringify(error as BusinessError)}`);
          expect().assertFail();
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
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0700
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0700
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification2).then((shortMessage: sms.ShortMessage|undefined) => {
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          expect().assertFail();
          done();
        }).catch((error:Error) => {
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
     * @tc.name   testTelephonySmsMmsCreateMessageStatic0900
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0900
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.level  Level 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     */
    it("testTelephonySmsMmsCreateMessageStatic0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsCreateMessageStatic0900';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        sms.createMessage(pdu, '').then((shortMessage: sms.ShortMessage|undefined) => {
          expect().assertFail();
          hilog.info(domain, tag, `${caseName} success:${JSON.stringify(shortMessage)}`);
          done();
        }).catch((error:Error) => {
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
     * @tc.name    Telephony_SmsMms_createMessage_Promise_static_0300
     * @tc.number  Telephony_SmsMms_createMessage_Async_0300
     * @tc.desc    Call interface CreateMessage,
     *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
     *             shortMessage Don't empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('Telephony_SmsMms_createMessage_Promise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let rawArray: Array<int> = [
        0x08, 0x91, 0x68, 0x31, 0x08, 0x20, 0x00, 0x75, 0xF4, 0x24, 0x0D, 0x91,
        0x68, 0x81, 0x29, 0x56, 0x29, 0x83, 0xF6, 0x00, 0x00, 0x12, 0x40, 0x80,
        0x01, 0x02, 0x14, 0x23, 0x02, 0xC1, 0x30
      ];
      sms.createMessage(rawArray, '3gpp').then((shortMessage: sms.ShortMessage|undefined) => {
        expect(shortMessage?.protocolId !== -1).assertTrue();
        expect(shortMessage?.scTimestamp !== 0).assertTrue();
        expect(shortMessage?.pdu == undefined).assertFalse();
        expect(shortMessage?.status !== -1).assertTrue();
        done();
      }).catch((err: Error) => {
        let error = err as BusinessError;
        expect().assertFail();
        hilog.info(domain, tag, 'Telephony_SmsMms_createMessage_Promise_static_0300 fail' + JSON.stringify(error));
        done();
      });
    });

  })
}