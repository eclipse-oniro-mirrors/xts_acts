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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import call from '@ohos.telephony.call'
import radio from '@ohos.telephony.radio'
import sim from '@ohos.telephony.sim'
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function telSyncTest() {
  describe('telSyncTest', () => {
    hilog.info(domain, tag, '%{public}s','==========> Sync Test start ==========>');
    /**
     * @tc.name   SUB_Telephony_call_hasCallSync_0100
     * @tc.number SUB_Telephony_call_hasCallSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Telephony_call_hasCallSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, '%{public}s','SUB_Telephony_call_hasCallSync_0100 hasCallSync '+ call.hasCallSync());
          expect(call.hasCallSync()).assertFalse();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s','SUB_Telephony_call_hasCallSync_0100 hasCallSync '+ JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
    });

    /**
     * @tc.name   SUB_Telephony_call_getCallStateSync_0100
     * @tc.number SUB_Telephony_call_getCallStateSync_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Telephony_call_getCallStateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let simState: sim.SimState = sim.getSimStateSync(0);
      if(simState == sim.SimState.SIM_STATE_UNKNOWN)
      {
        hilog.info(domain, tag, '%{public}s', 'SUB_Telephony_call_getCallStateSync_0100' + ' faild, SIM_STATE_UNKNOWN');
        done();
      }else {
        try {
          console.info("SUB_Telephony_call_getCallStateSync_0100 getCallStateSync " + call.getCallStateSync());
          expect(call.getCallStateSync()).assertEqual(call.CallState.CALL_STATE_IDLE);
          done();
        } catch (err) {
          console.info("SUB_Telephony_call_getCallStateSync_0100 " + JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
      }
    });
    hilog.info(domain, tag, '%{public}s','==========> Sync Test end ==========>');

  });
}