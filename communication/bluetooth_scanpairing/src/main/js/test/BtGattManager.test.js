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

export default function btGattManagerTest() {
describe('btGattManagerTest', function() {
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
        gattServer = await bluetooth.BLE.createGattServer();
        console.info('bluetooth ble create gattserver result:' + gattServer);
        gattClient = await bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        console.info('bluetooth ble create gattclientdevice result:' + gattClient);
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
        gattServer.close();
        console.info('bluetooth gattServer close success');
        // gattClient.close();
        // console.info('bluetooth gattClient close 11:22:33:44:55:66 success');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0100
     * @tc.name test gatt connect and disconnect
     * @tc.desc Test connect and disconnect api .
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0100', 0, async function (done) {
        try {
            gattClient.connect();
            await sleep(2000);
            gattClient.disconnect();
        } catch (error) {
            console.info('[bluetooth_js] gatt disconnect:' + disconnect);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0200
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test getConnectedBLEDevices api .
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0200', 0, function () {
        let result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)
                + "length:" +result.length);
        expect(true).assertEqual(result.length >= 0);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0300
     * test Client BLEconnectStateChange
     * @tc.desc Test on and off api 
     * @tc.type Function
     * @tc.level Level 2
     */
   it('SUB_COMMUNICATION_BLUETOOTH_GATTCLICONNECT_0300', 0, async function (done) {
        function ConnectStateChanged(state) {
            console.log('bluetooth connect state changed');
            let connectState = state.state;
            console.info('[bluetooth_js] state changed' + connectState)
            expect(true).assertEqual(connectState!=null);
        }
        try {
            gattClient.on('BLEConnectionStateChange', ConnectStateChanged);
            gattClient.connect();
            gattClient.disconnect();
        } catch (error) {
            console.info('[bluetooth_js] gatt disconnect:' + disconnect);
            expect(error.code).assertEqual('2900099');
        }
        gattClient.off("BLEConnectionStateChange");
        done();
   })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETRSSIVALUE_0100
     * @tc.name testgetRssiValue
     * @tc.desc Test getRssiValue api by promise
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_GETRSSIVALUE_0100', 0, async function (done) {
        try {
            gattClient.connect();
            await gattClient.getRssiValue().then((data) => {
                console.info('[bluetooth_js] BLE read rssi: ' + JSON.stringify(data));
                expect(true).assertEqual(data != null);
                done();
            }).catch(err => {
                console.info('bluetooth getRssiValue has error: '+ JSON.stringify(err));
                let b=false;
                if(err.code==2900099||err.code==-1)
                {
                    b=true
                }
                expect(true).assertEqual(b);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })


        /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETRSSIVALUE_0200
     * @tc.name testgetRssiValue
     * @tc.desc Test testGetDeviceName api by callback
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETRSSIVALUE_0200', 0, async function (done) {
        try {
            gattClient.getRssiValue((err, data)=> {
                if(err)
                {
                console.info('[bluetooth_js]getRssi value:'+JSON.stringify(err));
                let b=false;
                if(err.code==2900099||err.code==-1)
                {
                    b=true
                }
                expect(true).assertEqual(b);
                }
                else
                {
                    console.info('[bluetooth_js]getRssi value:'+JSON.stringify(data));
                    expect(true).assertEqual(data!=null)
                }
            });
        } catch (error) {
            console.error(`[bluetooth_js]error, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETDEVICENAME_0100
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETDEVICENAME_0100', 0, async function (done) {
        try {
            await gattClient.getDeviceName().then((data) => {
                console.info('[bluetooth_js] device name' + JSON.stringify(data))
                expect(true).assertEqual(data != null);
                done();
            }).catch(err => {
                console.error('bluetooth getDeviceName has error: '+ err);
                expect(err.code).assertEqual(2900099);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]error, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETDEVICENAME_0200
     * @tc.name testGetDeviceName
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETDEVICENAME_0200', 0, async function (done) {
        try {
            function getName() {
                 return new Promise((resolve,reject) => {
                    gattClient.getDeviceName((err, data)=> {
                        if (err) {
                            console.error('getName failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]getName value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await getName().then((data) => {
                console.info("[bluetooth_js]02 getDeviceName done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]02 getDeviceName failed" + e);
                expect(2900099).assertEqual(e);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]getDeviceName error, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETSERVICE_0100
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETSERVICE_0100', 0, async function (done) {
        try {
            await gattClient.getServices().then((GattService) => {
                console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(GattService));
                expect(GattService).assertNull();
                done();
            }).catch(err => {
                console.error('[bluetooth_js] getServices has error:'+ JSON.stringify(err));
                expect(true).assertEqual(true);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]error, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETSERVICE_0200
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETSERVICE_0200', 0, async function (done) {
        try {
            function getService() {
                 return new Promise((resolve,reject) => {
                    gattClient.getServices((err, data)=> {
                        if (err) {
                            console.error('getService failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]getService value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await getService().then((data) => {
                console.info("[bluetooth_js]02 getServices done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]02 getServices failed" + e);
                expect(2900099).assertEqual(e);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]getServices error, code is ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        gattClient.disconnect();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0100
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0100', 0, function () {
        let ret = gattClient.setBLEMtuSize(100);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0200
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0200', 0, function () {
        let ret = gattClient.setBLEMtuSize(22);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0300
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0300', 0, function () {
        let ret = gattClient.setBLEMtuSize(21);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0400
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0400', 0, function () {
        let ret = gattClient.setBLEMtuSize(512);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0500
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MTUSIZE_0500', 0, function () {
        let ret = gattClient.setBLEMtuSize(513);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

      /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0100', 0, async function (done) {
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
            cccValue[0] = 32;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            await gattClient.readCharacteristicValue(characteristic).then((data) => {
                console.info('[bluetooth_js] readCharacValue promise data:'
                + JSON.stringify(data));
                expect(true).assertEqual(data.length>=0);
                done();
            }).catch(err => {
                console.error(`bluetooth readCharacteValue01 promise has error: ${err}`);
                expect(true).assertEqual(true);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue01 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual(undefined);
            done()
        }
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0200', 0, async function(done) {                               
        function readCcc(code, BLECharacteristic) {
            if (code.code != 0) {
                return;
            }
            console.log('bluetooth characteristic uuid:'+ BLECharacteristic.characteristicUuid);
            expect(true).assertEqual(data==null);
            let value = new Uint8Array(BLECharacteristic.characteristicValue);
            console.log('bluetooth characteristic value: ' 
            + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
        }                                                                                              
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
               descriptorValue:arrayBuffer};
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
           characteristicValue: arrayBufferCCC, descriptors:descriptor};
        await gattClient.readCharacteristicValue(characteristic,readCcc);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0300
     * @tc.name test characteristicReadOn
     * @tc.desc Test On and off api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READCHARACTERISTIC_0300', 0, async function (done) {                               
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1123;
        function ReadCharacteristicReq(CharacteristicReadReq) {
            let deviceId = CharacteristicReadReq.deviceId;
            let transId = CharacteristicReadReq.transId;
            let offset = CharacteristicReadReq.offset;
            let characteristicUuid = CharacteristicReadReq.characteristicUuid;
            
            let serverResponse = {deviceId: deviceId, transId: transId, 
                status: 0, offset: offset, value:arrayBufferCCC};
            let ret = gattServer.sendResponse(serverResponse);
            console.info('[bluetooth_js] sendResponse ret : ' + ret);
            expect(ret).assertEqual(false);
        }     
        gattServer.on("characteristicRead", ReadCharacteristicReq);
        sleep(2000);
        gattServer.off("characteristicRead");
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0100', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer};
            await gattClient.readDescriptorValue(descriptor).then((object) => {
                    console.info('[bluetooth_js]readDescripValue null:' + JSON.stringify(object));
                    expect(true).assertEqual(object!=null);
                done();
            }).catch(err => {
                console.error('[bluetooth_js]readDescrValue promise err:'+JSON.stringify(err))
                expect(true).assertEqual(true);
                done();
            })
        } catch (error) {
            console.error('[bluetooth_js]readDescrValue01 error code:'+JSON.stringify(error.code));
            expect(error.code).assertEqual(undefined);
            done()
        } 
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0200', 0, async function (done) {                               
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
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        gattClient.readDescriptorValue(descriptor,readDesc);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0300
     * @tc.name test ReadDescriptorOn
     * @tc.desc Test On and Off api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_READDESCRIPTOR_0300', 0, async function (done) {
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1011;
        function ReadDescriptorReq(DescriptorReadReq) {
            let deviceId = DescriptorReadReq.deviceId;
            let transId = DescriptorReadReq.transId;
            let offset = DescriptorReadReq.offset;
            let characteristicUuid = DescriptorReadReq.characteristicUuid;
            
            let serverResponse = {deviceId: deviceId, transId: transId, 
                status: 0, offset: offset, value:arrayBufferCCC};
            let ret = gattServer.sendResponse(serverResponse);
            console.info('[bluetooth_js]sendResponse ret : ' + ret);
            expect(ret).assertEqual(false);
            console.info("[bluetooth_js] DesRedon jsondata:" +
                'deviceId:' + deviceId + 'transId:' +transId + 'offset:' + 
                offset +'descriptorUuid:' + DescriptorReadReq.descriptorUuid + 
                'characteristicUuid:' +characteristicUuid + 
                'serviceUuid:' + DescriptorReadReq.serviceUuid);
                expect(true).assertEqual(DescriptorReadReq !=null);
        }
        await gattServer.on("descriptorRead", ReadDescriptorReq);
        await gattServer.off("descriptorRead");
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0100
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0100', 0, function () {
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
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
        let ret = gattClient.writeCharacteristicValue(characteristic);
        console.info('[bluetooth_js] writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0200
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0200', 0,  function () {
        let ret = gattClient.writeCharacteristicValue("123");
        console.info('[bluetooth_js]  invaild writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0300
     * @tc.name test characteristicWriteOn
     * @tc.desc Test on and off api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITECHARACTERISTIC_0300', 0, async function (done) {                               
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        function WriteCharacteristicReq(CharacteristicWriteReq) {
        let deviceId = CharacteristicWriteReq.deviceId;
        let transId = CharacteristicWriteReq.transId;
        let offset = CharacteristicWriteReq.offset;
        let isPrep = CharacteristicWriteReq.isPrep;
        let needRsp = CharacteristicWriteReq.needRsp;
        let value =  new Uint8Array(CharacteristicWriteReq.value);
        let characteristicUuid = CharacteristicWriteReq.characteristicUuid;
        
        cccValue[0] = value[0];
        let serverResponse = {deviceId: deviceId, transId: transId,
             status: 0, offset: offset, value:arrayBufferCCC};
        
            let ret = gattServer.sendResponse(serverResponse);
            console.info('[bluetooth_js] sendResponse ret : ' + ret);
            expect(ret).assertEqual(false);
        }    
        gattServer.on("characteristicWrite", WriteCharacteristicReq);
        gattServer.off("characteristicWrite");
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0100', 0,  function () {
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let ret = gattClient.writeDescriptorValue(descriptor);
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0200
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test WriteDescriptorValue api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0200', 0,  function () {
        let ret = gattClient.writeDescriptorValue("");
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0300
     * @tc.name test WriteDescriptorOn
     * @tc.desc Test on and off api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_WRITEDESCRIPTOR_0300', 0, async function (done) {
        let arrayBufferDesc = new ArrayBuffer(8);
        let descValue = new Uint8Array(arrayBufferDesc);
        function WriteDescriptorReq(DescriptorWriteReq) {
            let deviceId = DescriptorWriteReq.deviceId;
            let transId = DescriptorWriteReq.transId;
            let offset = DescriptorWriteReq.offset;
            let isPrep = DescriptorWriteReq.isPrep;
            let needRsp = DescriptorWriteReq.needRsp;
            let value = new Uint8Array(DescriptorWriteReq.value);
            let descriptorUuid = DescriptorWriteReq.descriptorUuid;
            descValue[0] = value[0];
            let serverResponse = {deviceId: deviceId, transId: transId, 
                status: 0, offset: offset, value:arrayBufferDesc};
            
            let ret = gattServer.sendResponse(serverResponse);
            console.info('[bluetooth_js] sendResponse ret : ' + ret);
            expect(ret).assertEqual(false);
            console.info("[bluetooth_js] desWriOn jsondata: " +'deviceId: ' 
            + deviceId + 'transId:' + transId + 'offset:' + offset +'descriptorUuid:'
             + descriptorUuid + 'charUuid:' + DescriptorWriteReq.characteristicUuid +
             'serviceUuid:' + DescriptorWriteReq.serviceUuid +
            'value:' + DescriptorWriteReq.value + 'needRsp' + 
            needRsp + 'isPrep:' +isPrep );
            expect(true).assertEqual(DescriptorWriteReq !=null);
        }    
        gattServer.on("descriptorWrite", WriteDescriptorReq);
        gattServer.off("descriptorWrite");
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0100
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let arrayBufferNotify = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotify);
        descNotifyValue[0] = 1
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBufferNotify};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, true);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0200
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0200', 0, async function(done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let arrayBufferNotify = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotify);
        descNotifyValue[0] = 1
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBufferNotify};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, false);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0300
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0300', 0, async function (done) {
        let ret = gattClient.setNotifyCharacteristicChanged(null, false);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged is null ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0400
     * @tc.name test BLECharacteristicChangeON
     * @tc.desc Test On and off api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SETNOTIFYCHARACTERISTIC_0400', 0, async function (done) {
        function CharacteristicChange(CharacteristicChangeReq) {
            let serviceUuid = CharacteristicChangeReq.serviceUuid;
            let characteristicUuid = CharacteristicChangeReq.characteristicUuid;
            let value = new Uint8Array(CharacteristicChangeReq.characteristicValue);
            expect(true).assertEqual(CharacteristicChangeReq !=null);
        }
        gattClient.on('BLECharacteristicChange', CharacteristicChange);
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let arrayBufferNotify = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotify);
        descNotifyValue[0] = 1
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBufferNotify};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, false);
        expect(ret).assertEqual(false);
        gattClient.off('BLECharacteristicChange');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLOSE_0100
     * @tc.name test gattClient close
     * @tc.desc Test close api.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTCLOSE_0100', 0, async function (done) {
        try {
            let ret = gattClient.close();
            expect(ret).assertEqual(true);
            console.info('bluetooth gattClient close 11:22:33:44:55:66 success');
            await sleep(5000);
        } catch (err) {
            console.error(`[bluetooth_js]GATTCLOSE_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

})
}