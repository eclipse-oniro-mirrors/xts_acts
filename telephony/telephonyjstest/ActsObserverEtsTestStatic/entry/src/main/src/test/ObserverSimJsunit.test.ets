/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, expect, it, Level, TestType, Size } from '../../../hypium/index';
import cellular from '@ohos.telephony.data';
import observer from '@ohos.telephony.observer';
import radio from '@ohos.telephony.radio';


export default function ObserverSimJsunit() {
  describe('ObserverSimJsunit', ()=>{
    console.log("************* Observer Test start *************");

    /**
     * @tc.name   Telephony_observer_observer_on_simStateChange_0200
     * @tc.number Telephony_observer_observer_on_simStateChange_0200
     * @tc.desc   call the on method of simStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_observer_on_simStateChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_observer_on_simStateChange_0200 Test start *************");
      try {
		let callback = (SimStateData:observer.SimStateData) => {
          console.log("on simStateChange, SimStateData:" + JSON.stringify(SimStateData));
          expect(typeof SimStateData === undefined).assertFalse();
        }
        observer.on('simStateChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
        observer.off('simStateChange');
      console.log("************* Telephony_observer_observer_on_simStateChange_0200 Test end *************")
    })

    /**
     * @tc.name   Telephony_observer_observer_off_simStateChange_0100
     * @tc.number Telephony_observer_observer_off_simStateChange_0100
     * @tc.desc   call the off method of simStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_observer_off_simStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_observer_off_simStateChange_0100 Test start *************");
      try {
        let callback = (SimStateData:observer.SimStateData) => {
          console.log("on simStateChange, data:" + JSON.stringify(SimStateData));
          expect(typeof SimStateData.reason === undefined).assertFalse();
          expect(typeof SimStateData.state === undefined).assertFalse();
          expect(typeof SimStateData.type === undefined).assertFalse();
        }
        observer.on('simStateChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('simStateChange', callback);
        observer.off('simStateChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_simStateChange_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_NONE_0100
     * @tc.number Telephony_observer_LockReason_SIM_NONE_0100
     * @tc.desc   check the SIM_NONE property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_NONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_NONE_0100 Test start *************")
      expect(0).assertEqual(observer.LockReason.SIM_NONE);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_NONE_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_PIN_0100
     * @tc.desc   check the SIM_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PIN_0100 Test start *************");
      expect(1).assertEqual(observer.LockReason.SIM_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PIN_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_PUK_0100
     * @tc.desc   check the SIM_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PUK_0100 Test start *************");
      expect(2).assertEqual(observer.LockReason.SIM_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PUK_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PN_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_PN_PIN_0100
     * @tc.desc   check the SIM_PN_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PN_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PN_PIN_0100 Test start *************");
      expect(3).assertEqual(observer.LockReason.SIM_PN_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PN_PIN_0100 Test end *************");
    })
    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PN_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_PN_PUK_0100
     * @tc.desc   check the SIM_PN_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PN_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PN_PUK_0100 Test start *************");
      expect(4).assertEqual(observer.LockReason.SIM_PN_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PN_PUK_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PU_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_PU_PIN_0100
     * @tc.desc   check the SIM_PU_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PU_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PU_PIN_0100 Test start *************");
      expect(5).assertEqual(observer.LockReason.SIM_PU_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PU_PIN_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PU_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_PU_PUK_0100
     * @tc.desc   check the SIM_PU_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PU_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PU_PUK_0100 Test start *************");
      expect(6).assertEqual(observer.LockReason.SIM_PU_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PU_PUK_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PP_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_PP_PIN_0100
     * @tc.desc   check the SIM_PP_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PP_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PP_PIN_0100 Test start *************");
      expect(7).assertEqual(observer.LockReason.SIM_PP_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PP_PIN_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PP_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_PP_PUK_0100
     * @tc.desc   check the SIM_PP_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PP_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PP_PUK_0100 Test start *************");
      expect(8).assertEqual(observer.LockReason.SIM_PP_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PP_PUK_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PC_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_PC_PIN_0100
     * @tc.desc   check the SIM_PC_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PC_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PC_PIN_0100 Test start *************");
      expect(9).assertEqual(observer.LockReason.SIM_PC_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PC_PIN_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_PC_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_PC_PUK_0100
     * @tc.desc   check the SIM_PC_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_PC_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_PC_PUK_0100 Test start *************");
      expect(10).assertEqual(observer.LockReason.SIM_PC_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PC_PUK_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_SIM_PIN_0100
     * @tc.number Telephony_observer_LockReason_SIM_SIM_PIN_0100
     * @tc.desc   check the SIM_SIM_PIN property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_SIM_PIN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PIN_0100 Test start *************");
      expect(11).assertEqual(observer.LockReason.SIM_SIM_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PIN_0100 Test end *************");
    })

    /**
     * @tc.name   Telephony_observer_LockReason_SIM_SIM_PUK_0100
     * @tc.number Telephony_observer_LockReason_SIM_SIM_PUK_0100
     * @tc.desc   check the SIM_SIM_PUK property of LockReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Telephony_observer_LockReason_SIM_SIM_PUK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PUK_0100 Test start *************");
      expect(12).assertEqual(observer.LockReason.SIM_SIM_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PUK_0100 Test end *************");
    })

    console.log("************* Observer Test end *************");
  })
}
