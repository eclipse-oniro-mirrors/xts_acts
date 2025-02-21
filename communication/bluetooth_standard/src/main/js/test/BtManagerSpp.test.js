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

export default function btManagerSppTest() {
describe('btManagerSppTest', function() {
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
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SPP_0100
     * @tc.name test  SppListen
     * @tc.desc Test  SppListen 
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SPP_0100', 0, async function (done) {
        let SppOption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetoothManager.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        function serverSocket(code, number) {
            if (code) {
                console.log('bluetooth error code01: ' + code);
            } else {
                console.log('bluetooth serverSocket Number:' + JSON.stringify(number));
                serverNumber = number;
                expect(true).assertEqual(number != null);
            }
        }
    try {
        await bluetoothManager.sppListen('server1', SppOption, serverSocket);
    } catch (error) {
        console.error(`[bluetooth_js]SPPListen error, code is ${error.code}, 
        message is ${error.message}`);
    }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SPP_0200
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api 
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SPP_0200', 0, async function (done) {
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('bluetooth error code: ' + code.code);
            if (code.code == 0) {
                console.log('bluetooth serverSocket Number: ' + number);
                serverNumber = number;
            }
        }
        let clientNumber = -1;
        function acceptClientSocket(code, number) {
            console.log('bluetooth error code: ' + code.code);
            if (code.code == 0) {
                console.log('bluetooth clientSocket Number: ' + number);
                clientNumber = number;
            }
        }
        try {
            bluetoothManager.sppAccept(serverNumber, acceptClientSocket);
        } catch (error) {
            console.error(`[bluetooth_js]SPPAccept error, code is ${error.code}, 
        message is ${error.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SPP_0300
     * @tc.name test SppConnect
     * @tc.desc Test SppConnect api 8 
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SPP_0300', 0, async function (done) {
        let sppOption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0
        };
    try {
        await bluetoothManager.sppConnect('00:11:22:33:44:55', sppOption, function (code, number) {
            if (code) {
                console.info('[bluetooth_js] code is: ' + JSON.stringify(code));
            } else {
                console.log('[bluetooth_js]sppConnect Number:'
                + JSON.stringify(number));
                expect(true).assertEqual(number != null);
            }
        });
    } catch (error) {
        console.error(`[bluetooth_js]SPPConnect error, code is ${error.code}, 
        message is ${error.message}`);
    }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SPP_0400
     * @tc.name test sppReadOn 
     * @tc.desc Test On and Off Api
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SPP_0400', 0, async function (done) {
        let clientNumber = -1;
        function clientSocket(code, number) {
            if (code.code != 0) {
                return;
            }
            console.log('bluetooth serverSocket Number: ' + number);
            clientNumber = number;
        }
        function dataRead(dataBuffer) {
            let data = new Uint8Array(dataBuffer);
            console.log('bluetooth data is: ' + data[0]);
        }
        try {
            bluetoothManager.on('sppRead', clientNumber, dataRead);
            bluetoothManager.off('sppRead', clientNumber);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
        }
        done();
    })
})
}