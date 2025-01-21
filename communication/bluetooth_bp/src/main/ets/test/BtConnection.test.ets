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

import bluetooth from '@ohos.bluetooth.connection';
import ble from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btConnectionTest() {
describe('btConnectionTest', function() {
    let Btname = {
        NUM_TEST :'012345678901234567890123456789012345678901234567890123'+
        '45678901234567890123456789012345678901234567890123456789012345678901234567',
        NUM_TEST1 :'0123456789012345678901234567890123456789012345678901'
        +'23456789012345678901234567890123456789012345678901234567890123456789012345678012'
        +'345678901234567890123456789012345678901234567890123456789012367890123456789012345568'
        +'01234567890123456789012345678912',
        LETTERS_TEST :'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        CHINESES_TEST :'测试蓝牙名称是否正常测试蓝牙名称是否试蓝牙',
        CHINESES_TEST2 :'测试蓝牙名称正常',
        SYMBOL_TEST:'*^_^* 、。·ˉˇ¨〃々—～‖·‘’“”「『』〖❂【±×'
        +'÷∶∧∨∑∏∪∩∈∷√⊥‖∠⌒⊙∫∮≡≌≈∽∝≠♂♀°℃＄¤￠￡‰§№☆★○●◎◇□■△※→←↑↓〓',
        MIXES:'测试蓝牙名称是否正试蓝牙\'名称是否[666]aaw',
        MIXES2:'——◎◇◆□■△▲测试蓝牙',
        MIXES3:'78453-、、。。◎◇◆□■△▲',
        MIXES4:'hhhfdf-、、。。◎◇◆□■△▲',
        MIXES5:'#01-5@<?;:!@$%^&*(1[]{【+-；：‘’“”测试=》《\'[6]',
        MIXES6:'#01-567890@<>?/;:5675ASDF012345678!@'
        +'$%^&*()9012378901[]{}【】566~·67890blue',
        MIXES7:'0123456789012345678901234567890123456789012345678901'
        +'23456789012345678901234567890123456789012345678901234567890123456789012345678012'
        +'345678901234567890123456789012345678901234567890123456789012367890123456789012345568'
        +'012345678901234567890123456789123'
    }

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
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await clickRequestPermission();
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
                await clickRequestPermission();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    async function clickRequestPermission() {
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
        await clickRequestPermission();
        await openPhone();
        done();
    })
    beforeEach(async function (done) {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
     * @tc.name Test pinRequired and setDevicePairing true
     * @tc.desc Test pinRequired off api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('pin required = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on('pinRequired', onReceiveEvent);
            bluetooth.off('pinRequired', onReceiveEvent);
        } catch (error) {
            console.info(`[bluetooth_js]pinRequired error, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
     * @tc.name test get PairedDevices
     * @tc.desc Test getPairedDevices api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200', 0, async function (done) {
        try {
            let ret = bluetooth.getPairedDevices();
            console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
            expect(true).assertEqual(ret.length >= 0);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300
     * @tc.name test getRemoteDeviceName
     * @tc.desc Test get RemoteDeviceName api 10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300', 0, async function (done) {
         try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400
     * @tc.name Test pairDevice callback
     * @tc.desc Test pairDevice callback api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
        try {
            bluetooth.on('bondStateChange', BondStateParam);
            bluetooth.pairDevice("11:22:55:66:33:44", err => {
                if (err) {
                    console.info('pairDevice errCode: ' + err.code + ', errMessage: ' + err.message);
                }
                console.info('pairDevice, err: ' + JSON.stringify(err));
            });
            bluetooth.off('bondStateChange', BondStateParam);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('bondStateChange', BondStateParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500
     * @tc.name Test setDevicePairingConfirmation
     * @tc.desc Test setDevicePairingConfirmation api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500', 0, async function (done) {
        function PinRequiredParam(data) {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(data));
            bluetooth.setDevicePairingConfirmation(data.deviceId, false);
            console.info("[bluetooth_js] setDevicePairingConfirmation data.deviceId:" + data.deviceId);
        }
        try {
            bluetooth.on('pinRequired', PinRequiredParam);
            await sleep(2000);
            bluetooth.off('pinRequired', PinRequiredParam);
        } catch (err) {
            console.info("setDevicePairingConfirmation errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600
     * @tc.name test getRemoteDeviceClass
     * @tc.desc Test get RemoteDeviceClass api10
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600', 0, async function (done) {
        try {
            let DeviceClass = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
            console.info('[bluetooth_js]getRemoteDeviceClass majorClass:' + DeviceClass.majorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass majorMinorClass:' + DeviceClass.majorMinorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass classOfDevice:' + DeviceClass.classOfDevice);
        } catch (err) {
            console.info("getRemoteDeviceClass errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700
     * @tc.name Test setDevicePinCode callback
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700', 0, async function (done) {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345', (err, data) => {
                console.info('setDevicePinCode callback,device name err:' + JSON.stringify(err) + ',device name:' + JSON.stringify(data));
            });
        } catch (err) {
            console.info("setDevicePinCode callback errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800
     * @tc.name Test setDevicePinCode promise
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800', 0, async function (done) {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                console.info('setDevicePinCode promise');
            }, error => {
                console.info('setDevicePinCode promise: errCode:' + error.code + ',errMessage' + error.message);
            })
        } catch (err) {
            console.info("setDevicePinCode promise errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900
     * @tc.name Test pairDevice promise
     * @tc.desc Test pairDevice promise api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
        try {
            bluetooth.on('bondStateChange', BondStateParam);
            bluetooth.pairDevice("11:22:55:66:33:44").then((data) => {
                console.info('pairDevice info success');
            }, err => {
                console.info('pairDevice:errCode' + err.code + ', errMessage: ' + err.message);
            });
            bluetooth.off('bondStateChange', BondStateParam);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('bondStateChange', BondStateParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api10 by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100', 0, async function (done) {
        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 oldScanMode = '+ JSON.stringify(oldScanMode));
           let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_NONE,0);
           expect(result).assertTrue();
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_NONE);
           result=bluetooth.setBluetoothScanMode(oldScanMode,0);
           expect(result).assertTrue();
           let getOldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 setoldscanmode = '+ JSON.stringify(getOldScanMode));
           expect(true).assertEqual(oldScanMode == getOldScanMode);
           done();
       }
       else
       {
           console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
           expect(true).assertFalse();
           done();
       }

     })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200', 0, async function (done) {
        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state002'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
           let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
           expect(result).assertTrue();
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
           result=bluetooth.setBluetoothScanMode(oldScanMode,0);
           expect(result).assertTrue();
           let getOldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 setoldscanmode = '+ JSON.stringify(getOldScanMode));
           expect(true).assertEqual(oldScanMode == getOldScanMode);
           done();
       }
        else
       {
           console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
           expect(true).assertFalse();
           done();
       }
   })
   /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0300
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
   it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0300', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state003'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0300 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,40000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0300 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0300 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
    }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0400
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 1
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0400', 0, async function (done) {
     let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state004'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,40000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
    }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0500
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 3
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0500', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state005'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
     }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0600
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 1
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0600', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state006'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
    }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
  })

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0700
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 2
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0700', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state007'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,20000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
     }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_08700
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 1
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0800', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state008'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
     }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0900
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 3
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0900', 0, async function (done) {
    let state = btAccess.getState();
    console.info('[bluetooth_js] get bluetooth state009'+ JSON.stringify(state));
    if(state == 2)
    {
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,30000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
    }
     else
    {
        console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
        expect(true).assertFalse();
        done();
    }
})

/**
 * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_1000
 * @tc.name TEST scanmode
 * @tc.desc TEST scanmode api by promise.
 * @tc.type Function
 * @tc.level Level 4
 */
it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_1000', 0, async function (done) {
    try {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state010'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_1000 oldScanMode = '+ JSON.stringify(oldScanMode));
            let result = bluetooth.setBluetoothScanMode(-1,0);
            expect(result).assertFalse();
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_1000 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == oldScanMode);
            done();
        }
        else
        {
            console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
            expect(true).assertFalse();
        }
    } catch (err) {
        console.info("errCode:" + err.code + ",errMessage:" + err.message);
        expect(err.code).assertEqual('2900099');
    }
    done();
    
})

   /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_DISCOVERY_0100
     * @tc.name TEST bluetoothDeviceFind on&off 
     * @tc.desc TEST bluetoothDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_DISCOVERY_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] Device' + JSON.stringify(data) +
            'length' + data.length);
            expect(true).assertTrue(data.length > 0);
        }
    try {
        bluetooth.on("bluetoothDeviceFind", onReceiveEvent);
        let result = bluetooth.startBluetoothDiscovery();
        await sleep(3000);
        console.info('[bluetooth_js] startDiscovery' + result);
        expect(result).assertTrue();
        bluetooth.off('bluetoothDeviceFind', onReceiveEvent);
        result = bluetooth.stopBluetoothDiscovery();
        console.info('[bluetooth_js] stopDiscovery' + result);
        expect(true).assertTrue();
    } catch (error) {
        console.info(`[bluetooth_js]bluetoothDeviceFin error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual('2900099');
    }
    bluetooth.off('bluetoothDeviceFind', onReceiveEvent);
    done(); 
    })

    

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api10
     * @tc.type Function
     * @tc.level Level 1 
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.LETTERS_TEST);
        expect(result).assertTrue();
        await sleep(1000);
        try {
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0100 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.LETTERS_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.CHINESES_TEST2);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.CHINESES_TEST2 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0300
     * @tc.name setLocalName
     * @tc.desc Test setLocalName number
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0300', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.NUM_TEST);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0300 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.NUM_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

   /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0400
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by SYMBOL.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0400', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.SYMBOL_TEST);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0400 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.SYMBOL_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0500
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0500', 0, async function (done) {
        try {
            let newName = 'my bluetooth';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0500 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0600
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0600', 0, async function (done) {
        try {
            let newName = 'bluetooth1234ABCDEFGH';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0600 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0700
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0700', 0, async function (done) {
        try {
            let newName = '蓝牙设备bluetooth';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0700 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0800
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0800', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES4);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0800 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES4 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0900
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0900', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES2);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0900 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES2 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1000
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1000', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES3);
        expect(result).assertTrue();
        await sleep(1000);
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1000 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(Btname.MIXES3 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1100
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1100', 0, async function (done) {
        try {
            let newName = '蓝牙设备123';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1100 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1200
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1200', 0, async function (done) {
        try {
            let newName = '蓝牙设备bluetooth12';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName1200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1300
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1300', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES6);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1300 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES6 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1400
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1400', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1400 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1500
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1500', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES5);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1500 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES5 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1600
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1600', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.NUM_TEST1);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1600 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.NUM_TEST1 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1700
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1700', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.MIXES7);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1700 NewName = '+ JSON.stringify(getNewName));
            expect(false).assertEqual(Btname.MIXES7 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1800
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1800', 0, async function (done) {
        try {
            let name = bluetooth.getLocalName();
            let set = bluetooth.setLocalName('');
            expect(set).assertFalse();
            await sleep(1000);
            let localName = bluetooth.getLocalName();
            expect(true).assertTrue(localName==name);
            console.info('[bluetooth_js] getLocalName1800 = ' + JSON.stringify(localName));
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1900
     * @tc.name set LocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1900', 0, async function (done) {
        try {
            let localName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1900 localName = '+ JSON.stringify(localName));
            expect(true).assertEqual(localName!=null);
            let newName = 'bluetoothtest';
            let result = bluetooth.setLocalName(newName);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1900 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
            let result1=bluetooth.setLocalName(localName);
            expect(result1).assertTrue();
            await sleep(1000);
            let getLocalName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalNam1900 localName ='+ JSON.stringify(getLocalName));
            expect(true).assertEqual(localName == getLocalName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100
     * @tc.name test getBtConnectionState
     * @tc.desc Test getBtConnectionState api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100', 0, async function (done) {
        try {
            let connectionState = bluetooth.getProfileConnectionState();
            expect(true).assertEqual(connectionState == 0 || connectionState == 1 || connectionState == 2 || connectionState == 3);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200
     * @tc.name getProfileConnectionState
     * @tc.desc Test getProfileConnectionState api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200', 0, async function (done) {
        try {
            let result = bluetooth.getProfileConnectionState(1);
            expect(true).assertEqual(result == 0 || result == 1 || result == 2 || result == 3);
        } catch (err) {
            console.info("getProfileConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('401');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100
     * @tc.name BluetoothTransport
     * @tc.desc Test BluetoothTransport api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100', 0, async function (done) {
        try {
            let TRANSPORT_BR_EDR = bluetooth.BluetoothTransport.TRANSPORT_BR_EDR;
            let TRANSPORT_LE = bluetooth.BluetoothTransport.TRANSPORT_LE;
            expect(TRANSPORT_BR_EDR).assertEqual(0);
            expect(TRANSPORT_LE).assertEqual(1);
        } catch (err) {
            console.info("BluetoothTransport errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1000
     * @tc.name getPairState
     * @tc.desc Test getPairState api11
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1000', 0, async function (done) {
        try {
            let state: bluetooth.BondState = bluetooth.getPairState("00:11:22:33:44:55");
            console.log('[bluetooth_js] getPairState: ' + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.info("getPairState errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1100
     * @tc.name isBluetoothDiscovering
     * @tc.desc Test isBluetoothDiscovering api11
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1100', 0, async function (done) {
        try {
            let result: boolean = bluetooth.isBluetoothDiscovering();
            console.log('[bluetooth_js] isBluetoothDiscovering: ' + result);
            expect(result).assertEqual(false);
        } catch (err) {
            console.info("getPairState errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
})
}