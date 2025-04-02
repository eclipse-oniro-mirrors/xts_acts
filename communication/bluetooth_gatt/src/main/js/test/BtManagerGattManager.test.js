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
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btManagerGattManagerTest() {
describe('btManagerGattManagerTest', function() {
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
        await tryToEnableBt();
        gattServer = bluetooth.BLE.createGattServer();
        console.info('[bluetooth_js]bmgm gattServer create info:' + gattServer);
        gattClient = bluetooth.BLE.createGattClientDevice('92:3A:C0:3A:4C:28');
        console.info('[bluetooth_js]bmgm gattClient create info:' + gattClient);
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
        await gattServer.close();
        console.info('[bluetooth_js]bmgm gattServer close success');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0100
     * @tc.name testConnect
     * @tc.desc Test api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0100', 0, async function (done) { 
        try {
            gattClient.connect();
            console.info(`[bluetooth_js]connect success`);
          } 
          catch(error) {
            console.info(`[bluetooth_js]connect failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        try {
            gattClient.disconnect();
            console.info(`[bluetooth_js]disconnect success`);
          } 
          catch(error) {
            console.info(`[bluetooth_js]disconnect failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0200
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test api 201 - Permission denied.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0200', 0, async function (done) {
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
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0300
     * @tc.name testBLEconnectStateChange
     * @tc.desc Test on and off api 
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
   it('SUB_COMMUNICATION_BTMANAGER_GATTCONNECT_0300', 0, async function (done) {
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
            done();
        } catch (error) {
            console.error(`[bluetooth_js]GattConnect_0300 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
            done()
        }
        await gattClient.off("BLEConnectionStateChange");
        done();
   })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETRSSIVALUE_0100
     * @tc.name testGetRssiValue
     * @tc.desc Test getRssiValue api by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETRSSIVALUE_0100', 0, async function (done) {
        try {
            gattClient.connect();
            await gattClient.getRssiValue().then((data) => {
                console.info('[bluetooth_js] BLE read rssi:' + data);
                expect(data).assertNotEqual(null);
                done();
            }).catch(err => {
                console.info('bluetooth getRssiValue has error: '+ JSON.stringify(err));
                let b=false;
                if(err.code==2900099||err.code==-1)
                {
                    b=true
                }
                expect(b).assertEqual(true);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        gattClient.disconnect();
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETRSSIVALUE_0200
     * @tc.name testGetRssiValue
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETRSSIVALUE_0200', 0, async function (done) {
        try {
            gattClient.connect();
            function getRssi() {
                 return new Promise((resolve,reject) => {
                    gattClient.getRssiValue((err, data)=> {
                        if (err) {
                            console.error('getRssi failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]getRssi value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await getRssi().then((data) => {
                console.info("[bluetooth_js]02 getRssiValue done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]02 getRssiValue failed" + e);
                expect(2900099).assertEqual(e);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
        }
        gattClient.disconnect();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETDEVICENAME_0100
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETDEVICENAME_0100', 0, async function (done) {  
        try {
            gattClient.connect();
            await gattClient.getDeviceName().then((data) => {
                console.info('[bluetooth_js] device name:' + JSON.stringify(data))             
                expect(true).assertEqual(data != null);
                done();
            }).catch(err => {
                console.error('[bluetooth_js] bluetooth getDeviceName has error: '+ JSON.stringify(err));
                expect(Number(err.code)).assertEqual(2900099);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetDeviceName failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        gattClient.disconnect();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETDEVICENAME_0200
     * @tc.name testGetDeviceName
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETDEVICENAME_0200', 0, async function (done) {
        try {
            gattClient.connect();
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
                expect(Number(error.code)).assertEqual(2900099);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]getDeviceName error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        gattClient.disconnect();
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETSERVICE_0100
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETSERVICE_0100', 0, async function (done) {
        try {
            gattClient.connect();
            await gattClient.getServices().then((GattService) => {
                console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(GattService));
                expect(true).assertEqual(GattService != null);
                done();
            }).catch(err => {
                console.error('[bluetooth_js] getServices has error:'+ JSON.stringify(err));
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetService_0100 failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        gattClient.disconnect();
        done();   
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GETSERVICE_0200
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_GETSERVICE_0200', 0, async function (done) {
        try {
            gattClient.connect();
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
        }
        gattClient.disconnect();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0100
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0100', 0, function () {
        try {
            gattClient.setBLEMtuSize(100);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }    
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0200
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0200', 0, function () {
        try {
            gattClient.setBLEMtuSize(22);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0200 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        } 
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0300
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0300', 0, function () {
        try {
            gattClient.setBLEMtuSize(21);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0300 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0400
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0400', 0, function () {
        try {
            gattClient.setBLEMtuSize(512);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0400 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0500
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_MTUSIZE_0500', 0, function () {
        try {
            gattClient.setBLEMtuSize(513);
            console.info("[bluetooth_js]setBLEMtuSize success")
            expect(true).assertFalse();
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize_0500 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_1900
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_1900', 0, async function (done) {
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
            expect(Number(error.code)).assertEqual(401);
            done()
        }             
       
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_2000
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_2000', 0, async function(done) {  
        try {
            function readCcc(code, BLECharacteristic) {
                console.log('bluetooth characteristic code:'+ code.code);
                if (code.code != 0) {
                    return;
                }
                console.log('bluetooth characteristic serviceUuid:'+ BLECharacteristic.serviceUuid);
                console.log('bluetooth characteristic characteristicUuid:'+ BLECharacteristic.characteristicUuid);
                console.log('bluetooth characteristic characteristicValue:'+ BLECharacteristic.characteristicValue);
                console.log('bluetooth characteristic descriptors:'+ BLECharacteristic.descriptors);
                console.log('bluetooth characteristic properties:'+ BLECharacteristic.properties);

                console.log('bluetooth BLECharacteristic write:'+ BLECharacteristic.properties.write);
                console.log('bluetooth BLECharacteristic writeNoResponse:'+ BLECharacteristic.properties.writeNoResponse);
                console.log('bluetooth BLECharacteristic read:'+ BLECharacteristic.properties.read);
                console.log('bluetooth BLECharacteristic notify:'+ BLECharacteristic.properties.notify);
                console.log('bluetooth BLECharacteristic indicate:'+ BLECharacteristic.properties.indicate);

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
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue20 failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
            done();
        }                             
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_2100
     * @tc.name testCharacteristicReadOn
     * @tc.desc Test On and off api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_READCHARACTERISTIC_2100', 0, async function (done) { 
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
            await gattServer.on("characteristicRead", ReadCharacteristicReq);
            await gattServer.off("characteristicRead");
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue21 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
        }       
        done();                       
       
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1300', 0, async function (done) {
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
            expect(Number(error.code)).assertEqual(401);
            done()
        }   
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1400', 0, async function (done) {     
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
            expect(Number(error.code)).assertEqual(401);
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1500
     * @tc.name testReadDescriptorOn
     * @tc.desc Test On and Off api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_READDESCRIPTOR_1500', 0, async function (done) {
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
            await gattServer.on("descriptorRead", ReadDescriptorReq);
            await gattServer.off("descriptorRead");
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue15 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_WRITECHARACTERISTIC_1900
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_WRITECHARACTERISTIC_1900', 0, function () {
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
            expect(Number(error.code)).assertEqual(401);
        }
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_WRITECHARACTERISTIC_2000
     * @tc.name testCharacteristicWriteOn
     * @tc.desc Test on and off api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_WRITECHARACTERISTIC_2000', 0, async function (done) { 
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
            gattServer.on("characteristicWrite", WriteCharacteristicReq);
            gattServer.off("characteristicWrite");
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue20 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
        }     
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_WRITEDESCRIPTOR_1100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_WRITEDESCRIPTOR_1100', 0,  function () {
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
            expect(Number(error.code)).assertEqual(401);
        }
       
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_WRITEDESCRIPTOR_1200
     * @tc.name testWriteDescriptorOn
     * @tc.desc Test on and off api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_WRITEDESCRIPTOR_1200', 0, async function (done) {
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
            gattServer.on("descriptorWrite", WriteDescriptorReq);
            gattServer.off("descriptorWrite");
            done()
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue12 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        } 
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1200
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1200', 0, async function (done) {
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
            expect(Number(error.code)).assertEqual(401);
            done()
        }
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1300
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1300', 0, async function (done) {
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
            expect(Number(error.code)).assertEqual(401);
            done()
        }
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1400
     * @tc.name testBLECharacteristicChangeON
     * @tc.desc Test On and off api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SETNOTIFYCHARACTERISTIC_1400', 0, async function (done) {
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
        } catch (error) {
            console.error(`[bluetooth_js]setNotifyCharacteristicChanged14 failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        gattClient.off('BLECharacteristicChange');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_GATTCLOSE_0100
     * @tc.name testGattClientClose
     * @tc.desc Test close api.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_GATTCLOSE_0100', 0, async function (done) {
        try {
            await gattClient.close();
            console.info('[bluetooth_js]bmgm gattClient close success');
        } catch (error) {
            console.error(`[bluetooth_js]GattClose_0100 failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(true).assertFalse();
        }
       done();
    })

})
}