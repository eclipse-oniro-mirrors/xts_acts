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

export default function btGattServiceTest() {
describe('btGattServiceTest', function() {

    let gattServer = null;
    let gattClient = null;
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
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        gattServer = bluetooth.BLE.createGattServer();
        console.info('[bluetooth_js]bgs gattServer create info:' + gattServer);
        gattClient = bluetooth.BLE.createGattClientDevice("00:22:44:66:77:69");
        console.info('[bluetooth_js]bgs gattClient create info:' + gattClient);
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
    afterAll(async function (done) {
        console.info('afterAll called')
        await gattClient.close();
        console.info('[bluetooth_js]gattClient close success');
        await gattServer.close();
        console.info('[bluetooth_js]gattServer close success');
        done();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTSERCONNECT_0100
     * @tc.name test Server connectStateChange
     * @tc.desc Test on and off api .
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTSERCONNECT_0100', 0, async function (done) {
        function Connected(BLEConnectChangedState) {
            let deviceId = BLEConnectChangedState.deviceId;
            let status = BLEConnectChangedState.state;
            console.info("[bluetooth_js] connectStateChange jsondata:"
             +'deviceId:' + deviceId + 'status:' + status);
        }
        try {
            await gattServer.on("connectStateChange", Connected);
            gattClient.connect();
        } catch (error) {
            console.error(`[bluetooth_js]code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        await gattServer.off("connectStateChange");
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0100', 0, async function (done) {
        try {
            let characteristics = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FF',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FF', 
            characteristicValue: arrayBufferC};
            characteristics[0] = characteristic;
            let service = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FF', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            let ret = gattServer.addService(service);
            console.info('[bluetooth_js] bluetooth addService characteristics is null result:' + ret);
            expect(ret).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]Connect_0100 failed, code is ${error.code},message is ${error.message}`);
            
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B88QP',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B88QP',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B88QP', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B88QP',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B88QP', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B88QP', isPrimary: true,
        characteristics:characteristics};
        try {
            let ret = gattServer.addService(gattService);
            console.info('[bluetooth_js] bluetooth addService a characteristics result : ' + ret);
        } catch (error) {
            console.error(`[bluetooth_js] failed, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0300
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0300', 0, async function (done) {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let descV = new Uint8Array(arrayBuffer);
            descV[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B77OO',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B77OO',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B77OO', descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let characteristics = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B77OO',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B77OO', 
            characteristicValue: arrayBufferC, descriptors:descriptors};
            let characteristicN = {serviceUuid: '00001810-0000-1000-8000-00805F9B77OO',
            characteristicUuid: '00001821-0000-1000-8000-00805F9B77OO', 
            characteristicValue: arrayBufferC, descriptors:descriptors};
            characteristics[0] = characteristic;
            characteristics[1] = characteristicN;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B77OO', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            let ret = gattServer.addService(gattService);
            console.info('[bluetooth_js] bluetooth addService more characteristics result : ' + ret);
            expect(ret).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]Connect_0100 failed, code is ${error.code},message is ${error.message}`);
            
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0400
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0400', 0, async function (done) {
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B32YY',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B32YY', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService not descriptors result : ' + ret);
        done();
    })
 
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0500
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0500', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B98IL',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B98IL',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B98IL', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B98IL',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B98IL', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B98IL', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService a descriptors result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0600
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0600', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B30QA',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B30QA',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B30QA', descriptorValue: arrayBuffer};
        
        let descriptor1 = {serviceUuid: '00001810-0000-1000-8000-00805F9B30QA',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B30QA',
        descriptorUuid: '00001830-0000-1000-8000-00805F9B30QA', descriptorValue: arrayBuffer};

        descriptors[0] = descriptor;
        descriptors[1] = descriptor1;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B30QA',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B30QA', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B30QA', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService more descriptors result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0700
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0700', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B7878',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B7878',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B7878', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService isPrimary result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0800
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0800', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: false,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService isNotPrimary result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0900
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_0900', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null serviceUuid result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1000
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1000', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '123@ad',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '123@ad',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'123@ad', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService invalid serviceUuid result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null characteristicValue result : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ADDSERVICE_1200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB'};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null descriptorValue result : ' + ret);
        expect(ret).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_REMOVESERVICE_0200
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_REMOVESERVICE_0200', 0, async function (done) {
        let ret1=gattServer.removeService('00001800-0000-1000-8000-00805f9b3442');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_REMOVESERVICE_0300
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_REMOVESERVICE_0300', 0, async function (done) {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let descV = new Uint8Array(arrayBuffer);
            descV[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B21HZ',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B21HZ',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B21HZ', descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let characteristics = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B21HZ',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B21HZ', 
            characteristicValue: arrayBufferC, descriptors:descriptors};
            characteristics[0] = characteristic;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B21HZ', isPrimary: false,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            console.info('[bluetooth_js] bluetooth addService result : ' + ret);
            await sleep(1000);
            let ret = gattServer.removeService('00001810-0000-1000-8000-00805F9B21HZ');
            await sleep(1000);
            console.info('[bluetooth_js]removeService ret:'+ret);
        } catch (error) {
            console.error(`[bluetooth_js]Connect_0100 failed, code is ${error.code},message is ${error.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0100
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B77JX',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B77JX',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B77JX', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B77JX',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B77JX', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B77JX',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B77JX', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', NotifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0200
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B99BH',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B99BH',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B99BH', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B99BH',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B99BH', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B99BH',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B99BH', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0300
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_NOTIFYCHARACTERISTIC_0300', 0, async function (done) {
        console.info('[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200');
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', null);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SENDRESPONSE_0100
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SENDRESPONSE_0100', 0, async function (done) {
        let arrayBuffer = new ArrayBuffer(8);
        let value =  new Uint8Array(arrayBuffer);
        value[0] = 1;
        let ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: 0, offset: 0, value: arrayBuffer};
        let ret = gattServer.sendResponse(ServerResponse);
        console.info('[bluetooth_js] sendResponse ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SENDRESPONSE_0200
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SENDRESPONSE_0200', 0, async function (done) {
        let arrayBuffer = new ArrayBuffer(8);
        let value =  new Uint8Array(arrayBuffer);
        value[0] = 1;
        let ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: -1, offset: 0, value: arrayBuffer};
        let ret = gattServer.sendResponse(ServerResponse);
        console.info('[bluetooth_js] sendResponse ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

})
}