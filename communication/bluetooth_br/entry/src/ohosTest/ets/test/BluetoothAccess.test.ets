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

import bluetooth from '@ohos.bluetooth.access';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

    function sleep(delay : number) : Promise<void> {
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

    let PERMISSION_TEXT:string = "允许";
    let OPEN_BT_TEXT:string = "开启";
    let CLOSE_BT_TEXT:string = "关闭";

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
    function onReceiveEvent(data : bluetooth.BluetoothState) {
            console.info('bluetooth state001 =' + JSON.stringify(data));
        }
    
export default function btAccessTest() {
describe('btAccessTest', () => {
    
    beforeAll(async (done : Function) =>  {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        done();
    })
    beforeEach(async (done : Function) =>  {
        console.info('beforeEach called')
        let state = bluetooth.getState();
        console.info('[bluetooth_js] bluetooth state ='+ JSON.stringify(state));
        if(state != bluetooth.BluetoothState.STATE_ON) {
            bluetooth.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let openSt = bluetooth.getState();
            console.info('[bluetooth_js] bluetooth enable state ='+ JSON.stringify(openSt));
        }
        done();
    })
    afterEach(() => {
        console.info('afterEach called')
    })
    afterAll(() => {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0100
     * @tc.name testEnableBluetooth
     * @tc.desc Test enableBluetooth api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) =>  {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] bluetooth state = '+ JSON.stringify(state));
        if(state != bluetooth.BluetoothState.STATE_OFF) {
            bluetooth.disableBluetooth();
            await clickRequestPermission(CLOSE_BT_TEXT);
            await sleep(10000);
            let closeSt = bluetooth.getState();
            console.info('[bluetooth_js] bluetooth disable state ='+ JSON.stringify(closeSt));
            expect(closeSt).assertEqual(bluetooth.BluetoothState.STATE_OFF);
        } else {
            console.info('[bluetooth_js] bluetooth state is OFF');
        } 
        try {
            bluetooth.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
        } catch (error) {
            console.error(`[bluetooth_js] enable StateChange error, code is ${error.code},message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]enablebluetooth is not support');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
            expect(Number(error.code)).assertEqual(2900099);
        }
        let openSt = bluetooth.getState();
        console.info('[bluetooth_js] bluetooth enable state ='+ JSON.stringify(openSt));
        expect(openSt).assertEqual(bluetooth.BluetoothState.STATE_ON);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0200
     * @tc.name testDisableBluetooth
     * @tc.desc Test disableBluetooth api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) =>  {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] bluetooth state = '+ JSON.stringify(state));
        if(state != bluetooth.BluetoothState.STATE_ON) {
            bluetooth.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
            let openSt = bluetooth.getState();
            console.info('[bluetooth_js] bluetooth enable state ='+ JSON.stringify(openSt));
            expect(openSt).assertEqual(bluetooth.BluetoothState.STATE_ON);
        } else {
            console.info('[bluetooth_js] bluetooth state is ON');
        } 
        try {
            bluetooth.disableBluetooth();
            await clickRequestPermission(CLOSE_BT_TEXT);
            await sleep(10000);
        } catch (error) {
            console.error(`[bluetooth_js] disable StateChange error, code is ${error.code},message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]disablebluetooth is not support');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
            expect(Number(error.code)).assertEqual(2900099);
        }
        let closeSt = bluetooth.getState();
        console.info('[bluetooth_js] bluetooth disable state ='+ JSON.stringify(closeSt));
        expect(closeSt).assertEqual(bluetooth.BluetoothState.STATE_OFF);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0300
     * @tc.name testGetState
     * @tc.desc Test getState api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) =>  {
        try {
            let state = bluetooth.getState();
            expect(state >= 0 && state <= 6).assertTrue();
        } catch (error) {
            console.error("[bluetooth_js] bluetooth getState errCode:" + error.code + ",bluetooth getState errMessage:" + error.message);
            if (error.code == 801) {
                console.info('[bluetooth_js]getState is not support');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
            expect(Number(error.code)).assertEqual(2900099);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0400
     * @tc.name testOnStateChange
     * @tc.desc Test on 'stateChange' api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) =>  {
    try {
        await bluetooth.on('stateChange', onReceiveEvent);
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state' + JSON.stringify(state));
        if (state != bluetooth.BluetoothState.STATE_ON) {
            bluetooth.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
            let state1 = bluetooth.getState();
            console.info('[bluetooth_js] enable state ' + JSON.stringify(state1));
            expect(state1).assertEqual(bluetooth.BluetoothState.STATE_ON);
        }
    } catch (error) {
        console.error(`[bluetooth_js]enable StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
            console.info('[bluetooth_js]OnStateChange is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
        expect(Number(error.code)).assertEqual(2900099);
    }    
    bluetooth.off('stateChange', onReceiveEvent);
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0500
     * @tc.name testOnStateChange
     * @tc.desc Test off 'stateChange' api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) =>  {
    try {
        await bluetooth.on('stateChange', onReceiveEvent);
        await sleep(3000);
        await bluetooth.off('stateChange', onReceiveEvent);
        let state = bluetooth.getState();
        console.info('[bluetooth_js] get bluetooth state001' + JSON.stringify(state));
        if (state != bluetooth.BluetoothState.STATE_OFF) {
            bluetooth.disableBluetooth();
            await clickRequestPermission(CLOSE_BT_TEXT);
            await sleep(10000);
            let state1 = bluetooth.getState();
            console.info('[bluetooth_js] disable state001 ' + JSON.stringify(state1));
            expect(state1).assertEqual(bluetooth.BluetoothState.STATE_OFF);
        }
    } catch (error) {
        console.error(`[bluetooth_js]disable StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
            console.info('[bluetooth_js]OffStateChange is not support');
            expect(true).assertTrue();
        } else {
            expect().assertFail();
        }
        expect(Number(error.code)).assertEqual(2900099);
    }    
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0600
     * @tc.name testBluetoothState
     * @tc.desc Test BluetoothState api10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        let STATE_ON = bluetooth.BluetoothState.STATE_ON;
        console.info("[bluetooth_js]STATE_ON : " + JSON.stringify(STATE_ON));
        expect(true).assertEqual(STATE_ON == 2);
        let STATE_OFF = bluetooth.BluetoothState.STATE_OFF;
        console.info("[bluetooth_js]STATE_OFF : " + JSON.stringify(STATE_OFF));
        expect(true).assertEqual(STATE_OFF == 0);
        let STATE_TURNING_ON = bluetooth.BluetoothState.STATE_TURNING_ON;
        console.info("[bluetooth_js]STATE_TURNING_ON : " + JSON.stringify(STATE_TURNING_ON));
        expect(true).assertEqual(STATE_TURNING_ON == 1);
        let STATE_TURNING_OFF = bluetooth.BluetoothState.STATE_TURNING_OFF;
        console.info("[bluetooth_js]STATE_TURNING_OFF : " + JSON.stringify(STATE_TURNING_OFF));
        expect(true).assertEqual(STATE_TURNING_OFF == 3);
        let STATE_BLE_TURNING_ON = bluetooth.BluetoothState.STATE_BLE_TURNING_ON;
        console.info("[bluetooth_js]STATE_BLE_TURNING_ON : " + JSON.stringify(STATE_BLE_TURNING_ON));
        expect(true).assertEqual(STATE_BLE_TURNING_ON == 4);
        let STATE_BLE_ON = bluetooth.BluetoothState.STATE_BLE_ON;
        console.info("[bluetooth_js]STATE_BLE_ON : " + JSON.stringify(STATE_BLE_ON));
        expect(true).assertEqual(STATE_BLE_ON == 5);
        let STATE_BLE_TURNING_OFF = bluetooth.BluetoothState.STATE_BLE_TURNING_OFF;
        console.info("[bluetooth_js]STATE_BLE_TURNING_OFF : " + JSON.stringify(STATE_BLE_TURNING_OFF));
        expect(true).assertEqual(STATE_BLE_TURNING_OFF == 6);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESS_GETPERSISTENTDEVICEIDS_0100
     * @tc.name testGetPersistentDeviceIds
     * @tc.desc Test getPersistentDeviceIds api16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ACCESS_GETPERSISTENTDEVICEIDS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        let macs: string[] = bluetooth.getPersistentDeviceIds();
        console.info("[bluetooth_js]getPersistentDeviceIds result:" + JSON.stringify(macs));
        expect(true).assertEqual(macs.length == 0);
    } catch (error) {
        console.info("getPersistentDeviceIds errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
            console.info("getPersistentDeviceIds is not support");
            expect(true).assertTrue();
        }else {
            expect().assertFail();
        }
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISVALIDRANDOMDEVICEID_0100
     * @tc.name testIsValidRandomDeviceId
     * @tc.desc Test isValidRandomDeviceId api16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISVALIDRANDOMDEVICEID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        let isValidRandom = bluetooth.isValidRandomDeviceId("00:00:00:00:00:00");
        console.info("[bluetooth_js]isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
        expect(isValidRandom).assertFalse();
    } catch (error) {
        console.info("isValidRandomDeviceId errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
            console.info("isValidRandomDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect().assertFail();
        }
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISVALIDRANDOMDEVICEID_0200
     * @tc.name testIsValidRandomDeviceId
     * @tc.desc Test isValidRandomDeviceId api16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISVALIDRANDOMDEVICEID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        let isValidRandom = bluetooth.isValidRandomDeviceId(null);
        console.info("[bluetooth_js]isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
        expect().assertFail();
    } catch (error) {
        console.info("isValidRandomDeviceId errCode:" + error.code + ",errMessage:" + error.message);
        expect(Number(error.code)).assertEqual(401);
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESS_ADDPERSISTENTDEVICEID_0100
     * @tc.name testAddPersistentDeviceId
     * @tc.desc Test addPersistentDeviceId api16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ACCESS_ADDPERSISTENTDEVICEID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        await bluetooth.addPersistentDeviceId('00:00:00:00:00:00').then(() => {
            console.info('[bluetooth_js] addPersistentDeviceId success');
        });
        expect().assertFail();
    } catch (error) {
        console.info("addPersistentDeviceId errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
            console.info("addPersistentDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(error.code)).assertEqual(401);
        }
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESS_DELETEPERSISTENTDEVICEID_0100
     * @tc.name testDeletePersistentDeviceId
     * @tc.desc Test deletePersistentDeviceId api16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_ACCESS_DELETEPERSISTENTDEVICEID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        await bluetooth.deletePersistentDeviceId('00:00:00:00:00:00').then(() => {
            console.info('[bluetooth_js] deletePersistentDeviceId success');
        });
        expect().assertFail();
    } catch (error) {
        console.info("deletePersistentDeviceId errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
            console.info("deletePersistentDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(error.code)).assertEqual(401);
        }
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0700
     * @tc.name testOnStateChange
     * @tc.desc Test on 'stateChange' 401
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        bluetooth.on('stateChange', null);
        expect().assertFail();
    } catch (error) {
        console.error(`[bluetooth_js]enable StateChange error, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
    }
    done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0800
     * @tc.name testOnStateChange
     * @tc.desc Test off 'stateChange' 401
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_STATECHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
    try {
        bluetooth.off('stateChange', null);
        expect().assertFail();
    } catch (error) {
        console.error(`[bluetooth_js]enable StateChange error, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
    }
    done();
    })
})
}