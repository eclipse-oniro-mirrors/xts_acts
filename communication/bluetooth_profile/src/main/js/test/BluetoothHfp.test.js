/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'


export default function bluetoothhostTest_host_3() {
describe('bluetoothhostTest_host_3', function () {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await sleep(10000);
                let sta1 = bluetooth.getState();
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                bluetooth.enableBluetooth();
                await sleep(10000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1100
     * @tc.name test Get HFP ConnectionState
     * @tc.desc Test getProfileConnState api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1100', 0, async function (done) {
        let hfpSrcConn = 
            bluetooth.getProfileConnState(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        console.info('[bluetooth_js]get hfp result:' + JSON.stringify(hfpSrcConn));
        expect(hfpSrcConn).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1200
     * @tc.name test getDevice HFP State.
     * @tc.desc Test getDeviceState api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1200', 0, async function (done) {
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        let ret = hfpSrc.getDeviceState('11:22:33:44:55:66');
        console.info('[bluetooth_js]hfp getDeviceState:' + JSON.stringify(ret));
        expect(ret).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1300
     * @tc.name test getDevice HFP State.
     * @tc.desc Test getDeviceState api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1300', 0, async function (done) {
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        let ret = hfpSrc.getDeviceState('bluetooth1');
        console.info('[bluetooth_js]hfp get valid mac DeviceState:' + JSON.stringify(ret));
        expect(ret).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1400
     * @tc.name test HFP Connect
     * @tc.desc Test connect api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1400', 0, async function (done) {
        function StateChangeParam(data) {
            console.info("[bluetooth_js] hfp state " + JSON.stringify(data) +
            'deviceId: ' + data.deviceId + 'state:'+ data.state);
            expect(true).assertEqual(data !=null);
        }
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        hfpSrc.on('connectionStateChange', StateChangeParam);
        let conn = hfpSrc.connect('11:22:33:44:55:66');
        await sleep(6000);
		console.info('[bluetooth_js]hfp connect result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        hfpSrc.off('connectionStateChange', StateChangeParam);
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1500
     * @tc.name test HFP disconnect
     * @tc.desc Test disconnect api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1500', 0, async function (done) {
        function StateChangeParam(data) {
            console.info("[bluetooth_js] hfp state " + JSON.stringify(data) +
            'deviceId: ' + data.deviceId + 'state:'+ data.state);
            expect(true).assertEqual(data !=null);
        }
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        hfpSrc.on('connectionStateChange', StateChangeParam);
        await sleep(10000);
        let conn = hfpSrc.disconnect('11:22:33:44:55:66');
        console.info('[bluetooth_js]hfp disconnect result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        hfpSrc.off('connectionStateChange', StateChangeParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1600
     * @tc.name test a invaild HFP Connect
     * @tc.desc Test connect api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1600', 0, async function (done) {
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        let conn1 = hfpSrc.connect('test');
        console.info('[bluetooth_js]hfp vaild MAC disconnect :' + JSON.stringify(conn1));
        expect(conn1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1700
     * @tc.name test a invaild HFP disconnect
     * @tc.desc Test disconnect api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1700', 0, async function (done) {
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        console.info('[bluetooth_js]hfp get profile result:' + JSON.stringify(hfpSrc));
        let conn = hfpSrc.disconnect('test');
        console.info('[bluetooth_js]hfp disconnect1 result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1800
     * @tc.name test getDevice HFP State.
     * @tc.desc Test getDeviceState api.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_HFP_Conn_1800', 0, async function (done) {
        let hfpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        let retArray = hfpSrc.getConnectionDevices();
        console.info('[bluetooth_js]hfp getConnectionDevices:' + JSON.stringify(retArray));
        expect(true).assertEqual(retArray.length>=0);
        done();
    })


})

}

