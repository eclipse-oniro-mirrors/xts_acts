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
import data from '@ohos.telephony.data';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

async function runTestCaseWithJudgeHasSimCard(testCaseName: string, done: Function, runTest: Function) {
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

export default function observerManagerTest() {
  describe('ObserverManagerTest', () => {
    beforeAll(async (done: Function) => {
      await data.setDefaultCellularDataSlotId(0);
      await data.enableCellularData();
      done();
    });
    afterAll(async (done: Function) => {
      await data.setDefaultCellularDataSlotId(0);
      await data.enableCellularData();
      done();
    });


    /* *
    * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOn_0300
    * @tc.name  : testTelephonyObserverNetworkStateChangeOn0300
    * @tc.desc  : Subscribe to network state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 2
    */
    it('testTelephonyObserverNetworkStateChangeOn0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOn0300';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOnId_0500
     * @tc.name  : testTelephonyObserverNetworkStateChangeOnId0500
     * @tc.desc  : Subscribe to network state change events.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testTelephonyObserverNetworkStateChangeOnId0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnId0500';
      console.info(`${caseName} test start `);
      try {
        observer.on('networkStateChange', {
          slotId: 3
        }, (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOnId_0600
     * @tc.name  : testTelephonyObserverNetworkStateChangeOnId0600
     * @tc.desc  : Subscribe to network state change events.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverNetworkStateChangeOnId0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnId0600';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 0
        }, (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOnId_0700
     * @tc.name  : testTelephonyObserverNetworkStateChangeOnId0700
     * @tc.desc  : Subscribe to network state change events.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverNetworkStateChangeOnId0700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnId0700';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 1
        }, (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOff_0100
    * @tc.name  : testTelephonyObserverNetworkStateChangeOff0100
    * @tc.desc  : Unsubscribe to network state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverNetworkStateChangeOff0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        // Unsubscribe to network state change events
        observer.on('networkStateChange', (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        observer.off("networkStateChange");
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOff_0200
     * @tc.name  : testTelephonyObserverNetworkStateChangeOff0200
     * @tc.desc  : Unsubscribe to network state change events.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverNetworkStateChangeOff0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        // Turn on cellular data
        await data.disableCellularData();
        await data.enableCellularData();
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('networkStateChange', callback);
        observer.off("networkStateChange", callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOff_0300
    * @tc.name  : testTelephonyObserverNetworkStateChangeOff0300
    * @tc.desc  : Unsubscribe to network state change events
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 2
    */
    it('testTelephonyObserverNetworkStateChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff0300';
      console.info(`${caseName} test start `);
      try {
        observer.on('networkStateChange', (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        observer.off(null);
        ExpectTrue(false);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_NetworkStateChangeOff_0400
    * @tc.name  : testTelephonyObserverNetworkStateChangeOff0400
    * @tc.desc  : Unsubscribe to network state change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverNetworkStateChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        // Turn on cellular data
        await data.disableCellularData();
        await data.enableCellularData();
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('networkStateChange', callback);
        observer.off("networkStateChange", callback);
        observer.off("networkStateChange", callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CallStateChangeOn_0500
    * @tc.name  : testTelephonyObserverCallStateChangeOn0500
    * @tc.desc  : Subscribe to call status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCallStateChangeOn0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0500';
      console.info(`${caseName} test start `);
      try {
        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        observer.on(null, (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CallStateChangeOnId_0300
    * @tc.name  : testTelephonyObserverCallStateChangeOnId0300
    * @tc.desc  : Subscribe to call status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCallStateChangeOnId0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOnId0300';
      console.info(`${caseName} test start `);
      try {
        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        observer.on(null, {
          slotId: 0
        }, (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
      * @tc.number: SUB_Telephony_Observer_CallStateChangeOnId_0600
      * @tc.name  : testTelephonyObserverCallStateChangeOnId0600
      * @tc.desc  : Subscribe to call status change event.
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testTelephonyObserverCallStateChangeOnId0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOnId0600';
      console.info(`${caseName} test start `);
      try {
        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        observer.on(null, {
          slotId: 1
        }, (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOnId_0700
     * @tc.name  : testTelephonyObserverCallStateChangeOnId0700
     * @tc.desc  : Subscribe to call status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOnId0700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOnId0700';
      console.info(`${caseName} test start `);
      try {
        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        observer.on('callStateChange', {
          slotId: 3
        }, (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOff_0300
     * @tc.name  : testTelephonyObserverCallStateChangeOff0300
     * @tc.desc  : Unsubscribe to call status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCallStateChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0300';
      console.info(`${caseName} test start `);
      try {

        // Indicates that there is no call in progress
        class Value {
          state: call.CallState = call.CallState.CALL_STATE_UNKNOWN
          number: string = ""
        };
        let callback: (value: Value) => void = (value: Value) => {
          console.info(`${caseName} data ${JSON.stringify(value)}}`);
          ExpectTrue(value !== null);
        };
        observer.on('callStateChange', callback);
        observer.off(null, callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });


    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOn_0500
    * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOn0500
    * @tc.desc  : Subscribe to cellular data link connection status.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataConnectionStateChangeOn0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOn0500';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, (data: observer.NetworkState) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });


    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOnId_0500
     * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOnId0500
     * @tc.desc  : Subscribe to the cellular data link connection status of the specified card slot.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOnId0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOnId0500';
      console.info(`${caseName} test start `);
      try {

        // Turn on cellular data
        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on('cellularDataConnectionStateChange', {
          slotId: 3
        }, (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOnId_0600
     * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOnId0600
     * @tc.desc  : Subscribe to the cellular data link connection status of the specified card slot.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOnId0600', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOnId0600';
      console.info(`${caseName} test start `);
      try {

        // Turn on cellular data
        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on(null, {
          slotId: 0
        }, (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOnId_0700
     * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOnId0700
     * @tc.desc  : Subscribe to the cellular data link connection status of the specified card slot.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOnId0700', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOnId0700';
      console.info(`${caseName} test start `);
      try {

        // Turn on cellular data
        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on(null, {
          slotId: 1
        }, (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0100
    * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOff0100
    * @tc.desc  : Remove subscription cellular data link connection status.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff';
      console.info(`${caseName} test start `);
      try {

        // Unsubscribe to network state change events
        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on('cellularDataConnectionStateChange', (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        observer.off("cellularDataConnectionStateChange");
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0200
     * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOff0200
     * @tc.desc  : Remove subscription cellular data link connection status.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Value) => void = (data: Value) => {
          console.info(`testCellularDataConnectionStateChangeOff0200 data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        };

        await data.disableCellularData();

        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on('cellularDataConnectionStateChange', callback);
        observer.off("cellularDataConnectionStateChange", callback);
        await data.enableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0300
    * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOff0300
    * @tc.desc  : Remove subscription cellular data link connection status
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff0300';
      console.info(`${caseName} test start `);
      try {
        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on('cellularDataConnectionStateChange', (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        observer.off(null);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0400
    * @tc.name  : testTelephonyObserverCellularDataConnectionStateChangeOff0400
    * @tc.desc  : Remove subscription cellular data link connection status.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        // Turn on cellular data
        let callback: (data: Value) => void = (data: Value) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data != null);
        };
        await data.disableCellularData();

        class Value {
          state: data.DataConnectState = data.DataConnectState.DATA_STATE_UNKNOWN
          network: radio.RadioTechnology = radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN
        };
        observer.on('cellularDataConnectionStateChange', callback);
        observer.off("cellularDataConnectionStateChange", callback);
        observer.off("cellularDataConnectionStateChange", callback);
        await data.enableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOn_0300
     * @tc.name  : testTelephonyObserverCellularDataFlowChangeOn0300
     * @tc.desc  : Subscribe to the uplink and downlink data flow status of cellular data services.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverCellularDataFlowChangeOn0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOn0300';
      console.info(`${caseName} test start `);
      try {
        await observer.on(null, (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        await data.disableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOnId_0100
     * @tc.name  : testTelephonyObserverCellularDataFlowChangeOnId0100
     * @tc.desc  : Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
   */
    it('testTelephonyObserverCellularDataFlowChangeOnId0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('cellularDataFlowChange', {
          slotId: 0
        }, (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data == 0 || data == 4);
        });
        await data.disableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });


    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOnId_0300
    * @tc.name  : testTelephonyObserverCellularDataFlowChangeOnId0300
    * @tc.desc  : Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 2
  */
    it('testTelephonyObserverCellularDataFlowChangeOnId0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId0300';
      console.info(`${caseName} test start `);
      try {
        observer.on('cellularDataFlowChange', {
          slotId: 3
        }, (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOnId_0400
    * @tc.name  : testTelephonyObserverCellularDataFlowChangeOnId0400
    * @tc.desc  : Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
  */
    it('testTelephonyObserverCellularDataFlowChangeOnId0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId0400';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 0
        }, (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOnId_0500
    * @tc.name  : testTelephonyObserverCellularDataFlowChangeOnId0500
    * @tc.desc  :Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataFlowChangeOnId0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId0500';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 1
        }, (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
   * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOff_0100
   * @tc.name  : testTelephonyObserverCellularDataFlowChangeOff0100
   * @tc.desc  : Remove the uplink and downlink data flow status of subscribed cellular data services.
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it('testTelephony_Observer_CellularDataFlowChangeOff0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephony_Observer_CellularDataFlowChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('cellularDataFlowChange', (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        await data.disableCellularData();
        observer.off('cellularDataFlowChange');
        await data.enableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
   * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOff_0200
   * @tc.name  : testTelephonyObserverCellularDataFlowChangeOff0200
   * @tc.desc  : Remove the uplink and downlink data flow status of subscribed cellular data services.
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it('testTelephony_Observer_CellularDataFlowChangeOff0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephony_Observer_CellularDataFlowChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.DataFlowType) => void = (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOff_0300
    * @tc.name  : testTelephonyObserverCellularDataFlowChangeOff0300
    * @tc.desc  : Remove the uplink and downlink data flow status of subscribed cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataFlowChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff0300';
      console.info(`${caseName} test start `);
      try {
        observer.on('cellularDataFlowChange', (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        });
        observer.off(null);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_CellularDataFlowChangeOff_0400
    * @tc.name  : testTelephonyObserverCellularDataFlowChangeOff0400
    * @tc.desc  : Remove the uplink and downlink data flow status of subscribed cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverCellularDataFlowChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.DataFlowType) => void = (data: observer.DataFlowType) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        await data.disableCellularData();
        observer.on('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        await data.enableCellularData();
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOn_0100
    * @tc.name  : testTelephonyObserverSignalInfoChangeOn0100
    * @tc.desc  : Subscribe signal status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOn0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOn0100';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          await data.setDefaultCellularDataSlotId(0);
          observer.on('signalInfoChange', (data: Array<radio.SignalInformation>) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(true);
          });
          done();
        } else {
          console.error(`${caseName} This test case requires an environment where cards are inserted.`);
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
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOn_0300
    * @tc.name  : testTelephonyObserverSignalInfoChangeOn0300
    * @tc.desc  : Subscribe signal status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOn0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOn0300';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOnId_0100
     * @tc.name  : testTelephonyObserverSignalInfoChangeOnId0100
     * @tc.desc  : Subscribe signal status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverSignalInfoChangeOnId0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOnId0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('signalInfoChange', {
          slotId: 0
        }, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(true);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOnId_0300
     * @tc.name  : testTelephonyObserverSignalInfoChangeOnId0300
     * @tc.desc  : Subscribe to the signal state change event of the specified card slot.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverSignalInfoChangeOnId0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOnId0300';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 0
        }, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOn_0400
    * @tc.name  : testTelephonyObserverSignalInfoChangeOn0400
    * @tc.desc  : Subscribe to the signal state change event of the specified card slot.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOn0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOn0400';
      console.info(`${caseName} test start `);
      try {
        observer.on(null, {
          slotId: 1
        }, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOn_0500
    * @tc.name  : testTelephonyObserverSignalInfoChangeOn0500
    * @tc.desc  : Subscribe to the signal state change event of the specified card slot.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOn0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOn0500';
      console.info(`${caseName} test start `);
      try {
        observer.on('signalInfoChange', {
          slotId: 3
        }, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOff_0100
    * @tc.name  : testTelephonyObserverSignalInfoChangeOff0100
    * @tc.desc  : Unsubscribe signal status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOff0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('signalInfoChange', (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        observer.off('signalInfoChange');
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOff_0200
     * @tc.name  : testTelephonyObserverSignalInfoChangeOff0200
     * @tc.desc  : Unsubscribe signal status change event
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyObserverSignalInfoChangeOff0200', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOff_0300
    * @tc.name  : testTelephonyObserverSignalInfoChangeOff0300
    * @tc.desc  : Unsubscribe signal status change event.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOff0300', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0300';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        }
        observer.on('signalInfoChange', callback);
        observer.off(null, callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_SignalInfoChangeOff_0400
    * @tc.name  : testTelephonyObserverSignalInfoChangeOff0400
    * @tc.desc  : Unsubscribe signal status change event
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverSignalInfoChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_IccAccountInfoChangeOn_0100
    * @tc.name  : testTelephonyObserverIccAccountInfoChangeOn0100
    * @tc.desc  : Subscribe to accountInfo of icc change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverIccAccountInfoChangeOn0100', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOn0100';
      await runTestCaseWithJudgeHasSimCard(caseName, done, async () => {
        try {
          observer.on('iccAccountInfoChange', async () => {
            let accInfo: sim.IccAccountInfo = await sim.getSimAccountInfo(0);
            console.info(`${caseName} data ${JSON.stringify(accInfo)}`);
            ExpectTrue(accInfo.isActive);
            done();
          });
          await sim.activateSim(0);
        } catch (error) {
          console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
          ExpectTrue(false);
          done();
        }
      });
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_IccAccountInfoChangeOn_0900
    * @tc.name  : testTelephonyObserverIccAccountInfoChangeOn0900
    * @tc.desc  : Subscribe to accountInfo of icc change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverIccAccountInfoChangeOn0900', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOn0900';
      console.info(`${caseName} test start`);
      try {
        observer.on(null, () => {
          console.info(`${caseName} data`);
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
    * @tc.number: SUB_Telephony_Observer_IccAccountInfoChangeOff_0400
    * @tc.name  : testTelephonyObserverIccAccountInfoChangeOff0400
    * @tc.desc  : Unsubscribe to accountInfo of icc change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverIccAccountInfoChangeOff0400', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOff0400';
      console.info(`${caseName} test start`);
      try {
        let number: number = 1;
        let callback: () => void = () => {
          number++;
        };
        observer.off('iccAccountInfoChange', callback);
        ExpectTrue(number == 1);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /* *
    * @tc.number: SUB_Telephony_Observer_IccAccountInfoChangeOff_0500
    * @tc.name  : testTelephonyObserverIccAccountInfoChangeOff0500
    * @tc.desc  : Unsubscribe to accountInfo of icc change events.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyObserverIccAccountInfoChangeOff0500', 0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverIccAccountInfoChangeOff0500';
      console.info(`${caseName} test start`);
      try {
        observer.off(null);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        let e = error as BusinessError;
        ExpectTrue(e.code == 401);
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}

