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
import ble from '@ohos.bluetooth.ble';
import common from '@ohos.bluetooth.common';
import hid from '@ohos.bluetooth.hid';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let hidDevice = hid.createHidDeviceProfile();
let closeUnsupport = false;
function sleep(delay) {
    return new Promise(resolve => setTimeout(resolve, delay));
}
function onReceiveEvent_boolean(data){
    console.info('[bluetooth_js]hid registerHidDevice result'+ JSON.stringify(data));
    expect(data).assertTrue();
}
async function tryToDisableBt() {
    let sta = bluetoothManager.getState();
    switch(sta){
        case 0:
            console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
            break;
        case 1:
            console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
            bluetoothManager.disableBluetooth();
            await clickTheWindow(CLOSE_BT_TEXT);
            await sleep(3000);
            break;
        case 2:
            console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
            bluetoothManager.disableBluetooth();
            await clickTheWindow(CLOSE_BT_TEXT);
            await sleep(3000);
            break;
        case 3:
            console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
            await sleep(3000);
            break;
        default:
            console.info('[bluetooth_js] enable success');
    }
}

async function tryToEnableBt() {
    let sta = bluetoothManager.getState();
    switch(sta){
      case 0:
        bluetoothManager.enableBluetooth();
        await clickTheWindow(OPEN_BT_TEXT);
        let sta1 = bluetoothManager.getState();
        console.info('[bluetooth_js] bt turn off and enableBt:'+ JSON.stringify(sta1));
        break;
      case 1:
        console.info('[bluetooth_js] bt turning on and sleep 3s:'+ JSON.stringify(sta));
        await sleep(3000);
        break;
      case 2:
        console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
        break;
      case 3:
        bluetoothManager.enableBluetooth();
        await clickTheWindow(OPEN_BT_TEXT);
        let sta2 = bluetoothManager.getState();
        console.info('[bluetooth_js] bt turning off and enableBt:'+ JSON.stringify(sta2));
        break;
      default:
        console.info('[bluetooth_js] state undefined');
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
    } finally{
        driver.release();
    }
}

let CLOSE_BT_TEXT = "关闭";
let OPEN_BT_TEXT = "开启";

async function clickTheWindow(text) {
     console.info('[bluetooth_js] clickTheWindow start');
     let driver = Driver.create();
     await driver.delayMs(3000);
     try {
          let button = await driver.findComponent(ON.text(text));
          await button.click();
          await driver.delayMs(3000);
          console.info('[bluetooth_js] click sucess');
     } catch (err) {
          console.info('[bluetooth_js] click failed. ' + JSON.stringify(err));
     }
}
export default function btHidoff003Test() {
    describe('btHidoff003Test', function() {
        beforeAll(async function (done) {
            console.info('beforeAll start');
            let PERMISSION_TEXT = "允许";
            await sleep(2000);
            await openPhone();
            await clickTheWindow(PERMISSION_TEXT);
            gattServer = ble.createGattServer();
            gattClient = ble.createGattClientDevice("11:22:33:44:55:66");

            console.info('beforeAll end');
            done();
        })
        beforeEach(async function(done) {
            console.info('beforeEach start');
            try {
                await tryToDisableBt();
            } catch (error) {
                console.error('[bluetooth_js]tryToDisableBt get error:'+JSON.stringify(error)+ 'error.code = :'+JSON.stringify(error.code));
                if (Number(error.code) == 801) {
                    closeUnsupport = true;
                }
            }
            console.info('beforeEach end');
            done();
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(async function (done) {
            console.info('afterAll start')
            gattServer.destroy();
            gattClient.destroy();
            try {
                await tryToEnableBt();
            } catch (error) {
                console.error('[bluetooth_js]tryToEnableBt get error:'+JSON.stringify(error)+ 'error.code = :'+JSON.stringify(error.code));
            }
            console.info('afterAll end')
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0100
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try {
                    let deviceId = {
                        "address": "11:22:33:44:55:66",
                        "addressType": common.BluetoothAddressType.REAL,
                    };
                    hidDevice.connect(deviceId);
                    console.info("[bluetooth_js]hid connect is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0200
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0200
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try {
                    hidDevice.disconnect();
                    console.info("[bluetooth_js]hid disconnect is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0300
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0300
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try {
                    let id = 1;
                    let reportData = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
                    hidDevice.sendReport(id,reportData);
                    console.info("[bluetooth_js]hid sendReport is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0400
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0400
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try {
                    let type1 = hid.ReportType.REPORT_TYPE_INPUT;
                    let id = 1;
                    let reportData = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
                    hidDevice.replyReport(type1,id,reportData);
                    console.info("[bluetooth_js]hid replyReport is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0500
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0500
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try {
                    let error = hid.ErrorReason.RSP_SUCCESS;
                    hidDevice.reportError(error);
                    console.info("[bluetooth_js]hid reportError is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0600
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0600
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try{
                    let descriptors = new Uint8Array([
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
                    let sdp = {
                        "name": "testName",
                        "description": "testDescription",
                        "provider": "testProvoder",
                        "subclass": hid.Subclass.SUBCLASS_KEYBOARD,
                        "descriptors": descriptors,
                    };
                    let inqos = {
                        "serviceType": hid.ServiceType.SERVICE_BEST_EFFORT,
                        "tokenRate": 0,
                        "tokenBucketSize": 0,
                        "peakBandwidth": 0,
                        "latency": -1,
                        "delayVariation": -1,
                    };
                    let outqos = {};
                    hidDevice.registerHidDevice(sdp, inqos, outqos, onReceiveEvent_boolean);
                    console.info("[bluetooth_js]hid registerHidDevice is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0700
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0700
         * @tc.desc   Test 2900003 - Bluetooth switch is off.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
         it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_OFF_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                await sleep(3000);
                try{
                    hidDevice.unregisterHidDevice();
                    console.info("[bluetooth_js]hid unregisterHidDevice 0100 is success ");
                    expect().assertFail();
                } catch (error) {
                    console.error('[bluetooth_js] switch error.code:'+JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
    })
}
