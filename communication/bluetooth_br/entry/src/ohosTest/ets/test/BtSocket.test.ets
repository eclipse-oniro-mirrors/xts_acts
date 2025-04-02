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
import { BusinessError } from '@ohos.base';
import bluetooth from '@ohos.bluetooth.socket';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

    function sleep(delay : number) : Promise<void> {
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

    let PERMISSION_TEXT:string = "允许";
    let OPEN_BT_TEXT:string = "开启";

    async function clickRequestPermission(text:string) {
        console.info('[bluetooth_js] clickRequestPermission start');
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
            let button1 = await driver.findComponent(ON.text("允许"));
            await button1.click();
            await driver.delayMs(3000);
            console.info('[bluetooth_js] click 允许 end');
        } catch (err) {
            console.info('[bluetooth_js] click 允许 failed. ' + err);
        }
    }

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await clickRequestPermission(OPEN_BT_TEXT);
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
                await clickRequestPermission(OPEN_BT_TEXT);
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    function serverSocket(code: BusinessError, number: number) {
            let serverNumber = -1;
            if (code) {
                console.log('bluetooth error code01: ' + code);
            } else {
                console.log('bluetooth serverSocket Number:' + JSON.stringify(number));
                serverNumber = number;
                expect(true).assertEqual(serverNumber != -1);
            }
        }
    function serverSocket3(code: BusinessError, number: number) {
            let serverNumber = -1;
            if (code) {
                console.log('bluetooth error code10: ' + JSON.stringify(code));
            }else{
                console.log('bluetooth serverSocket3 Number:'+ JSON.stringify(number));
                serverNumber = number;
                expect(true).assertEqual(serverNumber!=null);
            }
        }
        function acceptClientSocket(code: BusinessError, number: number) {
            console.log('bluetooth error code: ' + code.code);
            let clientNumber = -1;
            if (code.code == 0) {
                console.log('bluetooth clientSocket Number: ' + number);
                clientNumber = number;
                expect(true).assertEqual(clientNumber != -1);
            }
        }
    function dataRead(dataBuffer :  ArrayBuffer) {
            let data = new Uint8Array(dataBuffer);
            console.log('bluetooth data is: ' + data[0]);
        }
export default function btSocketTest() {
describe('btSocketTest', () =>  {
    beforeAll(async (done : Function) =>  {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        done();
    })
    beforeEach(async (done : Function) =>  {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(() => {
        console.info('afterEach called')
    })
    afterAll(() => {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0100
     * @tc.name testSppListen
     * @tc.desc Test  SppListen api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0100', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        const SppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
    try {
        await bluetooth.sppListen('server1', SppOption, serverSocket);
    } catch (error) {
        console.error(`[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
        expect(true).assertEqual(error == null);
    }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0200
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0200', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        let SppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        bluetooth.sppListen('server_accept', SppOption, serverSocket);
        let clientNumber = -1;
        try {
            bluetooth.sppAccept(serverNumber, acceptClientSocket);
        } catch (error) {
            console.error(`[bluetooth_js]SPPAccept error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0300
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0300', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        let sppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0
        };
    try {
        await bluetooth.sppConnect('00:11:22:33:44:55', sppOption, (code: BusinessError, number: number) => {
            if (code) {
                console.info('[bluetooth_js] code is: ' + JSON.stringify(code));
            } else {
                console.log('[bluetooth_js]sppConnect Number:'
                + JSON.stringify(number));
                expect(true).assertEqual(number != null);
            }
        });
    } catch (error) {
        console.error(`[bluetooth_js]SPPConnect error, code is ${error.code},message is ${error.message}`);
        expect(true).assertEqual(error == null);
    }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0400
     * @tc.name testSppReadOn 
     * @tc.desc Test On and Off api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0400', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        let SppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;  
        try {
            bluetooth.sppListen('server04', SppOption, serverSocket);
		    bluetooth.sppAccept(serverNumber, acceptClientSocket);
            bluetooth.on('sppRead', clientNumber, dataRead);
            bluetooth.off('sppRead', clientNumber);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0800
     * @tc.name testSppReadOn 
     * @tc.desc Test On and Off api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0800', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        let SppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        try {
            bluetooth.sppListen('server08', SppOption, serverSocket);
		    bluetooth.sppAccept(serverNumber, acceptClientSocket);
            bluetooth.on('sppRead', clientNumber, dataRead);
            bluetooth.off('sppRead', clientNumber);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0500
     * @tc.name testSppCloseServerSocket
     * @tc.desc Test sppCloseServerSocket api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0500', 0, async (done : Function) =>  {
        let serverNumber = -1;
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        const SppOption : sppoption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        await bluetooth.sppListen('server1', SppOption, serverSocket3);
        try {
            bluetooth.sppCloseServerSocket(serverNumber);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(true).assertEqual(err == null);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0600
     * @tc.name testSppCloseClientSocket
     * @tc.desc Test sppCloseClientSocket api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0600', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        let SppOption :sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        try {
            bluetooth.sppListen('server06', SppOption, serverSocket);
		    bluetooth.sppAccept(serverNumber, acceptClientSocket);
            bluetooth.sppCloseClientSocket(clientNumber);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0700
     * @tc.name testSppWrite
     * @tc.desc Test sppWrite api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0700', 0, async (done : Function) =>  {
        interface sppoption {
            uuid : string;
            secure : boolean;
            type : number
        }
        const SppOption : sppoption = {
            uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        let arrayBuffer = new ArrayBuffer(8);
        let data = new Uint8Array(arrayBuffer);
        data[0] = 123;
        try {
            bluetooth.sppListen('server07', SppOption, serverSocket);
		    bluetooth.sppAccept(serverNumber, acceptClientSocket);
            bluetooth.sppWrite(clientNumber, arrayBuffer);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })
})
}