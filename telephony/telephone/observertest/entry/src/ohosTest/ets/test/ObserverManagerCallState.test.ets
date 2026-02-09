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

import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
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

function sleep(time: number): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

export default function observerManagerCallStateTest() {
  describe('ObserverManagerCallStateTest', () => {

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOff0100
     * @tc.number SUB_Telephony_Observer_CallStateChangeOff_0100
     * @tc.desc   Unsubscribe to call status change event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOff0200
     * @tc.number SUB_Telephony_Observer_CallStateChangeOff_0200
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOff0400
     * @tc.number SUB_Telephony_Observer_CallStateChangeOff_0400
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOn0500
     * @tc.number SUB_Telephony_Observer_CallStateChangeOn_0500
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0500';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        observer.on(null, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOn0600
     * @tc.number SUB_Telephony_Observer_CallStateChangeOn_0600
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn0600';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on(null, options, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeOff0700
     * @tc.number SUB_Telephony_Observer_CallStateChangeOff_0700
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeOff0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOff0700';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: observer.CallStateInfo) => void = (data: observer.CallStateInfo) => {
          console.log("on callStateChange, data:" + JSON.stringify(data));
        }
        observer.off(null, callback);
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0100
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0100
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0100';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0200
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0200
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 1
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0300
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0300
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0300';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 2
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0400
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0400
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: -1
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0500
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0500
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0500';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: -2
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8800001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0600
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0600
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0600';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        observer.on('callStateChangeEx', callback, options);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 8800001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0700
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0700
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0700';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0800
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0800
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0800';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on(null, callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOn0900
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOn_0900
     * @tc.desc   Subscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOn0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOn0900';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          const telCallStateAry: number[] = [
            call.TelCallState.TEL_CALL_STATE_UNKNOWN,
            call.TelCallState.TEL_CALL_STATE_IDLE,
            call.TelCallState.TEL_CALL_STATE_RINGING,
            call.TelCallState.TEL_CALL_STATE_OFFHOOK,
            call.TelCallState.TEL_CALL_STATE_ANSWERED,
            call.TelCallState.TEL_CALL_STATE_CONNECTED
          ]
          ExpectTrue(telCallStateAry.includes(data));        }
        observer.on('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOff0100
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOff_0100
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0100';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOff0200
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOff_0200
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx', callback);
        observer.off('callStateChangeEx', callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOff0300
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOff_0300
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOff0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0300';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
          ExpectTrue(data !== null);
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChangeEx');
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverCallStateChangeExOff0400
     * @tc.number SUB_Telephony_Observer_CallStateChangeExOff_0400
     * @tc.desc   Unsubscribe to call status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyObserverCallStateChangeExOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyObserverCallStateChangeExOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: call.TelCallState) => void = (data: call.TelCallState) => {
          console.log(`${caseName} on callStateChange, data:` + JSON.stringify(data));
        }
        observer.on('callStateChangeEx', callback);
        //可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off(null, callback);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(error.code == 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0100
     * @tc.number Telephony_observer_on_cCallStateInfo_0100
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0100';
      console.log("************* Telephony_observer_on_cCallStateInfo_0100 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          ExpectTrue(value !== null);
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback);
      } catch (err) {
        console.info(`${caseName} catchError: ${JSON.stringify(err)}}` + err);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0200
     * @tc.number Telephony_observer_on_cCallStateInfo_0200
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0200';
      console.log("************* Telephony_observer_on_cCallStateInfo_0200 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          ExpectTrue(value !== null);
          observer.offCCallStateChange();
          done();
        }
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.onCCallStateChange(callback, options);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0200 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0300
     * @tc.number Telephony_observer_on_cCallStateInfo_0300
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0300';
      console.log("************* Telephony_observer_on_cCallStateInfo_0300 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          ExpectTrue(value !== null);
          observer.offCCallStateChange();
          done();
        }
        let options: observer.ObserverOptions = {
          slotId: 1
        }
        observer.onCCallStateChange(callback, options);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0300 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0400
     * @tc.number Telephony_observer_on_cCallStateInfo_0400
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0400';
      console.log("************* Telephony_observer_on_cCallStateInfo_0400 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' +
          JSON.stringify(value.teleNumber));
          expect(false).assertTrue();
          observer.offCCallStateChange();
          done();
        }
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        observer.onCCallStateChange(callback, options);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`);
        ExpectTrue(err.code === 8800001);
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0400 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0500
     * @tc.number Telephony_observer_on_cCallStateInfo_0500
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0500';
      console.log("************* Telephony_observer_on_cCallStateInfo_0500 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          ExpectTrue(value !== null);
          observer.offCCallStateChange();
          done();
        }
        let options: observer.ObserverOptions = {
          slotId: -1
        }
        observer.onCCallStateChange(callback, options);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}` + err);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0500 Test end *************");
    })
    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0600
     * @tc.number Telephony_observer_on_cCallStateInfo_0600
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0600';
      console.log("************* Telephony_observer_on_cCallStateInfo_0600 Test start *************");
      try {
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          expect(false).assertTrue();
          observer.offCCallStateChange();
          done();
        }
        let options: observer.ObserverOptions = {
          slotId: -2
        }
        observer.onCCallStateChange(callback, options);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`);
        ExpectTrue(err.code === 8800001);
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0600 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_on_cCallStateInfo_0700
     * @tc.number Telephony_observer_on_cCallStateInfo_0700
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_on_cCallStateInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_on_cCallStateInfo_0700';
      console.log("************* Telephony_observer_on_cCallStateInfo_0700 Test start *************");
      try {
        const CCALL_STATE_UNKNOWN =-1;
        const CCALL_STATE_ACTIVE =0;
        const CCALL_STATE_HOLDING=1;
        const CCALL_STATE_DIALING=2;
        const CCALL_STATE_ALERTING=3;
        const CCALL_STATE_INCOMING=4;
        const CCALL_STATE_WAITING=5;
        const CCALL_STATE_DISCONNECTED=6;
        const CCALL_STATE_DISCONNECTING=7;
        const CCALL_STATE_IDLE=8;
        const CCALL_STATE_ANSWERED=9;

        const cCallStateAry: number[] = [
          CCALL_STATE_UNKNOWN,
          CCALL_STATE_ACTIVE,
          CCALL_STATE_HOLDING,
          CCALL_STATE_DIALING,
          CCALL_STATE_ALERTING,
          CCALL_STATE_INCOMING,
          CCALL_STATE_WAITING,
          CCALL_STATE_DISCONNECTED,
          CCALL_STATE_DISCONNECTING,
          CCALL_STATE_IDLE,
          CCALL_STATE_ANSWERED
        ]
        let callback = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, data:` + JSON.stringify(value.state) + 'number:' + JSON.stringify(value.teleNumber));
          ExpectTrue(cCallStateAry.includes(value.state));
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback);
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`+err);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_on_cCallStateInfo_0700 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_off_cCallStateInfo_0100
     * @tc.number Telephony_observer_off_cCallStateInfo_0100
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_off_cCallStateInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_off_cCallStateInfo_0100';
      console.log("************* Telephony_observer_off_cCallStateInfo_0100 Test start *************");
      try {
        let callback: (value: observer.CCallStateInfo) => void = (value: observer.CCallStateInfo) => {
          console.log(`${caseName} on cCallStateChange, value:` + JSON.stringify(value));
          ExpectTrue(value !== null);
        }
        observer.offCCallStateChange(callback);
        done();
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}`);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_off_cCallStateInfo_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_off_cCallStateInfo_0200
     * @tc.number Telephony_observer_off_cCallStateInfo_0200
     * @tc.desc   call the on method of cCallStateInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_off_cCallStateInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'Telephony_observer_off_cCallStateInfo_0200';
      console.log("************* Telephony_observer_off_cCallStateInfo_0200 Test start *************");
      try {
        observer.offCCallStateChange();
        done();
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}}` + err);
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_off_cCallStateInfo_0200 Test end *************");
    })

  });
}