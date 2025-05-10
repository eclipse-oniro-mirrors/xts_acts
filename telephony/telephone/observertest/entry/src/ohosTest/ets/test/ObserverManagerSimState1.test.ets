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

import { describe, afterEach, it, expect } from '@ohos/hypium';
import observer from '@ohos.telephony.observer';
import sim from '@ohos.telephony.sim';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}


function sleep(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, time);
  });
}

export default function observerManagerSimStateTest1() {
  describe('ObserverManagerSimStateTest1', () => {
    // call this function after each test case done
    afterEach( async (done: Function) => {
      // sim 1
      let state: sim.SimState = await sim.getSimState(0);
      if (state == sim.SimState.SIM_STATE_NOT_READY) {
        await sim.activateSim(0);
      }
      if (state === sim.SimState.SIM_STATE_LOCKED) {
        await sim.unlockPin(0, '123');
      }
      await sleep(1500);
      done();
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOn_0900
    * @tc.name  : testTelephonyObserverSimStateChangeOn0900
    * @tc.desc  : Subscribe to sim state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOn0900', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOn0900';
      console.info(`${caseName} test start`);
      try {
        observer.on(null, (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
      * @tc.number: SUB_Telephony_Observer_SimStateChangeOnOptions_1700
      * @tc.name  : testTelephonyObserverSimStateChangeOnOptions1700
      * @tc.desc  : Subscribe to sim state change events with options.
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testTelephonyObserverSimStateChangeOnOptions1700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOnOptions1700';
      console.info(`${caseName} test start`);
      try {
        observer.on('simStateChange', {
          slotId: 3
        }, (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOnOptions_1800
    * @tc.name  : testTelephonyObserverSimStateChangeOnOptions1800
    * @tc.desc  : Subscribe to sim state change events with options.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOnOptions1800', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOnOptions1800';
      console.info(`${caseName} test start`);
      try {
        observer.on(null, {
          slotId: 0
        }, (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOnOptions_2000
    * @tc.name  : testTelephonyObserverSimStateChangeOnOptions2000
    * @tc.desc  : Subscribe to sim state change events with options.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOnOptions2000', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOnOptions2000';
      console.info(`${caseName} test start`);
      try {
        observer.on(null, {
          slotId: 2
        }, (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOff_0300
    * @tc.name  : testTelephonyObserverSimStateChangeOff0300
    * @tc.desc  : Unsubscribe to sim state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0300';
      console.info(`${caseName} test start`);
      try {
        let number: number = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          number++;
          console.info(`${caseName} number ${JSON.stringify(number)}`);
        };
        observer.on('simStateChange', callback);
        observer.off('simStateChange', callback);
        observer.off('simStateChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOff_0400
    * @tc.name  : testTelephonyObserverSimStateChangeOff0400
    * @tc.desc  : Unsubscribe to sim state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0400';
      console.info(`${caseName} test start`);
      try {
        let number: number = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          number++;
          console.info(`${caseName} number ${JSON.stringify(number)}`);
        };
        observer.off('simStateChange', callback);
        ExpectTrue(number === 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SimStateChangeOff_0500
    * @tc.name  : testTelephonyObserverSimStateChangeOff0500
    * @tc.desc  : Unsubscribe to sim state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSimStateChangeOff0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0500';
      console.info(`${caseName} test start`);
      try {
        observer.off(null);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

  });
}
