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

//import bluetooth from '@ohos.bluetooth';
import bluetooth from '@ohos.bluetoothManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function bluetoothBLETest4() {
describe('bluetoothBLETest4', function() {
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
    afterAll(async function (done) {
        console.info('afterAll called')
        await sleep(6000);
        gattClient.close();
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test api 401 - Invalid null parameters.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200', 0, function () {
        try {
            gattClient.setBLEMtuSize();
            expect(true).assertFalse();
        } catch(error) {
            console.error('[bluetooth_js]error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test api 401 -error type.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300', 0, function () {
        try {
            gattClient.setBLEMtuSize(null);
            expect(true).assertFalse();
        } catch(error) {
            console.error(`[bluetooth_js]setBLEMtuSize3 failed, code is ${error.code}, 
              message is ${error.message}`);
              expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - Invalid null parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0100', 0, async function (done) {
        try {
            await gattClient.readCharacteristicValue().then((data) => {
                if (object != null) {
                    expect(true).assertEqual(true);
                } else {
                    console.info('[bluetooth_js] readCharacValue promise data:'
                    + JSON.stringify(data));
                }
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue1 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - Invalid null parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0200', 0, async function (done) {
        try {
            await gattClient.readCharacteristicValue(null).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue2 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - null serviceUuid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0300', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue3 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if serviceUuid type is error.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0400', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: 123,
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue4 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0500
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - null characteristicUuid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0500', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue5 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0600
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if characteristicUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0600', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: null,
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue6 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0700
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - null characteristicValue.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0700', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue7 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0800
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if characteristicValue is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0800', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
             characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: null, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue8 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0900
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - null descriptors.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0900', 0, async function (done) {
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                    console.info('[bluetooth_js] readCharacValue promise data:'
                    + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue9 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
        done();
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1000
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if descriptors type is error.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1000', 0, async function (done) {
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:123};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue10 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if serviceUuid of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue11 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if serviceUuid of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: 1111222,
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if descriptorUuid of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1300', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue13 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if descriptorUuid of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1400', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: 444555,
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue14 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done();
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1500
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if descriptorValue of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1500', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB'};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue15 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1600
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - if descriptorValue of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1600', 0, async function (done) {
        let descriptors = [];
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: 4455};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        try {
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
            }).catch(err => {
                console.error(`bluetooth readCharacteValue promise has error: ${err}`);
                expect(true).assertFalse();
            });
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue16 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1700
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 -null api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1700', 0, async function(done) {      
        try {
            gattClient.readCharacteristicValue();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]readCharacteValue17 failed, error.code:'
            +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
    })

       /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1800
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 -null readCharacteristicValue by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1800', 0, async function(done) {      
        try {
            function readCcc(code, BLECharacteristic) {
                if (coderror.code != 0) {
                    return;
                }
                console.log('bluetooth characteristic uuid:'+ BLECharacteristic.characteristicUuid);
                expect(true).assertEqual(data==null);
                let value = new Uint8Array(BLECharacteristic.characteristicValue);
                console.log('bluetooth characteristic value: ' 
                + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
            }
            gattClient.readCharacteristicValue(null,readCcc);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue18 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - null descriptor.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0100', 0, async function (done) {
        try {
            await gattClient.readDescriptorValue().then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));          
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue1 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - descriptor is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0200', 0, async function (done) {
        try {
            await gattClient.readDescriptorValue(null).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue2 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - serviceUuid of descriptor is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0300', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue3 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - serviceUuid of descriptor is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0400', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = { serviceUuid: 1234,
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue4 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0500
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - characteristicUuid of descriptor is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0500', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue5 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0600
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - characteristicUuid of descriptor is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0600', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: 1234,
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue6 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0700
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - descriptorUuid of descriptor is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0700', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue7 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0800
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - descriptorUuid of descriptor is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0800', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: 1234,
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue8 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0900
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - descriptorValue of descriptor is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0900', 0, async function (done) {
        try {
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB'};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object)); 
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue9 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1000
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 - descriptorValue of descriptor is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1000', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: 1236454};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                if (object != null) {
                    console.error('readDescriptorValue promise object:'+JSON.stringify(object));
                                
                } else {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertFalse();
                }
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err));
                expect(true).assertFalse();
                done();
            })      
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue10 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 -null readDescriptorValue by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1100', 0, async function (done) {   
        try {                                                                 
            gattClient.readDescriptorValue();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue11 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test 401 -null readDescriptorValue by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1200', 0, async function (done) {   
        try {
            function readDesc(code, BLEDescriptor) {
                if (code.code != 0) {
                   console.info('[bluetooth_js] descriptor code: ' + BLEDescriptor.descriptorUuid);
                   expect(true).assertEqual(BLEDescriptor.descriptorUuid==null);
                }
                console.info('[bluetooth_js] descriptor uuid: ' + BLEDescriptor.descriptorUuid);
                let value = new Uint8Array(BLEDescriptor.descriptorValue);
                console.info('[bluetooth_js] descriptor value: '
                + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
            }
            gattClient.readDescriptorValue(null,readDesc);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }   
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0100
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - api of null parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0100', 0, function () {
        try {
            gattClient.writeCharacteristicValue();
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue1 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0200
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -  api of error parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0200', 0, function () {
        try {
            gattClient.writeCharacteristicValue(null);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue2 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0300
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -null serviceUuid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0300', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue3 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0400
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -serviceUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0400', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: 123123,
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue4 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0500
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - null characteristicUuid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0500', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue5 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0600
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - characteristicUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0600', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: 123123,
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue6 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0700
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - null characteristicValue.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0700', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                 descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue7 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0800
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - characteristicValue is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0800', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: "string", descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue8 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0900
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 - null descriptors.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0900', 0, function () {
        try {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue9 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1000
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1000', 0, function () {
        try {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:'123ss'};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue10 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1100
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -null serviceUuid of descriptors.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1100', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue11 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1200
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -serviceUuid of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1200', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:123123,
                   characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1300
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -characteristicUuid of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1300', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue13 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1400
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -characteristicUuid of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1400', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                   characteristicUuid: 123123,
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue14 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1500
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -descriptorUuid of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1500', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                   characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue15 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1600
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -descriptorUuid of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1600', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                   characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: 123123, descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue16 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1700
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -descriptorValue of descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1700', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                   characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue17 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1800
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test 401 -descriptorValue of descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1800', 0, function () {
        try {
            let descriptors = [];
            let descriptor = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                   characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: "string"};
                descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteValue18 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - api is null parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0100', 0, function () {
        try {
            gattClient.writeDescriptorValue();
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue1 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0200
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 -  api is error parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0200', 0, function () {
        try {
            gattClient.writeDescriptorValue(null);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue2 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0300
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 -  null serviceUuid.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0300', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
           gattClient.writeDescriptorValue(descriptor);
           expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue3 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0400
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - serviceUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0400', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: 123123,
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
           gattClient.writeDescriptorValue(descriptor);
           expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue4 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0500
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 -  characteristicUuid is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0500', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
           gattClient.writeDescriptorValue(descriptor);
           expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue5 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })
  
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0600
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - characteristicUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0600', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: 123123,
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
           gattClient.writeDescriptorValue(descriptor);
           expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue6 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0700
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - descriptorUuid is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0700', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
            gattClient.writeDescriptorValue(descriptor);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue7 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0800
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - descriptorUuid is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0800', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: 123123, descriptorValue: arrayBuffer};
            gattClient.writeDescriptorValue(descriptor);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue8 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0900
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - descriptorValue is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0900', 0,  function () {
        try {
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB'};
            gattClient.writeDescriptorValue(descriptor);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue9 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1000
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test 401 - descriptorValue is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1000', 0,  function () {
        try {
            let descriptor = {serviceUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: 'string'};
            gattClient.writeDescriptorValue(descriptor);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue10 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0100
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - parameter of api is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0100', 0, function () {
        try {
            gattClient.setNotifyCharacteristicChanged();
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged1 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0200
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - first parameter of api is error type .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0200', 0, function () {
        try {
            gattClient.setNotifyCharacteristicChanged(null, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged2 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0300
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - second parameter of api is null .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0300', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, 222);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged3 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0400
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - serviceUuid is null .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0400', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged4 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0500
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - serviceUuid is error type .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0500', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:123123,
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged5 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0600
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - characteristicUuid is null .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0600', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged6 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0700
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - characteristicUuid is error type .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0700', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicUuid: 123123,
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged7 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0800
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - characteristicValue is null .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0800', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged8 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0900
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - characteristicValue is error type .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0900', 0, function () {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: '123', descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged9 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1000
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - descriptors is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1000', 0, function () {
        try {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged10 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1100
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test 401 - descriptors is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1100', 0, function () {
        try {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid:'00001820-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:'123'};
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged11 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_createGattClientDevice_0100
     * @tc.name test createGattClientDevice
     * @tc.desc Test createGattClientDevice 401.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_createGattClientDevice_0100', 0, async function (done) {
        try {
            let gattClient = bluetooth.BLE.createGattClientDevice();
            gattClient.close();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]createGattClientDevice01 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_createGattClientDevice_0200
     * @tc.name test createGattClientDevice
     * @tc.desc Test createGattClientDevice 401.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_createGattClientDevice_0200', 0, async function (done) {
        try {
            let gattClient = bluetooth.BLE.createGattClientDevice(null);
            gattClient.close();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]createGattClientDevice02 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
       
    })

})
}


