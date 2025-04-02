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

import { describe, it, expect } from '@ohos/hypium';
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


export default function observerManagerCallStateTest() {
  describe('ObserverManagerCallStateTest', () => {

    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOff_0100
     * @tc.name  : testTelephonyObserverCallStateChangeOff0100
     * @tc.desc  : Unsubscribe to call status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOff0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          observer.on('callStateChange', (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value != null);
          });
          observer.off("callStateChange");
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOff_0200
     * @tc.name  : testTelephonyObserverCallStateChangeOff0200
     * @tc.desc  : Unsubscribe to call status change event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOff0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          let callback: (value: Value) => void = (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value !== null);
          }
          observer.on('callStateChange', callback);
          observer.off("callStateChange", callback);
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOff_0400
     * @tc.name  : testTelephonyObserverCallStateChangeOff0400
     * @tc.desc  : Unsubscribe to call status change event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        // Indicates that there is no call in progress
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          class Value {
            state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
            number: string = ""
          };
          let callback: (value: Value) => void = (value: Value) => {
            console.info(`${caseName} data ${JSON.stringify(value)}}`);
            ExpectTrue(value !== null);
          };
          observer.on('callStateChange', callback);
          observer.off("callStateChange", callback);
          observer.off("callStateChange", callback);
          done();
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

  });
}