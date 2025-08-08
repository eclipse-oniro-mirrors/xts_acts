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
import a2dp from '@ohos.bluetooth.a2dp';
import access from '@ohos.bluetooth.access';
import ble from '@ohos.bluetooth.ble';
import socket from '@ohos.bluetooth.socket';
import connection from '@ohos.bluetooth.connection';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let gattServer = null;
let gattClient = null;
let BleScanner = null;
let closeUnsupport = false;
function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay));
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
        btAccess.enableBluetooth();
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
export default function btManagerError003Test() {
    describe('btManagerError003Test', function() {
        beforeAll(async function (done) {
            console.info('beforeAll start');
            let PERMISSION_TEXT = "允许";
            await sleep(2000);
            await openPhone();
            await clickTheWindow(PERMISSION_TEXT);
            gattServer = ble.createGattServer();
            gattClient = ble.createGattClientDevice("11:22:33:44:55:66");
            BleScanner = ble.createBleScanner();
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
            try {
                await tryToEnableBt();
            } catch (error) {
                console.error('[bluetooth_js]tryToEnableBt get error:'+JSON.stringify(error)+ 'error.code = :'+JSON.stringify(error.code));
            }
            console.info('afterAll end')
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0100
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0100
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0200
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0200
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.pairDevice("11:22:55:66:33:44");
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]pairDevice error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0300
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0300
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let ret = bluetoothManager.getRemoteDeviceName("00:00:00:00:00:00");
                    console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
                    expect(ret.length).assertEqual(0);
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getRemoteDeviceName error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0400
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0400
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0500
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0500
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let ret = bluetoothManager.getPairedDevices();
                    console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getPairedDevices error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0600
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0600
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpSrcConn = bluetoothManager.getProfileConnectionState(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
                    console.info('[bluetooth_js]get a2dp result:' + JSON.stringify(a2dpSrcConn));
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getProfileConnState error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0700
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0700
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.setDevicePairingConfirmation("11:22:55:66:33:44",false);
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]setDevicePairingConfirmation error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0800
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0800
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let newName = 'my bluetooth';
                    bluetoothManager.setLocalName(newName);
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]setLocalName error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0900
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0900
         * @tc.desc TEST 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.setBluetoothScanMode(bluetoothManager.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]setBluetoothScanMode error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1000
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1000
         * @tc.desc TEST 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let oldScanMode = bluetoothManager.getBluetoothScanMode();
                    console.info('[bluetooth_js] getBluetoothScanMode = '+ JSON.stringify(oldScanMode));
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getBluetoothScanMode error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1100
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1100
         * @tc.desc TEST 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.startBluetoothDiscovery();
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]startBluetoothDiscovery error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1200
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1200
         * @tc.desc TEST 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.stopBluetoothDiscovery();
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]stopBluetoothDiscovery error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1600
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1600
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let hfpSrc = bluetoothManager.getProfileInstance(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
                    let retArray = hfpSrc.getConnectionDevices();
                    console.info('[bluetooth_js]hfp getConnectionDevices:' + JSON.stringify(retArray));
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getConnectionDevices error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1700
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1700
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let hfpSrc = bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
                    let ret = hfpSrc.getDeviceState('11:22:33:44:55:66');
                    console.info('[bluetooth_js]hfp getDeviceState:' + JSON.stringify(ret));
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]getDeviceState error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1800
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1800
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpSrc = bluetoothManager.getProfile(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
                    a2dpSrc.connect('11:22:33:44:55:77');
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]A2DPconnect error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

    
        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1900
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1900
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpSrc = bluetoothManager.getProfile(bluetoothManager.ProfileId.PROFILE_A2DP_SOURCE);
                    a2dpSrc.disconnect('11:22:33:44:55:77');
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]A2DPdisconnect error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2000
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2000
         * @tc.desc Test  2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2100
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2100
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let hfpSrc = 
                        bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
                    hfpSrc.connect('11:22:33:44:55:77');
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]HFPconnect error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
    
        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2200
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2200
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let hfpSrc = 
                    bluetoothManager.getProfileInst(bluetoothManager.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
                    hfpSrc.disconnect('11:22:33:44:55:77');
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]HFPdisconnect error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2800
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2800
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2900
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2900
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    bluetoothManager.BLE.stopBLEScan();
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]startBLEScan error.code:'
                    +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3000
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3000
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            if (!closeUnsupport) {
                try {
                    ble.startAdvertising(setting,advData,advResponse);
                    expect(true).assertFalse();
                }catch(error) {
                    console.error('[bluetooth_js]startAdvertising error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            await sleep(2000);
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3100
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3100
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            if (!closeUnsupport) {
                try {
                    ble.stopAdvertising();
                    expect(true).assertFalse();
                }catch(error) {
                    console.error('[bluetooth_js]stopAdvertising error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3200
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SwitchOff_3200
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SwitchOff_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }      
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3300
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3300
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
                    expect(true).assertFalse();
                    done();
                } catch (error) {
                    console.error(`[bluetooth_js]removeService failed, code is ${error.code},
                        message is ${error.message}`);
                    expect(Number(error.code)).assertEqual(401);
                    done()
                }    
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3400
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3400
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    gattServer.close();
                    expect(true).assertFalse();
                    done();
                } catch (error) {
                    console.error(`[bluetooth_js]close failed, code is ${error.code},
                        message is ${error.message}`);
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }     
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3600
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3600
         * @tc.desc Test 2900003 - Bluetooth switch is off.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
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
                    expect(Number(error.code)).assertEqual(2900003);
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700 
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    gattClient.connect();
                    await sleep(2000);
                    expect(true).assertFalse();
                } catch(error) {
                    console.error(`[bluetooth_js]connect failed, code is ${error.code}, 
                    message is ${error.message}`);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done()
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    gattClient.disconnect();
                    expect(true).assertFalse();
                } catch(error) {
                    console.error(`[bluetooth_js]disconnect failed, code is ${error.code}, 
                    message is ${error.message}`);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done()
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3900
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3900
         * @tc.desc Test 2900003 - Bluetooth switch is off
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    gattClient.close();
                    expect(true).assertFalse();
                } catch(error) {
                    console.error(`[bluetooth_js]gattClient close failed, code is ${error.code}, 
                    message is ${error.message}`);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done()
        })

        /**
        * @tc.number SUB_COMMUNICATION_BTMANAGER_BLESCAN_0800
        * @tc.name SUB_COMMUNICATION_BTMANAGER_BLESCAN_0800
        * @tc.desc Test ClassicStartBLEScan api.
        * @tc.type Function
        * @tc.size MediumTest
        * @tc.level Level 3
        */
        it('SUB_COMMUNICATION_BTMANAGER_BLESCAN_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result8'+JSON.stringify(data));
                expect(data.length = 0).assertTrue();
            }
            try {
                let state = bluetoothManager.getState();
                console.info('[bluetooth_js] bt turn off1:'+ JSON.stringify(state));
                if(state == bluetoothManager.BluetoothState.STATE_ON) {
                    let result2= bluetoothManager.disableBluetooth();
                    await clickTheWindow(CLOSE_BT_TEXT);
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
                console.info('[bluetooth_js] BLE scan off8');
                bluetoothManager.BLE.stopBLEScan();
                done();
            } catch (error) {
                console.error('[bluetooth_js]Scan_0800 error.code:'+JSON.stringify(error.code)+
                'error.message:'+JSON.stringify(error.message));
                expect(Number(error.code)).assertEqual(2900003);
            }
            console.info('[bluetooth_js] BLE BLEDeviceFind off start!');
            bluetoothManager.BLE.off('BLEDeviceFind', onReceiveEvent);
            } else {
                expect(true).assertTrue();
            }
            await sleep(2000);
            done();
        })

        /**
             * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_4000
             * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_4000
             * @tc.desc Test ClassicStartBLEScan api.
             * @tc.type Function
             * @tc.size MediumTest
             * @tc.level Level 3
             */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                bluetooth.disableBluetooth();
            await clickTheWindow(CLOSE_BT_TEXT);
            await sleep(3000);
            let state = bluetooth.getState();
            console.info('[bluetooth_js] bt turn off1:'+ JSON.stringify(state));
            function onReceiveEvent(data)
            {
                console.info('[bluetooth_js] BLEscan device result8'+JSON.stringify(data));
                expect(data.length == 0).assertTrue();
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
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCH_0400
         * @tc.name SUB_COMMUNICATION_BTMANAGER_SWITCH_0400
         * @tc.desc Test EnableBluetooth api by promise.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 3
         */
        it('SUB_COMMUNICATION_BTMANAGER_SWITCH_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                let state = bluetooth.getState();
            console.info('[bluetooth_js] getState1 off = '+ JSON.stringify(state));
            if(state == bluetooth.BluetoothState.STATE_OFF) {
                let result2= bluetooth.disableBluetooth();
                await clickTheWindow(CLOSE_BT_TEXT);
                console.info('[bluetooth_js]disable result1'+ JSON.stringify(result2));
                expect(result2).assertFalse();
                let state1 = bluetooth.getState();
                console.info('[bluetooth_js] getState4 off = '+ JSON.stringify(state1));
                expect(state1).assertEqual(bluetooth.BluetoothState.STATE_OFF);
            }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_A2DP_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_A2DP_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_A2DP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpProfile = a2dp.createA2dpSrcProfile();
                    let state = a2dpProfile.getPlayingState('11:22:33:44:55:66');
                    expect().assertFail();
                } catch (err) {
                    console.info("bluetooth a2dp getPlayingState errCode:" + err.code + ",bluetooth a2dp getPlayingState errMessage:" + err.message);
                    expect(Number(err.code)).assertEqual(2900003);   
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await access.addPersistentDeviceId('00:00:00:00:00:00').then(() => {
                        console.info('[bluetooth_js] addPersistentDeviceId success');
                    });
                    expect().assertFail();
                } catch (error) {
                    console.info("addPersistentDeviceId errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await access.deletePersistentDeviceId('00:00:00:00:00:00').then(() => {
                        console.info('[bluetooth_js] deletePersistentDeviceId success');
                    });
                    expect().assertFail();
                } catch (error) {
                    console.info("deletePersistentDeviceId errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let macs = access.getPersistentDeviceIds();
                    console.info("[bluetooth_js]getPersistentDeviceIds result:" + JSON.stringify(macs));
                    expect().assertFail();
                } catch (error) {
                    console.info("getPersistentDeviceIds errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0400
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0400
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_ACCESS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let isValidRandom = access.isValidRandomDeviceId("00:00:00:00:00:00");
                    console.info("[bluetooth_js]isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
                    expect().assertFail();
                } catch (error) {
                    console.info("isValidRandomDeviceId errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpProfile = a2dp.createA2dpSrcProfile();
                    let devices = a2dpProfile.getConnectedDevices();
                    console.info("address of connected devices list:" + devices);
                    expect().assertFail();
                } catch (error) {
                    console.info("getConnectedDevices errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BASEPROFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let a2dpProfile = a2dp.createA2dpSrcProfile();
                    let state = a2dpProfile.getConnectionState("11:22:33:AA:BB:FF");
                    console.info("the connection state:" + state);
                    expect().assertFail();
                } catch (error) {
                    console.info("getConnectionState errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let serverNumber = -1;
                    let serverSocket = (code, number) => {
                    if (code) {
                        console.error('sppListen error, code is ' + code);
                        return;
                    } else {
                        serverNumber = number;
                        console.info('sppListen success, serverNumber = ' + serverNumber);
                    }
                    }
                    let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: 0};
                    socket.sppListen('server1', sppOption, serverSocket);
                } catch (error) {
                    console.info("sppListen errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            function acceptClientSocket(code, number) {
                console.log('bluetooth error code: ' + code.code);
                let clientNumber = -1;
                if (code.code == 0) {
                    console.log('bluetooth clientSocket Number: ' + number);
                    clientNumber = number;
                    expect(true).assertEqual(clientNumber != -1);
                }
            }
            let serverNumber = -1;
            if (!closeUnsupport) {
                try {
                    socket.sppAccept(serverNumber, acceptClientSocket);
                } catch (error) {
                    console.info("sppAccept errCode:" + error.code + ",errMessage:" + error.message);
                    expect(true).assertEqual(Number(error.code) == 2900003 || Number(error.code) == 401);
                } 
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let clientSocket = (code, number) => {
                        if (code) {
                          console.error('sppListen error, code is ' + code);
                          return;
                        } else {
                          console.info('bluetooth serverSocket Number: ' + number);
                        }
                      }
                    let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: 0};
                    socket.sppConnect('00:11:22:33:44:55', sppOption, clientSocket);
                } catch (error) {
                    console.info("sppConnect errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let connectionState = connection.getProfileConnectionState();
                    console.info("getProfileConnectionState result:" + connectionState);
                    expect().assertFail();
                } catch (error) {
                    console.info("getProfileConnectionState errCode:" + error.code + ",errMessage:" + error.message);
                    expect(Number(error.code)).assertEqual(2900003);
                }
            } else {
                expect(true).assertTrue();
            }
            done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionPairDevice() {
                        return new Promise((resolve,reject) => {
                            connection.pairDevice('11:22:33:44:55:66', (error) => {
                               if (error) {
                                   console.info('pairDevice failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionPairDevice().then(() => {
                    console.info("[bluetooth_js]functionPairDevice success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]functionPairDevice failed" + e);
                        expect(e).assertEqual(2900003);
                        done();
                    })
                  } catch (e) {
                    console.error(`pairDevice callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.pairDevice('11:22:33:44:55:66').then(() => {
                      console.info('[bluetooth_js] pairDevice success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `pairDevice promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0400
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0400
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let ret = connection.getRemoteDeviceName("00:00:00:00:00:00");
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getRemoteDeviceName error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0500
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0500
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let ret = connection.getRemoteDeviceName("00:00:00:00:00:00", true);
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `testGetRemoteDeviceName use alias error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0600
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0600
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
                    except().assertFail();
                  } catch (e) {
                    console.error( `getRemoteDeviceClass error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0700
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0700
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let ret = connection.getPairedDevices();
                    except().assertFail();
                  } catch (e) {
                    console.error( `getPairedDevices error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0800
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0800
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let state = connection.getPairState("00:11:22:33:44:55");
                  } catch (e) {
                    console.error( `getPairState error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0900
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0900
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    connection.setDevicePairingConfirmation("00:11:22:33:44:55", true);
                    except().assertFail();
                  } catch (e) {
                    console.error( `setDevicePairingConfirmation error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1000
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1000
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionSetDevicePinCode() {
                        return new Promise((resolve,reject) => {
                            connection.setDevicePinCode('11:22:33:44:55:66', '12345', (error) => {
                               if (error) {
                                   console.info('setDevicePinCode failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionSetDevicePinCode().then(() => {
                    console.info("[bluetooth_js]setDevicePinCode success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]setDevicePinCode failed" + e);
                        expect(true).assertEqual(Number(e) == 2900003 || Number(e) == 2900099);
                        done();
                    })
                  } catch (e) {
                    console.error(`setDevicePinCode callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                      console.info('[bluetooth_js] setDevicePinCode success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `setDevicePinCode promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 2900099);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    connection.setBluetoothScanMode(-1, 0);
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `setBluetoothScanMode error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let scanMode = connection.getBluetoothScanMode();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getBluetoothScanMode error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1400
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1400
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    connection.startBluetoothDiscovery();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `startBluetoothDiscovery error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1500
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1500
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    connection.stopBluetoothDiscovery();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `stopBluetoothDiscovery error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })
        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1600
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1600
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let result = connection.isBluetoothDiscovering();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `isBluetoothDiscovering error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1700
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1700
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionGetRemoteProfileUuids() {
                        return new Promise((resolve,reject) => {
                            connection.getRemoteProfileUuids('11:22:33:44:55:66', (error) => {
                               if (error) {
                                   console.info('getRemoteProfileUuids failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionGetRemoteProfileUuids().then(() => {
                    console.info("[bluetooth_js]getRemoteProfileUuids success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]getRemoteProfileUuids failed" + e);
                        expect(e).assertEqual(2900003);
                        done();
                    })
                  } catch (e) {
                    console.error(`getRemoteProfileUuids callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1800
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1800
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getRemoteProfileUuids('11:22:33:44:55:66').then(() => {
                      console.info('[bluetooth_js] getRemoteProfileUuids success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getRemoteProfileUuids promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1900
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1900
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionConnectAllowedProfiles() {
                        return new Promise((resolve,reject) => {
                            connection.connectAllowedProfiles('11:22:33:44:55:66', (error) => {
                               if (error) {
                                   console.info('connectAllowedProfiles failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionConnectAllowedProfiles().then(() => {
                    console.info("[bluetooth_js]connectAllowedProfiles success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]connectAllowedProfiles failed" + e);
                        expect(e).assertEqual(2900003);
                        done();
                    })
                  } catch (e) {
                    console.error(`connectAllowedProfiles callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2000
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2000
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
                      console.info('[bluetooth_js] connectAllowedProfiles success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `connectAllowedProfiles promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then(() => {
                      console.info('[bluetooth_js] getRemoteDeviceBatteryInfo success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getRemoteDeviceBatteryInfo error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 2900099);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.setRemoteDeviceName('11:22:33:44:55:66', 'RemoteDeviceName').then(() => {
                      console.info('[bluetooth_js] setRemoteDeviceName success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `setRemoteDeviceName error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_CONNECTION_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getLastConnectionTime('54:71:DD:5F:75:06').then((time) => {
                      console.info('[bluetooth_js] getLastConnectionTime success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getLastConnectionTime error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    let result = ble.getConnectedBLEDevices();
                  } catch (e) {
                    console.error( `getConnectedBLEDevices error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    ble.startBLEScan([{}]);
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `startBLEScan error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    ble.stopBLEScan();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `stopBLEScan error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0400
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0400
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            let setting = {
              interval:32,
              txPower:1,
              connectable:true,
            }
            let manufactureDataUnit1 = {
              manufactureId:4567,
              manufactureValue:manufactureValueBuffer.buffer
            };
            let advData = {
              serviceUuids : ["00001888-0000-1000-8000-00805f9b34fb"],
              manufactureData : [manufactureDataUnit1],
              serviceData:[{
                serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                serviceValue:serviceValueBuffer.buffer
              }],
              includeDeviceName:false
            }
            let manufactureDataUnit2 = {
              manufactureId:1789,
              manufactureValue:manufactureValueBuffer.buffer
            }
            let serviceDataUnit = {
              serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
              serviceValue:serviceValueBuffer.buffer
            }
            let advResponse = {
              serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
              manufactureData : [manufactureDataUnit2],
              serviceData : [serviceDataUnit],
            }
            if (!closeUnsupport) {
                try {
                    ble.startAdvertising(setting, advData, advResponse);
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `startAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0500
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0500
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    ble.stopAdvertising();
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `stopAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0600
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0600
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await ble.disableAdvertising(0).then((data) => {
                        console.info('[bluetooth_js] disableAdvertising promise success:' + JSON.stringify(data));
                      });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `disableAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 401);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0700
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0700
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionDisableAdvertising() {
                        return new Promise((resolve,reject) => {
                            ble.disableAdvertising(0, (error) => {
                               if (error) {
                                   console.info('disableAdvertising failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionDisableAdvertising().then(() => {
                    console.info("[bluetooth_js]disableAdvertising success");
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `disableAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 401);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0800
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0800
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    function functionStopAdvertising() {
                        return new Promise((resolve,reject) => {
                            ble.stopAdvertising(0, (error) => {
                               if (error) {
                                   console.info('stopAdvertising failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionStopAdvertising().then(() => {
                    console.info("[bluetooth_js]stopAdvertising success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]stopAdvertising failed" + e);
                        expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 401);
                    })
                  } catch (e) {
                    console.error(`stopAdvertising callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0900
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0900
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await ble.stopAdvertising(0).then(() => {
                      console.info('[bluetooth_js] stopAdvertising success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `stopAdvertising promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 401);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1000
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1000
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: characteristic.characteristicValue, confirm: false};
            if (!closeUnsupport) {
                try {
                    function functionNotifyCharacteristicChanged() {
                        return new Promise((resolve,reject) => {
                            gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic, (error) => {
                               if (error) {
                                   console.info('notifyCharacteristicChanged failed' + error);
                                   reject(error.code);
                               }
                               resolve();
                           });
                       });
                   }
                   await functionNotifyCharacteristicChanged().then(() => {
                    console.info("[bluetooth_js]notifyCharacteristicChanged success");
                    expect(true).assertFalse();
                    done();
                    })
                    .catch(e => {
                        console.info("[bluetooth_js]notifyCharacteristicChanged failed" + e);
                        expect(true).assertEqual(Number(e) == 2900003 || Number(e) == 2900099);
                        done();
                    })
                  } catch (e) {
                    console.error(`notifyCharacteristicChanged callback error, error code is: ${e.code}, error message is: ${e.message}`);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1100
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: characteristic.characteristicValue, confirm: false};
            if (!closeUnsupport) {
                try {
                    await gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic).then(() => {
                      console.info('[bluetooth_js] notifyCharacteristicChanged success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `notifyCharacteristicChanged promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(true).assertEqual(Number(e.code) == 2900003 || Number(e.code) == 2900099);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1200
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1200
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let arrayBuffer = new ArrayBuffer(8);
            let scanFilter = {
                deviceId: "00:11:22:33:44:55",
                name: "testStartScan",
                serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
                serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                serviceData: arrayBuffer,
                serviceDataMask: arrayBuffer,
                manufactureId: 4567,
                manufactureData: arrayBuffer,
                manufactureDataMask: arrayBuffer
            };
            if (!closeUnsupport) {
                try {
                    await BleScanner.startScan([scanFilter]).then(() => {
                        console.info('[bluetooth_js] bleScanner startScan success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `bleScanner startScan promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1300
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1300
         * @tc.desc test disable bt use api
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await BleScanner.stopScan().then(() => {
                        console.info('[bluetooth_js] bleScanner stopScan success');
                    });
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `bleScanner stopScan promise error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_0100
         * @tc.desc Test getRemoteDeviceTransport
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            if (!closeUnsupport) {
                try {
                    let transport = connection.getRemoteDeviceTransport("00:11:22:33:44:55");
                    console.info('[bluetooth_js] getRemoteDeviceTransport result:' + transport);
                    expect(true).assertFalse();
                  } catch (e) {
                    console.error( `getRemoteDeviceTransport get error, error code is: ${e.code}, error message is: ${e.message}`);
                    expect(Number(e.code)).assertEqual(2900003);
                  }
            } else {
                expect(true).assertTrue();
            }
              done();
            })
})
}