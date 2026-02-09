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
import hid from '@ohos.bluetooth.hid';
import { BusinessError } from '@ohos.base';
import { bundleManager } from '@kit.AbilityKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let hidDevice: hid.HidDeviceProfile;
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
    switch (sta) {
        case 0:
            btAccess.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
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
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(10000);
            let sta2 = btAccess.getState();
            console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
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
function onReceiveEvent_void(){
    console.info('[bluetooth_js] BLEscan device result_viod');
}
function onReceiveEvent_boolean(data : boolean){
    console.info('[bluetooth_js]hid registerHidDevice result'+ JSON.stringify(data));
    expect(data).assertTrue();
}
function onReceiveEvent_GetReportData(data : hid.GetReportData){
    console.info('[bluetooth_js]hid on/offGetReport result'+ JSON.stringify(data));
    console.info('[bluetooth_js]hid on/offGetReport result'+ JSON.stringify(data.type));
    expect(data.type).not().assertUndefined();
    console.info('[bluetooth_js]hid on/offGetReport result'+ JSON.stringify(data.id));
    expect(data.id).not().assertUndefined();
    console.info('[bluetooth_js]hid on/offGetReport result'+ JSON.stringify(data.bufferSize));
    expect(data.bufferSize).not().assertUndefined();
}
function onReceiveEvent_SetReportData(data : hid.SetReportData){
    console.info('[bluetooth_js]hid on/offSetReportData device result_viod'+ JSON.stringify(data));
    console.info('[bluetooth_js]hid on/offSetReportData device result_viod'+ JSON.stringify(data.type));
    expect(data.type).not().assertUndefined();
    console.info('[bluetooth_js]hid on/offSetReportData device result_viod'+ JSON.stringify(data.id));
    expect(data.id).not().assertUndefined();
    console.info('[bluetooth_js]hid on/offSetReportData device result_viod'+ JSON.stringify(data.data));
    expect(data.data).not().assertUndefined();
}
function onReceiveEvent_InterruptData(data : hid.InterruptData){
    console.info('[bluetooth_js]hid on/offInterruptDataReceived device result_viod'+ JSON.stringify(data));
    console.info('[bluetooth_js]hid on/offInterruptDataReceived device result_viod'+ JSON.stringify(data.id));
    expect(data.id).not().assertUndefined();
    console.info('[bluetooth_js]hid on/offInterruptDataReceived device result_viod'+ JSON.stringify(data.data));
    expect(data.data).not().assertUndefined();
}	
function onReceiveEvent_ProtocolData(data : hid.ProtocolData){
    console.info('[bluetooth_js]hid on/offSetProtocol device result_viod'+ JSON.stringify(data));
    console.info('[bluetooth_js]hid on/offSetProtocol device result_viod'+ JSON.stringify(data.protocol));
    expect(data.protocol).not().assertUndefined();
}

let descriptors: Uint8Array = new Uint8Array([
    0x05, 0x01,
    0x09, 0x06,
    0xA1, 0x01,
    0x05, 0x07,
    0x19, 0xE0,
    0x29, 0xE7,
    0x15, 0x00,
    0x25, 0x01,
    0x75, 0x01,
    0x95, 0x08,
    0x81, 0x02,
    0x95, 0x01,
    0x75, 0x08,
    0x81, 0x01,
    0x95, 0x05,
    0x75, 0x01,
    0x05, 0x08,
    0x19, 0x01,
    0x29, 0x05,
    0x91, 0x02,
    0x95, 0x01,
    0x75, 0x03,
    0x91, 0x01,
    0x95, 0x06,
    0x75, 0x08,
    0x15, 0x00,
    0x25, 0x65,
    0x05, 0x07,
    0x19, 0x00,
    0x29, 0x65,
    0x81, 0x00,
    0xC0]);
let sdp: hid.HidDeviceSdp = {
    "name": "testName",
    "description": "testDescription",
    "provider": "testProvoder",
    "subclass": hid.Subclass.SUBCLASS_KEYBOARD,
    "descriptors": descriptors,
};
let inqos: hid.HidDeviceQos = {
    "serviceType": hid.ServiceType.SERVICE_BEST_EFFORT,
    "tokenRate": 0,
    "tokenBucketSize": 0,
    "peakBandwidth": 0,
    "latency": -1,
    "delayVariation": -1,
};
let outqos: hid.HidDeviceQos = {};

function registerHidDeviceAsync(): Promise<boolean> {
    return new Promise((resolve,reject) => {
        const timeout = setTimeout(() => {
            reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
        }, 5000);
        hidDevice.registerHidDevice(sdp, inqos, outqos,(data: boolean) => {
            clearTimeout(timeout)
            console.info('[bluetooth_js] registerHidDeviceAsync success'+ JSON.stringify(data));
            resolve(data);
        });
    });
}
export default function btHidTest() {
describe('btHidTest', () => {
    beforeAll(async (done : Function) =>  {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        hidDevice = hid.createHidDeviceProfile();
        console.info('[bluetooth_js]beforeAll createHidDeviceProfile success'+ JSON.stringify(hidDevice));
        done();
    })
    beforeEach(async (done : Function) =>  {
        console.info('beforeEach called');
        await tryToEnableBt();
        done();
    })
    afterEach(async (done : Function) =>  {
        console.info('afterEach called')
        hidDevice.unregisterHidDevice();
        console.info("[bluetooth_js]afterEach unregisterHidDevice is success ");
        done();
    })
    afterAll(() => {
        console.info('afterAll called')
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0100
     * @tc.desc   Test Subclass EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
            let value1 = hid.Subclass.SUBCLASS_UNCATEGORIZED;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_UNCATEGORIZED value is: " + JSON.stringify(value1));
            expect(value1).assertEqual(0);
            let value2 = hid.Subclass.SUBCLASS_JOYSTICK;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_JOYSTICK value is: " + JSON.stringify(value2));
            expect(value2).assertEqual(1);
            let value3 = hid.Subclass.SUBCLASS_GAMEPAD;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_GAMEPAD value is: " + JSON.stringify(value3));
            expect(value3).assertEqual(2);
            let value4 = hid.Subclass.SUBCLASS_REMOTE_CONTROL;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_REMOTE_CONTROL value is: " + JSON.stringify(value4));
            expect(value4).assertEqual(3);
            let value5 = hid.Subclass.SUBCLASS_SENSING_DEVICE;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_SENSING_DEVICE value is: " + JSON.stringify(value5));
            expect(value5).assertEqual(4);
            let value6 = hid.Subclass.SUBCLASS_DIGITIZER_TABLET;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_DIGITIZER_TABLET value is: " + JSON.stringify(value6));
            expect(value6).assertEqual(5);
            let value7 = hid.Subclass.SUBCLASS_CARD_READER;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_CARD_READER value is: " + JSON.stringify(value7));
            expect(value7).assertEqual(6);
            let value8 = hid.Subclass.SUBCLASS_KEYBOARD;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_KEYBOARD value is: " + JSON.stringify(value8));
            expect(value8).assertEqual(64);
			let value9 = hid.Subclass.SUBCLASS_MOUSE;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_MOUSE value is: " + JSON.stringify(value9));
            expect(value9).assertEqual(128);
			let value10 = hid.Subclass.SUBCLASS_COMBO;
            console.info("[bluetooth_js]hid Subclass SUBCLASS_COMBO value is: " + JSON.stringify(value10));
            expect(value10).assertEqual(192);
        } catch (err) {
            console.error("[bluetooth_js]hid Subclass EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0200
     * @tc.desc   Test ReportType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
            let value1 = hid.ReportType.REPORT_TYPE_INPUT;
            console.info("[bluetooth_js]hid ReportType REPORT_TYPE_INPUT value is: " + JSON.stringify(value1));
            expect(value1).assertEqual(1);
            let value2 = hid.ReportType.REPORT_TYPE_OUTPUT;
            console.info("[bluetooth_js]hid ReportType REPORT_TYPE_OUTPUT value is: " + JSON.stringify(value2));
            expect(value2).assertEqual(2);
            let value3 = hid.ReportType.REPORT_TYPE_FEATURE;
            console.info("[bluetooth_js]hid ReportType REPORT_TYPE_FEATURE value is: " + JSON.stringify(value3));
            expect(value3).assertEqual(3);
        } catch (err) {
            console.error("[bluetooth_js]hid ReportType EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0300
     * @tc.desc   Test ServiceType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
            let value1 = hid.ServiceType.SERVICE_NO_TRAFFIC;
            console.info("[bluetooth_js]hid ServiceType SERVICE_NO_TRAFFIC value is: " + JSON.stringify(value1));
            expect(value1).assertEqual(0);
            let value2 = hid.ServiceType.SERVICE_BEST_EFFORT;
            console.info("[bluetooth_js]hid ServiceType SERVICE_BEST_EFFORT value is: " + JSON.stringify(value2));
            expect(value2).assertEqual(1);
            let value3 = hid.ServiceType.SERVICE_GUARANTEED;
            console.info("[bluetooth_js]hid ServiceType SERVICE_GUARANTEED value is: " + JSON.stringify(value3));
            expect(value3).assertEqual(2);
        } catch (err) {
            console.error("[bluetooth_js]hid ServiceType EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0400
     * @tc.desc   Test ErrorReason EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
            let value1 = hid.ErrorReason.RSP_SUCCESS;
            console.info("[bluetooth_js]hid ErrorReason RSP_SUCCESS value is: " + JSON.stringify(value1));
            expect(value1).assertEqual(0);
            let value2 = hid.ErrorReason.RSP_NOT_READY;
            console.info("[bluetooth_js]hid ErrorReason RSP_NOT_READY value is: " + JSON.stringify(value2));
            expect(value2).assertEqual(1);
            let value3 = hid.ErrorReason.RSP_INVALID_REPORT_ID;
            console.info("[bluetooth_js]hid ErrorReason RSP_INVALID_REPORT_ID value is: " + JSON.stringify(value3));
            expect(value3).assertEqual(2);
            let value4 = hid.ErrorReason.RSP_UNSUPPORTED_REQ;
            console.info("[bluetooth_js]hid ErrorReason RSP_UNSUPPORTED_REQ value is: " + JSON.stringify(value4));
            expect(value4).assertEqual(3);
            let value5 = hid.ErrorReason.RSP_INVALID_PARAM;
            console.info("[bluetooth_js]hid ErrorReason RSP_INVALID_PARAM value is: " + JSON.stringify(value5));
            expect(value5).assertEqual(4);
            let value6 = hid.ErrorReason.RSP_UNKNOWN;
            console.info("[bluetooth_js]hid ErrorReason RSP_UNKNOWN value is: " + JSON.stringify(value6));
            expect(value6).assertEqual(14);
        } catch (err) {
            console.error("[bluetooth_js]hid ErrorReason EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0500
     * @tc.desc   Test ProtocolType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        try {
            let value1 = hid.ProtocolType.PROTOCOL_BOOT_MODE;
            console.info("[bluetooth_js]hid ProtocolType PROTOCOL_BOOT_MODE value is: " + JSON.stringify(value1));
            expect(value1).assertEqual(0);
            let value2 = hid.ProtocolType.PROTOCOL_REPORT_MODE;
            console.info("[bluetooth_js]hid ProtocolType PROTOCOL_REPORT_MODE value is: " + JSON.stringify(value2));
            expect(value2).assertEqual(1);
        } catch (err) {
            console.error("[bluetooth_js]hid ProtocolType EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_3300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_3300
     * @tc.desc   Test ReportType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_ENUMVALUE_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) =>  {
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
        try {
            bundleManager.getBundleInfoForSelf(bundleFlags).then((bundleInfo:bundleManager.BundleInfo) => {
                console.info('testTag', 'getBundleInfoForSelf successfully. appIdentifier:', bundleInfo.signatureInfo.appIdentifier);
            }).catch((err: BusinessError) => {
                console.error('testTag', 'getBundleInfoForSelf failed. Cause:', err.message);
            });
        } catch (err) {
            console.error("[bluetooth_js]hid ReportType EnumValue:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_CREAT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_CREAT_0100
     * @tc.desc   Test function createHidDeviceProfile(): HidDeviceProfile;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_CREAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice = hid.createHidDeviceProfile();
            console.info("[bluetooth_js]hid createHidDeviceProfile is success ");
            expect(true).assertEqual(hidDevice != null);
        } catch (err) {
            console.error("[bluetooth_js]hid createHidDeviceProfile is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("RK板 is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect().assertFail();
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_0100
     * @tc.desc   Test 注册 /去注册 -正常场景api23.normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let result: boolean = await registerHidDeviceAsync();
            console.info("[bluetooth_js]hid registerHidDevice 0100 is success "+ JSON.stringify(result));
            expect(result).assertTrue();
            hidDevice.unregisterHidDevice();
            console.info("[bluetooth_js]hid unregisterHidDevice is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect().assertFail();
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HIDPROFILE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HIDPROFILE_0300
     * @tc.desc   Test unregisterHidDevice(): void; api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HIDPROFILE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.unregisterHidDevice();
            console.info("[bluetooth_js]hid unregisterHidDevice is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid unregisterHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect().assertFail();
            }
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0100
     * @tc.desc   Test connect 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			let deviceId: common.BluetoothAddress = {
				"address": "11:22:33:44:55:66",
				"addressType": common.BluetoothAddressType.REAL,
                "rawAddressType": common.BluetoothRawAddressType.PUBLIC
			};
            hidDevice.connect(deviceId);
            console.info("[bluetooth_js]hid connect is success ");
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid connect is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903052);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0200
     * @tc.desc   Test disconnect() 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.disconnect();
            console.info("[bluetooth_js]hid disconnect is success ");
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid disconnect is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903052);
            }
        }
        done();
    })	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0300
     * @tc.desc   Test sendReport 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			let id: number = 1;
			let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
            hidDevice.sendReport(id,reportData);
            console.info("[bluetooth_js]hid sendReport is success ");
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903052);
            }
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0400
     * @tc.desc   Test replyReport 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			let type1: hid.ReportType = hid.ReportType.REPORT_TYPE_INPUT;
			let id: number = 1;
			let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
            hidDevice.replyReport(type1,id,reportData);
            console.info("[bluetooth_js]hid replyReport is success ");
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903052);
            }
        }
        done();
    })	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0500
     * @tc.desc   Test reportError 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			let error: hid.ErrorReason = hid.ErrorReason.RSP_SUCCESS;
            hidDevice.reportError(error);
            console.info("[bluetooth_js]hid reportError is success ");
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903052);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RR_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RR_0500
     * @tc.desc   Test registerHidDevice  api23.重复注册2903051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let result: boolean = await registerHidDeviceAsync();
            let result2: boolean = await registerHidDeviceAsync();
            console.info("[bluetooth_js]hid registerHidDevice 0100 is success "+ JSON.stringify(result));
            console.info("[bluetooth_js]hid registerHidDevice 0100 is success "+ JSON.stringify(result2));
            expect().assertFail();
        } catch (err) {
            console.error("[bluetooth_js]hid unregisterHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);            
            if (Number(err.code) == 801) {
                console.info("设备（除手机外） is not support.");
                expect(Number(err.code)).assertTrue(801);
            } else {
                expect(Number(err.code)).assertEqual(2903051);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0100
     * @tc.desc   Test onSetReport(callback: Callback<SetReportData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onGetReport(onReceiveEvent_GetReportData);
            hidDevice.offGetReport(onReceiveEvent_GetReportData);
            console.info("[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0200
     * @tc.desc   Test onSetReport(callback: Callback<SetReportData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onSetReport(onReceiveEvent_SetReportData);
            hidDevice.offSetReport(onReceiveEvent_SetReportData);
            console.info("[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0300
     * @tc.desc   Test onInterruptDataReceived(callback: Callback<InterruptData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onInterruptDataReceived(onReceiveEvent_InterruptData);
            hidDevice.offInterruptDataReceived(onReceiveEvent_InterruptData);
            console.info("[bluetooth_js]hid on/offInterruptDataReceived value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offInterruptDataReceived is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0400
     * @tc.desc   Test onSetProtocol(callback: Callback<ProtocolData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onSetProtocol(onReceiveEvent_ProtocolData);
            hidDevice.offSetProtocol(onReceiveEvent_ProtocolData);
            console.info("[bluetooth_js]hid on/offSetProtocol value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetProtocol is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0500
     * @tc.desc   Test onVirtualCableUnplug(callback: Callback<void>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onVirtualCableUnplug(onReceiveEvent_void);
            hidDevice.offVirtualCableUnplug(onReceiveEvent_void);
            console.info("[bluetooth_js]hid on/offVirtualCableUnplug value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offVirtualCableUnplug is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0600
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onGetReport(onReceiveEvent_GetReportData);
            hidDevice.offGetReport();
            console.info("[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0700
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onSetReport(onReceiveEvent_SetReportData);
            hidDevice.offSetReport();
            console.info("[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0800
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onInterruptDataReceived(onReceiveEvent_InterruptData);
            hidDevice.offInterruptDataReceived();
            console.info("[bluetooth_js]hid on/offInterruptDataReceived value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offInterruptDataReceived is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0900
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onSetProtocol(onReceiveEvent_ProtocolData);
            hidDevice.offSetProtocol();
            console.info("[bluetooth_js]hid on/offSetProtocol value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offSetProtocol is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_1000
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            hidDevice.onVirtualCableUnplug(onReceiveEvent_void);
            hidDevice.offVirtualCableUnplug();
            console.info("[bluetooth_js]hid on/offVirtualCableUnplug value is success ");
        } catch (err) {
            console.error("[bluetooth_js]hid on/offVirtualCableUnplug is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })    
 })
}