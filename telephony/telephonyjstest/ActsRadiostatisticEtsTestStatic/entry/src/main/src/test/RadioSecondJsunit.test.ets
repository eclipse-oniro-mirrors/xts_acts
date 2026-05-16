/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';

const NETWORK_TYPES = [
  radio.NetworkType.NETWORK_TYPE_UNKNOWN,
  radio.NetworkType.NETWORK_TYPE_GSM,
  radio.NetworkType.NETWORK_TYPE_CDMA,
  radio.NetworkType.NETWORK_TYPE_WCDMA,
  radio.NetworkType.NETWORK_TYPE_TDSCDMA,
  radio.NetworkType.NETWORK_TYPE_LTE,
  radio.NetworkType.NETWORK_TYPE_NR,
];
const NETWORK_SIGNAL = [0, 1, 2, 3, 4, 5];

function assertCellInformation(data:Array<radio.CellInformation>) {
  expect(data != undefined && data != null).assertTrue();
  expect(data.length).assertLarger(0);
  for (let i = 0; i < data.length; i++) {
    expect(NETWORK_TYPES).assertContain(data[i].networkType);
    expect(NETWORK_TYPES).assertContain(data[i].signalInformation.signalType);
    expect(NETWORK_SIGNAL).assertContain(data[i].signalInformation.signalLevel);
    expect(NETWORK_SIGNAL).assertContain(data[i].signalInformation.dBm);
    if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_LTE) {
      console.log("radio.NetworkType.NETWORK_TYPE_LTE:" + radio.NetworkType.NETWORK_TYPE_LTE);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_WCDMA) {
      console.log("radio.NetworkType.NETWORK_TYPE_WCDMA:" + radio.NetworkType.NETWORK_TYPE_WCDMA);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_GSM) {
      console.log("radio.NetworkType.NETWORK_TYPE_GSM:" + radio.NetworkType.NETWORK_TYPE_GSM);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_TDSCDMA) {
      console.log("radio.NetworkType.NETWORK_TYPE_TDSCDMA:" + radio.NetworkType.NETWORK_TYPE_TDSCDMA);
    } else if (data[i].networkType === radio.NetworkType.NETWORK_TYPE_NR) {
      console.log("radio.NetworkType.NETWORK_TYPE_NR:" + radio.NetworkType.NETWORK_TYPE_NR);
    } else {
      console.log("radio.NetworkType.NETWORK_TYPE_UNKNOWN:" + radio.NetworkType.NETWORK_TYPE_UNKNOWN);
    }
  }
}

export default function radioSecondJsunit() {
  describe('radioSecondTest', ()=> {
    console.log("************* radio Test start*************");

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Async_0500
     * @tc.number Telephony_NetworkSearch_getSignalInformation_Async_0500
     * @tc.desc   SlotId parameter input is 0, test getSignalInformation() api by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      radio.getSignalInformation(0, (err, data) => {
        if (err) {
          console.log("Telephony_NetworkSearch_getSignalInformation_Async_0500 fail err:" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(
          "Telephony_NetworkSearch_getSignalInformation_Async_0500 finish data:" + JSON.stringify(data));
        expect(data == undefined).assertFalse();
        done();
      });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Async_0100
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getNetworkState((err, data) => {
        if (err) {
          console.error("Network unavailable");
          expect(false).assertTrue();
          done();
          return;
        }
        if (data) {
          console.log("Telephony_NetworkSearch_NetworkState_Async_0100 end data:" + JSON.stringify(data));
          expect(data.longOperatorName === "longOperatorName").assertFalse();
          expect(data.shortOperatorName === "shortOperatorName").assertFalse();
          expect(data.plmnNumeric === "plmnNumeric").assertFalse();
          expect(data.isRoaming === true || data.isRoaming === false).assertTrue();
          expect(data.isEmergency === true || data.isEmergency === false).assertTrue();
          expect(data.cfgTech.toString() == "-1").assertFalse();
          expect(data.nsaState.toString() == "-1").assertFalse();
          expect(data.regState.toString() == "-1").assertFalse();
          done();
          return;
        }
      });
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Promise_0100
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0300
     * @tc.desc   Test getNetworkState api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const result = await radio.getNetworkState();
        console.log("Telephony_NetworkSearch_NetworkState_Promise_0100 result:" + JSON.stringify(result));
        expect(result.longOperatorName === "longOperatorName").assertFalse();
        expect(result.shortOperatorName === "shortOperatorName").assertFalse();
        expect(result.plmnNumeric === "plmnNumeric").assertFalse();
        expect(result.isRoaming === true || result.isRoaming === false).assertTrue();
        expect(result.isEmergency === true || result.isEmergency === false).assertTrue();
        expect(result.cfgTech.toString() == "-1").assertFalse();
        expect(result.nsaState.toString() == "-1").assertFalse();
        expect(result.regState.toString() == "-1").assertFalse();
        done();
      } catch (error) {
        console.error("Network unavailable");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Async_0200
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0200
     * @tc.desc   Test getNetworkState() api by callback, slotId is 0, to check the callback result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getNetworkState(0, (err, data) => {
        if (err) {
          console.error("Network unavailable");
          expect(false).assertTrue();
          done();
          return;
        }
        if (data) {
          console.log("Telephony_NetworkSearch_NetworkState_Async_0200 end data:" + JSON.stringify(data));
          expect(data.longOperatorName === "longOperatorName").assertFalse();
          expect(data.shortOperatorName === "shortOperatorName").assertFalse();
          expect(data.plmnNumeric === "plmnNumeric").assertFalse();
          expect(data.isRoaming === true || data.isRoaming === false).assertTrue();
          expect(data.isEmergency === true || data.isEmergency === false).assertTrue();
          expect(data.cfgTech.toString() == "-1").assertFalse();
          expect(data.nsaState.toString() == "-1").assertFalse();
          expect(data.regState.toString() == "-1").assertFalse();
          done();
        }
      });
    })

    /**
     * @tc.name   Telephony_NetworkSearch_NetworkState_Promise_0200
     * @tc.number Telephony_NetworkSearch_NetworkState_Async_0400
     * @tc.desc   Test getNetworkState() api by promise, slotId is 0, to check the callback result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_NetworkState_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const result = await radio.getNetworkState(0);
        console.log("Telephony_NetworkSearch_NetworkState_Promise_0200 result:" + JSON.stringify(result));
        expect(result.longOperatorName === "longOperatorName").assertFalse();
        expect(result.shortOperatorName === "shortOperatorName").assertFalse();
        expect(result.plmnNumeric === "plmnNumeric").assertFalse();
        expect(result.isRoaming === true || result.isRoaming === false).assertTrue();
        expect(result.isEmergency === true || result.isEmergency === false).assertTrue();
        expect(result.cfgTech.toString() == "-1").assertFalse();
        expect(result.nsaState.toString() == "-1").assertFalse();
        expect(result.regState.toString() == "-1").assertFalse();
        done();
      } catch (error) {
        console.error("Network unavailable");
        expect(false).assertTrue();
        done();
      }
    })

    console.log("************* radio Test end*************");
  })
}