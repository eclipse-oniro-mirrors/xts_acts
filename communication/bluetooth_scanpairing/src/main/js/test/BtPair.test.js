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

export default function btPairTest() {
describe('btPairTest', function() {
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
            let button = await driver.findComponent(ON.text("允许"));
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0100
     * @tc.name Test pairDevice of use invailded address
     * @tc.desc Test pairDevice api
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0100', 0, async function (done) {
        try{
            bluetooth.pairDevice("11:22:55:66:33:44");
            await sleep(3000);
        } catch(err) {
            console.error("pairDevice errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0200
     * @tc.name testStartpair
     * @tc.desc Test pairDevice of use vailded address.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0200', 0, async function (done) {
        function PinRequiredParam(data) {
            console.info("[bluetooth_js] pinRequired on:" + 
                JSON.stringify(data.deviceId)+JSON.stringify(data.pinCode));
            bluetooth.setDevicePairingConfirmation(data.deviceId,false);
        }
        bluetooth.BLE.on('pinRequired', PinRequiredParam);
        let result = bluetooth.pairDevice("SSS");
        console.info("[bluetooth_js] onStartpair -> " + JSON.stringify(result));
        expect(result).assertFalse();
        bluetooth.BLE.off('pinRequired', PinRequiredParam);
        done();
    })
  
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0300
     * @tc.name test getRemoteDeviceName
     * @tc.desc Test get RemoteDeviceName
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0300', 0, async function (done) {
        let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
        console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
        expect(ret.length).assertEqual(0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0400
     * @tc.name test getRemoteDeviceClass
     * @tc.desc Test get RemoteDeviceClass
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0400', 0, async function (done) {
        let MajorMinorClass = {
            COMPUTER_UNCATEGORIZED : 0x0100,COMPUTER_DESKTOP : 0x0104,
            COMPUTER_SERVER : 0x0108,COMPUTER_LAPTOP : 0x010C,
            COMPUTER_HANDHELD_PC_PDA : 0x0110,COMPUTER_PALM_SIZE_PC_PDA : 0x0114,
            COMPUTER_WEARABLE : 0x0118,COMPUTER_TABLET : 0x011C,
            PHONE_UNCATEGORIZED : 0x0200,PHONE_CELLULAR : 0x0204,
            PHONE_CORDLESS : 0x0208,PHONE_SMART : 0x020C,
            PHONE_MODEM_OR_GATEWAY : 0x0210,PHONE_ISDN : 0x0214,
            NETWORK_FULLY_AVAILABLE : 0x0300,NETWORK_1_TO_17_UTILIZED : 0x0320,
            NETWORK_17_TO_33_UTILIZED : 0x0340,NETWORK_33_TO_50_UTILIZED : 0x0360,
            NETWORK_60_TO_67_UTILIZED : 0x0380,NETWORK_67_TO_83_UTILIZED : 0x03A0,
            NETWORK_83_TO_99_UTILIZED : 0x03C0,NETWORK_NO_SERVICE : 0x03E0,
            AUDIO_VIDEO_UNCATEGORIZED : 0x0400,AUDIO_VIDEO_WEARABLE_HEADSET: 0x0404,
            AUDIO_VIDEO_HANDSFREE : 0x0408,AUDIO_VIDEO_MICROPHONE : 0x0410,
            AUDIO_VIDEO_LOUDSPEAKER : 0x0414,AUDIO_VIDEO_HEADPHONES : 0x0418,
            AUDIO_VIDEO_PORTABLE_AUDIO : 0x041C,AUDIO_VIDEO_CAR_AUDIO : 0x0420,
            AUDIO_VIDEO_SET_TOP_BOX : 0x0424,AUDIO_VIDEO_HIFI_AUDIO : 0x0428,
            AUDIO_VIDEO_VCR : 0x042C,AUDIO_VIDEO_VIDEO_CAMERA : 0x0430,
            AUDIO_VIDEO_CAMCORDER : 0x0434,AUDIO_VIDEO_VIDEO_MONITOR : 0x0438,
            AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER : 0x043C,
            AUDIO_VIDEO_VIDEO_CONFERENCING : 0x0440,AUDIO_VIDEO_VIDEO_GAMING_TOY: 0x0448,
            PERIPHERAL_NON_KEYBOARD_NON_POINTING : 0x0500,
            PERIPHERAL_KEYBOARD : 0x0540,PERIPHERAL_POINTING_DEVICE : 0x0580,
            PERIPHERAL_KEYBOARD_POINTING : 0x05C0,PERIPHERAL_UNCATEGORIZED : 0x0500,
            PERIPHERAL_JOYSTICK : 0x0504,PERIPHERAL_GAMEPAD : 0x0508,
            PERIPHERAL_REMOTE_CONTROL : 0x05C0,PERIPHERAL_SENSING_DEVICE : 0x0510,
            PERIPHERAL_DIGITIZER_TABLET : 0x0514,
            PERIPHERAL_CARD_READER : 0x0518,PERIPHERAL_DIGITAL_PEN : 0x051C,
            PERIPHERAL_SCANNER_RFID : 0x0520,PERIPHERAL_GESTURAL_INPUT : 0x0522,
            IMAGING_UNCATEGORIZED : 0x0600,IMAGING_DISPLAY : 0x0610,
            IMAGING_CAMERA : 0x0620,IMAGING_SCANNER : 0x0640,
            IMAGING_PRINTER : 0x0680,WEARABLE_UNCATEGORIZED : 0x0700,
            WEARABLE_WRIST_WATCH : 0x0704,WEARABLE_PAGER : 0x0708,
            WEARABLE_JACKET : 0x070C,WEARABLE_HELMET : 0x0710,
            WEARABLE_GLASSES : 0x0714,TOY_UNCATEGORIZED : 0x0800,
            TOY_ROBOT : 0x0804,TOY_VEHICLE : 0x0808,
            TOY_DOLL_ACTION_FIGURE : 0x080C,TOY_CONTROLLER : 0x0810,
            TOY_GAME : 0x0814,HEALTH_UNCATEGORIZED : 0x0900,
            HEALTH_BLOOD_PRESSURE : 0x0904,HEALTH_THERMOMETER : 0x0908,
            HEALTH_WEIGHING : 0x090C,HEALTH_GLUCOSE : 0x0910,
            HEALTH_PULSE_OXIMETER : 0x0914,HEALTH_PULSE_RATE : 0x0918,
            HEALTH_DATA_DISPLAY : 0x091C,HEALTH_STEP_COUNTER : 0x0920,
            HEALTH_BODY_COMPOSITION_ANALYZER : 0x0924,
            HEALTH_PEAK_FLOW_MOITOR : 0x0928,HEALTH_MEDICATION_MONITOR : 0x092C,
            HEALTH_KNEE_PROSTHESIS : 0x0930,HEALTH_ANKLE_PROSTHESIS : 0x0934,
            HEALTH_GENERIC_HEALTH_MANAGER : 0x0938,
            HEALTH_PERSONAL_MOBILITY_DEVICE : 0x093C,
            HEALTH_PERSONAL_MOBILITY_DEVICE : 0x093C
        };
        let MajorClass = {
            MAJOR_MISC : 0x0000,MAJOR_COMPUTER : 0x0100,
            MAJOR_PHONE : 0x0200,MAJOR_NETWORKING : 0x0300,
            MAJOR_AUDIO_VIDEO: 0x0400,MAJOR_PERIPHERAL : 0x0500,
            MAJOR_IMAGING : 0x0600,MAJOR_WEARABLE : 0x0700,
            MAJOR_TOY : 0x0800,MAJOR_HEALTH : 0x0900,
            MAJOR_UNCATEGORIZED : 0x1F00
        }; 
        let DeviceClass = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
        console.info('[bluetooth_js] getRemoteDeviceClass ret2 :' + JSON.stringify(DeviceClass) 
        + 'majorClass:' +DeviceClass.majorClass + 'majorMinorClass:'+ DeviceClass.majorMinorClass 
        + 'classOfDevice:' + DeviceClass.classOfDevice);
        expect(DeviceClass.majorClass).assertEqual(7936);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0500
     * @tc.name test get RemoteDeviceName
     * @tc.desc Test getRemoteDeviceName api 
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0500', 0, async function (done) {
        let ret = bluetooth.getRemoteDeviceName("1125445");
        console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
        expect(ret.length).assertEqual(0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0600
     * @tc.name test get PairedDevices
     * @tc.desc Test getPairedDevices api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0600', 0, async function (done) {
        let ret = bluetooth.getPairedDevices();
        console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
        expect(true).assertEqual(ret.length>=0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0700
     * @tc.name Test pinRequired and setDevicePairing false
     * @tc.desc Test pinRequired ON api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0700', 0, async function (done) {
        function PinRequiredParam(data) {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(data));
            let ret = bluetooth.setDevicePairingConfirmation(data.deviceId, false);
            expect(ret).assertFalse();
        }
        try {
            bluetooth.BLE.on('pinRequired', PinRequiredParam);
            bluetooth.pairDevice("99:55:22:88:66:11");
            await sleep(2000);
            bluetooth.BLE.off('pinRequired', PinRequiredParam);
        } catch(err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0800
     * @tc.name Test pinRequired and setDevicePairing true
     * @tc.desc Test pinRequired off api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0800', 0, async function (done) {
        function PinRequiredParam(data) {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(data));
            let ret = bluetooth.setDevicePairingConfirmation(data.deviceId, true);
            expect(ret).assertTrue();
        }
        try {
            bluetooth.BLE.on('pinRequired', PinRequiredParam);
            bluetooth.pairDevice("66:88:33:55:22:99");
            await sleep(1000);
            bluetooth.BLE.off('pinRequired', PinRequiredParam);
        } catch(err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAIR_0900
     * @tc.name Test On pair StateChange
     * @tc.desc Test bondStateChange ON api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAIR_0900', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
        bluetooth.BLE.on('bondStateChange', BondStateParam);
        bluetooth.pairDevice("58:62:22:23:69:54");
        expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
        expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
        expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        bluetooth.BLE.off('bondStateChange', BondStateParam);
        done();
    })

})
}