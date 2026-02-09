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

import radio from '@ohos.telephony.radio';
import observer from '@ohos.telephony.observer';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
export default function ActsNetworkSearchTest() {

describe('ActsNetworkSearchTest',  () => {

    const SLOT_0 = 0;
    const SLOT_2 = -1;

    afterEach(async (done: () => void): Promise<void> => {
        try {
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_UNKNOWN === 0).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_GSM === 1).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_1XRTT === 2).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_WCDMA === 3).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPA === 4).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_HSPAP === 5).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_TD_SCDMA === 6).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EVDO === 7).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_EHRPD === 8).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE === 9).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_LTE_CA === 10).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_IWLAN === 11).assertTrue();
            expect(radio.RadioTechnology.RADIO_TECHNOLOGY_NR === 12).assertTrue();

            expect(radio.NetworkType.NETWORK_TYPE_UNKNOWN === 0).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_GSM === 1).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_CDMA === 2).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_WCDMA === 3).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_TDSCDMA === 4).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_LTE === 5).assertTrue();
            expect(radio.NetworkType.NETWORK_TYPE_NR === 6).assertTrue();

            expect(radio.RegState.REG_STATE_NO_SERVICE === 0).assertTrue();
            expect(radio.RegState.REG_STATE_IN_SERVICE === 1).assertTrue();
            expect(radio.RegState.REG_STATE_EMERGENCY_CALL_ONLY === 2).assertTrue();
            expect(radio.RegState.REG_STATE_POWER_OFF === 3).assertTrue();

            expect(radio.NsaState.NSA_STATE_NOT_SUPPORT === 1).assertTrue();
            expect(radio.NsaState.NSA_STATE_NO_DETECT === 2).assertTrue();
            expect(radio.NsaState.NSA_STATE_CONNECTED_DETECT === 3).assertTrue();
            expect(radio.NsaState.NSA_STATE_IDLE_DETECT === 4).assertTrue();
            expect(radio.NsaState.NSA_STATE_DUAL_CONNECTED === 5).assertTrue();
            expect(radio.NsaState.NSA_STATE_SA_ATTACHED === 6).assertTrue();

            // expect(radio.NetworkSelectionMode.NETWORK_SELECTION_UNKNOWN === 0).assertTrue();
            // expect(radio.NetworkSelectionMode.NETWORK_SELECTION_MANUAL === 2).assertTrue();
        } catch (error) {
            console.info(`Telephony_NetworkSearch error`);
        }
        done();
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.number Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getSignalInformation(SLOT_2, (err, data) => {
            if (err) {
                console.info('Telephony_NetworkSearch_getSignalInformation_Async_0400 fail err:' + JSON.stringify(err));
                expect(err.code).assertEqual(8300001);
                done();
                return;
            }
            if (data) {
                console.info('getSignalInformation_Async_0400 data: ' + JSON.stringify(data));
                if (data.length > 0) {
                    expect(data[0].signalLevel != -1).assertTrue();
                    expect(data[0].signalType != radio.NetworkType.NETWORK_TYPE_WCDMA).assertTrue();
                }
                expect(data.length === 0).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.number Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        radio.getNetworkState(SLOT_2, (err, data) => {
            if (err) {
                console.info(`Telephony_NetworkSearch_getNetworkState_Async_0700 finish err: ${err}`);
                done();
                return;
            }
            if (data) {
                console.info(`Telephony_NetworkSearch_getNetworkState_Async_0700 fail not go to err ${data}`);
                expect(data.longOperatorName != 'longOperatorName').assertTrue();
                expect(data.shortOperatorName != 'shortOperatorName').assertTrue();
                expect(data.plmnNumeric != 'plmnNumeric').assertTrue();
                expect(data.isRoaming != true).assertTrue();
                expect(data.regState != radio.RegState.REG_STATE_IN_SERVICE).assertTrue();
                expect(data.nsaState != radio.NsaState.NSA_STATE_SA_ATTACHED).assertTrue();
                expect().assertFail();
            }
        });
    });
});
}