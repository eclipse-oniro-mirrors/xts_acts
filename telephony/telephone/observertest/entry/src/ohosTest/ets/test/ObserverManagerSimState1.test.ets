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

import { describe, afterEach, it, expect, Level, TestType, Size } from '@ohos/hypium';
import observer from '@ohos.telephony.observer';
import sim from '@ohos.telephony.sim';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOn0900
     * @tc.number SUB_Telephony_Observer_SimStateChangeOn_0900
     * @tc.desc   Subscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOn0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOnOptions1700
     * @tc.number SUB_Telephony_Observer_SimStateChangeOnOptions_1700
     * @tc.desc   Subscribe to sim state change events with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOnOptions1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOnOptions1800
     * @tc.number SUB_Telephony_Observer_SimStateChangeOnOptions_1800
     * @tc.desc   Subscribe to sim state change events with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOnOptions1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOnOptions2000
     * @tc.number SUB_Telephony_Observer_SimStateChangeOnOptions_2000
     * @tc.desc   Subscribe to sim state change events with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOnOptions2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOff0300
     * @tc.number SUB_Telephony_Observer_SimStateChangeOff_0300
     * @tc.desc   Unsubscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOff0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOff0400
     * @tc.number SUB_Telephony_Observer_SimStateChangeOff_0400
     * @tc.desc   Unsubscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOff0500
     * @tc.number SUB_Telephony_Observer_SimStateChangeOff_0500
     * @tc.desc   Unsubscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOff0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverOnGetSimActiveState0100
     * @tc.number SUB_Telephony_Observer_OnGetSimActiveState_0100
     * @tc.desc   Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnGetSimActiveState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOnGetSimActiveState0100';
      console.info(`${caseName} test start`);
      try {
        observer.onGetSimActiveState(null, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectFail();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOnGetSimActiveState0200
     * @tc.number SUB_Telephony_Observer_OnGetSimActiveState_0200
     * @tc.desc   Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnGetSimActiveState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOnGetSimActiveState0200';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = -1;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectFail();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOnGetSimActiveState0300
     * @tc.number SUB_Telephony_Observer_OnGetSimActiveState_0300
     * @tc.desc   Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnGetSimActiveState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOnGetSimActiveState0300';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 0;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectTrue(data);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOnGetSimActiveState0400
     * @tc.number SUB_Telephony_Observer_OnGetSimActiveState_0400
     * @tc.desc   Subscribe to sim active state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnGetSimActiveState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOnGetSimActiveState0400';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 1;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectTrue(data);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOnGetSimActiveState0500
     * @tc.number SUB_Telephony_Observer_OnGetSimActiveState_0500
     * @tc.desc   Subscribe to sim active state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnGetSimActiveState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOnGetSimActiveState0500';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 2;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectFail();
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOffGetSimActiveState0100
     * @tc.number SUB_Telephony_Observer_OffGetSimActiveState_0100
     * @tc.desc   Cancel callback when the sim active state is updated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOffGetSimActiveState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOffGetSimActiveState0100';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 0;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectTrue(data);
          if (data) {
            observer.offGetSimActiveState((res: boolean) => {
              console.info(`${caseName} res: ${res}}`);
              ExpectTrue(res);
            });
          }
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOffGetSimActiveState0200
     * @tc.number SUB_Telephony_Observer_OffGetSimActiveState_0200
     * @tc.desc   Cancel callback when the sim active state is updated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOffGetSimActiveState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOffGetSimActiveState0200';
      console.info(`${caseName} test start`);
      try {
        let slotId: number = 1;
        observer.onGetSimActiveState(slotId, (data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          ExpectTrue(data);
          if (data) {
            observer.offGetSimActiveState((res: boolean) => {
              console.info(`${caseName} res: ${res}}`);
              ExpectTrue(res);
            });
          }
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOffGetSimActiveState0300
     * @tc.number SUB_Telephony_Observer_OffGetSimActiveState_0300
     * @tc.desc   Cancel callback when the sim active state is updated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOffGetSimActiveState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverOffGetSimActiveState0300';
      console.info(`${caseName} test start`);
      try {
        let num: number = 1;
        observer.offGetSimActiveState((data: boolean) => {
          console.info(`${caseName} data: ${data}}`);
          num++;
        });
        ExpectTrue(num === 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}
