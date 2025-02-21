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

import btAccess from '@ohos.bluetooth.access';
import a2dp from '@ohos.bluetooth.a2dp';
import hid from '@ohos.bluetooth.hid';
import hfp from '@ohos.bluetooth.hfp';
import pan from '@ohos.bluetooth.pan';
import map from '@ohos.bluetooth.map';
import pbap from '@ohos.bluetooth.pbap';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btBaseProfileTest() {
describe('btBaseProfileTest', function() {
    let A2dpSourceProfile = null;
    let HandsFreeAudioGatewayProfile = null;
    let HidHostProfile = null;
    let PanProfile = null;
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

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await clickRequestPermission();
                await sleep(10000);
                let sta1 = btAccess.getState();
                console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
                break;
            case 3:
                btAccess.enableBluetooth();
                await clickRequestPermission();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    async function clickRequestPermission() {
        try {
            console.info('[bluetooth_js] clickRequestPermission start');
            let driver = Driver.create();
            await driver.delayMs(3000);
            let button = await driver.findComponent(ON.text("允许"));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed');
        }
    }

    beforeAll(async function (done) {
        console.info('beforeAll called')
        await clickRequestPermission();
        await openPhone();
        A2dpSourceProfile = a2dp.createA2dpSrcProfile();
        HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
        HidHostProfile = hid.createHidHostProfile();
        PanProfile = pan.createPanProfile();
        expect(true).assertEqual(A2dpSourceProfile != null && HandsFreeAudioGatewayProfile != null && HidHostProfile != null && PanProfile != null);
        done();
    })
    beforeEach(async function (done) {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100
     * @tc.name test getConnectedDevices
     * @tc.desc Test getConnectedDevices api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100', 0, async function (done) {
        try {
            let devices = A2dpSourceProfile.getConnectedDevices();
            console.info("address of connected devices list:" + devices);
            expect(true).assertEqual(devices != null);
        } catch (err) {
            console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200
     * @tc.name test getConnectionState
     * @tc.desc Test getConnectionState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200', 0, async function (done) {
        try {
            let state = A2dpSourceProfile.getConnectionState("11:22:33:AA:BB:FF");
            console.info("the connection state:" + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300
     * @tc.name test on type: 'connectionStateChange'
     * @tc.desc Test on type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        try {
            A2dpSourceProfile.on('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        A2dpSourceProfile.off('connectionStateChange', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400
     * @tc.name test off type: 'connectionStateChange'
     * @tc.desc Test off type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        A2dpSourceProfile.on('connectionStateChange', onReceiveEvent);
        try {
            A2dpSourceProfile.off('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500
     * @tc.name test getConnectedDevices
     * @tc.desc Test getConnectedDevices api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500', 0, async function (done) {
        try {
            let devices = HandsFreeAudioGatewayProfile.getConnectedDevices();
            console.info("address of connected devices list:" + devices);
            expect(true).assertEqual(devices != null);
        } catch (err) {
            console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600
     * @tc.name test getConnectionState
     * @tc.desc Test getConnectionState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600', 0, async function (done) {
        try {
            let state = HandsFreeAudioGatewayProfile.getConnectionState("11:22:33:AA:BB:FF");
            console.info("the connection state:" + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700
     * @tc.name test on type: 'connectionStateChange'
     * @tc.desc Test on type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
            console.info('connection state change:'+ data.deviceId);
            console.info('connection state change:'+ data.state);
        }
        try {
            HandsFreeAudioGatewayProfile.on('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        HandsFreeAudioGatewayProfile.off('connectionStateChange', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800
     * @tc.name test off type: 'connectionStateChange'
     * @tc.desc Test off type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        HandsFreeAudioGatewayProfile.on('connectionStateChange', onReceiveEvent);
        try {
            HandsFreeAudioGatewayProfile.off('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900
     * @tc.name test getConnectedDevices
     * @tc.desc Test getConnectedDevices api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900', 0, async function (done) {
        try {
            let devices = HidHostProfile.getConnectedDevices();
            console.info("address of connected devices list:" + devices);
            expect(true).assertEqual(devices != null);
        } catch (err) {
            console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000
     * @tc.name test getConnectionState
     * @tc.desc Test getConnectionState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000', 0, async function (done) {
        try {
            let state = HidHostProfile.getConnectionState("11:22:33:AA:BB:FF");
            console.info("the connection state:" + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100
     * @tc.name test on type: 'connectionStateChange'
     * @tc.desc Test on type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        try {
            HidHostProfile.on('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        HidHostProfile.off('connectionStateChange', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200
     * @tc.name test off type: 'connectionStateChange'
     * @tc.desc Test off type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        HidHostProfile.on('connectionStateChange', onReceiveEvent);
        try {
            HidHostProfile.off('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1300
     * @tc.name test getConnectedDevices
     * @tc.desc Test getConnectedDevices api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1300', 0, async function (done) {
        try {
            let devices = PanProfile.getConnectedDevices();
            console.info("address of connected devices list:" + devices);
            expect(true).assertEqual(devices != null);
        } catch (err) {
            console.error("bluetooth getConnectedDevices errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900008');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1400
     * @tc.name test getConnectionState
     * @tc.desc Test getConnectionState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1400', 0, async function (done) {
        try {
            let state = PanProfile.getConnectionState("11:22:33:AA:BB:FF");
            console.info("the connection state:" + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.error("bluetooth getConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900008');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1500
     * @tc.name test on type: 'connectionStateChange'
     * @tc.desc Test on type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1500', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        try {
            PanProfile.on('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        PanProfile.off('connectionStateChange', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1600
     * @tc.name test off type: 'connectionStateChange'
     * @tc.desc Test off type: 'connectionStateChange' api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1600', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('connection state change:'+ JSON.stringify(data));
        }
        PanProfile.on('connectionStateChange', onReceiveEvent);
        try {
            PanProfile.off('connectionStateChange', onReceiveEvent);
        } catch (err) {
            console.error("bluetooth connectionStateChange errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1700
     * @tc.name test createA2dpSrcProfile/createHfpAgProfile/createHidHostProfile/createPanProfile
     * @tc.desc Test createA2dpSrcProfile/createHfpAgProfile/createHidHostProfile/createPanProfile api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_1700', 0, async function (done) {
        try {
            let asp = a2dp.createA2dpSrcProfile();
            let hp = hfp.createHfpAgProfile();
            let hhp = hid.createHidHostProfile();
            let pp = pan.createPanProfile();
            expect(true).assertEqual(asp != null);
            expect(true).assertEqual(hp != null);
            expect(true).assertEqual(hhp != null);
            expect(true).assertEqual(pp != null);
        } catch (err) {
            console.error("bluetooth createProfile errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MAP_0100
     * @tc.name test createMapMseProfile
     * @tc.desc Test createMapMseProfile api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_MAP_0100', 0, async function (done) {
        try {
            let mapMseProfile = map.createMapMseProfile();
            console.info('MapMse success' + mapMseProfile);
            expect(true).assertEqual(mapMseProfile != null);
        } catch (err) {
            console.error("bluetooth map createMapMseProfile errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PBAP_0100
     * @tc.name test createPbapServerProfile
     * @tc.desc Test createPbapServerProfile api11.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTH_PBAP_0100', 0, async function (done) {
        try {
            let pbapServerProfile = pbap.createPbapServerProfile();
            console.info('pbapServer success' + pbapServerProfile);
            expect(true).assertEqual(pbapServerProfile != null);
        } catch (err) {
            console.error("bluetooth pbap pbapServerProfile errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
})
}