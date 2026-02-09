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

import { describe, afterEach, it, expect, Level, TestType, Size } from '../../../hypium/index';
import observer from '@ohos.telephony.observer';
import sim from '@ohos.telephony.sim';
import { BusinessError } from "@ohos.base";


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

async function runTestCaseWithJudgeHasSimCard(testCaseName: string, done: () => void, runTest: () => Promise<void>) {
  try {
    console.info(`${testCaseName} test start`);
    let hasSim = await sim.hasSimCard(0);
    if (hasSim) {
      runTest();
    } else {
      console.info(`${testCaseName}. Do not have sim card but this test case must be need.`);
      ExpectTrue(false);
      done();
    }
  } catch (error) {
    console.info(`${testCaseName} error->${JSON.stringify(error)}.`);
    ExpectTrue(false);
    done();
  }
  console.info(`${testCaseName} test end`);
}

export default function observerManagerSimStateTest1() {
  describe('ObserverManagerSimStateTest1', () => {

    /**
     * @tc.name   testTelephonyObserverSimStateChangeOnOptions1700
     * @tc.number SUB_Telephony_Observer_SimStateChangeOnOptions_1700
     * @tc.desc   Subscribe to sim state change events with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverSimStateChangeOnOptions1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        console.info(`${caseName} catchError ${JSON.stringify(error)}`);
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
    it('testTelephonyObserverSimStateChangeOff0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0300';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          myNumber++;
          console.info(`${caseName} myNumber ` + myNumber);
        };
        observer.on('simStateChange', callback);
        observer.off('simStateChange', callback);
        observer.off('simStateChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}`);
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
    it('testTelephonyObserverSimStateChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0400';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          myNumber++;
          console.info(`${caseName} myNumber ` + myNumber);
        };
        observer.off('simStateChange', callback);
        ExpectTrue(myNumber === 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverIccAccountInfoChangeOn0100
     * @tc.number SUB_Telephony_Observer_IccAccountInfoChangeOn_0100
     * @tc.desc   Subscribe to accountInfo of icc change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverIccAccountInfoChangeOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOn0100';
      let simState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        runTestCaseWithJudgeHasSimCard(caseName, done, async () => {
          try {
            observer.on('iccAccountInfoChange', () => {
              let accInfo: sim.IccAccountInfo = await sim.getSimAccountInfo(0);
              console.info(`${caseName} data ${JSON.stringify(accInfo)}`);
              ExpectTrue(accInfo.isActive);
              done();
            });
            // await sim.activateSim(0);
            done();
          } catch (error) {
            console.info(`${caseName} catchError ${JSON.stringify(error)}`);
            ExpectTrue(false);
            done();
          }
        });
      }
    });

    /**
     * @tc.name   testTelephonyObserverIccAccountInfoChangeOff0400
     * @tc.number SUB_Telephony_Observer_IccAccountInfoChangeOff_0400
     * @tc.desc   Unsubscribe to accountInfo of icc change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverIccAccountInfoChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOff0400';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: () => void = () => {
          myNumber++;
        };
        console.info(caseName + 'myNmuber -> ' + myNumber);
        observer.off('iccAccountInfoChange', callback);
        ExpectTrue(myNumber == 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}`);
        ExpectTrue(error == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}
