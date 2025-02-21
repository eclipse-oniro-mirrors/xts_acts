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
import { describe, expect, it } from '@ohos/hypium';
import cellular from '@ohos.telephony.data';
import observer from '@ohos.telephony.observer';

let callState: observer.CallState = 0;
let ratType: observer.RatType = 0;

export default function ObserverJsunit() {
  describe('ObserverJsunit', function () {
    console.log("************* Observer Test start *************");

    /*
     * @tc.number    : Telephony_observer_observer_DataConnectState_0100
     * @tc.name      : DataConnectState
     * @tc.desc      : check the getCellularDataState callback to verify the call back data
     */
    it('Telephony_observer_observer_DataConnectState_0100', 0, function (done) {
      console.log("************* Telephony_observer_observer_DataConnectState_0100 Test start *************");
      cellular.getCellularDataState((err, data) => {
        if (!err) {
          var dataConnectStateList = [cellular.DataConnectState.DATA_STATE_UNKNOWN,
          cellular.DataConnectState.DATA_STATE_DISCONNECTED,
          cellular.DataConnectState.DATA_STATE_CONNECTING,
          cellular.DataConnectState.DATA_STATE_CONNECTED,
          cellular.DataConnectState.DATA_STATE_SUSPENDED]
          expect(dataConnectStateList.indexOf(data) >= 0).assertTrue();
          done();
          return;
        }
        console.log("Telephony_CellularData_getCellularDataState_0100 end");
        done();
      })
      console.log("************* Telephony_observer_observer_DataConnectState_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_on_networkStateChange_0200
     * @tc.name      : on_networkStateChange
     * @tc.desc      : call the on method of networkStateChange
     */
    it('Telephony_observer_observer_on_networkStateChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_networkStateChange_0200 Test start *************");
      try {
        let callback = NetworkState => {
          console.log("on networkStateChange, NetworkState:" + JSON.stringify(NetworkState));
          expect(typeof NetworkState === undefined).assertFalse();
        }
        observer.on('networkStateChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      observer.off('networkStateChange');

      console.log("************* Telephony_observer_observer_on_networkStateChange_0200 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_off_networkStateChange_0100
     * @tc.name      : off_networkStateChange
     * @tc.desc      : call the off method of networkStateChange
     */
    it('Telephony_observer_observer_off_networkStateChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_networkStateChange_0100 Test start *************");
      try {
        let callback = NetworkState => {
          console.log("on networkStateChange, NetworkState:" + JSON.stringify(NetworkState));
          expect(typeof NetworkState === undefined).assertFalse();
        }
        observer.on('networkStateChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('networkStateChange', callback);
        observer.off('networkStateChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_networkStateChange_0100 Test end *************");
    })



    /*
     * @tc.number    : Telephony_observer_observer_on_signalInfoChange_0200
     * @tc.name      : on_signalInfoChange
     * @tc.desc      : call the on method of signalInfoChange
     */
    it('Telephony_observer_observer_on_signalInfoChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_signalInfoChange_0200 Test start *************");
      try {
        let callback = SignalInformation => {
          console.log("on signalInfoChange, SignalInformation:" + JSON.stringify(SignalInformation));
          expect(typeof SignalInformation === undefined).assertFalse();
        }
        observer.on('signalInfoChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      observer.off('signalInfoChange');
      console.log("************* Telephony_observer_observer_on_signalInfoChange_0200 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_off_signalInfoChange_0100
     * @tc.name      : off_signalInfoChange
     * @tc.desc      : call the off method of signalInfoChange
     */
    it('Telephony_observer_observer_off_signalInfoChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_signalInfoChange_0100 Test start *************");
      try {
        let callback = SignalInformation => {
          console.log("on signalInfoChange, SignalInformation:" + JSON.stringify(SignalInformation));
          expect(typeof SignalInformation === undefined).assertFalse();
        }
        observer.on('signalInfoChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('signalInfoChange', callback);
        observer.off('signalInfoChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_signalInfoChange_0100 Test end *************");
    })




    /*
     * @tc.number    : Telephony_observer_observer_on_cellularDataConnectionStateChange_0200
     * @tc.name      : on_cellularDataConnectionStateChange
     * @tc.desc      : call the on method of cellularDataConnectionStateChange
     */
    it('Telephony_observer_observer_on_cellularDataConnectionStateChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_cellularDataConnectionStateChange_0200 Test start *************");
      try {
        let callback = value => {
          console.log("on cellularDataConnectionStateChange, state:" + value.state + ", network:" + value.network);
          expect(typeof value.state === undefined).assertFalse();
          expect(typeof value.network === undefined).assertFalse();
        }
        observer.on('cellularDataConnectionStateChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
        observer.off('cellularDataConnectionStateChange');
      console.log("************* Telephony_observer_observer_on_cellularDataConnectionStateChange_0200 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_off_cellularDataConnectionStateChange_0100
     * @tc.name      : off_cellularDataConnectionStateChange
     * @tc.desc      : call the off method of cellularDataConnectionStateChange
     */
    it('Telephony_observer_observer_off_cellularDataConnectionStateChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_cellularDataConnectionStateChange_0100 Test start *************");
      try {
        let callback = value => {
          console.log("on cellularDataConnectionStateChange, state:" + value.state + ", network:" + value.network);
        }
        observer.on('cellularDataConnectionStateChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('cellularDataConnectionStateChange', callback);
        observer.off('cellularDataConnectionStateChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_cellularDataConnectionStateChange_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_on_cellularDataFlowChange_0200
     * @tc.name      : on_cellularDataFlowChange
     * @tc.desc      : call the on method of cellularDataFlowChange
     */
    it('Telephony_observer_observer_on_cellularDataFlowChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_cellularDataFlowChange_0200 Test start *************");
      try {
		let callback = DataFlowType => {
          console.log("on networkStateChange, DataFlowType:" + JSON.stringify(DataFlowType));
          expect(typeof DataFlowType === undefined).assertFalse();
        }
        observer.on('cellularDataFlowChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
        observer.off('cellularDataFlowChange');
      console.log("************* Telephony_observer_observer_on_cellularDataFlowChange_0200 Test end *************")
    })

    /*
     * @tc.number    : Telephony_observer_observer_off_cellularDataFlowChange_0100
     * @tc.name      : off_cellularDataFlowChange
     * @tc.desc      : call the off method of cellularDataFlowChange
     */
    it('Telephony_observer_observer_off_cellularDataFlowChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_cellularDataFlowChange_0100 Test start *************");
      try {
        let callback = data => {
          console.log("on cellularDataFlowChange, data:" + JSON.stringify(data));
        }
        observer.on('cellularDataFlowChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_cellularDataFlowChange_0100 Test end *************")
    })

    /*
     * @tc.number    : Telephony_observer_observer_on_callStateChange_0200
     * @tc.name      : on_callStateChange
     * @tc.desc      : call the on method of callStateChange
     */
    it('Telephony_observer_observer_on_callStateChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_callStateChange_0200 Test start *************");
      try {
		let callback = value => {
          console.log("on callStateChange, state:" + value.state + ", number:" + value.number);
          expect(typeof value.state === undefined).assertFalse();
        }
        observer.on('callStateChange', {
          slotId: 0
        }, callback);
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
        observer.off('callStateChange');
      console.log("************* Telephony_observer_observer_on_callStateChange_0200 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_observer_off_callStateChange_0100
     * @tc.name      : off_callStateChange
     * @tc.desc      : call the off method of callStateChange
     */
    it('Telephony_observer_observer_off_callStateChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_callStateChange_0100 Test start *************");
      try {
        let callback = value => {
          console.log("on callStateChange, state:" + value.state + ", number:" + value.number);
        }
        observer.on('callStateChange', callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.off('callStateChange', callback);
        observer.off('callStateChange');
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
      console.log("************* Telephony_observer_observer_off_callStateChange_0100 Test end *************");
    })


    /*
     * @tc.number    : Telephony_observer_observer_on_simStateChange_0200
     * @tc.name      : on_simStateChange
     * @tc.desc      : call the on method of simStateChange
     */
    it('Telephony_observer_observer_on_simStateChange_0200', 0, async function (done) {
      console.log("************* Telephony_observer_observer_on_simStateChange_0200 Test start *************");
      try {
		let callback = SimStateData => {
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

    /*
     * @tc.number    : Telephony_observer_observer_off_simStateChange_0100
     * @tc.name      : off_simStateChange
     * @tc.desc      : call the off method of simStateChange
     */
    it('Telephony_observer_observer_off_simStateChange_0100', 0, async function (done) {
      console.log("************* Telephony_observer_observer_off_simStateChange_0100 Test start *************");
      try {
        let callback = SimStateData => {
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

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_NONE_0100
     * @tc.name      : SIM_NONE
     * @tc.desc      : check the SIM_NONE property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_NONE_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_NONE_0100 Test start *************")
      expect(0).assertEqual(observer.LockReason.SIM_NONE);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_NONE_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PIN_0100
     * @tc.name      : SIM_PIN
     * @tc.desc      : check the SIM_PIN property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PIN_0100 Test start *************");
      expect(1).assertEqual(observer.LockReason.SIM_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PIN_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PUK_0100
     * @tc.name      : SIM_PUK
     * @tc.desc      : check the SIM_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PUK_0100 Test start *************");
      expect(2).assertEqual(observer.LockReason.SIM_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PUK_0100 Test end *************");
    })

    /*
    * @tc.number    : Telephony_observer_LockReason_SIM_PN_PIN_0100
    * @tc.name      : SIM_PN_PIN
    * @tc.desc      : check the SIM_PN_PIN property of LockReason
    */
    it('Telephony_observer_LockReason_SIM_PN_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PN_PIN_0100 Test start *************");
      expect(3).assertEqual(observer.LockReason.SIM_PN_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PN_PIN_0100 Test end *************");
    })
    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PN_PUK_0100
     * @tc.name      : SIM_PN_PUK
     * @tc.desc      : check the SIM_PN_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PN_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PN_PUK_0100 Test start *************");
      expect(4).assertEqual(observer.LockReason.SIM_PN_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PN_PUK_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PU_PIN_0100
     * @tc.name      : SIM_PU_PIN
     * @tc.desc      : check the SIM_PU_PIN property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PU_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PU_PIN_0100 Test start *************");
      expect(5).assertEqual(observer.LockReason.SIM_PU_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PU_PIN_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PU_PUK_0100
     * @tc.name      : SIM_PU_PUK
     * @tc.desc      : check the SIM_PU_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PU_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PU_PUK_0100 Test start *************");
      expect(6).assertEqual(observer.LockReason.SIM_PU_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PU_PUK_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PP_PIN_0100
     * @tc.name      : SIM_PP_PIN
     * @tc.desc      : check the SIM_PP_PIN property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PP_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PP_PIN_0100 Test start *************");
      expect(7).assertEqual(observer.LockReason.SIM_PP_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PP_PIN_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PP_PUK_0100
     * @tc.name      : SIM_PP_PUK
     * @tc.desc      : check the SIM_PP_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PP_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PP_PUK_0100 Test start *************");
      expect(8).assertEqual(observer.LockReason.SIM_PP_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PP_PUK_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PC_PIN_0100
     * @tc.name      : SIM_PC_PIN
     * @tc.desc      : check the SIM_PC_PIN property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PC_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PC_PIN_0100 Test start *************");
      expect(9).assertEqual(observer.LockReason.SIM_PC_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PC_PIN_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_PC_PUK_0100
     * @tc.name      : SIM_PC_PUK
     * @tc.desc      : check the SIM_PC_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_PC_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_PC_PUK_0100 Test start *************");
      expect(10).assertEqual(observer.LockReason.SIM_PC_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_PC_PUK_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_SIM_PIN_0100
     * @tc.name      : SIM_SIM_PIN
     * @tc.desc      : check the SIM_SIM_PIN property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_SIM_PIN_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PIN_0100 Test start *************");
      expect(11).assertEqual(observer.LockReason.SIM_SIM_PIN);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PIN_0100 Test end *************");
    })

    /*
     * @tc.number    : Telephony_observer_LockReason_SIM_SIM_PUK_0100
     * @tc.name      : SIM_SIM_PUK
     * @tc.desc      : check the SIM_SIM_PUK property of LockReason
     */
    it('Telephony_observer_LockReason_SIM_SIM_PUK_0100', 0, function (done) {
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PUK_0100 Test start *************");
      expect(12).assertEqual(observer.LockReason.SIM_SIM_PUK);
      done();
      console.log("************* Telephony_observer_LockReason_SIM_SIM_PUK_0100 Test end *************");
    })

    console.log("************* Observer Test end *************");
  })
}
