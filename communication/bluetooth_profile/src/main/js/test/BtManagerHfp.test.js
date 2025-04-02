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

import bluetoothManager from '@ohos.bluetoothManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btManagerHfpConnTest() {
describe('btManagerHfpConnTest', function() {
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
        console.info('[bluetooth_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        try {
            let button = await driver.findComponent(ON.text("开启"));
            await button.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 开启 end');
        } catch (err) {
            console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
        }
        try {
            let button1 = await driver.findComponent(ON.text("允许"));
            await button1.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 允许 end');
        } catch (err) {
            console.info('[bluetooth_js] click 允许 failed. ' + err);
        }
    }

    async function tryToEnableBt() {
        let sta = bluetoothManager.getState();
        switch (sta) {
            case 0:
                bluetoothManager.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta1 = bluetoothManager.getState();
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
                bluetoothManager.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta2 = bluetoothManager.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
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
     * @tc.number SUB_COMMUNICATION_BTMANAGER_HFPCONN_0100
     * @tc.name testConnect
     * @tc.desc Test connect api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BTMANAGER_HFPCONN_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('hfp state = '+ JSON.stringify(data));
            expect(true).assertEqual(data != null);
        }
        let hfpAg = bluetoothManager.getProfileInstance(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
        hfpAg.on('connectionStateChange', onReceiveEvent);
        hfpAg.off('connectionStateChange', onReceiveEvent);
        done();
    })
})
}