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

const ExpectFail =() =>{
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
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
     * @tc.name   testTelephonyObserverOnSimStateChange0100
     * @tc.number SUB_Telephony_Observer_On_SimStateChange_0100
     * @tc.desc   Subscribe to sim state change events with options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnSimStateChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverOnSimStateChange0100';
      console.info(`${caseName} test start`);
      try {
        observer.onSimStateChange( {
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
     * @tc.name   testTelephonyObserverOffSimStateChange0100
     * @tc.number SUB_Telephony_Observer_Off_SimStateChange_0100
     * @tc.desc   Unsubscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOffSimStateChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSimStateChangeOff0300';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          myNumber++;
          console.info(`${caseName} myNumber ` + myNumber);
        };
        observer.onSimStateChange(callback);
        observer.offSimStateChange(callback);
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
     * @tc.name   testTelephonyObserverOffSimStateChange0200
     * @tc.number SUB_Telephony_Observer_Off_SimStateChange_0200
     * @tc.desc   Unsubscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOffSimStateChange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverOffSimStateChange0200';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          myNumber++;
          console.info(`${caseName} myNumber ` + myNumber);
        };
        observer.offSimStateChange(callback);
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
     * @tc.name   testTelephonyObserverOnIccAccountInfoChange0100
     * @tc.number SUB_Telephony_Observer_On_IccAccountInfoChange_0100
     * @tc.desc   Subscribe to accountInfo of icc change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverOnIccAccountInfoChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverOnIccAccountInfoChange0100';
      let simState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        console.info(`${caseName} failed, SIM STATE IS UNKNOWN`);
        console.info(`${caseName} test end`);
        done();
      } else {
        runTestCaseWithJudgeHasSimCard(caseName, done, async () => {
          try {
            observer.onIccAccountInfoChange( () => {
              (async () => {
                let accInfo: sim.IccAccountInfo = await sim.getSimAccountInfo(0);
                console.info(`${caseName} data ${JSON.stringify(accInfo)}`);
                ExpectTrue(accInfo.isActive);
                done();
              })().awaitSync()
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
     * @tc.name   testTelephonyObserverOffIccAccountInfoChange0200
     * @tc.number SUB_Telephony_Observer_Off_IccAccountInfoChange_0200
     * @tc.desc   Unsubscribe to accountInfo of icc change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverOffIccAccountInfoChange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverOffIccAccountInfoChange0200';
      console.info(`${caseName} test start`);
      try {
        let myNumber: int = 1;
        let callback: () => void = () => {
          myNumber++;
        };
        console.info(caseName + 'myNmuber -> ' + myNumber);
        observer.offIccAccountInfoChange(callback);
        ExpectTrue(myNumber == 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}`);
        ExpectTrue(error == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyObserverOnSimStateChange2300
     * @tc.number SUB_Telephony_Observer_OnSimStateChange_2300
     * @tc.desc   Subscribe to sim state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverOnSimStateChange2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverOnSimStateChange2300';
      console.info(`${caseName} test start`);
      let hasSimCard: Boolean = await sim.hasSimCardSync(0);
      if (!hasSimCard) {
        console.info(`${caseName} failed, No SIM exists in slot 0`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
      try {
        let callback: (data: observer.SimStateData) => void = (data: observer.SimStateData) => {
          const simStateAry: number[] = [
            sim.SimState.SIM_STATE_UNKNOWN,
            sim.SimState.SIM_STATE_LOCKED,
            sim.SimState.SIM_STATE_NOT_PRESENT,
            sim.SimState.SIM_STATE_NOT_READY,
            sim.SimState.SIM_STATE_LOADED,
            sim.SimState.SIM_STATE_READY
          ]

          const simStateAry1: number[] = [
            sim.CardType.UNKNOWN_CARD,
            sim.CardType.SINGLE_MODE_SIM_CARD,
            sim.CardType.SINGLE_MODE_USIM_CARD,
            sim.CardType.SINGLE_MODE_RUIM_CARD,
            sim.CardType.DUAL_MODE_CG_CARD,
            sim.CardType.CT_NATIONAL_ROAMING_CARD,
            sim.CardType.CU_DUAL_MODE_CARD,
            sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
            sim.CardType.DUAL_MODE_UG_CARD,
            sim.CardType.SINGLE_MODE_ISIM_CARD
          ];

          const simStateAry2: number[] = [
            observer.LockReason.SIM_NONE,
            observer.LockReason.SIM_PIN,
            observer.LockReason.SIM_PUK,
            observer.LockReason.SIM_PN_PIN,
            observer.LockReason.SIM_PN_PUK,
            observer.LockReason.SIM_PU_PIN,
            observer.LockReason.SIM_PU_PUK,
            observer.LockReason.SIM_PP_PIN,
            observer.LockReason.SIM_PP_PUK,
            observer.LockReason.SIM_PC_PIN,
            observer.LockReason.SIM_PC_PUK,
            observer.LockReason.SIM_SIM_PIN,
            observer.LockReason.SIM_SIM_PUK,
          ];
          if (simStateAry.includes(data.state) && simStateAry1.includes(data.type) &&
          simStateAry2.includes(data.reason)) {
            console.info(`${caseName} data success ${JSON.stringify(data)}`);
            ExpectTrue(true);
            observer.offSimStateChange();
            done();
          } else {
            console.info(`${caseName} data fail ${JSON.stringify(data)}`);
            ExpectTrue(false);
            done();
          }
        }
        observer.onSimStateChange(callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}
