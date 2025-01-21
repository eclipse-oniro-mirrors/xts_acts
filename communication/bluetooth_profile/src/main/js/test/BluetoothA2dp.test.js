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
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btA2dpConnTest() {
describe('btA2dpConnTest', function () {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function openPhone() {
        try{
            let drivers = Driver.create();
            console.info('[bluetooth_js] bt driver create:'+ drivers);            
            await drivers.delayMs(1000);
            await drivers.wakeUpDisplay();
            await drivers.delayMs(5000);
            await drivers.swipe(1500, 1000, 1500, 100);
            await drivers.delayMs(10000);
        } catch (error) {
            console.info('[bluetooth_js] driver error info:'+ error);
        }
    }

    async function clickTheWindow() {
        try {
            console.info('[bluetooth_js] clickRequestPermission start');
            let driver = Driver.create();
            await driver.delayMs(3000);
            let button = await driver.findComponent(ON.text("开启"));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed');
        }
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await clickTheWindow();
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
                await clickTheWindow();
                await sleep(10000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        done();
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0100
     * @tc.name test bluetooth Profile ConnectionState
     * @tc.desc Test getBtConnectionState api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0100', 0, async function (done) {
        let connState = bluetooth.getBtConnectionState();
        console.info('[bluetooth_js] get bt connection state result' + JSON.stringify(connState));
        expect(connState).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        expect(true).assertEqual(bluetooth.ProfileConnectionState.STATE_CONNECTING != connState);
        expect(true).assertEqual(bluetooth.ProfileConnectionState.STATE_CONNECTED != connState);
        expect(true).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTING != connState);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0200
     * @tc.name test A2DP Connect
     * @tc.desc Test connect api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0200', 0, async function (done) {
        function StateChangeParam(data) {
            console.info("[bluetooth_js] a2dp state " + JSON.stringify(data) +
            'deviceId: ' + data.deviceId + 'state:'+ data.state);
            expect(true).assertEqual(data !=null);
        }
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        a2dpSrc.on('connectionStateChange', StateChangeParam);
        a2dpSrc.connect('11:22:33:44:55:77');
        await sleep(6000);
       
        a2dpSrc.off('connectionStateChange', StateChangeParam);
        done();
    })

   
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0300
     * @tc.name test A2DP disconnect
     * @tc.desc Test disconnect api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0300', 0, async function (done) {
        function StateChangeParam(data) {
            console.info("[bluetooth_js] a2dp state " + JSON.stringify(data) +
            'deviceId: ' + data.deviceId + 'state:'+ data.state);
            expect(true).assertEqual(data !=null);
        }
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        a2dpSrc.on('connectionStateChange', StateChangeParam);
        await sleep(6000);
        let conn = a2dpSrc.disconnect('11:22:33:44:55:66');
        console.info('[bluetooth_js]a2dp disconnect result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        a2dpSrc.off('connectionStateChange', StateChangeParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0400
     * @tc.name test a invaild A2DP disconnect
     * @tc.desc Test disconnect api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0400', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        let conn = a2dpSrc.disconnect('test');
        console.info('[bluetooth_js]a2dp disconnect1 result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        done();
    })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0500
     * @tc.name test Get A2DP ConnectionState
     * @tc.desc Test getProfileConnState api.
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0500', 0, async function (done) {
        let a2dpSrcConn = bluetooth.getProfileConnState(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]get a2dp result:' + JSON.stringify(a2dpSrcConn));
        expect(a2dpSrcConn).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0600
     * @tc.name test a invaild A2DP Connect
     * @tc.desc Test connect api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0600', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        let conn = a2dpSrc.connect('test');
        console.info('[bluetooth_js]a2dp invaild connect:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0700
     * @tc.name test getDevice A2DP State.
     * @tc.desc Test getDeviceState api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0700', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        let ret = a2dpSrc.getDeviceState('11:22:33:44:55:66');
        expect(ret).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0800
     * @tc.name test getDevice A2DP State.
     * @tc.desc Test getDeviceState api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0800', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        let ret = a2dpSrc.getDeviceState('test');
        expect(ret).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0900
     * @tc.name test  get A2DP Playing State
     * @tc.desc Test getPlayingState api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_0900', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        let state = a2dpSrc.getPlayingState('11:22:33:44:55:66');
        console.info('[bluetooth_js]a2dp getPlayingState result:' + JSON.stringify(state));
        expect(state).assertEqual(bluetooth.PlayingState.STATE_NOT_PLAYING);
        expect(true).assertEqual(state!=bluetooth.PlayingState.STATE_PLAYING);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_1000
     * @tc.name test getDevice A2DP State.
     * @tc.desc Test getDeviceState api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DPCONN_1000', 0, async function (done) {
        let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
        console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
        let retArray = a2dpSrc.getConnectionDevices();
        expect(true).assertEqual(retArray.length>=0);
        done();
    })


})

}