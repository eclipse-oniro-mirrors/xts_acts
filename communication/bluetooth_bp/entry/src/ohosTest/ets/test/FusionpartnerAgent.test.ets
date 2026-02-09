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

import btAccess from '@ohos.bluetooth.access';
import common from '@ohos.bluetooth.common';
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";
let btAddr: common.BluetoothAddress = {
    "address": "11:22:33:44:55:66",
    "addressType": common.BluetoothAddressType.REAL,
};
let deviceAddress: partnerAgent.PartnerDeviceAddress = {
    "bluetoothAddress": btAddr,
};
let deviceCapability: partnerAgent.DeviceCapability = {
    "supportBR": true,
    "supportBleAdvertiser": true,
};
let businessCapability: partnerAgent.BusinessCapability = {
    "supportMediaControl": true,
    "supportTelephonyControl": true,
};
let partnerAgentExtensionAbilityName: string = "testAbilityName";
function sleep(delay : number) : Promise<void> {
    return new Promise(resolve => setTimeout(resolve, delay));
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
            btAccess.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
            let sta1 = btAccess.getState();
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
            btAccess.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
            let sta2 = btAccess.getState();
            console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
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
        let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
        await button1.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] click PERMISSION_TEXT end');
    } catch (err) {
        console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
    }
}

export default function fusionAgentTest() {
    describe('fusionAgentTest', () => {

        beforeAll(async (done : Function) => {
            await clickRequestPermission(PERMISSION_TEXT);
            await openPhone();
            console.info('beforeAll called')
            done();
        })
        beforeEach(async (done : Function) =>{
            console.info('beforeEach called')
            await tryToEnableBt()
            done();
        })
        afterEach(() => {
            console.info('afterEach called')
        })
        afterAll(() => {
            console.info('afterAll called')
        })
        /**
         * @tc.name   SUB_COMMUNICATION_COMMON_ENUMVALUE_0100
         * @tc.number SUB_COMMUNICATION_COMMON_ENUMVALUE_0100
         * @tc.desc   Test EnumValue
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_COMMON_ENUMVALUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let value1 = common.BluetoothRawAddressType.PUBLIC;
                console.info("[common_js]common BluetoothRawAddressType PUBLIC value is: " + JSON.stringify(value1));
                expect(value1).assertEqual(0);
                let value2 = common.BluetoothRawAddressType.RANDOM;
                console.info("[common_js]common BluetoothRawAddressType  RANDOM value is: " + JSON.stringify(value2));
                expect(value2).assertEqual(1);
            } catch (err) {
                console.error("[common_js]common enumvalue is fail , errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ENUMVALUE_0100
         * @tc.number SUB_COMMUNICATION_FUSION_ENUMVALUE_0100
         * @tc.desc   Test EnumValue
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ENUMVALUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let value1 = partnerAgent.PartnerAgentExtensionAbilityDestroyReason.UNKNOWN_REASON;
                console.info("[fusion_js]PartnerAgentExtensionAbilityDestroyReason UNKNOWN_REASON value is: " + JSON.stringify(value1));
                expect(value1).assertEqual(0);
                let value2 = partnerAgent.PartnerAgentExtensionAbilityDestroyReason.USER_CLOSED_ABILITY;
                console.info("[fusion_js]PartnerAgentExtensionAbilityDestroyReason USER_CLOSED_ABILITY value is: " + JSON.stringify(value2));
                expect(value2).assertEqual(1);
                let value3 = partnerAgent.PartnerAgentExtensionAbilityDestroyReason.DEVICE_UNPAIRED;
                console.info("[fusion_js]PartnerAgentExtensionAbilityDestroyReason DEVICE_UNPAIRED value is: " + JSON.stringify(value3));
                expect(value3).assertEqual(2);
                let value4 = partnerAgent.PartnerAgentExtensionAbilityDestroyReason.DEVICE_LOST;
                console.info("[fusion_js]PartnerAgentExtensionAbilityDestroyReason DEVICE_LOST value is: " + JSON.stringify(value4));
                expect(value4).assertEqual(3);
                let value5 = partnerAgent.PartnerAgentExtensionAbilityDestroyReason.BLUETOOTH_DISABLED;
                console.info("[fusion_js]PartnerAgentExtensionAbilityDestroyReason BLUETOOTH_DISABLED value is: " + JSON.stringify(value5));
                expect(value5).assertEqual(4);
            } catch (err) {
                console.error("[fusion_js]PartnerAgentExtensionAbilityDestroyReason is fail , errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_0100
         * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0100
         * @tc.desc   Test function isPartnerAgentSupported(): boolean;API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let isSupport = partnerAgent.isPartnerAgentSupported();
                console.info("[fusion_js]isPartnerAgentSupported UNKNOWN_REASON value is: " + JSON.stringify(isSupport));
                expect(isSupport).assertEqual(true);
            } catch (err) {
                console.error("[fusion_js]PartnerAgentExtensionAbilityDestroyReason is fail , errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_0200
         * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0200
         * @tc.desc   Test isDeviceBound 没有对端设备返回false API 23 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceBound(deviceAddress);
                console.info("[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
                expect(is_boolean).assertEqual(false);
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_0300
         * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0300
         * @tc.desc   Test isDeviceControlEnabled 没有对端设备返回false API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress);
                console.info("[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
                expect(is_boolean).assertEqual(false);
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0100
         * @tc.number SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0100
         * @tc.desc   Test function bindDevice;API 23 没有配对设备报错03
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability, partnerAgentExtensionAbilityName);
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(34900003);
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0200
         * @tc.number SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0200
         * @tc.desc   Test function bindDevice;API 23 关闭蓝牙报错05
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                btAccess.disableBluetooth();
                await clickRequestPermission(CLOSE_BT_TEXT);
                await sleep(5000);
                await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability, partnerAgentExtensionAbilityName);
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(34900005);
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_0100
         * @tc.number SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_0100
         * @tc.desc   Test function bindDevice;API 23 设备未注册01
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.unbindDevice(deviceAddress);
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(34900001);
            }
            done();
        })

    })
}