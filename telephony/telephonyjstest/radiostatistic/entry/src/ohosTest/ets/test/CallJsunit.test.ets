/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';

export function toString(data:object) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
};

export default function callJsunit() {
  describe('callTest', ()=> {
    console.log("==========> call Test start ==========>");

    /**
     * @tc.number Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.name Checks whether a device supports voice calls.
     * @tc.desc Return type test
     */
    it("Telephony_Call_HasVoiceCapability_HasVoiceCapability", 0, async (done:Function)=> {
      let caseName = 'Telephony_Call_HasVoiceCapability_HasVoiceCapability';
      console.log(`==========> ${caseName} Test start ==========>`);
      let ret = false;
      let voiceCapablity = call.hasVoiceCapability();
      if (voiceCapablity === true || voiceCapablity === false) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.number Telephony_Call_Call_MakeCall_0100
     * @tc.name Make a call.
     * @tc.desc Function test
     */
    it("Telephony_Call_Call_MakeCall_0100", 0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0100";
      console.log(`==========> ${caseName} Test start ==========>`);
      try {
        let telNumber = "";
        call.makeCall(telNumber, (error) => {
          if (error) {
            console.log("makeCall callback: err->" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
            return;
          }
          done();
        });
      } catch (err) {
        console.log("makeCall callback: err->" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });

    /**
     * @tc.number Telephony_Call_Call_MakeCall_0200
     * @tc.name Makes a call.
     * @tc.desc Function test
     */
    it("Telephony_Call_Call_MakeCall_0200", 0, async (done:Function)=> {
      let caseName: string = "Telephony_Call_Call_MakeCall_0200";
      console.log(`==========> ${caseName} Test start ==========>`);
      let telNumber = "";
      try {
        call.makeCall(telNumber).then(() => {
          done();
        }).catch((error:BusinessError) => {
          console.log("makeCall callback: err->" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.log("makeCall callback: err->" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.log(`==========> ${caseName} Test end ==========>`);
    });
  });
}