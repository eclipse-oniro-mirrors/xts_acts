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
let btAddr1: common.BluetoothAddress = {
    "address": "11:22:33",
    "addressType": common.BluetoothAddressType.VIRTUAL,
};
let btAddr2: common.BluetoothAddress = {
    "address": "11:22:33:44:55:66",
    "addressType": common.BluetoothAddressType.VIRTUAL,
};
let deviceAddress: partnerAgent.PartnerDeviceAddress = {
    "bluetoothAddress": btAddr,
};
let deviceAddress1: partnerAgent.PartnerDeviceAddress = {
    "bluetoothAddress": btAddr1,
};
let deviceAddress2: partnerAgent.PartnerDeviceAddress = {
    "bluetoothAddress": btAddr2,
};
let deviceCapability: partnerAgent.DeviceCapability = {
    "supportBR": true,
    "supportBleAdvertiser": true,
};
let deviceCapability1: partnerAgent.DeviceCapability = {
    "supportBR": false,
    "supportBleAdvertiser": true,
};
let deviceCapability2: partnerAgent.DeviceCapability = {
    "supportBR": false,
    "supportBleAdvertiser": false,
};
let deviceCapability3: partnerAgent.DeviceCapability = {
    "supportBR": true,
    "supportBleAdvertiser": false,
};
let businessCapability: partnerAgent.BusinessCapability = {
    "supportMediaControl": true,
    "supportTelephonyControl": true,
};
let businessCapability1: partnerAgent.BusinessCapability = {
    "supportMediaControl": false,
    "supportTelephonyControl": true,
};
let businessCapability2: partnerAgent.BusinessCapability = {
    "supportMediaControl": true,
    "supportTelephonyControl": false,
};
let businessCapability3: partnerAgent.BusinessCapability = {
    "supportMediaControl": false,
    "supportTelephonyControl": false,
};

let partnerAgentExtensionAbilityName: string = "testAbilityName";

function sleep(delay : number) : Promise<void> {
    return new Promise(resolve => setTimeout(resolve, delay));
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
        afterAll(async (done : Function) =>{
            console.info('afterAll called')
            await tryToEnableBt()
            done();
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
                expect(isSupport == true || isSupport == false).assertTrue();
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
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect().assertFail();
                }
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
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect().assertFail();
                }
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
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(34900003);
                }
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
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(34900005);
                }
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
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(34900001);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_0100
         * @tc.number SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_0100
         * @tc.desc   Test function getBoundDevices;API 23 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let result_list = partnerAgent.getBoundDevices();
                if (result_list.length > 0) {
                    console.info('[bluetooth_js] getBoundDevices' + JSON.stringify(result_list[0]));
                    expect(result_list.length > 0).assertTrue();
                    done();
                }
                else {
                    expect(result_list.length == 0).assertTrue();
                    done();
                }
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0100
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0100
         * @tc.desc   Test isDeviceBound 入参不合法返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceBound(deviceAddress1);
                console.info("[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0200
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0200
         * @tc.desc   Test isDeviceControlEnabled 入参不合法返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress1);
                console.info("[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0300
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0300
         * @tc.desc   Test unbindDevice 入参不合法返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.unbindDevice(deviceAddress1);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0400
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0400
         * @tc.desc   Test isDeviceBound 入参null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceBound(null);
                console.info("[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0500
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0500
         * @tc.desc   Test isDeviceControlEnabled 入参null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceControlEnabled(null);
                console.info("[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0600
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0600
         * @tc.desc   Test unbindDevice 入参null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.unbindDevice(null);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0700
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0700
         * @tc.desc   Test bindDevice 参数1null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.bindDevice(null, deviceCapability1, businessCapability2, '');
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0800
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0800
         * @tc.desc   Test bindDevice 参数2null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.bindDevice(deviceAddress1, null, businessCapability1, partnerAgentExtensionAbilityName);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_0900
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_0900
         * @tc.desc   Test bindDevice 参数3null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.bindDevice(deviceAddress2, deviceCapability2, null, partnerAgentExtensionAbilityName);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1000
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1000
         * @tc.desc   Test bindDevice 参数4null 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.bindDevice(deviceAddress, deviceCapability3, businessCapability3, null);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })     
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1100
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1100
         * @tc.desc   Test isDeviceBound 参数undefined 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceBound(undefined);
                console.info("[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1200
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1200
         * @tc.desc   Test isDeviceControlEnabled 参数undefined 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceControlEnabled(undefined);
                console.info("[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1300
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1300
         * @tc.desc   Test unbindDevice 参数undefined 返回401 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.unbindDevice(undefined);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1400
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1400
         * @tc.desc   Test isDeviceBound 参数覆盖  API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceBound(deviceAddress2);
                console.info("[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1500
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1500
         * @tc.desc   Test isDeviceControlEnabled 没有对端设备返回false 参数覆盖 API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress2);
                console.info("[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
                expect(is_boolean == true || is_boolean == false).assertTrue();
            } catch (err) {
                console.error("[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_FUSION_ADD_1600
         * @tc.number SUB_COMMUNICATION_FUSION_ADD_1600
         * @tc.desc   Test unbindDevice 设备未注册01 参数覆盖API 23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_FUSION_ADD_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
            try {
                await partnerAgent.unbindDevice(deviceAddress2);
                expect().assertFail();
            } catch (err) {
                console.error("[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);    
                if (Number(err.code) === 801) {
                    console.info("设备 is not support.");
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(34900001);
                }
            }
            done();
        })

    })
}