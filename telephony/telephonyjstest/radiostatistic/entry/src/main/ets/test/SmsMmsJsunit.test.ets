/**
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
import { describe, expect, it } from '@ohos/hypium';
import sms from '@ohos.telephony.sms';
import radio from '@ohos.telephony.radio';
import sim from '@ohos.telephony.sim';

export default function smsUiJsunit() {
  describe('smsUiJsunit', function () {
    var rawArray = [
      0x08, 0x91, 0x68, 0x31, 0x08, 0x20, 0x00, 0x75, 0xF4, 0x24, 0x0D, 0x91,
      0x68, 0x81, 0x29, 0x56, 0x29, 0x83, 0xF6, 0x00, 0x00, 0x12, 0x40, 0x80,
      0x01, 0x02, 0x14, 0x23, 0x02, 0xC1, 0x30
    ];


    /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0100
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
   *             shortMessage Don't empty
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_createMessage_Async_0100', 0, async function (done) {
      sms.createMessage(rawArray, '3gpp', (err, shortMessage) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_createMessage_Async_0100 fail');
          done();
          return;
        }
        console.log("dxj fail shortMessage:" + JSON.stringify(shortMessage));
        expect(shortMessage.visibleMessageBody == "Aa").assertTrue();
        console.log("dxj fail visibleMessageBody:" + shortMessage.visibleMessageBody);
        expect(shortMessage.visibleRawAddress.length !== 0).assertTrue();
        console.log("dxj fail visibleRawAddress:" + shortMessage.visibleRawAddress);
        expect(shortMessage.messageClass !== -1).assertTrue();
        console.log("dxj fail messageClass:" + shortMessage.messageClass);
        expect(shortMessage.protocolId !== -1).assertTrue();
        console.log("dxj fail protocolId:" + shortMessage.protocolId);
        expect(shortMessage.scAddress.length !== 0).assertTrue();
        console.log("dxj fail scAddress:" + shortMessage.scAddress);
        expect(shortMessage.scTimestamp !== 0).assertTrue();
        console.log("dxj fail scTimestamp:" + shortMessage.scTimestamp);
        expect(shortMessage.isReplaceMessage).assertFalse();
        console.log("dxj fail isReplaceMessage:" + shortMessage.isReplaceMessage);
        expect(shortMessage.hasReplyPath).assertFalse();
        console.log("dxj fail hasReplyPath:" + shortMessage.hasReplyPath);
        expect(shortMessage.pdu == undefined).assertFalse();
        console.log("dxj fail pdu:" + shortMessage.pdu);
        expect(shortMessage.status !== -1).assertTrue();
        console.log("dxj fail status:" + shortMessage.status);
        expect(shortMessage.isSmsStatusReportMessage).assertTrue();
        console.log("dxj fail isSmsStatusReportMessage:" + shortMessage.isSmsStatusReportMessage);
        done();
      });
    });

    /*
     * @tc.number  Telephony_SmsMms_createMessage_Async_0300
     * @tc.name    testCreateMessage_0300
     * @tc.desc    Call interface CreateMessage,
     *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
     *             shortMessage Don't empty
     */
    it('Telephony_SmsMms_createMessage_Promise_0100', 0, async function (done) {
      sms.createMessage(rawArray, '3gpp').then(shortMessage => {
        expect(shortMessage.visibleMessageBody == "Aa").assertTrue();
        expect(shortMessage.visibleRawAddress.length !== 0).assertTrue();
        expect(shortMessage.messageClass !== -1).assertTrue();
        expect(shortMessage.protocolId !== -1).assertTrue();
        expect(shortMessage.scAddress.length !== 0).assertTrue();
        expect(shortMessage.scTimestamp !== 0).assertTrue();
        expect(shortMessage.isReplaceMessage).assertFalse();
        expect(shortMessage.hasReplyPath).assertFalse();
        expect(shortMessage.pdu == undefined).assertFalse();
        expect(shortMessage.status !== -1).assertTrue();
        expect(shortMessage.isSmsStatusReportMessage).assertTrue();
        done();
      }).catch(err => {
        expect().assertFail();
        console.log('Telephony_SmsMms_createMessage_Promise_0100 fail' + JSON.stringify(err));
        done();
      });
    });

    /*
   * @tc.number  Telephony_SmsMms_getSendSmsResult_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_getSendSmsResult_Async_0100', 0, async function (done) {
      expect(sms.SendSmsResult.SEND_SMS_SUCCESS == 0).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_UNKNOWN == 1).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF == 2).assertTrue();
      expect(sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE == 3).assertTrue();
      done();
    });

    /*
   * @tc.number  Telephony_SmsMms_ShortMessageClass_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_ShortMessageClass_Async_0100', 0, async function (done) {
      expect(sms.ShortMessageClass.UNKNOWN == 0).assertTrue();
      expect(sms.ShortMessageClass.INSTANT_MESSAGE == 1).assertTrue();
      expect(sms.ShortMessageClass.OPTIONAL_MESSAGE == 2).assertTrue();
      expect(sms.ShortMessageClass.SIM_MESSAGE == 3).assertTrue();
      expect(sms.ShortMessageClass.FORWARD_MESSAGE == 4).assertTrue();
      done();
    });

    /**
     * @tc.number Telephony_Sms_getDefaultSmsSimId_CallBack_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sms_getDefaultSmsSimId_CallBack_0100', 0, async function (done) {
      sms.getDefaultSmsSimId((err, data) => {
        if(err){
          console.info("Telephony_Sms_getDefaultSmsSimId_CallBack_0100 err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`Telephony_Sms_getDefaultSmsSimId_CallBack_0100 callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sms_getDefaultSmsSimId_CallBack_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertFalse();
          done();
        });
      });
    });
    /**
     * @tc.number Telephony_Sms_getDefaultSmsSimId_Promise_0100
     * @tc.name   Test getOpName interface
     * @tc.desc
     */
    it('Telephony_Sms_getDefaultSmsSimId_Promise_0100', 0, async function (done) {
      let promise = sms.getDefaultSmsSimId();
      promise.then(data => {
        console.info("Telephony_Sms_getDefaultSmsSimId_Promise_0100 data = " + JSON.stringify(data));
        sim.hasSimCard(0, (err, data) => {
          console.log(`Telephony_Sms_getDefaultSmsSimId_Promise_0100 hasSimCard callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          expect(data).assertFalse();
          done();
        });
      }).catch(err => {
        console.info("Telephony_Sms_getDefaultSmsSimId_Promise_0100 err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      });
    });
  })
}
