/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export function toString(data: object) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
}
;

export default function callJsunit() {
  describe('callTest', (): void => {
    console.log("==========> call Test start ==========>");

    /**
     * @tc.name   Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.number Telephony_Call_HasVoiceCapability_HasVoiceCapability
     * @tc.desc   Return type test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_HasVoiceCapability_HasVoiceCapability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'Telephony_Call_HasVoiceCapability_HasVoiceCapability';
        hilog.info(domain, tag, '%{public}s', caseName + ' Test start');
        let ret = false;
        let voiceCapablity = call.hasVoiceCapability();
        if (voiceCapablity === true || voiceCapablity === false) {
          ret = true;
        }
        expect(ret).assertTrue();
        hilog.info(domain, tag, '%{public}s', caseName + ' Test end');
        done();
      });

    /**
     * @tc.name   Telephony_Call_Call_MakeCall_0100
     * @tc.number Telephony_Call_Call_MakeCall_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Telephony_Call_Call_MakeCall_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = "Telephony_Call_Call_MakeCall_0100";
        let simState: sim.SimState = sim.getSimStateSync(0);
        if(simState == sim.SimState.SIM_STATE_UNKNOWN)
        {
          hilog.info(domain, tag, '%{public}s', caseName + ' faild, SIM_STATE_UNKNOWN');
          done();
        }else{
          hilog.info(domain, tag, '%{public}s', caseName + ' start');
          try {
            let telNumber: string = "";
            call.makeCall(telNumber, (error: BusinessError<void>|null) => {
              if (error) {
                hilog.info(domain, tag, '%{public}s', caseName +'makeCall callback: err->'+JSON.stringify(error));
                expect(false).assertTrue();
                done();
              }
              done();
            });
          } catch (err) {
            expect(false).assertTrue();
            done();
          }
          hilog.info(domain, tag, '%{public}s', caseName + ' Test end');
        }
      });

  });
}