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

export default function bluetoothAdvertisingTest() {
describe('bluetoothAdvertisingTest', function() {
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
        let sta = btAccess.getState();
        switch(sta){
            case 0:
                btAccess.enableBluetooth();
                await clickTheWindow();
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
                await clickTheWindow();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    let manufactureValueBuffer = new Uint8Array(4);
    manufactureValueBuffer[0] = 1;
    manufactureValueBuffer[1] = 2;
    manufactureValueBuffer[2] = 3;
    manufactureValueBuffer[3] = 4;
    let serviceValueBuffer = new Uint8Array(4);
    serviceValueBuffer[0] = 4;
    serviceValueBuffer[1] = 6;
    serviceValueBuffer[2] = 7;
    serviceValueBuffer[3] = 8;
    let setting = {
        interval:32,
        txPower:1,
        connectable:true,
    };
    let manufactureDataUnit = {
        manufactureId:4567,
        manufactureValue:manufactureValueBuffer.buffer
    };
    let serviceDataUnit = {
        serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
        serviceValue:serviceValueBuffer.buffer
    };
    let advData = {
        serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
        manufactureData:[manufactureDataUnit],
        serviceData:[serviceDataUnit],
    };
    let advResponse = {
        serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
        manufactureData:[manufactureDataUnit],
        serviceData:[serviceDataUnit],
    };
        
    beforeAll(async function (done) {
        await openPhone();
        console.info('beforeAll called');
        done();
    })
    beforeEach(async function(done) {
        await tryToEnableBt();
        console.info('manufactureValueBuffer = '+ JSON.stringify(manufactureValueBuffer));
        console.info('serviceValueBuffer = '+ JSON.stringify(serviceValueBuffer));
        console.info('beforeEach called');
        done();
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0600
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0600', 0, async function (done) {
        let advertisingParams = {
            advertisingSettings: setting,
            advertisingData: advData,
            advertisingResponse: advResponse,
            duration: 'a',
        }
        let advHandle = 0xFF;
        try {
            bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
                console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
                advHandle = outAdvHandle;
                console.info('[bluetooth_js]startAdvertising promise info2:'+JSON.stringify(advHandle));
            });
            await sleep(1000);
            await bluetooth.stopAdvertising(advHandle).then((data) => {
                console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
            });
        } catch (err) {
            console.info("06errCode:" + err.code + ",06errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        await sleep(2000);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0800
     * @tc.name test start/stopAdvertising callback/promise
     * @tc.desc Test bluetoothBle api11
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0800', 0, async function (done) {
        let advertisingParams = {
            advertisingSettings: setting,
            advertisingData: advData,
            advertisingResponse: advResponse,
            duration: '',
        }
        let advHandle = 0xFF;
        try {
            bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
                console.info('[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
                advHandle = outAdvHandle;
                console.info('[bluetooth_js]startAdvertising promise info2:'+JSON.stringify(advHandle));
            });
            await sleep(3000);
            await bluetooth.stopAdvertising(advHandle).then((data) => {
                console.info('[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
            });
        } catch (err) {
            console.info("08errCode:" + err.code + ",08errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        await sleep(2000);
        done();
    })
})
}