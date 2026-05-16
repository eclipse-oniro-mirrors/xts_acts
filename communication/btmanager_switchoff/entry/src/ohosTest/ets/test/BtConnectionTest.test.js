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
import connection from '@ohos.bluetooth.connection';
import bluetoothBle from '@ohos.bluetooth.ble';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let closeUnsupport = false;

function sleep(delay) {
    return new Promise(resolve => setTimeout(resolve, delay));
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

export default function btConnectionSwitchOffTest() {
    describe('btConnectionSwitchOffTest', function() {
        beforeAll(async function (done) {
            console.info('beforeAll start');
            let PERMISSION_TEXT = "允许";
            await sleep(2000);
            await clickTheWindow(PERMISSION_TEXT);
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
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
         * @tc.desc   Test setLocalName when bluetooth is disabled (error code 2900003)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    connection.setLocalName('TestName');
                    console.info('[bluetooth_js] setLocalName should fail when bluetooth is disabled');
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]setLocalName error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] setLocalName is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003 || errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled or not enabled');
                        expect(errorCode === 2900003 || errorCode === 2900099).assertTrue();
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
         * @tc.desc   Test getRemoteProfileUuids when bluetooth is disabled (error code 2900003)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getRemoteProfileUuids('44:55:66:77:88:99').then((value) => {
                        console.info('[bluetooth_js] getRemoteProfileUuids success, should not reach here');
                        expect(true).assertFalse();
                        done()
                    });
                } catch (error) {
                    console.error('[bluetooth_js]getRemoteProfileUuids error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] getRemoteProfileUuids is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode).assertEqual(2900003);
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done()
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
         * @tc.desc   Test pairDevice when bluetooth is disabled (error code 2900003)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                try {
                    await new Promise((resolve, reject) => {
                        connection.pairDevice("11:22:55:66:33:44", (error) => {
                            if (error) {
                                console.error('[bluetooth_js]pairDevice callback error.code:'+JSON.stringify(error.code)+
                                    'error.message:'+JSON.stringify(error.message));
                                reject(error);
                            } else {
                                console.info('[bluetooth_js] pairDevice success, should not reach here');
                                resolve();
                            }
                        });
                    });
                    expect(true).assertFalse();
                    done()
                } catch (error) {
                    console.error('[bluetooth_js]pairDevice error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 2900003) {
                        console.info('[bluetooth_js] Got expected error 2900003 (Bluetooth disabled)');
                        expect(errorCode).assertEqual(2900003);
                    } else if (errorCode === 801) {
                        console.info('[bluetooth_js] pairDevice is not supported');
                        expect(errorCode).assertEqual(801);
                    } else {
                        console.error('[bluetooth_js] Unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done()
                }
            } else {
                expect(true).assertTrue();
                done();
            }
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_STARTADVERTISING_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_STARTADVERTISING_0100
         * @tc.desc Test startAdvertising when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_STARTADVERTISING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
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
                    console.info('manufactureValueBuffer = '+ JSON.stringify(manufactureValueBuffer));
                    console.info('serviceValueBuffer = '+ JSON.stringify(serviceValueBuffer));

                    let setting = {
                        interval:150,
                        txPower:0,
                        connectable:true
                    };
                    let manufactureDataUnit = {
                        manufactureId:4567,
                        manufactureValue:manufactureValueBuffer.buffer
                    };
                    let serviceDataUnit = {
                        serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                        serviceValue:serviceValueBuffer.buffer
                    };
                    let advData = {
                        serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                        manufactureData:[manufactureDataUnit],
                        serviceData:[serviceDataUnit]
                    };
                    let advResponse = {
                        serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                        manufactureData:[manufactureDataUnit],
                        serviceData:[serviceDataUnit]
                    };
                    let advertisingParams = {
                        advertisingSettings: setting,
                        advertisingData: advData,
                        advertisingResponse: advResponse,
                        duration: 300
                    }
                    let advHandle = 0xFF;
                    bluetoothBle.startAdvertising(advertisingParams, (err, advId) => {
                        console.info('[bluetooth_js] startAdvertising should fail when bluetooth is disabled');
                        expect(err.code === 2900003 || err.code === 2900099).assertTrue();
                        done();
                    });
                } catch (error) {
                    console.error('[bluetooth_js]startAdvertising error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] startAdvertising is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003 || errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode === 2900003 || errorCode === 2900099).assertTrue();
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })


        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_NOTIFYCHARACTERISTIC_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_NOTIFYCHARACTERISTIC_0100
         * @tc.desc Test notifyCharacteristicChanged when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_NOTIFYCHARACTERISTIC_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    let gattServer = bluetoothBle.createGattServer();
                    let buf = new ArrayBuffer(1);
                    let val = new Uint8Array(buf);
                    val[0] = 1;
                    let notifyCharacteristic = {
                        serviceUuid: '0000180A-0000-1000-8000-00805f9b34fb',
                        characteristicUuid: '0000180A-0000-1000-8000-00805f9b34fb',
                        characteristicValue: buf,
                        confirm: false
                    };
                    gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic, (err) => {
                        console.info('[bluetooth_js] notifyCharacteristicChanged should fail when bluetooth is disabled'+`${err.code}`);
                        expect(err.code === 2900003 || err.code === 2900099).assertTrue();
                        done();
                    });
                } catch (error) {
                    console.error('[bluetooth_js]notifyCharacteristicChanged error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] notifyCharacteristicChanged is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003 || errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode === 2900003 || errorCode === 2900099).assertTrue();
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIREDEVICES_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIREDEVICES_0100
         * @tc.desc Test getPairedDevices when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIREDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    let pairedDevices = connection.getPairedDevices();
                    console.info('[bluetooth_js] getPairedDevices should fail when bluetooth is disabled');
                    expect(true).assertFalse();
                } catch (error) {
                    console.error('[bluetooth_js]getPairedDevices error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] getPairedDevices is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003 || errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode === 2900003 || errorCode === 2900099).assertTrue();
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_PINCODE_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PINCODE_0100
         * @tc.desc Test setDevicePinCode when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PINCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await new Promise((resolve, reject) => {
                        connection.setDevicePinCode('11:22:33:AA:BB:FF', '1234', (error) => {
                            if (error) {
                                console.error('[bluetooth_js]setDevicePinCode callback error.code:'+JSON.stringify(error.code)+
                                    'error.message:'+JSON.stringify(error.message));
                                reject(error);
                            } else {
                                console.info('[bluetooth_js] setDevicePinCode success, should not reach here');
                                resolve();
                            }
                        });
                    });
                    expect(true).assertFalse();
                } catch (error) {
                    console.error('[bluetooth_js]setDevicePinCode error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] setDevicePinCode is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003) {
                        console.info('[bluetooth_js] Got expected error 2900003 (Bluetooth disabled)');
                        expect(errorCode).assertEqual(2900003);
                    } else if (errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode).assertEqual(2900099);
                    } else {
                        console.error('[bluetooth_js] Unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILEUUIDS_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILEUUIDS_0100
         * @tc.desc Test getRemoteProfileUuids when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILEUUIDS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getRemoteProfileUuids('11:22:33:AA:BB:FF').then((value) => {
                        console.info('[bluetooth_js] getRemoteProfileUuids success, should not reach here');
                        expect(true).assertFalse();
                    });
                } catch (error) {
                    console.error('[bluetooth_js]getRemoteProfileUuids error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] getRemoteProfileUuids is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode).assertEqual(2900003);
                    } else if (errorCode === 2900099) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode).assertEqual(2900099);
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_BATTERYINFO_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_BATTERYINFO_0100
         * @tc.desc Test getRemoteDeviceBatteryInfo when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL3
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_BATTERYINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.getRemoteDeviceBatteryInfo('11:22:33:AA:BB:FF').then((value) => {
                        console.info('[bluetooth_js] getRemoteDeviceBatteryInfo success, should not reach here');
                        expect(true).assertFalse();
                    });
                } catch (error) {
                    console.error('[bluetooth_js]getRemoteDeviceBatteryInfo error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 801) {
                        console.info('[bluetooth_js] getRemoteDeviceBatteryInfo is not support');
                        expect(errorCode).assertEqual(801);
                    } else if (errorCode === 2900003) {
                        console.info('[bluetooth_js] bluetooth is disabled');
                        expect(errorCode).assertEqual(2900003);
                    } else {
                        console.error('[bluetooth_js] unexpected error code: ' + error.code);
                        expect(errorCode).assertEqual(2900099);
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })


        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0100
         * @tc.desc Test connectAllowedProfiles callback when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await new Promise((resolve, reject) => {
                        connection.connectAllowedProfiles('11:22:33:AA:BB:FF', (error) => {
                            if (error) {
                                console.error('[bluetooth_js]connectAllowedProfiles callback error.code:'+JSON.stringify(error.code)+
                                    'error.message:'+JSON.stringify(error.message));
                                reject(error);
                            } else {
                                console.info('[bluetooth_js] connectAllowedProfiles success, should not reach here');
                                resolve();
                            }
                        });
                    });
                    expect(true).assertFalse();
                    done();
                } catch (error) {
                    console.error('[bluetooth_js]connectAllowedProfiles error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 2900003) {
                        console.info('[bluetooth_js] Got expected error 2900003 (Bluetooth disabled)');
                        expect(errorCode).assertEqual(2900003);
                    } else if (errorCode === 801) {
                        console.info('[bluetooth_js] connectAllowedProfiles is not supported');
                        expect(errorCode).assertEqual(801);
                    } else {
                        console.error('[bluetooth_js] Unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                expect(true).assertTrue();
                done();
            }
        })

        /**
         * @tc.name SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0200
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0200
         * @tc.desc Test connectAllowedProfiles promise when bluetooth is disabled (error code 2900003)
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTALLOWEDPROFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            if (!closeUnsupport) {
                try {
                    await connection.connectAllowedProfiles('11:22:33:AA:BB:FF').then((value) => {
                        console.info('[bluetooth_js] connectAllowedProfiles success, should not reach here');
                        expect(true).assertFalse();
                    });
                } catch (error) {
                    console.error('[bluetooth_js]connectAllowedProfiles error.code:'+JSON.stringify(error.code)+
                        'error.message:'+JSON.stringify(error.message));
                    let errorCode = Number(error.code);
                    if (errorCode === 2900003) {
                        console.info('[bluetooth_js] Got expected error 2900003 (Bluetooth disabled)');
                        expect(errorCode).assertEqual(2900003);
                    } else if (errorCode === 801) {
                        console.info('[bluetooth_js] connectAllowedProfiles is not supported');
                        expect(errorCode).assertEqual(801);
                    } else {
                        console.error('[bluetooth_js] Unexpected error code: ' + error.code);
                        expect().assertFail();
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
        /**
         * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_0100
         * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_0100
         * @tc.desc   Test pairDevice when bluetooth is disabled (error code 2900003)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            if (!closeUnsupport) {
                let hashValue = "c10b57deb2e1aafd255596e0d4fd6789";
                try {
                    connection.getVirtualAddressByHash(connection.HashAlgorithmType.HASH_ALGORITHM_SHA256, hashValue)
                    expect().assertFail();
                } catch (err) {
                    console.error(`getVirtualAddressByHash errCode: ${err.code}, errMessage: ${err.message}`);
                    if (err.code === 801) {
                        console.info('[bluetooth_js] RK板 is not support');
                        expect(err.code === 801).assertTrue();
                    } else {
                        console.info('[bluetooth_js] getVirtualAddressByHash fail 201');
                        expect(Number(err.code)).assertEqual(2900003);
                    }
                }
            } else {
                expect(true).assertTrue();
            }
            done();
        })
    })
}
