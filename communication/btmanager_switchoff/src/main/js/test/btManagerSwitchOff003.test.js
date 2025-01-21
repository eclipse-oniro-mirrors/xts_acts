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
import bluetooth from '@ohos.bluetooth';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btManagerError003Test() {
describe('btManagerError003Test', function() {
    let gattServer = null;
    let gattClient = null;
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToDisableBt() {
        let sta = bluetoothManager.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                bluetoothManager.disableBluetooth();
                await clickTheWindow();
                await sleep(3000);
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
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
    
    beforeAll(async function (done) {
        console.info('beforeAll called')
        gattServer = bluetoothManager.BLE.createGattServer();
        gattClient = bluetoothManager.BLE.createGattClientDevice("11:22:33:44:55:66");
        await openPhone();
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToDisableBt()
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
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0100
     * @tc.name test bluetooth Profile ConnectionState
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0100', 0, async function (done) {
        await sleep(3000);
        try {
            let sta = bluetoothManager.getState();
            console.info('[bluetooth_js] bt getState:'+ JSON.stringify(sta));
            let connState = bluetoothManager.getBtConnectionState();
            console.info('[bluetooth_js] get bt connection state result' 
                         + JSON.stringify(connState));
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]getBtConnectionState error.code:'
            +JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0200
     * @tc.name Test pairDevice api
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0200', 0, async function (done) {
        try {
            bluetoothManager.pairDevice("11:22:55:66:33:44");
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]pairDevice error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0300
     * @tc.name test getRemoteDeviceName
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0300', 0, async function (done) {
        try {
            let ret = bluetoothManager.getRemoteDeviceName("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
            expect(ret.length).assertEqual(0);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getRemoteDeviceName error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0400
     * @tc.name test getRemoteDeviceClass
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0400', 0, async function (done) {
        try {
            let DeviceClass = bluetoothManager.getRemoteDeviceClass("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceClass ret2 :' + JSON.stringify(DeviceClass) 
            + 'majorClass:' +DeviceClass.majorClass + 'majorMinorClass:'+ DeviceClass.majorMinorClass 
            + 'classOfDevice:' + DeviceClass.classOfDevice);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getRemoteDeviceClass error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0500
     * @tc.name test get PairedDevices
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0500', 0, async function (done) {
        try {
            let ret = bluetoothManager.getPairedDevices();
            console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getPairedDevices error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0600
     * @tc.name test Get A2DP ConnectionState
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0600', 0, async function (done) {
        try {
            let a2dpSrcConn = bluetoothManager.getProfileConnectionState(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
            console.info('[bluetooth_js]get a2dp result:' + JSON.stringify(a2dpSrcConn));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getProfileConnState error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0700
     * @tc.name Test setDevicePairing
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0700', 0, async function (done) {
        try {
            bluetoothManager.setDevicePairingConfirmation("11:22:55:66:33:44",false);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setDevicePairingConfirmation error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0800
     * @tc.name setLocalName
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0800', 0, async function (done) {
        try {
            let newName = 'my bluetooth';
            bluetoothManager.setLocalName(newName);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setLocalName error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0900
     * @tc.name TEST setBluetoothScanMode
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0900', 0, async function (done) {
        try {
            bluetoothManager.setBluetoothScanMode(bluetoothManager.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setBluetoothScanMode error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1000
     * @tc.name TEST getBluetoothScanMode
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1000', 0, async function (done) {
        try {
            let oldScanMode = bluetoothManager.getBluetoothScanMode();
            console.info('[bluetooth_js] getBluetoothScanMode = '+ JSON.stringify(oldScanMode));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getBluetoothScanMode error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1100
     * @tc.name TEST startBluetoothDiscovery
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1100', 0, async function (done) {
        try {
            bluetoothManager.startBluetoothDiscovery();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBluetoothDiscovery error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1200
     * @tc.name TEST stopBluetoothDiscovery
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1200', 0, async function (done) {
        try {
            bluetoothManager.stopBluetoothDiscovery();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]stopBluetoothDiscovery error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1600
     * @tc.name test getDevice HFP State.
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1600', 0, async function (done) {
        try {
            let hfpSrc = bluetoothManager.getProfileInstance(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            let retArray = hfpSrc.getConnectionDevices();
            console.info('[bluetooth_js]hfp getConnectionDevices:' + JSON.stringify(retArray));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getConnectionDevices error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1700
     * @tc.name test getDeviceState.
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1700', 0, async function (done) {
        try {
            let hfpSrc = bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            let ret = hfpSrc.getDeviceState('11:22:33:44:55:66');
            console.info('[bluetooth_js]hfp getDeviceState:' + JSON.stringify(ret));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getDeviceState error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1800
     * @tc.name test A2DP Connect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1800', 0, async function (done) {
        try {
            let a2dpSrc = bluetoothManager.getProfile(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
            a2dpSrc.connect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]A2DPconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

   
    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1900
     * @tc.name test A2DP disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1900', 0, async function (done) {
        try {
            let a2dpSrc = bluetoothManager.getProfile(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
            a2dpSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]A2DPdisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2000
     * @tc.name test  get A2DP Playing State
     * @tc.desc Test  2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2000', 0, async function (done) {
        try {
            let a2dpSrc = bluetoothManager.getProfile(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
            console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
            let state = a2dpSrc.getPlayingState('11:22:33:44:55:66');
            console.info('[bluetooth_js]a2dp getPlayingState result:' + JSON.stringify(state));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getPlayingState error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2100
     * @tc.name test HFP Connect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2100', 0, async function (done) {
        try {
            let hfpSrc = 
                bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            hfpSrc.connect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]HFPconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })
   
    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2200
     * @tc.name test HFP disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2200', 0, async function (done) {
        try {
            let hfpSrc = 
               bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            hfpSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]HFPdisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2800
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2800', 0, async function (done) {
        try {
            bluetoothManager.BLE.startBLEScan(
                [{
                    deviceId:"11:22:33:44:55:66",
                    name:"test",
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"
                }],
                {
                    interval: 500,
                    dutyMode: bluetoothManager.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetoothManager.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBLEScan error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2900
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2900', 0, async function (done) {
        try {
            bluetoothManager.BLE.stopBLEScan();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBLEScan error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3000
     * @tc.name testStartAdvertising
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3000', 0, async function (done) {
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
            txPower:-10,
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
               gattServer.startAdvertising(setting,advData,advResponse);
               expect(true).assertFalse();
          }catch(error) {
               console.error('[bluetooth_js]startAdvertising error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
               expect(error.code).assertEqual('2900003');
          }
          await sleep(2000);
          done();
     })

       /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3100
     * @tc.name teststopAdvertising
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3100', 0, async function (done) {
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
               gattServer.stopAdvertising();
               expect(true).assertFalse();
          }catch(error) {
               console.error('[bluetooth_js]stopAdvertising error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
               expect(error.code).assertEqual('2900003');
          }
          done();
     })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3200
     * @tc.name testAddService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SwitchOff_3200', 0, async function (done) {
        try {
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
            gattServer.addService(gattService);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }       
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3300
     * @tc.name test removeService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3300', 0, async function (done) {
        try {
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3400
     * @tc.name test removeService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3400', 0, async function (done) {
        try {
            gattServer.close();
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]close failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }       
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3600
     * @tc.name testSendResponse success
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3600', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let value =  new Uint8Array(arrayBuffer);
            value[0] = 1;
            let ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
                status: 0, offset: 0, value: arrayBuffer};
            gattServer.sendResponse(ServerResponse);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]sendResponse failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }
        
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700
     * @tc.name test gatt connect 
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700', 0, async function (done) { 
        try {
            gattClient.connect();
            await sleep(2000);
            expect(true).assertFalse();
        } catch(error) {
            console.error(`[bluetooth_js]connect failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800
     * @tc.name test gatt disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800', 0, async function (done) {
        try {
            gattClient.disconnect();
            expect(true).assertFalse();
          } catch(error) {
            console.error(`[bluetooth_js]disconnect failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3900
     * @tc.name test gatt close
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3900', 0, async function (done) {
        try {
            gattClient.close();
            expect(true).assertFalse();
          } catch(error) {
            console.error(`[bluetooth_js]gattClient close failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
    * @tc.number SUB_COMMUNICATION_BTMANAGER_BLESCAN_0800
    * @tc.name testClassicStartBLEScan
    * @tc.desc Test ClassicStartBLEScan api.
    * @tc.type Function
    * @tc.level Level 3
    */
    it('SUB_COMMUNICATION_BTMANAGER_BLESCAN_0800', 0, async function (done) {
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result8'+JSON.stringify(data));
            expect(true).assertTrue(data.length=0);
        }
        try {
            let state = bluetoothManager.getState();
            console.info('[bluetooth_js] bt turn off1:'+ JSON.stringify(state));
            if(state == bluetoothManager.BluetoothState.STATE_ON) {
                let result2= bluetoothManager.disableBluetooth();
                await clickTheWindow();
                console.info('[bluetooth_js]disable result1'+ JSON.stringify(result2));
                let state1 = bluetoothManager.getState();
                console.info('[bluetooth_js] getState4 off = '+ JSON.stringify(state1));
                expect(state1).assertEqual(bluetooth.BluetoothState.STATE_OFF);
            }
            console.info('[bluetooth_js] BLE BLEDeviceFind on start!');
            bluetoothManager.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetoothManager.BLE.startBLEScan(
                [{}],
                {
                    interval: 100,
                    dutyMode: bluetoothManager.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetoothManager.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            // expect(true).assertFalse();
            console.info('[bluetooth_js] BLE scan off8');
            bluetoothManager.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0800 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
        }
        console.info('[bluetooth_js] BLE BLEDeviceFind off start!');
        bluetoothManager.BLE.off('BLEDeviceFind', onReceiveEvent);
        await sleep(2000);
        done();
    })

    /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_BLESCAN_0900
         * @tc.name testClassicStartBLEScan
         * @tc.desc Test ClassicStartBLEScan api.
         * @tc.type Function
         * @tc.level Level 3
         */
    it('SUB_COMMUNICATION_BTMANAGER_BLESCAN_0900', 0, async function (done) {
        bluetooth.disableBluetooth();
        await clickTheWindow();
        await sleep(3000);
        let state = bluetooth.getState();
        console.info('[bluetooth_js] bt turn off1:'+ JSON.stringify(state));
        function onReceiveEvent(data)
        {
            console.info('[bluetooth_js] BLEscan device result8'+JSON.stringify(data));
            expect(true).assertTrue(data.length=0);
        }
        bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        bluetooth.BLE.startBLEScan(
            [{}],
            {
                interval: 100,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
        );
        await sleep(1000);
        console.info('[bluetooth_js] BLE scan off8');
        bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
        bluetooth.BLE.stopBLEScan();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCH_0400
     * @tc.name testEnableBluetooth
     * @tc.desc Test EnableBluetooth api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCH_0400', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] getState1 off = '+ JSON.stringify(state));
        if(state == bluetooth.BluetoothState.STATE_OFF) {
            let result2= bluetooth.disableBluetooth();
            await clickTheWindow();
            console.info('[bluetooth_js]disable result1'+ JSON.stringify(result2));
            expect(result2).assertFalse();
            let state1 = bluetooth.getState();
            console.info('[bluetooth_js] getState4 off = '+ JSON.stringify(state1));
            expect(state1).assertEqual(bluetooth.BluetoothState.STATE_OFF);
        }
        done();
    })
})
}