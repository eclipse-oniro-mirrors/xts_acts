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

export default function btScanModeTest() {
describe('btScanModeTest', function() {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0100
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0100', 0, async function (done) {
         let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0100 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_NONE,0);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0100 newscanmode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_NONE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0100 setoldscanmode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
        else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }

      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0200
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0200', 0, async function (done) {

         let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 newscanmode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 setoldscanmode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0300
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0300', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,40000);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0200 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0400
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0400', 0, async function (done) {
         let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0400 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,40000);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0400 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0400 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0500
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0500', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0500 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,0);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0500 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0500 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
         }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0600
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ScanMode_0600', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0600 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,0);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0600 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0600 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0700
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0700', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0700 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,20000);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0700 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0700 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
         }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0800
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ScanMode_0800', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0800 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,0);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0800 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0800 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
         }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_0900
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ScanMode_0900', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0900 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,30000);
            expect(result).assertTrue();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0900 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
            result=bluetooth.setBluetoothScanMode(oldScanMode,0);
            expect(result).assertTrue();
            let getOldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0900 getOldScanMode = '+ JSON.stringify(getOldScanMode));
            expect(true).assertEqual(oldScanMode == getOldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SCANMODE_1000
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SCANMODE_1000', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
        if(state==bluetooth.BluetoothState.STATE_ON)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_1000 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(-1,0);
            expect(result).assertFalse();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_1000 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == oldScanMode);
            done();
        }
         else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
            done();
        }
    })

})
}