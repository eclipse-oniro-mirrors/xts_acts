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

import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function bluetoothBleTest() {
describe('bluetoothBleTest', function() {
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
        switch(sta){
            case 0:
                btAccess.enableBluetooth();
                await clickRequestPermission();
                await sleep(10000);
                let sta1 = btAccess.getState();
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
                btAccess.enableBluetooth();
                await clickRequestPermission();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
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
        await clickRequestPermission();
        await openPhone();
        console.info('beforeAll called')
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
     * @tc.name test startBLEScan
     * @tc.desc Test startBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('BLE scan device find result = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{
                    deviceId:"00:11:22:33:44:55",
                    name:"test",
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"
                }],
                {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off("BLEDeviceFind", onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200
     * @tc.name test stopBLEScan
     * @tc.desc Test stopBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200', 0, async function (done) {
        try {
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300
     * @tc.name test on-BLEDeviceFind
     * @tc.desc Test on-BLEDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetooth device find = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400
     * @tc.name test off-BLEDeviceFind
     * @tc.desc Test off-BLEDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetooth device find = '+ JSON.stringify(data));
        }
        bluetooth.on('BLEDeviceFind', onReceiveEvent);
        try {
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500', 0, async function (done) {
    	function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLEscan device result1 '+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind",onReceiveEvent);
            bluetooth.startBLEScan(null);
            await sleep(1000);
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result2'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan([{deviceId:"00:11:22:33:44:55"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off2');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result3'+JSON.stringify(data));
         }
         try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan([{name:"blue_test"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off3');
            bluetooth.stopBLEScan();
         } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result4'+JSON.stringify(data));
         }
         try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan([{serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off4');
            bluetooth.stopBLEScan();
         } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result5'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{}],
            {
                    interval: 100,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off5');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result6'+JSON.stringify(data));
        }
        try {
            let ScanOptions=  {
                interval: 100,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_BALANCED,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            };
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan([{}],ScanOptions);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off6');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result7'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{}],
            {
                    interval: 100,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off7');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result9'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{}],
            {
                    interval: 0,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off7');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result10'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{}],
            {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off10');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result12'+JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
        bluetooth.startBLEScan(
            [{}],
           {
               interval: 500,
               dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
               matchMode: bluetooth.MatchMode.MATCH_MODE_STICKY,
            }
        );
        await sleep(1000);
        console.info('[bluetooth_js] BLE scan off12');
        bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })
})
}

