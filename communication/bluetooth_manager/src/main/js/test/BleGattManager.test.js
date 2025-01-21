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

import bluetooth from '@ohos.bluetoothManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function bluetoothBLETest() {
describe('bluetoothBLETest', function() {
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
    afterAll(async function (done) {
        console.info('afterAll called')
        await sleep(6000);
        gattClient.close();
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GattConnect_0100
     * @tc.name test gatt connect and disconnect
     * @tc.desc Test api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GattConnect_0100', 0, async function (done) { 
        try {
            gattClient.connect();
            await sleep(2000);
            gattClient.disconnect();
            expect(true).assertFalse();
          } catch(error) {
            console.error(`[bluetooth_js]disconnect failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Connect_0200
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test api 201 - Permission denied.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GattConnect_0200', 0, function () {
        try {
            let result = bluetooth.BLE.getConnectedBLEDevices();
            console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)
                    + "length:" +result.length);
            expect(result.length).assertEqual(0);
        } catch (error) {
            console.error(`[bluetooth_js]getConnDev failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
        }    
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Connect_0300
     * test Client BLEconnectStateChange
     * @tc.desc Test on and off api 
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
   it('COMMUNICATION_BLUETOOTH_BLE_GattConnect_0300', 0, async function (done) {
        try {
            function ConnectStateChanged(state) {
                console.log('bluetooth connect state changed');
                let connectState = state.state;
                console.info('[bluetooth_js] state changed' + connectState)
                expect(true).assertEqual(connectState!=null);
            }
            await gattClient.on('BLEConnectionStateChange', ConnectStateChanged);
            gattClient.connect();
            gattClient.disconnect();
            await sleep(2000);
            await gattClient.off("BLEConnectionStateChange");
            done()
        } catch (error) {
            console.error(`[bluetooth_js]GattConnect_0300 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
            done()
        }
   })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0100
     * @tc.name testgetRssiValue
     * @tc.desc Test getRssiValue api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0100', 0, async function (done) {
        try {
            await gattClient.getRssiValue().then((data) => {
                console.info('[bluetooth_js] BLE read rssi: ' + JSON.stringify(data));
                let rssiLength = Object.keys(data).length;
                expect(rssiLength).assertEqual(0);
                done();
            }).catch(err => {
                console.info('bluetooth getRssiValue has error: '+ JSON.stringify(err));
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetRssiValue_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0200
     * @tc.name testgetRssiValue
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0200', 0, async function (done) {
        try {
            let promise = new Promise((resolve) => {
                gattClient.getRssiValue((err, data)=> {
                    if (err) {
                        console.error('getRssi failed ');
                      }
                    console.info('[bluetooth_js]getRssi value:'+JSON.stringify(data));
                    expect(data).assertNull();
                });
                resolve()
            })
            await promise.then(done)
        } catch (error) {
            console.error(`[bluetooth_js]GetRssiValue_0200 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        } 
         
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0100
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0100', 0, async function (done) {
        await sleep(5000)   
        try {
            await gattClient.getDeviceName().then((data) => {
                console.info('[bluetooth_js] device name:' + JSON.stringify(data))             
                expect(data).assertNull();
                done();
            }).catch(err => {
                console.error('[bluetooth_js] bluetooth getDeviceName has error: '+ JSON.stringify(err));
                expect(err).assertFalse();                
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetDeviceName_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();                    
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_getDeviceName_0200
     * @tc.name testGetDeviceName
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0200', 0, async function (done) {
        try {
            gattClient.getDeviceName((err, data)=> {
                if (err) {
                    console.error('getname1 failed ');
                  }
                console.info('[bluetooth_js]getname value:'+JSON.stringify(data));
                expect(data).assertNull();
            });
            await sleep(2000);
            done(); 
        } catch (error) {
            console.error(`[bluetooth_js]GetDeviceName_0200 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }    
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GetService_0100
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetService_0100', 0, async function (done) {
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
            console.error(`[bluetooth_js]GetService_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GetService_0200
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GetService_0200', 0, async function (done) {
        try {
            gattClient.getServices((code, data)=> {
                if(code.code==0){
                    console.info("bluetooth services size is ", data.length)
                    expect(true).assertEqual(data.length >= 0);
                } else {
                    console.info('[bluetooth_js] get services code ' + JSON.stringify(code));
                    expect(true).assertEqual(code.code == -1);
                }
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetService_0200 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0100
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0100', 0, function () {
        try {
            gattClient.setBLEMtuSize(100);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }    
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
     it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200', 0, function () {
        try {
            gattClient.setBLEMtuSize(22);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0200 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        } 
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300', 0, function () {
        try {
            gattClient.setBLEMtuSize(21);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0300 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0400
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
     it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0400', 0, function () {
        try {
            gattClient.setBLEMtuSize(512);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0400 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_MtuSize_0500
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_MtuSize_0500', 0, function () {
        try {
            gattClient.setBLEMtuSize(513);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0500 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1900
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_1900', 0, async function (done) {
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
                console.error(`bluetooth readCharacteValue19 promise has error: ${err}`);
                expect(true).assertEqual(true);
                done();
            })
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue19 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }             
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_2000
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_2000', 0, async function(done) {  
        try {
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
            gattClient.readCharacteristicValue(characteristic,readCcc);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue20 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }                             
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_2100
     * @tc.name test characteristicReadOn
     * @tc.desc Test On and off api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_2100', 0, async function (done) { 
        try {
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
                gattServer.sendResponse(serverResponse);
            }       
            let gattServer = bluetooth.BLE.createGattServer();
            await gattServer.on("characteristicRead", ReadCharacteristicReq);
            await gattServer.off("characteristicRead");
            gattServer.close();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue21 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }                              
       
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1300', 0, async function (done) {
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
            expect(true).assertFalse();
        } catch (error) {
            console.error('[bluetooth_js]readDescrValue13 error code:'+JSON.stringify(error.code));
            expect(error.code).assertEqual('401');
            done()
        }   
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1400', 0, async function (done) {     
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
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001830-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
            gattClient.readDescriptorValue(descriptor,readDesc);     
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]readDescrValue14 error code:'+JSON.stringify(error));
            expect(error.code).assertEqual('401');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1500
     * @tc.name test ReadDescriptorOn
     * @tc.desc Test On and Off api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_1500', 0, async function (done) {
        try {
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
                gattServer.sendResponse(serverResponse);
                console.info("[bluetooth_js] DesRedon jsondata:" +
                    'deviceId:' + deviceId + 'transId:' +transId + 'offset:' + 
                    offset +'descriptorUuid:' + DescriptorReadReq.descriptorUuid + 
                    'characteristicUuid:' +characteristicUuid + 
                    'serviceUuid:' + DescriptorReadReq.serviceUuid);
                    expect(true).assertEqual(DescriptorReadReq !=null);
            }
            let gattServer = bluetooth.BLE.createGattServer();
            await gattServer.on("descriptorRead", ReadDescriptorReq);
            await gattServer.off("descriptorRead");
            gattServer.close();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue15 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1900
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_1900', 0, function () {
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
            gattClient.writeCharacteristicValue(characteristic);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue19 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_2000
     * @tc.name test characteristicWriteOn
     * @tc.desc Test on and off api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_2000', 0, async function (done) { 
        try {
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
                    gattServer.sendResponse(serverResponse);
            }    
            let gattServer = bluetooth.BLE.createGattServer();
            gattServer.on("characteristicWrite", WriteCharacteristicReq);
            gattServer.off("characteristicWrite");
            gattServer.close();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue20 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }     
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1100', 0,  function () {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let desValue =  new Uint8Array(arrayBuffer);
                desValue[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
                descriptorValue: arrayBuffer};
            gattClient.writeDescriptorValue(descriptor);
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue11 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1200
     * @tc.name test WriteDescriptorOn
     * @tc.desc Test on and off api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_1200', 0, async function (done) {
        try {
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
                gattServer.sendResponse(serverResponse);
                console.info("[bluetooth_js] desWriOn jsondata: " +'deviceId: ' 
                + deviceId + 'transId:' + transId + 'offset:' + offset +'descriptorUuid:'
                + descriptorUuid + 'charUuid:' + DescriptorWriteReq.characteristicUuid +
                'serviceUuid:' + DescriptorWriteReq.serviceUuid +
                'value:' + DescriptorWriteReq.value + 'needRsp' + 
                needRsp + 'isPrep:' +isPrep );
                expect(true).assertEqual(DescriptorWriteReq !=null);
            }    
            let gattServer = bluetooth.BLE.createGattServer();
            gattServer.on("descriptorWrite", WriteDescriptorReq);
            gattServer.off("descriptorWrite");
            gattServer.close();
            done()
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        } 
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1200
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1200', 0, async function (done) {
        try {
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
            gattClient.setNotifyCharacteristicChanged(characteristic, true);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1300
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1300', 0, async function (done) {
        try {
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
            gattClient.setNotifyCharacteristicChanged(characteristic, false);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged13 failed, code is ${error.code}, 
              message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1400
     * @tc.name test BLECharacteristicChangeON
     * @tc.desc Test On and off api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_1400', 0, async function (done) {
        try {
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
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;;
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC, descriptors:descriptors};
            gattClient.setNotifyCharacteristicChanged(characteristic, false);
            gattClient.off('BLECharacteristicChange');
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged14 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }  
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_GattClose_0100
     * @tc.name test gattClient close
     * @tc.desc Test close api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_GattClose_0100', 0, async function (done) {
        try {
            let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
            gattClient.close();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]GattClose_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
       
    })

})
}


