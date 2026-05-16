/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import observer from '@ohos.telephony.observer';
import radio from '@ohos.telephony.radio';
import hilog from '@ohos.hilog'
import cellular from '@ohos.telephony.data';
import call from '@ohos.telephony.call';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ObserverJsunit() {
  describe('ObserverJsunit', (): void => {
    hilog.info(domain, tag, '%{public}s', '************* Observer Test start *************');

    /**
     * @tc.number Telephony_observer_observer_on_callStateChange_0100
     * @tc.name   Telephony_observer_observer_on_callStateChange_0100
     * @tc.desc   call the on method of callStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0100 Test start *************');
      try {
        let callback = (value: observer.CallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0100 on callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCallStateChange();
          done();
        }
        observer.onCallStateChange(callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0100 on callStateChange, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0100 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChange_0200
     * @tc.name   Telephony_observer_observer_on_callStateChange_0200
     * @tc.desc   call the on method of callStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0200 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        let callback = (value: observer.CallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0200 on callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCallStateChange();
          done();
        }
        observer.onCallStateChange(options, callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0200 on callStateChange, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0200 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChange_0300
     * @tc.name   Telephony_observer_observer_on_callStateChange_0300
     * @tc.desc   call the on method of callStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0300 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        let callback = (value: observer.CallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0300 on callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(false).assertTrue();
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCallStateChange();
          done();
        }
        observer.onCallStateChange(options, callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChange_0300 on callStateChange, err:'+JSON.stringify(err));
        expect(Number(err.code)).assertEqual(8300001);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChange_0300 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_off_callStateChange_0100
     * @tc.name   Telephony_observer_observer_off_callStateChange_0100
     * @tc.desc   call the off method of callStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_off_callStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_callStateChange_0100 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        let callback = (value:observer.CallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_callStateChange_0100 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          done();
        }
        observer.onCallStateChange(options, callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.offCallStateChange(callback);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_callStateChange_0100 off callStateChange, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_callStateChange_0100 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChangeEx_0100
     * @tc.name   Telephony_observer_observer_on_callStateChangeEx_0100
     * @tc.desc   call the on method of callStateChangeEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChangeEx_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0100 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        let callback = (value: call.TelCallState) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0100 on callStateChangeEx, TelCallState:'+JSON.stringify(value));
          expect(Number(value)).assertEqual(0);
          observer.offCallStateChangeEx();
          done();
        }
        observer.onCallStateChangeEx(callback,options);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0100 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0100 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChangeEx_0200
     * @tc.name   Telephony_observer_observer_on_callStateChangeEx_0200
     * @tc.desc   call the on method of callStateChangeEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChangeEx_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0200 Test start *************');
      try {
        let callback = (value: call.TelCallState) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0200 on callStateChangeEx, TelCallState:'+JSON.stringify(value));
          expect(Number(value)).assertEqual(0);
          observer.offCallStateChangeEx();
          done();
        }
        observer.onCallStateChangeEx(callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0200 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0200 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChangeEx_0300
     * @tc.name   Telephony_observer_observer_on_callStateChangeEx_0300
     * @tc.desc   call the on method of callStateChangeEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChangeEx_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0300 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        let callback = (value: call.TelCallState) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0300 on callStateChangeEx, TelCallState:'+JSON.stringify(value));
          expect(false).assertTrue();
          observer.offCallStateChangeEx();
          done();
        }
        observer.onCallStateChangeEx(callback,options);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0300 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(Number(err.code)).assertEqual(8800001);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0300 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_callStateChangeEx_0400
     * @tc.name   Telephony_observer_observer_on_callStateChangeEx_0400
     * @tc.desc   call the on method of callStateChangeEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_callStateChangeEx_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0400 Test start *************');
      try {
        let callback = (value: call.TelCallState) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0400 on callStateChangeEx, TelCallState:'+JSON.stringify(value));
          let str:string = JSON.stringify(value).toString()
          let resultEnum :number = Number(str[str.length - 2])
          const TEL_CALL_STATE_UNKNOWN: number = -1
          const TEL_CALL_STATE_IDLE: number = 0
          const TEL_CALL_STATE_RINGING: number = 1
          const TEL_CALL_STATE_OFFHOOK: number = 2
          const TEL_CALL_STATE_ANSWERED: number = 3
          const TEL_CALL_STATE_CONNECTED: number = 4

          const telCallStateAry: Number[] = [
            TEL_CALL_STATE_UNKNOWN,
            TEL_CALL_STATE_IDLE,
            TEL_CALL_STATE_RINGING,
            TEL_CALL_STATE_OFFHOOK,
            TEL_CALL_STATE_ANSWERED,
            TEL_CALL_STATE_CONNECTED
          ]
          expect(telCallStateAry.includes(resultEnum)).assertTrue();
          observer.offCallStateChangeEx();
          done();
        }
        observer.onCallStateChangeEx(callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_callStateChangeEx_0400 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_callStateChangeEx_0400 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_off_callStateChangeEx_0100
     * @tc.name   Telephony_observer_observer_off_callStateChangeEx_0100
     * @tc.desc   call the off method of callStateChangeEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_off_callStateChangeEx_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_callStateChangeEx_0100 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        let callback = (value: call.TelCallState) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_callStateChangeEx_0100 on callStateChangeEx, TelCallState:'+JSON.stringify(value));
          expect(Number(value)).assertEqual(0);
          observer.offCallStateChangeEx();
          done();
        }
        observer.onCallStateChangeEx(callback,options);
        observer.offCallStateChangeEx(callback);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_callStateChangeEx_0100 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_callStateChangeEx_0100 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_CCallStateChange_0100
     * @tc.name   Telephony_observer_observer_on_CCallStateChange_0100
     * @tc.desc   call the on method of CCallStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_CCallStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0100 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        let callback = (value: observer.CCallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0100 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback,options);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0100 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0100 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_CCallStateChange_0200
     * @tc.name   Telephony_observer_observer_on_CCallStateChange_0200
     * @tc.desc   call the on method of CCallStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_CCallStateChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0200 Test start *************');
      try {
        let callback = (value: observer.CCallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0200 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0200 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0200 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_CCallStateChange_0300
     * @tc.name   Telephony_observer_observer_on_CCallStateChange_0300
     * @tc.desc   call the on method of CCallStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_CCallStateChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0300 Test start *************');
      try {
        let options: observer.ObserverOptions = {
          slotId: 3
        }
        let callback = (value: observer.CCallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0300 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(false).assertTrue();
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback,options);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0300 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(Number(err.code)).assertEqual(8800001);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0300 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_on_CCallStateChange_0400
     * @tc.name   Telephony_observer_observer_on_CCallStateChange_0400
     * @tc.desc   call the on method of CCallStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_on_CCallStateChange_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0400 Test start *************');
      try {
        let callback = (value: observer.CCallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0400 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          const CCALL_STATE_UNKNOWN: number =-1;
          const CCALL_STATE_ACTIVE: number =0;
          const CCALL_STATE_HOLDING: number=1;
          const CCALL_STATE_DIALING: number=2;
          const CCALL_STATE_ALERTING: number=3;
          const CCALL_STATE_INCOMING: number=4;
          const CCALL_STATE_WAITING: number=5;
          const CCALL_STATE_DISCONNECTED: number=6;
          const CCALL_STATE_DISCONNECTING: number=7;
          const CCALL_STATE_IDLE: number=8;
          const CCALL_STATE_ANSWERED: number=9;

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
          expect(cCallStateAry.includes(value.state)).assertTrue();
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_on_CCallStateChange_0400 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_on_CCallStateChange_0400 Test end *************');
    })

    /**
     * @tc.number Telephony_observer_observer_off_CCallStateChange_0100
     * @tc.name   Telephony_observer_observer_off_CCallStateChange_0100
     * @tc.desc   call the off method of CCallStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Telephony_observer_observer_off_CCallStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_CCallStateChange_0100 Test start *************');
      try {
        let callback = (value: observer.CCallStateInfo) => {
          hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_CCallStateChange_0100 off callStateChange, state:'+JSON.stringify(value.state)+'number:'+JSON.stringify(value.teleNumber));
          expect(Number(value.state)).assertEqual(0);
          expect(typeof value.teleNumber === undefined).assertFalse();
          observer.offCCallStateChange();
          done();
        }
        observer.onCCallStateChange(callback);
        observer.offCCallStateChange(callback);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'Telephony_observer_observer_off_CCallStateChange_0100 on callStateChangeEx, err:'+JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_CCallStateChange_0100 Test end *************');
    })

    hilog.info(domain, tag, '%{public}s', '************* Observer Test end *************');
  })
}