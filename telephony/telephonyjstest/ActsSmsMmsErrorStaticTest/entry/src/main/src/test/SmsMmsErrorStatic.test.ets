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
import { BusinessError, AsyncCallback } from '@ohos.base';
import sms from '@ohos.telephony.sms';
import hilog from '@ohos.hilog';

const rightPhone: string = "17301740854";
const emptyStr: string = "";
const errPhone: string = "125qqqq555";
const emergencyPhone: string = "120";
const specialPhone: string = "10086";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SmsMmsErrorTestStaticTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function SmsMmsErrorTestStatic() {
  describe('SmsMmsErrorTestStatic',  () => {
    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<int> = [];
    let pdu: Array<int> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let pdu1: Array<int> = [0x01];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.number  Telephony_SmsMms_createMessage_Async_0200
     * @tc.name    Telephony_SmsMms_createMessage_Async_static_0200
     * @tc.desc    Call interface CreateMessage,The incoming PDU is empty, the specification is 3GPP, shortMessage isn't empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("Telephony_SmsMms_createMessage_Async_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_SmsMms_createMessage_Async_static_0200";
      try {
        sms.createMessage(rawArrayNull, '3gpp', (err: BusinessError<void>|null, data: sms.ShortMessage|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} Telephony_SmsMms_createMessage_Async_0200 finish`);
            ExpectTrue(true);
            done();
          } else {
            expect(data?.visibleMessageBody !== 'visibleMessageBody').assertTrue();
            expect(data?.visibleRawAddress !== 'visibleRawAddress').assertTrue();
            expect(data?.messageClass !== sms.ShortMessageClass.FORWARD_MESSAGE).assertTrue();
            expect(data?.protocolId !== -1).assertTrue();
            expect(data?.scAddress !== 'scAddress').assertTrue();
            expect(data?.scTimestamp !== -1).assertTrue();
            expect(data?.isReplaceMessage !== true).assertTrue();
            expect(data?.hasReplyPath !== true).assertTrue();
            expect(data?.status !== -1).assertTrue();
            expect(data?.isSmsStatusReportMessage !== true).assertTrue();
            hilog.info(domain, tag, `${caseName} createMessage fail`);
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

    /**
     * @tc.number  Telephony_SmsMms_createMessage_Promise_0200
     * @tc.name    Telephony_SmsMms_createMessage_Promise_static_0200
     * @tc.desc    Call interface CreateMessage,The incoming PDU is empty, the specification is 3GPP,promise returns the result Don't empty          
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("Telephony_SmsMms_createMessage_Promise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_SmsMms_createMessage_Promise_static_0200";
      try {
        await sms.createMessage(rawArrayNull, '3gpp')
			  hilog.info(domain, tag, `${caseName} createMessage fail`);
        expect().assertFail();
			  done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error as BusinessError)}`);
        ExpectTrue(true);
      }
      done();
    });

    /**
     * @tc.number  Telephony_SmsMms_hasSmsCapability_0100
     * @tc.name    Telephony_SmsMms_hasSmsCapability_static_0100
     * @tc.desc    Check whether the Ims SMS function is supported
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("Telephony_SmsMms_hasSmsCapability_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_SmsMms_hasSmsCapability_static_0100";
      try {
        let result = sms.hasSmsCapability();
        hilog.info(domain, tag, `${caseName} createMessage success, result = ${result}`);
        expect(result === false || result === true).assertTrue();
        done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  Telephony_SmsMms_getDefaultSmsSlotId_Promise_0100
     * @tc.name    Telephony_SmsMms_getDefaultSmsSlotId_Promise_static_0100
     * @tc.desc    Set the default card slot ID for sending SMS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("Telephony_SmsMms_getDefaultSmsSlotId_Promise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "Telephony_SmsMms_getDefaultSmsSlotId_Promise_static_0100";
      try {
        let result = await sms.getDefaultSmsSlotId();
        hilog.info(domain, tag, `${caseName} getDefaultSmsSlotId finish , result = ${result}`);
        expect(result === 0 || result === 1).assertTrue();
        done();
      } catch(error) {
        hilog.error(domain, tag, `${caseName} fail, err: ${error}`);
        expect().assertFail();
        done();
      }
    });
  });
}