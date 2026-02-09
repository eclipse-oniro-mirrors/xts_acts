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
import common from '@ohos.bluetooth.common';
import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let BleScanner:bluetooth.BleScanner;
let gattServer: bluetooth.GattServer;
let device:bluetooth.GattClientDevice;
let deviceId = "00:11:22:33:44:55";
let phyValue1: bluetooth.PhyValue = {
    txPhy : bluetooth.BlePhy.BLE_PHY_1M,
    rxPhy : bluetooth.BlePhy.BLE_PHY_2M,
    phyMode : bluetooth.CodedPhyMode.BLE_PHY_CODED_S2,
};
function sleep(delay : number) : Promise<void> {
    return new Promise(resolve => setTimeout(resolve, delay));
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

function onReceiveEvent(data : Array<bluetooth.ScanResult>)
{
    console.info('bluetooth device find = '+ JSON.stringify(data));
    try{
        console.info('[bluetooth_js]ScanResult Property advertiseFlags is :' + JSON.stringify(data[0].advertiseFlags));
        console.info('[bluetooth_js]ScanResult Property manufacturerDataMap is :' + JSON.stringify(data[0].manufacturerDataMap));
        console.info('[bluetooth_js]ScanResult Property serviceDataMap is :' + JSON.stringify(data[0].serviceDataMap));
        console.info('[bluetooth_js]ScanResult Property serviceUuids is :' + JSON.stringify(data[0].serviceUuids));
        console.info('[bluetooth_js]ScanResult Property txPowerLevel is :' + JSON.stringify(data[0].txPowerLevel));
        console.info('[bluetooth_js]ScanResult Property advertisingDataMap is :' + JSON.stringify(data[0].advertisingDataMap));
        console.info('[bluetooth_js]ScanResult Property address is :' + JSON.stringify(data[0].address));
    } catch(error){
        console.error("[bt_arkts]ScanResult Property is Optional");
    }
}

function onReceiveEvent_void()
{
    console.info('[bluetooth_js] BLEscan device result_viod');
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
function onReceiveEvent_value(data : bluetooth.PhyValue)
{
    console.info('bluetooth PhyValue txPhy = ' + JSON.stringify(data.txPhy));
    console.info('bluetooth PhyValue rxPhy = ' + JSON.stringify(data.rxPhy));
    console.info('bluetooth PhyValue phyMode = ' + JSON.stringify(data.phyMode));
    expect(data.txPhy).not().assertUndefined();
    expect(data.rxPhy).not().assertUndefined();
    console.info('bluetooth onBlePhyUpdate success');
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
            gattServer = bluetooth.createGattServer();
            console.info('bluetooth ble create gattServer result:' + JSON.stringify(gattServer));
            device = bluetooth.createGattClientDevice('00:11:22:33:44:55');
            console.info('createGattClientDevice result:' + JSON.stringify(device));
            done();
        })
        beforeEach(async (done : Function) =>{
            console.info('beforeEach called');
            await tryToEnableBt();
            done();
        })
        afterEach(() => {
            console.info('afterEach called')
        })
        afterAll(async (done : Function) =>{
            await tryToEnableBt();
            console.info('afterAll called');
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
         * @tc.desc   Test startBLEScan api10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
            bluetooth.off("BLEDeviceFind", onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200
         * @tc.desc   Test stopBLEScan api10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300
         * @tc.desc   Test on-BLEDeviceFind api10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400
         * @tc.desc   Test off-BLEDeviceFind api10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                bluetooth.on("BLEDeviceFind",onReceiveEvent);
                bluetooth.startBLEScan(null);
                await sleep(1000);
                bluetooth.stopBLEScan();
            } catch (err) {
                console.error("errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                bluetooth.on("BLEDeviceFind", onReceiveEvent);
                bluetooth.startBLEScan([{deviceId:"00:11:22:33:44:55"}]);
                await sleep(1000);
                console.info('[bluetooth_js] BLE scan off2');
                bluetooth.stopBLEScan();
            } catch (err) {
                console.error("errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                bluetooth.on("BLEDeviceFind", onReceiveEvent);
                bluetooth.startBLEScan([{name:"blue_test"}]);
                await sleep(1000);
                console.info('[bluetooth_js] BLE scan off3');
                bluetooth.stopBLEScan();
            } catch (err) {
                console.error("errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                bluetooth.on("BLEDeviceFind", onReceiveEvent);
                bluetooth.startBLEScan([{serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"}]);
                await sleep(1000);
                console.info('[bluetooth_js] BLE scan off4');
                bluetooth.stopBLEScan();
            } catch (err) {
                console.error("errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let ScanOptions : bluetooth.ScanOptions=  {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400
         * @tc.desc   Test ClassicStartBLEScan api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
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
                expect(Number(err.code)).assertEqual(2900099);
            }
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
         * @tc.desc   Test constant PhyType api12
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1500
         * @tc.desc   Test constant PhyType api12
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1600
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1600
         * @tc.desc   Test startBLEScan api10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0100
         * @tc.desc   Test createBleScanner
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0200
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0200
         * @tc.desc   Test startScan
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0300
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0300
         * @tc.desc   Test stopScan
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0600
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0600
         * @tc.desc   Test startScan 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0700
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0700
         * @tc.desc   Test startScan again
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            let arrayBuffer = new ArrayBuffer(8);
            let addressvlue :common.BluetoothAddress = {
                "address": "11:22:33:44:55:66",
                "addressType": common.BluetoothAddressType.REAL,
            };
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
                manufactureDataMask: arrayBuffer,
                address: addressvlue,
                rssiThreshold: 15
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0400
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0400
         * @tc.desc   Test ScanReportType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            let ON_FOUND = bluetooth.ScanReportType.ON_FOUND;
            console.info("[bluetooth_js]ScanReportType ON_FOUND: " + JSON.stringify(ON_FOUND));
            expect(ON_FOUND).assertEqual(1);

            let ON_LOST = bluetooth.ScanReportType.ON_LOST;
            console.info("[bluetooth_js]ScanReportType ON_LOST: " + JSON.stringify(ON_LOST));
            expect(ON_LOST).assertEqual(2);

            let ON_BATCH = bluetooth.ScanReportType.ON_BATCH;
            console.info("[bluetooth_js]ScanReportType ON_BATCH: " + JSON.stringify(ON_BATCH));
            expect(ON_BATCH).assertEqual(3);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0500
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0500
         * @tc.desc   Test ScanReportMode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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

            let BATCH = bluetooth.ScanReportMode.BATCH;
            console.info("[bluetooth_js]ScanReportMode BATCH: " + JSON.stringify(BATCH));
            expect(BATCH).assertEqual(2);
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETCONNECTEDBLEDEVICES_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETCONNECTEDBLEDEVICES_0100
         * @tc.desc   Test getConnectedBLEDevices api21
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GETCONNECTEDBLEDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
            try {
                let devices = bluetooth.getConnectedBLEDevices(bluetooth.BleProfile.GATT);
                console.info("[bluetooth_js]getConnectedBLEDevices GATT: " + JSON.stringify(devices));
            } catch (err) {
                console.error("getConnectedBLEDevices GATT errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("[bluetooth_js]getConnectedBLEDevices is not support");
                    expect(Number(err.code) == 801).assertTrue();
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }

            try {
                let devices = bluetooth.getConnectedBLEDevices(bluetooth.BleProfile.GATT_CLIENT);
                console.info("[bluetooth_js]getConnectedBLEDevices GATT_CLIENT: " + JSON.stringify(devices));
            } catch (err) {
                console.error("getConnectedBLEDevices GATT_CLIENT errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("[bluetooth_js]getConnectedBLEDevices is not support");
                    expect(Number(err.code) == 801).assertTrue();
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }

            try {
                let devices = bluetooth.getConnectedBLEDevices(bluetooth.BleProfile.GATT_SERVER);
                console.info("[bluetooth_js]getConnectedBLEDevices GATT_SERVER: " + JSON.stringify(devices));
            } catch (err) {
                console.error("getConnectedBLEDevices GATT_SERVER errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("[bluetooth_js]getConnectedBLEDevices is not support");
                    expect(Number(err.code) == 801).assertTrue();
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLEPROFILE_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLEPROFILE_0100
         * @tc.desc   Test BleProfile api21
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_BLEPROFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
            let BleProfileGATT = bluetooth.BleProfile.GATT;
            console.info("[bluetooth_js]GATT: " + JSON.stringify(BleProfileGATT));
            expect(BleProfileGATT).assertEqual(1);

            let BleProfileGATT_CLIENT = bluetooth.BleProfile.GATT_CLIENT;
            console.info("[bluetooth_js]GATT_CLIENT: " + JSON.stringify(BleProfileGATT_CLIENT));
            expect(BleProfileGATT_CLIENT).assertEqual(2);

            let BleProfileGATT_SERVER = bluetooth.BleProfile.GATT_SERVER;
            console.info("[bluetooth_js]GATT_SERVER: " + JSON.stringify(BleProfileGATT_SERVER));
            expect(BleProfileGATT_SERVER).assertEqual(3);
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_CONNECTIONPARAM_ENUMVALUE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_CONNECTIONPARAM_ENUMVALUE_0100
         * @tc.desc 20251113API22用例覆盖 ConnectionParam Enumvalue 3-1.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_CONNECTIONPARAM_ENUMVALUE_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let value1 = bluetooth.ConnectionParam.LOW_POWER;
                console.info('[bt_arkts]get LOW_POWER is ' + JSON.stringify(value1));
                expect(value1).assertEqual(1);
                let value2 = bluetooth.ConnectionParam.BALANCED;
                console.info('[bt_arkts]get BALANCED is ' + JSON.stringify(value2));
                expect(value2).assertEqual(2);
                let value3 = bluetooth.ConnectionParam.HIGH;
                console.info('[bt_arkts]get HIGH is ' + JSON.stringify(value3));
                expect(value3).assertEqual(3);
            } catch (err) {
                console.error(`[bt_arkts]get ConnectionParam enumvalue ,code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_BLEPHY_ENUMVALUE_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_BLE_BLEPHY_ENUMVALUE_0200
         * @tc.desc 20251113API22用例覆盖 BlePhy Enumvalue.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_BLEPHY_ENUMVALUE_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let value4 = bluetooth.BlePhy.BLE_PHY_1M;
                console.info('[bt_arkts]get bluetooth BlePhy BLE_PHY_1M is ' + JSON.stringify(value4));
                expect(value4).assertEqual(1);
                let value5 = bluetooth.BlePhy.BLE_PHY_2M;
                console.info('[bt_arkts]get bluetooth BlePhy BLE_PHY_2M is ' + JSON.stringify(value5));
                expect(value5).assertEqual(2);
                let value6 = bluetooth.BlePhy.BLE_PHY_CODED;
                console.info('[bt_arkts]get bluetooth BlePhy BLE_PHY_CODED is ' + JSON.stringify(value6));
                expect(value6).assertEqual(3);
            } catch (err) {
                console.error(`[bt_arkts]get ConnectionParam enumvalue ,code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_CODEPHY_ENUMVALUE_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_BLE_CODEPHY_ENUMVALUE_0300
         * @tc.desc 20251113API22用例覆盖 CodedPhyMode Enumvalue.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_CODEPHY_ENUMVALUE_0300', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let value7 = bluetooth.CodedPhyMode.BLE_PHY_CODED_S2;
                console.info('[bt_arkts]get bluetooth CodedPhyMode BLE_PHY_CODED_S2 is ' + JSON.stringify(value7));
                expect(value7).assertEqual(1);
                let value8 = bluetooth.CodedPhyMode.BLE_PHY_CODED_S8;
                console.info('[bt_arkts]get bluetooth CodedPhyMode BLE_PHY_CODED_S8 is ' + JSON.stringify(value8));
                expect(value8).assertEqual(2);
            } catch (err) {
                console.error(`[bt_arkts]get ConnectionParam enumvalue ,code is ${err.code},message is ${err.message}`);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_0100
         * @tc.desc 20251113API22用例覆盖 on_serviceChange/off_serviceChange 1-1.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                device.on('serviceChange',onReceiveEvent_void);
                console.info('[bt_arkts]return_on value type is null，device on success')
                device.off('serviceChange',onReceiveEvent_void);
                console.info('[bt_arkts]return_off value type is null，device off success')
            } catch (error) {
                console.error(`[bt_arkts]service change is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]is not support');
                    expect(Number(error.code) == 801).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0100
         * @tc.desc 20251113API22用例覆盖 updateConnectionParam 1-3 .
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                await device.updateConnectionParam(bluetooth.ConnectionParam.LOW_POWER);
                console.info('[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
            } catch (error) {
                console.error(`[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts] device updateConnectionParam is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0200
         * @tc.desc 20251113API22用例覆盖 updateConnectionParam 2-3 .
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                await device.updateConnectionParam(bluetooth.ConnectionParam.BALANCED);
                console.info('[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
            } catch (error) {
                console.error(`[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts] device updateConnectionParam is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts] device updateConnectionParam error is 2900099');
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0300
         * @tc.desc 20251113API22用例覆盖 updateConnectionParam GATT未连接.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_0300', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                await device.updateConnectionParam(bluetooth.ConnectionParam.HIGH);
                console.info('[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
            } catch (error) {
                console.error(`[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts] device updateConnectionParam is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0100
         * @tc.desc 20251113API22用例覆盖 GattServer-getService 2901008 Gatt service is not found.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let serviceUuid = '00001888-0000-1000-8000-00805f9b34fb';
                let returu_gattservice: bluetooth.GattService = gattServer.getService(serviceUuid);
                console.info('[bt_arkts]gattServer getService get return_values is' + JSON.stringify(returu_gattservice));
                let return_serviceUuid = returu_gattservice.serviceUuid;
                console.info('[bt_arkts]get method attribute_serviceUuid' + JSON.stringify(return_serviceUuid));
                let isprimary = returu_gattservice.isPrimary;
                console.info('[bt_arkts]get method attribute_isPrimary' + JSON.stringify(isprimary));
                let characteristics = returu_gattservice.characteristics;
                console.info('[bt_arkts]get method attribute_characteristics' + JSON.stringify(characteristics));
                let includeServices = returu_gattservice.includeServices;
                console.info('[bt_arkts]get method attribute_includeServices' + JSON.stringify(includeServices));
                console.info('[bt_arkts]get method all attribute is success');
            } catch (error) {
                console.error(`[bt_arkts]getservice failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0100 getservice is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts]error is 2901008');
                    expect(Number(error.code)).assertEqual(2901008);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0200
         * @tc.desc 20251113API22用例覆盖 GattServer-getService input is error.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let returu_gattservice: bluetooth.GattService = gattServer.getService(null);
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] gattServer getService input is null, code is ${error.code},message is ${error.message}`);
                expect(Number(error.code)).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_0100
         * @tc.desc 20251113API22用例覆盖 GattServer-getServices.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let return_list: bluetooth.GattService[] = gattServer.getServices();
                console.info('[bt_arkts] return_list is' + JSON.stringify(return_list));
                console.info('[bt_arkts] return_list length is ' + return_list.length);
                if (return_list.length > 0) {
                    console.info('[bt_arkts]return_result is >0' + JSON.stringify(return_list[0]));
                } else {
                    console.info('[bt_arkts]return_result is' + JSON.stringify(return_list));
                }
            } catch (error) {
                console.error(`[bt_arkts]getservices failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]getservices is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    expect(Number(error.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0100
         * @tc.desc 20251113API22用例覆盖GattServer-getConnectedState.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let return_status: bluetooth.ProfileConnectionState = gattServer.getConnectedState('01:02:00:02:03:01');
                console.info('[bt_arkts]get status is' + JSON.stringify(return_status))
                expect(return_status).assertEqual(0);
            } catch (error) {
                console.error(`[bt_arkts]server ProfileConnectionState 0100 is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]getConnectedState is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    expect(Number(error.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0200
         * @tc.desc 20251113API22用例覆盖GattServer-getConnectedState 401.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let return_status: bluetooth.ProfileConnectionState = gattServer.getConnectedState('01');
                console.info('[bt_arkts]get status is' + JSON.stringify(return_status))
                expect(return_status).assertEqual(0);
            } catch (error) {
                console.error(`[bt_arkts]server ProfileConnectionState 0300 is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]getConnectedState is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts] server getConnectedState input is error');
                    expect(Number(error.code)).assertEqual(401);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_0100
         * @tc.desc 20251113API22用例覆盖GattClientDevice-getConnectedState.
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let return_status=device.getConnectedState();
                console.info('[bt_arkts] client ProfileConnectionState 0100 is' + JSON.stringify(return_status))
                expect(return_status).assertEqual(0);
            } catch (error) {
                console.error(`[bt_arkts]getConnectedState status is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]getConnectedState is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts]error code is 2900009');
                    expect(Number(error.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0100
         * @tc.desc API23 on/offBlePhyUpdate(callback: Callback<PhyValue>): void;test normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                gattServer.onBlePhyUpdate(onReceiveEvent_value);
                gattServer.offBlePhyUpdate(onReceiveEvent_value);
            } catch (error) {
                console.error(`[bt_arkts] server onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0200
         * @tc.desc API23 on/offBlePhyUpdate(callback: Callback<PhyValue>): void;test normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                gattServer.onBlePhyUpdate(onReceiveEvent_value);
                gattServer.offBlePhyUpdate();
            } catch (error) {
                console.error(`[bt_arkts] server onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0100
         * @tc.desc API23 client on/off BlePhyUpdate(callback: Callback<PhyValue>): void;normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                device.onBlePhyUpdate(onReceiveEvent_value);
                device.offBlePhyUpdate(onReceiveEvent_value);
            } catch (error) {
                console.error(`[bt_arkts] client onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0200
         * @tc.desc API23 client on/off BlePhyUpdate(callback: Callback<PhyValue>): void;normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                device.onBlePhyUpdate(onReceiveEvent_value);
                device.offBlePhyUpdate();
            } catch (error) {
                console.error(`[bt_arkts] client onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0100
         * @tc.desc API23 server setPhy 连接未建立 test
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                await gattServer.setPhy(deviceId , phyValue1);
                console.info('[bt_arkts] client setPhy is success');
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]setPhy is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts] server The connection is not established.');
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0200
         * @tc.desc API23 server readPhy 连接未建立 test
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let data: bluetooth.PhyValue  = await gattServer.readPhy(deviceId);
                console.info('[bt_arkts] server readPhy:'+ JSON.stringify(data));
                console.info('[bt_arkts] server readPhy txPhy: ' + JSON.stringify(data.txPhy));
                expect(data.txPhy).not().assertUndefined();
                console.info('[bt_arkts] server readPhy rxPhy: ' + JSON.stringify(data.rxPhy));
                expect(data.rxPhy).not().assertUndefined();
                console.info('[bt_arkts] server readPhy phyMode: ' + JSON.stringify(data.phyMode));
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]readPhy is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts] server The connection is not established.');
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0300
         * @tc.desc API23 client readPhy 连接未建立 test
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0300', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                let data: bluetooth.PhyValue = await device.readPhy();
                console.info('[bt_arkts] client readPhy:'+ JSON.stringify(data));
                console.info('[bt_arkts] client readPhy txPhy: ' + JSON.stringify(data.txPhy));
                expect(data.txPhy).not().assertUndefined();
                console.info('[bt_arkts] client readPhy rxPhy: ' + JSON.stringify(data.rxPhy));
                expect(data.rxPhy).not().assertUndefined();
                console.info('[bt_arkts] client readPhy phyMode: ' + JSON.stringify(data.phyMode));
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] client readPhy is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]readPhy is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts] server The connection is not established.');
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0400
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0400
         * @tc.desc API23 client setPhy 连接未建立 test
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_0400', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
            try {
                await device.setPhy(phyValue1);
                console.info('[bt_arkts] client setPhy success');
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[bt_arkts]setPhy is not support');
                    expect(Number(error.code) == 801).assertTrue();
                } else {
                    console.info('[bt_arkts]client The connection is not established.');
                    expect(Number(error.code)).assertEqual(2901003);
                }
            }
            done();
        })

    })
}