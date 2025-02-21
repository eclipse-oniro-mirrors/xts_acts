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

import bluetoothBle from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btBleManagerTest() {
describe('btBleManagerTest', function() {
    let gattS: bluetoothBle.GattServer;
    let gattC: bluetoothBle.GattClientDevice;
    let PERMISSION_TEXT:string = "允许";
    let OPEN_BT_TEXT:string = "开启";
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

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                btAccess.enableBluetooth();
                await clickRequestPermission(OPEN_BT_TEXT);
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
                btAccess.enableBluetooth();
                await clickRequestPermission(OPEN_BT_TEXT);
                await sleep(10000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

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

    beforeAll(async function (done) {
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        await tryToEnableBt()
        gattS = bluetoothBle.createGattServer();
        console.info('bluetooth ble create gattserver result:' + gattS);
        gattC = bluetoothBle.createGattClientDevice('04:30:02:01:00:07');
        console.info('bluetooth ble create gattclientdevice result:' + gattC);
        console.info('beforeAll called')
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(async function (done) {
        console.info('afterAll called')
        gattC.close();
        console.info('bluetooth gattC close success');
        gattS.close();
        console.info('bluetooth gattS close success');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100', 0, async function (done) {
        let manufactureValueBuffer = new Uint8Array(4);
          manufactureValueBuffer[0] = 1;
          manufactureValueBuffer[1] = 2;
          manufactureValueBuffer[2] = 3;
          manufactureValueBuffer[3] = 4;
          let serviceValueBuffer = new Uint8Array(4);
          serviceValueBuffer[0] = 4;
          serviceValueBuffer[1] = 6;
          serviceValueBuffer[2] = 7;
          serviceValueBuffer[3] = 8;
          let setting={
               interval:32,
               txPower:1,
               connectable:true,
          }
          let advData={
               serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:4567,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
               includeDeviceName:false
          }
          let advResponse ={
               serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:1789,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          try {
               bluetoothBle.startAdvertising(setting,advData,advResponse);
               console.info('[bluetooth_js]startAdvertising1 success');
               bluetoothBle.stopAdvertising();
          }catch(error) {
               console.error(`[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
              expect(Number(error.code)).assertEqual(2900099);
          }
          done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100
     * @tc.name testConnect
     * @tc.desc Test api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100', 0, async function (done) { 
        try {
            gattC.connect();
            await sleep(2000);
            gattC.disconnect();
          } catch(error) {
            console.error(`[bluetooth_js]disconnect failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0200
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0200', 0, async function (done) {
        try {
            let result = bluetoothBle.getConnectedBLEDevices();
            console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)
                    + "length:" +result.length);
            expect(result != null).assertTrue();
        } catch (error) {
            console.error(`[bluetooth_js]getConnDev failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300
     * @tc.name testBLEconnectStateChange
     * @tc.desc Test on and off api10 
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
   it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300', 0, async function (done) {
        try {
            function ConnectStateChanged(state) {
                console.log('bluetooth connect state changed');
                let connectState = state.state;
                console.info('[bluetooth_js] state changed' + connectState)
                expect(true).assertEqual(connectState != null);
            }
            gattC.on('BLEConnectionStateChange', ConnectStateChanged);
            gattC.off("BLEConnectionStateChange");
            done();
        } catch (error) {
            console.error(`[bluetooth_js]GattConnect failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
   })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100
     * @tc.name testGetRssiValue
     * @tc.desc Test getRssiValue api10 by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100', 0, async function (done) {
        try {
            await gattC.getRssiValue().then((data) => {
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
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200
     * @tc.name testgetRssiValue
     * @tc.desc Test testGetDeviceName api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200', 0, async function (done) {
        try {
            function getRssi() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.getRssiValue((err, data)=> {
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
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0100
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api10 by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0100', 0, async function (done) { 
        try {
            await gattC.getDeviceName().then((data) => {
                console.info('[bluetooth_js] device name:' + JSON.stringify(data))             
                expect(true).assertEqual(data != null);
                done();
            }).catch(err => {
                console.error('[bluetooth_js] bluetooth getDeviceName has error: '+ JSON.stringify(err));
                expect(err.code).assertEqual(2900099);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetDeviceName failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0200
     * @tc.name testGetDeviceName
     * @tc.desc Test testGetDeviceName api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETDEVICENAME_0200', 0, async function (done) {
        try {
            function getName() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.getDeviceName((err, data)=> {
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
        }
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100
     * @tc.name testGetServices
     * @tc.desc Test GetServices api10 by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100', 0, async function (done) {
        try {
            await gattC.getServices().then((GattService) => {
                console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(GattService));
                expect(GattService).assertNull();
                done();
            }).catch(err => {
                console.error('[bluetooth_js] getServices has error:'+ JSON.stringify(err));
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]GetService_0100 failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();     
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200
     * @tc.name testGetServices
     * @tc.desc Test GetServices api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200', 0, async function (done) {
        try {
            function getService() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.getServices((err, data)=> {
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
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0100
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_MTUSIZE_0100', 0, function (done) {
        try {
            gattC.setBLEMtuSize(500);
            console.info("[bluetooth_js]setBLEMtuSize success");
        } catch (error) {
            console.error(`[bluetooth_js]MtuSize failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api10 by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900', 0, async function (done) {
        let descriptors = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc};
        descriptors[0] = descriptor;

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors};
        try {
            gattC.readCharacteristicValue(characteristic);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }         
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000', 0, async function(done) {
        function readCcc(code, BLECharacteristic) {
            if (code.code != 0) {
                return;
            }
            console.log('bluetooth characteristic uuid: ' + BLECharacteristic.characteristicUuid);
            let value = new Uint8Array(BLECharacteristic.characteristicValue);
            console.log('bluetooth characteristic value: ' + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
          }
          
          let descriptors = [];
          let bufferDesc = new ArrayBuffer(8);
          let descV = new Uint8Array(bufferDesc);
          descV[0] = 11;
          let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc};
          descriptors[0] = descriptor;
          
          let bufferCCC = new ArrayBuffer(8);
          let cccV = new Uint8Array(bufferCCC);
          cccV[0] = 1;
          let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC, descriptors:descriptors};
        try {
            gattC.readCharacteristicValue(characteristic, readCcc);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100
     * @tc.name testCharacteristicReadOn
     * @tc.desc Test On and off api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100', 0, async function (done) { 
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1123;
        function ReadCharacteristicReq(CharacteristicReadRequest) {
            let deviceId = CharacteristicReadRequest.deviceId;
            let transId = CharacteristicReadRequest.transId;
            let offset = CharacteristicReadRequest.offset;
            let characteristicUuid = CharacteristicReadRequest.characteristicUuid;

            let serverResponse = {deviceId: deviceId, transId: transId, status: 0, offset: offset, value:arrayBufferCCC};

            try {
                gattS.sendResponse(serverResponse);
            } catch (err) {
                console.error("sendResponese errCode:" + err.code + ",errMessage:" + err.message);
            }
        }

        try {
            await gattS.on("characteristicRead", ReadCharacteristicReq);
            done();
        } catch (err) {
            console.info("characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        gattS.off("characteristicRead");
        done();          
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1300
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api10 by promise.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1300', 0, async function (done) {
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
            descriptorValue: bufferDesc
        };
        try {
            gattC.readDescriptorValue(descriptor);
            expect(true).assertFalse();
            done();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1400
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api10 by callback.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1400', 0, async function (done) {
        function readDesc(code, BLEDescriptor) {
            if (code.code != 0) {
                return;
            }
            console.log('bluetooth descriptor uuid: ' + BLEDescriptor.descriptorUuid);
            let value = new Uint8Array(BLEDescriptor.descriptorValue);
            console.log('bluetooth descriptor value: ' + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
        }
        
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
            descriptorValue: bufferDesc
        };
        try {
            gattC.readDescriptorValue(descriptor, readDesc);
            expect(true).assertFalse();
            done();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500
     * @tc.name testReadDescriptorOn
     * @tc.desc Test On and Off api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500', 0, async function (done) {
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
                gattS.sendResponse(serverResponse);
                console.info("[bluetooth_js] DesRedon jsondata:" +
                    'deviceId:' + deviceId + 'transId:' +transId + 'offset:' + 
                    offset +'descriptorUuid:' + DescriptorReadReq.descriptorUuid + 
                    'characteristicUuid:' +characteristicUuid + 
                    'serviceUuid:' + DescriptorReadReq.serviceUuid);
                    expect(true).assertEqual(DescriptorReadReq != null);
            }
            await gattS.on("descriptorRead", ReadDescriptorReq);
            await gattS.off("descriptorRead");
            done();
        } catch (error) {
            console.error(`[bluetooth_js]readDescrValue failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800', 0, async function (done) {
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
        try {
            function wrCharacteristicVal() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE, (err, data)=> {
                        if (err) {
                            console.info('wrCharacteristicVal failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]wrCharacteristicVal value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await wrCharacteristicVal().then((data) => {
                console.info("[bluetooth_js]18 writeCharacteristicValue done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]18 writeCharacteristicValue failed" + e);
                expect(Number(e.code)).assertEqual(401);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900', 0, async function (done) {
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
            gattC.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE).then(() => {
                console.info("writeCharacteristicValue");
                done();
            }, err => {
                console.error("writeCharacteristicValue:errCode" + err.code + ",errMessage:" + err.message);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000
     * @tc.name testCharacteristicWriteOn
     * @tc.desc Test on and off api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000', 0, async function (done) { 
        try {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            function WriteCharacteristicReq(CharacteristicWriteRequest) {
                let deviceId = CharacteristicWriteRequest.deviceId;
                let transId = CharacteristicWriteRequest.transId;
                let offset = CharacteristicWriteRequest.offset;
                let isPrepared = CharacteristicWriteRequest.isPrepared;
                let needRsp = CharacteristicWriteRequest.needRsp;
                let value =  new Uint8Array(CharacteristicWriteRequest.value);
                let characteristicUuid = CharacteristicWriteRequest.characteristicUuid;
                let serviceUuid = CharacteristicWriteRequest.serviceUuid;
                console.info('CharacteristicWriteRequest deviceId:' + deviceId);
                console.info('CharacteristicWriteRequest transId:' + transId);
                console.info('CharacteristicWriteRequest offset:' + offset);
                console.info('CharacteristicWriteRequest isPrepared:' + isPrepared);
                console.info('CharacteristicWriteRequest needRsp:' + needRsp);
                console.info('CharacteristicWriteRequest value:' + value);
                console.info('CharacteristicWriteRequest characteristicUuid:' + characteristicUuid);
                console.info('CharacteristicWriteRequest serviceUuid:' + serviceUuid);
                
                cccValue[0] = value[0];
                let serverResponse = {deviceId: deviceId, transId: transId,
                    status: 0, offset: offset, value:arrayBufferCCC};
                    gattS.sendResponse(serverResponse);
            }    
            gattS.on("characteristicWrite", WriteCharacteristicReq);
            gattS.off("characteristicWrite");
            done();
        } catch (error) {
            console.error(`[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done(); 
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue promsie api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000', 0, async function (done) {
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 22;
        let descriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
            descriptorValue: bufferDesc
        };
        try {
            gattC.writeDescriptorValue(descriptor).then(() => {
                console.info("writeDescriptorValue");
                done();
            }, err => {
                console.error("writeDescriptorValue:errCode" + err.code + ",errMessage:" + err.message);
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue callback api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100', 0, async function (done) {
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 22;
        let descriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
            descriptorValue: bufferDesc
        };
        try {
            function wrDescriptorVal() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.writeDescriptorValue(descriptor, (err, data)=> {
                        if (err) {
                            console.error('Descriptor failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]Descriptor value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await wrDescriptorVal().then((data) => {
                console.info("[bluetooth_js]11 writeDescriptorValue done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]11 writeDescriptorValue failed" + e);
                expect(Number(e.code)).assertEqual(401);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200
     * @tc.name testWriteDescriptorOn
     * @tc.desc Test on and off api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200', 0, async function (done) {
        try {
            let arrayBufferDesc = new ArrayBuffer(8);
            let descValue = new Uint8Array(arrayBufferDesc);
            function WriteDescriptorReq(DescriptorWriteRequest) {
                let deviceId = DescriptorWriteRequest.deviceId;
                let transId = DescriptorWriteRequest.transId;
                let offset = DescriptorWriteRequest.offset;
                let isPrepared = DescriptorWriteRequest.isPrepared;
                let needRsp = DescriptorWriteRequest.needRsp;
                let value = new Uint8Array(DescriptorWriteRequest.value);
                let descriptorUuid = DescriptorWriteRequest.descriptorUuid;
                descValue[0] = value[0];
                let serverResponse = {deviceId: deviceId, transId: transId, 
                    status: 0, offset: offset, value:arrayBufferDesc};
                gattS.sendResponse(serverResponse);
                console.info("[bluetooth_js] desWriOn jsondata: " +'deviceId: ' 
                + deviceId + 'transId:' + transId + 'offset:' + offset +'descriptorUuid:'
                + descriptorUuid + 'charUuid:' + DescriptorWriteRequest.characteristicUuid +
                'serviceUuid:' + DescriptorWriteRequest.serviceUuid +
                'value:' + DescriptorWriteRequest.value + 'needRsp' + 
                needRsp + 'isPrepared:' +isPrepared );
                expect(true).assertEqual(DescriptorWriteRequest != null);
            }
            gattS.on("descriptorWrite", WriteDescriptorReq);
            gattS.off("descriptorWrite");
            done();
        } catch (error) {
            console.error(`[bluetooth_js]writeDescriptorValue failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400
     * @tc.name testBLECharacteristicChangeON
     * @tc.desc Test On and off api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400', 0, async function (done) {
        try {
            function CharacteristicChange(CharacteristicChangeReq) {
                let serviceUuid = CharacteristicChangeReq.serviceUuid;
                let characteristicUuid = CharacteristicChangeReq.characteristicUuid;
                let value = new Uint8Array(CharacteristicChangeReq.characteristicValue);
                expect(true).assertEqual(CharacteristicChangeReq != null);
            }
            gattC.on('BLECharacteristicChange', CharacteristicChange);
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
            gattC.off('BLECharacteristicChange');
            done();
        } catch (error) {
            console.error(`[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100
     * @tc.name testSetCharacteristicChangeNotification
     * @tc.desc Test setCharacteristicChangeNotification api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        try {
            function setCCN() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.setCharacteristicChangeNotification(characteristic, false, (err, data)=> {
                        if (err) {
                            console.error('setCCN failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]setCCN value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await setCCN().then((data) => {
                console.info("[bluetooth_js]01 setCharacteristicChangeNotification done");
                done();
            })
            .catch(e => {
                console.info("[bluetooth_js]01 setCharacteristicChangeNotification failed" + e);
                expect(Number(e.code)).assertEqual(401);
                done();
            })
        } catch (error) {
            console.error(`[bluetooth_js]setCharacteristicChangeNotification error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200
     * @tc.name testSetCharacteristicChangeNotification
     * @tc.desc Test setCharacteristicChangeNotification api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        try {
            gattC.setCharacteristicChangeNotification(characteristic, true).then(() => {
                console.info("setCharacteristicChangeNotification");
            });
            done();
        } catch (err) {
            console.error('setCharacteristicChangeNotification failed errCode: ' + err.code + ', errMessage: ' + err.message);
            expect(Number(err.code)).assertEqual(401);
            done();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0300
     * @tc.name testSetCharacteristicChangeIndication
     * @tc.desc Test setCharacteristicChangeIndication api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0300', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        try {
            function setCCI() {
                 return new Promise<void>((resolve,reject) => {
                    gattC.setCharacteristicChangeIndication(characteristic, false, (err, data)=> {
                        if (err) {
                            console.error('setCCI failed' + err);
                            reject(err.code);
                        } else
                          {
                            console.info('[bluetooth_js]setCCI value:'+JSON.stringify(data));
                            expect(true).assertEqual(data != null);
                        }
                        resolve();
                    });
                });
            }
            await setCCI().then((data) => {
                console.info("[bluetooth_js]03 setCharacteristicChangeIndication done");
                done();
            });
        } catch (error) {
            console.error(`[bluetooth_js]setCharacteristicChangeIndication error, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0400
     * @tc.name testSetCharacteristicChangeIndication
     * @tc.desc Test setCharacteristicChangeIndication api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0400', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors:descriptors};
        try {
            gattC.setCharacteristicChangeIndication(characteristic, true).then(() => {
                console.info("setCharacteristicChangeIndication");
                done();
            });
            done();
        } catch (err) {
            console.error('setCharacteristicChangeIndication failed errCode: ' + err.code + ', errMessage: ' + err.message);
            expect(Number(err.code)).assertEqual(401);
            done();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100
     * @tc.name testOnBLEMtuChange
     * @tc.desc test GattClientDevice on blemtuchange api10.
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100', 0, async function (done) {
        try {
            gattC.on('BLEMtuChange', (mtu: number) => {
                console.info('BLEMtuChange, mtu: ' + mtu);
            });
        } catch (err) {
            console.info("bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        gattC.off('BLEMtuChange');
        done();
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200
     * @tc.name testOnBLEMtuChange
     * @tc.desc test GattClientDevice off blemtuchange api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200', 0, async function (done) {
        gattC.on('BLEMtuChange', (mtu: number) => {
                console.info('BLEMtuChange, mtu: ' + mtu);
            });
        try {
            gattC.off('BLEMtuChange');
        } catch (err) {
            console.info("bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        done();
    })

})
}