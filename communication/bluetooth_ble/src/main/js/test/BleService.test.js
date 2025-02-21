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

export default function bluetoothBLETest1() {
describe('bluetoothBLETest1', function() {

    let gattServer = null;
    let gattClient = null;
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
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
                await sleep(10000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
        gattServer = bluetooth.BLE.createGattServer();
        gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
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
        gattServer.close();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_Connect_0100
     * @tc.name test Server connectStateChange
     * @tc.desc Test on and off api .
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_Connect_0100', 0, async function (done) {
        function Connected(BLEConnectChangedState) {
            let deviceId = BLEConnectChangedState.deviceId;
            let status = BLEConnectChangedState.state;
            console.info("[bluetooth_js] connectStateChange jsondata:"
             +'deviceId:' + deviceId + 'status:' + status);
            expect(true).assertEqual(BLEConnectChangedState !=null);
          }
        await gattServer.on("connectStateChange", Connected);
        let ret = gattClient.connect();
        await sleep(2000);
        console.info('[bluetooth_js] gattClient connect' + ret)
        expect(ret).assertTrue();
        await gattServer.off("connectStateChange");
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0100', 0, async function (done) { 
        let service = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            isPrimary: true, includeServices: []};
        let ret = gattServer.addService(service);
        console.info('[bluetooth_js] bluetooth addService characteristics is null result:' + ret);
        expect(ret).assertFalse();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0200', 0, async function (done) {
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService a characteristics result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0300
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0300', 0, async function (done) {
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
        let characteristicN = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        characteristics[1] = characteristicN;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService more characteristics result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0400
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0400', 0, async function (done) {
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService not descriptors result : ' + ret);
        expect(ret).assertFalse();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })
 
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0500
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0500', 0, async function (done) {
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService a descriptors result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0600
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0600', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        
        let descriptor1 = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};

        descriptors[0] = descriptor;
        descriptors[1] = descriptor1;
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
        console.info('[bluetooth_js] bluetooth addService more descriptors result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0700
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0700', 0, async function (done) {
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService isPrimary result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0800
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0800', 0, async function (done) {
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
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0900
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0900', 0, async function (done) {
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
        expect(ret).assertFalse();
        await sleep(1000);
        let ret1=gattServer.removeService('');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1000
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1000', 0, async function (done) {
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
        expect(ret).assertFalse();
        await sleep(1000);
        let ret1=gattServer.removeService('123@ad');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1100', 0, async function (done) {
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
        expect(ret).assertFalse();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        console.info('[bluetooth_js]removeService ret:'+ ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1200', 0, async function (done) {
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
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100', 0, async function (done) {
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', 
                 isPrimary: true,characteristics:characteristics,includeServices:[]};
        let gattService1 = {serviceUuid:'00001888-0000-1000-8000-00805f9b34fb',
                isPrimary: false,characteristics:characteristics,includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService1 result : ' + ret);
        expect(ret).assertTrue();
        let retN = gattServer.addService(gattService1);
        console.info('[bluetooth_js] bluetooth addService2 result : ' + retN);
        expect(retN).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200', 0, async function (done) {
        let ret1=gattServer.removeService('00001800-0000-1000-8000-00805f9b3442');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300', 0, async function (done) {
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService result : ' + ret);
        expect(ret).assertTrue();
        await sleep(1000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        let ret2=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(1000);
        console.info('[bluetooth_js]removeService1 ret:'+ret2);
        expect(ret2).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', NotifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300', 0, async function (done) {
        console.info('[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200');
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', null);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0100
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0100', 0, async function (done) {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0200
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0200', 0, async function (done) {
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


