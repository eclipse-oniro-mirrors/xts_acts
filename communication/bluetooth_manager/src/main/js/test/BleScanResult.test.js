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

import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

async function applyPermission() {
    let osAccountManager = osaccount.getAccountManager();
    console.info("=== getAccountManager finish");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("LocalId is :" + localId);0
    let appInfo = await bundle.getApplicationInfo('ohos.acts.communication.bluetooth.bluetoothhost', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName = 'ohos.permission.LOCATION';
        await atManager.grantUserGrantedPermission(tokenID, permissionName, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permis' +
            'sion] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

export default function bluetoothBLETest6() {
describe('bluetoothBLETest6', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await sleep(10000);
                let sta1 = bluetooth.getState();
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                bluetooth.enableBluetooth();
                await sleep(10000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await applyPermission();
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
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0100
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test startBLEScan 401 - Invalid parameter.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 0
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0100', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result1 '+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind",onReceiveEvent)
            bluetooth.BLE.startBLEScan(null);
            await sleep(1000);
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0100 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0200
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0200', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result2'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{deviceId:"00:11:22:33:44:55"}]);
            await sleep(1000);
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0200 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0300
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0300', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result3'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
             }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{name:"blue_test"}]);
            await sleep(1000);
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0300 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0400
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0400', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result4'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"}]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off4');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0400 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0500
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0500', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result5'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
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
            console.info('[bluetooth_js] BLE scan off5');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0500 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0600
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0600', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result6'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            let ScanOptions=  {
                interval: 100,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_BALANCED,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{}],ScanOptions);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off6');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0600 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0700
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
     it('COMMUNICATION_BLUETOOTH_BLE_Scan_0700', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result7'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan(
                [{}],
               {
                    interval: 100,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off7');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0700 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_0700
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_0900', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result9'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan(
                [{}],
            {
                    interval: 0,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off7');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_0900 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1000
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1000', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result10'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan(
                [{}],
            {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off10');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1000 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1100
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1100', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result11'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan(
                [{}],
               {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off11');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1100 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1200
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1200', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result12'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
             }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan(
                [{}],
               {
                   interval: 500,
                   dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                   matchMode: bluetooth.MatchMode.MATCH_MODE_STICKY,
                }
            );
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off12');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1200 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1300
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1300', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result13'+JSON.stringify(data));
                expect(true).assertTrue(data.length>0);
            }
           bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
           bluetooth.BLE.startBLEScan(
               [{
                   deviceId:"11:22:33:44:55:66",
                   name:"test",
                   serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"
               }],
               {
                   interval: 500,
                   dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                   matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
               }
           );
           await sleep(1000);
           console.info('[bluetooth_js] BLE scan off13');
           bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
           bluetooth.BLE.stopBLEScan();
           done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1300 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
        
    })

    /* @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1400
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 9
     * @tc.type Function
     * @tc.level Level 3
     */
      it('COMMUNICATION_BLUETOOTH_BLE_Scan_1400', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLE scan device find result14'+ JSON.stringify(data));
                expect(true).assertTrue(data.length > 0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{
                serviceUuid:"00001812-0000-1000-8000-00805F9B34FB",
                serviceUuidMask:"0000FFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                }]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off14 ');
            bluetooth.BLE.stopBLEScan();
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1400 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1500
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 9
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1500', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLE scan device find result15'+ JSON.stringify(data));
                expect(true).assertTrue(data.length > 0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            bluetooth.BLE.startBLEScan([{
                serviceSolicitationUuid:"00000101-0000-1000-8000-00805F9B34FB",
                serviceSolicitationUuidMask:"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
    
                }]);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off15 ');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1500 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1600
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 9
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1600', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLE scan device find result16'+ JSON.stringify(data));
                expect(true).assertTrue(data.length > 0);
            }
            let ScanFilters= [];
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            const serviceDataArrayBuffer = new ArrayBuffer(1);
            const serviceDataMaskArrayBuffer = new ArrayBuffer(1);
            const serviceDataValue = new Uint8Array(serviceDataArrayBuffer);
            const serviceDataMaskValue = new Uint8Array(serviceDataMaskArrayBuffer);
            serviceDataValue[0] = '0xFF';
            serviceDataMaskValue[0] = '0xFF';
            let ScanFilter = {
                serviceData:serviceDataArrayBuffer,
                serviceDataMask:serviceDataMaskArrayBuffer,
                }
            ScanFilters[0]=ScanFilter;
            bluetooth.BLE.startBLEScan(ScanFilters);
            await sleep(1000);
            console.info('[bluetooth_js] BLE scan off16');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1600 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
        
    })

   /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1700
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.size MEDIUM
     * @ since 9
     * @tc.type Function
     * @tc.level Level 2
     */
      it('COMMUNICATION_BLUETOOTH_BLE_Scan_1700', 0, async function (done) {
        try {
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLE scan device find result17'+ JSON.stringify(data));
                expect(true).assertTrue(data.length > 0);
            }
            bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
            const manufactureDataArrayBuffer = new ArrayBuffer(29);
            const manufactureDataMaskArrayBuffer = new ArrayBuffer(29);
            const manufactureDataValue = new Uint8Array(manufactureDataArrayBuffer);
            const manufactureDataMaskValue = new Uint8Array(manufactureDataMaskArrayBuffer);
            for (let i = 0; i < 29; i++) {
            manufactureDataValue[i] = '0xFF';
            }
            for (let i = 0; i < 29; i++) {
                manufactureDataMaskValue[i] = '0xFF';
            }
            bluetooth.BLE.startBLEScan([{
                manufactureId:0x0006,
                manufactureData:manufactureDataValue,
                manufactureDataMask:manufactureDataMaskValue,
                }]);
            await sleep(1000);
            expect(true).assertFalse();
            console.info('[bluetooth_js] BLE scan off17 ');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1700 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401'); 
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1800
     * @tc.name test gatt connect and disconnect
     * @tc.desc Test connect and disconnect api .
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1800', 0, async function (done) {
        try {
            async function onReceiveEvent(ScanResult)
            {
                console.info('[bluetooth_js] BLEscan device result12'+JSON.stringify(ScanResult)
                +ScanResult.deviceId+ScanResult.rssi+ ScanResult.data);
                expect(true).assertTrue(ScanResult.length>0);
                await sleep(1000);
                let gattClient = bluetooth.BLE.createGattClientDevice(ScanResult[0].deviceId);
                let ret = gattClient.connect();
                await sleep(2000);
                console.info('[bluetooth_js] gattClient connect' + ret)
                expect(ret).assertTrue();
                let disconnect = gattClient.disconnect();
                console.info('[bluetooth_js] gatt disconnect:' + disconnect);
                expect(disconnect).assertEqual(false);
            }
            await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.BLE.startBLEScan(
                [{}],
            {
                interval: 500,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
                matchMode: bluetooth.MatchMode.MATCH_MODE_STICKY,
                }
            );
            console.info('[bluetooth_js] BLE scan offC');
            bluetooth.BLE.off('BLEDeviceFind', onReceiveEvent);
            bluetooth.BLE.stopBLEScan();
            done()
        } catch (error) {
            console.error('[bluetooth_js]Scan_1800 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_1900
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test startBLEScan 401 - Invalid parameter.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 0
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Scan_1900', 0, async function (done) {
        try {
            bluetooth.BLE.startBLEScan(123);
            expect(true).assertFalse();
            bluetooth.BLE.stopBLEScan();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_1900 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
    })
    
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Scan_2000
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test startBLEScan 401 - Invalid parameter.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 0
     */
   it('COMMUNICATION_BLUETOOTH_BLE_Scan_2000', 0, async function (done) {
        try {
            bluetooth.BLE.startBLEScan([{
                serviceSolicitationUuid:"00000101-0000-1000-8000-00805F9B34FB",
                serviceSolicitationUuidMask:"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                }]);
            bluetooth.BLE.stopBLEScan("test");
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]Scan_2000 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
    })
})
}

