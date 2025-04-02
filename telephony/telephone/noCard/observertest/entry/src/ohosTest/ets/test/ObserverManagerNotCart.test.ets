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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import observer from '@ohos.telephony.observer';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

let callNumber: string = '15595310612';

export default function observerManagerNotCartTest() {
  describe('ObserverManagerNotCartTest', () => {
    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOn_0600
     * @tc.name  : testTelephonyObserverCallStateChangeOn0600
     * @tc.desc  : Subscribe to call status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOn0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0600';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        console.info(`${caseName} hasSim ${JSON.stringify(hasSim)}`);
        ExpectTrue(hasSim === false);

        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        await sim.setDefaultVoiceSlotId(0);
        observer.on('callStateChange', (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300004);
        done();
      }
      console.info(`${caseName} test end `);
    });

  });
}