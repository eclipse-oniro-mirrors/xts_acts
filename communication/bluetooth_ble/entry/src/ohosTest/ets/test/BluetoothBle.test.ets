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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let BleScanner:bluetooth.BleScanner;

function sleep(delay : number) : Promise<void> {
    return new Promise(resolve => setTimeout(resolve, delay))
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
                await clickRequestPermission(OPEN_BT_TEXT);
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
                await clickRequestPermission(OPEN_BT_TEXT);
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    async function clickRequestPermission(text:string) {
        console.info('[bluetooth_js] clickRequestPermission start');
        let PERMISSION_TEXT:string = "允许";
        let driver = Driver.create();
        await driver.delayMs(3000);
        try {
            let button = await driver.findComponent(ON.text(text));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] clickRequestPermission end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
        }
        try {
            let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
            await button1.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click PERMISSION_TEXT end');
        } catch (err) {
            console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
        }
    }

    
    function onReceiveEvent00(data : Array<bluetooth.ScanResult>) {   
            console.info('BLE scan device find result = '+ JSON.stringify(data));
        }
    function onReceiveEvent(data : Array<bluetooth.ScanResult>) {   
            console.info('bluetooth device find = '+ JSON.stringify(data));
        }
    function onReceiveEvent1(data : Array<bluetooth.ScanResult>) {  
            console.info('[bluetooth_js] BLEscan device result1 '+JSON.stringify(data));
        }
    function onReceiveEvent2(data : Array<bluetooth.ScanResult>)  
        {
            console.info('[bluetooth_js] BLEscan device result2'+JSON.stringify(data));
        }
    function onReceiveEvent3(data : Array<bluetooth.ScanResult>)   
        {
            console.info('[bluetooth_js] BLEscan device result3'+JSON.stringify(data));
         }
    function onReceiveEvent4(data : Array<bluetooth.ScanResult>)    
        {
            console.info('[bluetooth_js] BLEscan device result4'+JSON.stringify(data));
         }
    function onReceiveEvent5(data : Array<bluetooth.ScanResult>)  
        {
            console.info('[bluetooth_js] BLEscan device result5'+JSON.stringify(data));
        }
    function onReceiveEvent6(data : Array<bluetooth.ScanResult>) 
        {
            console.info('[bluetooth_js] BLEscan device result6'+JSON.stringify(data));
        }
    function onReceiveEvent7(data : Array<bluetooth.ScanResult>)
        {
            console.info('[bluetooth_js] BLEscan device result7'+JSON.stringify(data));
        }
    function onReceiveEvent8(data : Array<bluetooth.ScanResult>)        
        {
            console.info('[bluetooth_js] BLEscan device result9'+JSON.stringify(data));
        }
    function onReceiveEvent9(data : Array<bluetooth.ScanResult>)    
        {
            console.info('[bluetooth_js] BLEscan device result10'+JSON.stringify(data));
        }
    function onReceiveEvent10(data : Array<bluetooth.ScanResult>)     
        {
            console.info('[bluetooth_js] BLEscan device result12'+JSON.stringify(data));
        }
    function onReceiveEvents(data : bluetooth.ScanReport)
        {
            console.info('[bluetooth_js] bleScanner startScan device result: ' + JSON.stringify(data));
            console.info('[bluetooth_js] reportType result: ' + JSON.stringify(data[0].reportType));
            console.info('[bluetooth_js] scanResult result: ' + JSON.stringify(data[0].scanResult));
            console.info('[bluetooth_js] deviceId result: ' + JSON.stringify(data[0].scanResult[0].deviceId));
            console.info('[bluetooth_js] rssi result: ' + JSON.stringify(data[0].scanResult[0].rssi));
            console.info('[bluetooth_js] data result: ' + JSON.stringify(data[0].scanResult[0].data));
            console.info('[bluetooth_js] deviceName result: ' + JSON.stringify(data[0].scanResult[0].deviceName));
            console.info('[bluetooth_js] connectable result: ' + JSON.stringify(data[0].scanResult[0].connectable));
        }
    

export default function bluetoothBleTest() {
describe('bluetoothBleTest', () => {

    beforeAll(async (done : Function) => {
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        console.info('beforeAll called')
        BleScanner = bluetooth.createBleScanner();
        console.info('createBleScanner result:' + JSON.stringify(BleScanner));
        expect(true).assertEqual(BleScanner != null);
        done();
    })
    beforeEach(async (done : Function) =>{
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(() => {
        console.info('afterEach called')
    })
    afterAll(() => {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
     * @tc.name test startBLEScan
     * @tc.desc Test startBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent00);
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
                    phyType: bluetooth.PhyType.PHY_LE_1M
                }
            );
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]startBLEScan is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        bluetooth.off("BLEDeviceFind", onReceiveEvent00);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200
     * @tc.name test stopBLEScan
     * @tc.desc Test stopBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]stopBLEScan is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }  
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
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
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
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        bluetooth.on('BLEDeviceFind', onReceiveEvent);
        try {
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
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
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind",onReceiveEvent1);
            bluetooth.startBLEScan(null);
            await sleep(1000);
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent1);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent2);
            bluetooth.startBLEScan([{deviceId:"00:11:22:33:44:55"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off2');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent2);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
         try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent3);
            bluetooth.startBLEScan([{name:"blue_test"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off3');
            bluetooth.stopBLEScan();
         } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent3);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
         try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent4);
            bluetooth.startBLEScan([{serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off4');
            bluetooth.stopBLEScan();
         } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent4);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent5);
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
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent5);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let ScanOptions : bluetooth.ScanOptions=  {
                interval: 100,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_BALANCED,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            };
            bluetooth.on("BLEDeviceFind", onReceiveEvent6);
            bluetooth.startBLEScan([{}],ScanOptions);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off6');
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent6);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent7);
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
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent7);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent8);
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
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent8);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent9);
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
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent9);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent10);
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
            expect(Number(err.code)).assertEqual(2900099);
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent10);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
     * @tc.name test constant PhyType
     * @tc.desc Test constant PhyType api12
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let PHY_LE_1M = bluetooth.PhyType.PHY_LE_1M;
        console.info("[bluetooth_js]PHY_LE_1M : " + JSON.stringify(PHY_LE_1M));
        expect(true).assertEqual(PHY_LE_1M == 1);

        let PHY_LE_ALL_SUPPORTED = bluetooth.PhyType.PHY_LE_ALL_SUPPORTED;
        console.info("[bluetooth_js]PHY_LE_ALL_SUPPORTED : " + JSON.stringify(PHY_LE_ALL_SUPPORTED));
        expect(true).assertEqual(PHY_LE_ALL_SUPPORTED == 255);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
     * @tc.name test constant PhyType
     * @tc.desc Test constant PhyType api12
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let PHY_LE_1M = bluetooth.PhyType.PHY_LE_1M;
        console.info("[bluetooth_js]PHY_LE_1M : " + JSON.stringify(PHY_LE_1M));
        expect(true).assertEqual(PHY_LE_1M == 1);

        let PHY_LE_ALL_SUPPORTED = bluetooth.PhyType.PHY_LE_ALL_SUPPORTED;
        console.info("[bluetooth_js]PHY_LE_ALL_SUPPORTED : " + JSON.stringify(PHY_LE_ALL_SUPPORTED));
        expect(true).assertEqual(PHY_LE_ALL_SUPPORTED == 255);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1600
     * @tc.name test startBLEScan
     * @tc.desc Test startBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.startBLEScan(null, null);
            expect().assertFail();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0100
     * @tc.name testCreateBleScanner
     * @tc.desc Test createBleScanner
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let testBleScanner:bluetooth.BleScanner = bluetooth.createBleScanner();
            console.info("[bluetooth_js]createBleScanner result: " + JSON.stringify(testBleScanner));
            expect(true).assertEqual(testBleScanner != null);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0200
     * @tc.name testStartScan
     * @tc.desc Test startScan
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let arrayBuffer = new ArrayBuffer(8);
        let scanFilter: bluetooth.ScanFilter = {
            deviceId: "00:11:22:33:44:55",
            name: "testStartScan",
            serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
            serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
            serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
            serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
            serviceData: arrayBuffer,
            serviceDataMask: arrayBuffer,
            manufactureId: 4567,
            manufactureData: arrayBuffer,
            manufactureDataMask: arrayBuffer
        };

        try {
            BleScanner.on("BLEDeviceFind", onReceiveEvents);
            await BleScanner.startScan([scanFilter]).then(() => {
                console.info('[bluetooth_js] bleScanner startScan success');
            });
            await sleep(500);
            await BleScanner.stopScan().then(() => {
                console.info('[bluetooth_js] bleScanner stopScan success');
            });
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            BleScanner.off("BLEDeviceFind", onReceiveEvents);
            if (err.code == 801 || err.code == 2900009) {
                console.info('[bluetooth_js]startScan is not support or start scan as it is out of hardware');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
        }
        BleScanner.off("BLEDeviceFind", onReceiveEvents);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0300
     * @tc.name testStopScan
     * @tc.desc Test stopScan
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let scanOptions: bluetooth.ScanOptions = {
            interval: 500,
            dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
            matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
            reportMode: bluetooth.ScanReportMode.NORMAL
        };

        try {
            await BleScanner.startScan([{}], scanOptions).then(() => {
                console.info('[bluetooth_js] bleScanner startScan success');
            });
            await sleep(500);
            await BleScanner.stopScan().then(() => {
                console.info('[bluetooth_js] bleScanner stopScan success');
            });
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801 || err.code == 2900009) {
                console.info('[bluetooth_js]startScan is not support or start scan as it is out of hardware');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0600
     * @tc.name testStartScan
     * @tc.desc Test startScan 401
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            await BleScanner.startScan(null, null).then(() => {
                console.info('[bluetooth_js] bleScanner startScan success');
            });
            expect().assertFail();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0700
     * @tc.name testStartScan
     * @tc.desc Test startScan again
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let arrayBuffer = new ArrayBuffer(8);
        let scanFilter: bluetooth.ScanFilter = {
            deviceId: "00:11:22:33:44:55",
            name: "testStartScan",
            serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
            serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
            serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
            serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
            serviceData: arrayBuffer,
            serviceDataMask: arrayBuffer,
            manufactureId: 4567,
            manufactureData: arrayBuffer,
            manufactureDataMask: arrayBuffer
        };

        try {
            await BleScanner.startScan([scanFilter]).then(() => {
                console.info('[bluetooth_js] bleScanner startScan success');
            });
            await sleep(500);
            await BleScanner.startScan([scanFilter]).then(() => {
                console.info('[bluetooth_js] bleScanner startScan success');
            });
            expect().assertFail();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("BleScanner.startScan is not support.");
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2902050);
            }
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0400
     * @tc.name testScanReportType
     * @tc.desc Test ScanReportType
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let ON_FOUND = bluetooth.ScanReportType.ON_FOUND;
        console.info("[bluetooth_js]ScanReportType ON_FOUND: " + JSON.stringify(ON_FOUND));
        expect(ON_FOUND).assertEqual(1);

        let ON_LOST = bluetooth.ScanReportType.ON_LOST;
        console.info("[bluetooth_js]ScanReportType ON_LOST: " + JSON.stringify(ON_LOST));
        expect(ON_LOST).assertEqual(2);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0500
     * @tc.name testScanReportMode
     * @tc.desc Test ScanReportMode
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let NORMAL = bluetooth.ScanReportMode.NORMAL;
        console.info("[bluetooth_js]ScanReportMode NORMAL: " + JSON.stringify(NORMAL));
        expect(NORMAL).assertEqual(1);

        let FENCE_SENSITIVITY_LOW = bluetooth.ScanReportMode.FENCE_SENSITIVITY_LOW;
        console.info("[bluetooth_js]ScanReportMode FENCE_SENSITIVITY_LOW: " + JSON.stringify(FENCE_SENSITIVITY_LOW));
        expect(FENCE_SENSITIVITY_LOW).assertEqual(10);

        let FENCE_SENSITIVITY_HIGH = bluetooth.ScanReportMode.FENCE_SENSITIVITY_HIGH;
        console.info("[bluetooth_js]ScanReportMode FENCE_SENSITIVITY_HIGH: " + JSON.stringify(FENCE_SENSITIVITY_HIGH));
        expect(FENCE_SENSITIVITY_HIGH).assertEqual(11);
        done();
    })
})
}

