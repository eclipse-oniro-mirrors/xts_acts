/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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

import { BusinessError } from '@ohos.base';
import bluetooth from '@ohos.bluetooth.connection';
import ble from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import btCommon from '@ohos.bluetooth.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

    function PinRequiredParam(data : bluetooth.PinRequiredParam) {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(data));
            console.info("[bluetooth_js] setDevicePairingConfirmation data.deviceId:" + data.deviceId);
            console.info("[bluetooth_js] setDevicePairingConfirmation data.pinCode:" + data.pinCode);
        }
    function onReceiveEvent2(data : Array<string>) {
            console.info('[bluetooth_js] Device' + JSON.stringify(data) +
            'length' + data.length);
            expect(data.length > 0).assertTrue();
        }
    function BondStateParam(data : bluetooth.BondStateParam) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state + 'bondStateChange cause:' + data.cause);
        }
    function BondStateParam1(data : bluetooth.BondStateParam) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
    function onReceiveEvent1(data : bluetooth.PinRequiredParam) {
            console.info('pin required = '+ JSON.stringify(data));
        }
    function sleep(delay : number) : Promise<void> {
            return new Promise(resolve => setTimeout(resolve, delay));
        }
    function onReceiveEvent_ScanMode(data : bluetooth.ScanMode){
        console.info('[bluetooth_js]hid registerHidDevice result'+ JSON.stringify(data));
        expect(data).not().assertUndefined();
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

    let PERMISSION_TEXT:string = "允许";
    let OPEN_BT_TEXT:string = "开启";

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

export default function btConnectionTest() {
describe('btConnectionTest', () => {
    interface btname {
        NUM_TEST : string;
        NUM_TEST1 :string;
        LETTERS_TEST : string;
        CHINESES_TEST :string;
        CHINESES_TEST2 : string;
        SYMBOL_TEST: string;
        MIXES : string;
        MIXES2:string;
        MIXES3:string;
        MIXES4:string;
        MIXES5:string;
        MIXES6:string;
        MIXES7:string
    }
    const Btname : btname = {
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
    };

    beforeAll(async (done : Function) => {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        done();
    })
    beforeEach(async (done : Function) => {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(() => {
        console.info('afterEach called')
    })
    afterAll(() => {
        console.info('afterAll called')
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
     * @tc.desc   Test pinRequired off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on('pinRequired', onReceiveEvent1);
        } catch (error) {
            console.info(`[bluetooth_js]pinRequired error, code is ${error.code}, 
            message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]pinRequired is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }

        try {
            bluetooth.off('pinRequired', onReceiveEvent1);
        } catch (error) {
            console.info(`[bluetooth_js]pinRequired error, code is ${error.code}, 
            message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]pinRequired is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
     * @tc.desc   Test getPairedDevices api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let ret = bluetooth.getPairedDevices();
            console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
            expect(ret.length == 0).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getPairedDevices is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300
      * @tc.desc   Test get RemoteDeviceName api 10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
         try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getRemoteDeviceName is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1900
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1900
      * @tc.desc   Test get RemoteDeviceName api 16
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
         try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00", true);
            console.info('[bluetooth_js] getRemoteDeviceName alias:' + JSON.stringify(ret));
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getRemoteDeviceName is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2000
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2000
      * @tc.desc   Test get RemoteDeviceName api 16
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
         try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00", false);
            console.info('[bluetooth_js] getRemoteDeviceName alias:' + JSON.stringify(ret));
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getRemoteDeviceName is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2100
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2100
      * @tc.desc   Test get RemoteDeviceName api 16
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
         try {
            let ret = bluetooth.getRemoteDeviceName(null);
            console.info('[bluetooth_js] getRemoteDeviceName alias:' + JSON.stringify(ret));
            expect().assertFail();
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400
     * @tc.desc   Test pairDevice callback api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on('bondStateChange', BondStateParam);
            await bluetooth.pairDevice("11:22:55:66:33:44").then(() => {
                console.info('pairDevice success');
            });
            await sleep(900);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]pairDevice is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        bluetooth.off('bondStateChange', BondStateParam);
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500
     * @tc.desc   Test setDevicePairingConfirmation api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.on('pinRequired', PinRequiredParam);
            bluetooth.setDevicePairingConfirmation("00:11:22:33:44:55", false);
            await sleep(2000);
            bluetooth.off('pinRequired', PinRequiredParam);
        } catch (err) {
            console.info("setDevicePairingConfirmation errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setDevicePairingConfirmation is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2400
     * @tc.desc   Test setDevicePairingConfirmation api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.setDevicePairingConfirmation(null, true);
            expect().assertFail();
        } catch (err) {
            console.info("setDevicePairingConfirmation errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2500
     * @tc.desc   Test setDevicePairingConfirmation api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.setDevicePairingConfirmation("00:11:22:33:44:55", null);
            expect().assertFail();
        } catch (err) {
            console.info("setDevicePairingConfirmation errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600
      * @tc.desc   Test get RemoteDeviceClass api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let DeviceClass = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
            console.info('[bluetooth_js]getRemoteDeviceClass majorClass:' + DeviceClass.majorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass majorMinorClass:' + DeviceClass.majorMinorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass classOfDevice:' + DeviceClass.classOfDevice);
        } catch (err) {
            console.info("getRemoteDeviceClass errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getRemoteDeviceClass is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2200
      * @tc.desc   Test get RemoteDeviceClass api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let DeviceClass = bluetooth.getRemoteDeviceClass(null);
            expect().assertFail();
        } catch (err) {
            console.info("getRemoteDeviceClass errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700
      * @tc.desc   Test setDevicePinCode api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345', (err, data) => {
                console.info('setDevicePinCode callback,device name err:' + JSON.stringify(err) + ',device name:' + JSON.stringify(data));
            });
        } catch (err) {
            console.info("setDevicePinCode callback errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setDevicePinCode is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2700
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2700
      * @tc.desc   Test setDevicePinCode api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setDevicePinCode(null, '12345', (err, data) => {
                console.info('setDevicePinCode callback,device name err:' + JSON.stringify(err) + ',device name:' + JSON.stringify(data));
            });
            expect().assertFail();
        } catch (err) {
            console.info("setDevicePinCode callback errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800
     * @tc.desc   Test setDevicePinCode api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                console.info('setDevicePinCode promise');
            }, (error :BusinessError) => {
                console.info('setDevicePinCode promise: errCode:' + error.code + ',errMessage' + error.message);
            })
        } catch (err) {
            console.info("setDevicePinCode promise errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setDevicePinCode is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2600
     * @tc.desc   Test setDevicePinCode api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', null).then(() => {
                console.info('setDevicePinCode success');
                expect().assertFail();
            }, (error :BusinessError) => {
                console.info('setDevicePinCode promise: errCode:' + error.code + ',errMessage' + error.message);
                expect(Number(error.code)).assertEqual(401);
            })
        } catch (err) {
            console.info("setDevicePinCode promise errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900
      * @tc.desc   Test pairDevice promise api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.on('bondStateChange', BondStateParam1);
            bluetooth.pairDevice("11:22:55:66:33:44").then((data) => {
                console.info('pairDevice info success');
            }, (err : BusinessError) => {
                console.info('pairDevice:errCode' + err.code + ', errMessage: ' + err.message);
            });
            bluetooth.off('bondStateChange', BondStateParam1);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]pairDevice is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        bluetooth.off('bondStateChange', BondStateParam1);
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100
      * @tc.desc   TEST scanmode api10 by promise.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 oldScanMode = '+ JSON.stringify(oldScanMode));
           bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_NONE,0);
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_NONE);
           bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state002'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
           bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
           bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0300
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state003'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0300 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,40000);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0300 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0400
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state004'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0400 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,40000);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0400 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0500
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state005'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0500 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,0);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0500 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0600
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state006'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0600 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,0);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0600 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0700
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state007'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0700 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,20000);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0700 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0800
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state008'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0800 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,0);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0800 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0900
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let state = btAccess.getState();
        console.info('[bluetooth_js] get bluetooth state009'+ JSON.stringify(state));
        if(state == 2)
        {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0900 oldScanMode = '+ JSON.stringify(oldScanMode));
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,30000);
            let getScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] ScanMode_0900 getScanMode = '+ JSON.stringify(getScanMode));
            expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
            bluetooth.setBluetoothScanMode(oldScanMode,0);
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_1000
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let state = btAccess.getState();
            console.info('[bluetooth_js] get bluetooth state010'+ JSON.stringify(state));
            if(state == 2)
            {
                let oldScanMode = bluetooth.getBluetoothScanMode();
                console.info('[bluetooth_js] ScanMode_1000 oldScanMode = '+ JSON.stringify(oldScanMode));
                bluetooth.setBluetoothScanMode(-1,0);
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
            if (err.code == 801) {
                console.info('[bluetooth_js]BluetoothScanMode is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_2800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_2800
     * @tc.desc   TEST scanmode api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.setBluetoothScanMode(null, null);
            expect().assertFail();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_DISCOVERY_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_DISCOVERY_0100
     * @tc.desc   TEST bluetoothDeviceFind api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_DISCOVERY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
    try {
        bluetooth.on("bluetoothDeviceFind", onReceiveEvent2);
        bluetooth.startBluetoothDiscovery();
        await sleep(3000);
        bluetooth.off('bluetoothDeviceFind', onReceiveEvent2);
        bluetooth.stopBluetoothDiscovery();
    } catch (error) {
        console.info(`[bluetooth_js]BluetoothDiscovery error, code is ${error.code},message is ${error.message}`);
        if (error.code == 801) {
            console.info('[bluetooth_js]BluetoothDiscovery is not support');
            expect(true).assertTrue();
        } else {
            expect(Number(error.code)).assertEqual(2900099);
        }
    }
    bluetooth.off('bluetoothDeviceFind', onReceiveEvent2);
    done(); 
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.LETTERS_TEST);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0100 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.LETTERS_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.CHINESES_TEST2);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.CHINESES_TEST2 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0300
     * @tc.desc   Test setLocalName number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.NUM_TEST);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0300 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.NUM_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0400
     * @tc.desc   Test setLocalName api by SYMBOL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.SYMBOL_TEST);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0400 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.SYMBOL_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0500
     * @tc.desc   Test setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let newName = 'my bluetooth';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0500 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0600
     * @tc.desc   Test setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let newName = 'bluetooth1234ABCDEFGH';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0600 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0700
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let newName = '蓝牙设备bluetooth';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0700 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0800
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0800
      * @tc.desc   TEST setLocalName api by promise.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES4);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0800 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES4 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0900
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES2);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0900 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES2 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1000
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES3);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1000 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES3 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1100
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let newName = '蓝牙设备123';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1100 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1200
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let newName = '蓝牙设备bluetooth12';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName1200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

      /**
       * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1300
       * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1300
       * @tc.desc   TEST setLocalName api by promise.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES6);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1300 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES6 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1400
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1400 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1500
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES5);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1500 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.MIXES5 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1600
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.NUM_TEST1);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1600 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.NUM_TEST1 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1700
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(Btname.MIXES7);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1700 NewName = '+ JSON.stringify(getNewName));
            expect(false).assertEqual(Btname.MIXES7 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1800
     * @tc.desc   TEST setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let name = bluetooth.getLocalName();
            bluetooth.setLocalName('');
            await sleep(1000);
            let localName = bluetooth.getLocalName();
            expect(localName == name).assertTrue();
            console.info('[bluetooth_js] getLocalName1800 = ' + JSON.stringify(localName));
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setLocalName is not support');
                expect(Number(err.code)).assertEqual(801);
            } else {
                expect(Number(err.code)).assertEqual(401);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1900
     * @tc.desc   Test setLocalName api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let localName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1900 localName = '+ JSON.stringify(localName));
            expect(true).assertEqual(localName!=null);
            let newName = 'bluetoothtest';
            bluetooth.setLocalName(newName);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_1900 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(newName == getNewName);
            bluetooth.setLocalName(localName);
            await sleep(1000);
            let getLocalName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalNam1900 localName ='+ JSON.stringify(getLocalName));
            expect(true).assertEqual(localName == getLocalName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2000
     * @tc.desc   Test setLocalName_401 api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName(null);
            expect().assertFail();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setLocalName is not support');
                expect(Number(err.code)).assertEqual(801);
            } else {
                expect(Number(err.code)).assertEqual(401);
            }
        }
        done();
    })
  
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2100
     * @tc.desc   Test setLocalName_401 api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let str = "a".repeat(249);
            console.info("[bluetooth_js]setLocalName input 249-401 start " + JSON.stringify(str));
            bluetooth.setLocalName(str);
            console.info("[bluetooth_js]setLocalName input 249-401 end");
            expect().assertFail();
        } catch (err) {
            console.info("[bluetooth_js]errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]setLocalName 2100 is not support');
                expect(Number(err.code)).assertEqual(801);
            } else {
                expect(Number(err.code)).assertEqual(401);
            }
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2200
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            bluetooth.setLocalName('A');
            await sleep(1000);
            console.info("[bluetooth_js]setLocalName input A ");
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_2200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual('A' == getNewName);
        } catch (err) {
            console.info("[bluetooth_js]errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2300
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let str = "a".repeat(248);
            bluetooth.setLocalName(str);
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_2300 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(str == getNewName);
        } catch (err) {
            console.info("[bluetooth_js]errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(801);
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100
     * @tc.desc   Test getBtConnectionState api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let connectionState = bluetooth.getProfileConnectionState();
            expect(true).assertEqual(connectionState == 0 || connectionState == 1 || connectionState == 2 || connectionState == 3);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801 || err.code == 2900004) {
                console.info('[bluetooth_js]getProfileConnectionState is not support or profile not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200
      * @tc.desc   Test getProfileConnectionState api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let result = bluetooth.getProfileConnectionState(1);
            expect(true).assertEqual(result == 0 || result == 1 || result == 2 || result == 3);
        } catch (err) {
            console.info("getProfileConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100
      * @tc.desc   Test BluetoothTransport api10
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let TRANSPORT_BR_EDR = bluetooth.BluetoothTransport.TRANSPORT_BR_EDR;
            let TRANSPORT_LE = bluetooth.BluetoothTransport.TRANSPORT_LE;
            expect(TRANSPORT_BR_EDR).assertEqual(0);
            expect(TRANSPORT_LE).assertEqual(1);
            let TRANSPORT_DUAL = bluetooth.BluetoothTransport.TRANSPORT_DUAL;
            console.info("TRANSPORT_DUAL:" + TRANSPORT_DUAL);
            expect(TRANSPORT_DUAL).assertEqual(2);
            let TRANSPORT_UNKNOWN = bluetooth.BluetoothTransport.TRANSPORT_UNKNOWN;
            console.info("TRANSPORT_UNKNOWN:" + TRANSPORT_UNKNOWN);
            expect(TRANSPORT_UNKNOWN).assertEqual(3);
        } catch (err) {
            console.info("BluetoothTransport errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0200
      * @tc.desc   Test DeviceChargeState api12
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let deviceNormalChargeNotCharged = bluetooth.DeviceChargeState.DEVICE_NORMAL_CHARGE_NOT_CHARGED;
            let deviceNormalChargeInCharging = bluetooth.DeviceChargeState.DEVICE_NORMAL_CHARGE_IN_CHARGING;
            let deviceSuperChargeNotCharged = bluetooth.DeviceChargeState.DEVICE_SUPER_CHARGE_NOT_CHARGED;
            let deviceSuperChargeInCharging = bluetooth.DeviceChargeState.DEVICE_SUPER_CHARGE_IN_CHARGING;
            expect(deviceNormalChargeNotCharged).assertEqual(0);
            expect(deviceNormalChargeInCharging).assertEqual(1);
            expect(deviceSuperChargeNotCharged).assertEqual(2);
            expect(deviceSuperChargeInCharging).assertEqual(3);
        } catch (err) {
            console.info("DeviceChargeState errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0300
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0300
      * @tc.desc   Test UnbondCause api12
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let userRemoved = bluetooth.UnbondCause.USER_REMOVED;
            let RemoteDeviceDown = bluetooth.UnbondCause.REMOTE_DEVICE_DOWN;
            let authFailure = bluetooth.UnbondCause.AUTH_FAILURE;
            let authRejected = bluetooth.UnbondCause.AUTH_REJECTED;
            let internalRrror = bluetooth.UnbondCause.INTERNAL_ERROR;
            expect(userRemoved).assertEqual(0);
            expect(RemoteDeviceDown).assertEqual(1);
            expect(authFailure).assertEqual(2);
            expect(authRejected).assertEqual(3);
            expect(internalRrror).assertEqual(4);
        } catch (err) {
            console.info("UnbondCause errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1000
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1000
      * @tc.desc   Test getPairState api11
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let state: bluetooth.BondState = bluetooth.getPairState("00:11:22:33:44:55");
            console.log('[bluetooth_js] getPairState: ' + state);
            expect(true).assertEqual(state == 0 || state == 1 || state == 2);
        } catch (err) {
            console.info("getPairState errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]getPairState is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2300
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2300
      * @tc.desc   Test getPairState api11
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let state: bluetooth.BondState = bluetooth.getPairState(null);
            expect().assertFail();
        } catch (err) {
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1100
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1100
      * @tc.desc   Test isBluetoothDiscovering api11
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done : Function) => {
        try {
            let result: boolean = bluetooth.isBluetoothDiscovering();
            console.log('[bluetooth_js] isBluetoothDiscovering: ' + result);
            expect(result).assertEqual(false);
        } catch (err) {
            console.info("isBluetoothDiscovering errCode:" + err.code + ",errMessage:" + err.message);
            if (err.code == 801) {
                console.info('[bluetooth_js]isBluetoothDiscovering is not support');
                expect(true).assertTrue();
            } else {
                expect().assertFail();
            }
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1200
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1200
      * @tc.desc   Test setRemoteDeviceName api12
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.setRemoteDeviceName('11:22:33:44:55:66', 'RemoteDeviceName').then(() => {
                console.info('setRemoteDeviceName success');
            });
        } catch (err) {
            console.info("setRemoteDeviceName errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1300
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1300
      * @tc.desc   Test getRemoteDeviceBatteryInfo api12
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then((data) => {
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo:' + JSON.stringify(data));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo batteryLevel:' + JSON.stringify(data.batteryLevel));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo leftEarBatteryLevel:' + JSON.stringify(data.leftEarBatteryLevel));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo leftEarChargeState:' + JSON.stringify(data.leftEarChargeState));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo rightEarBatteryLevel:' + JSON.stringify(data.rightEarBatteryLevel));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo rightEarChargeState:' + JSON.stringify(data.rightEarChargeState));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo boxBatteryLevel:' + JSON.stringify(data.boxBatteryLevel));
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo boxChargeState:' + JSON.stringify(data.boxChargeState));
            });
        } catch (err) {
            console.info("getRemoteDeviceBatteryInfo errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(2900099);
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3000
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3000
      * @tc.desc   Test getRemoteDeviceBatteryInfo api12
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.getRemoteDeviceBatteryInfo(null).then((data) => {
                console.info('getRemoteDeviceBatteryInfo success, BatteryInfo:' + JSON.stringify(data));
            });
            expect().assertFail();
        } catch (err) {
            console.info("getRemoteDeviceBatteryInfo errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1400
     * @tc.desc   Test getRemoteProfileUuids callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let getRemoProUid = () => {
                return new Promise<void>((resolve,reject) => {
                    bluetooth.getRemoteProfileUuids('44:55:66:77:88:99', (err, data:bluetooth.ProfileUuids[])=> {
                        if (err) {
                            console.info('getRemoProUid failed' + err);
                            reject(err.code);
                        } else
                        {
                            console.info('[bluetooth_js]getRemoProUid info:'+JSON.stringify(data));
                        }
                        resolve();
                    });
                });
            }
            await getRemoProUid().then((data) => {
                console.info("[bluetooth_js]09 connection done" + data);
                done();
            },
            (e: BusinessError) => {
                console.info("[bluetooth_js]09 connection done" + e);
                if (Number(e) == 801) {
                    console.info("getRemoteProfileUuids is not support");
                    expect(true).assertTrue();
                }else {
                    expect(2900099).assertEqual(e);
                }
                done();
            })
        } catch (error) {
            console.info("[bluetooth_js] error code connection -> " + error.code + " error info connection  -> " + error.message);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2800
     * @tc.desc   Test getRemoteProfileUuids callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let getRemoProUid = () => {
                return new Promise<void>((resolve,reject) => {
                    bluetooth.getRemoteProfileUuids(null, (err, data:bluetooth.ProfileUuids[])=> {
                        if (err) {
                            console.info('getRemoProUid failed' + err);
                            reject(err.code);
                        } else
                        {
                            console.info('[bluetooth_js]getRemoProUid info:'+JSON.stringify(data));
                        }
                        resolve();
                    });
                });
            }
            await getRemoProUid().then((data) => {
                console.info("[bluetooth_js]09 connection done" + data);
                done();
            },
            (e: BusinessError) => {
                console.info("[bluetooth_js]09 connection done" + e);
                expect(401).assertEqual(Number(e.code));
                done();
            })
        } catch (error) {
            console.info("[bluetooth_js] error code connection -> " + error.code + " error info connection  -> " + error.message);
            expect(401).assertEqual(Number(error.code));
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1500
     * @tc.desc   Test getRemoteProfileUuids promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.getRemoteProfileUuids('44:55:66:77:88:99').then((value: bluetooth.ProfileUuids[]) => {
                console.info('[bluetooth_js] getRemoteProfileUuids result:' + JSON.stringify(value));
            });
        } catch (error) {
            console.info("[bluetooth_js] error code connection -> " + error.code + " error info connection  -> " + error.message);
            if (Number(error.code) == 801) {
                    console.info("getRemoteProfileUuids is not support");
                    expect(true).assertTrue();
                }else {
                    expect(Number(error.code)).assertEqual(2900099);
                }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2900
     * @tc.desc   Test getRemoteProfileUuids promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.getRemoteProfileUuids(null).then((value: bluetooth.ProfileUuids[]) => {
                console.info('[bluetooth_js] getRemoteProfileUuids result:' + JSON.stringify(value));
            });
        } catch (error) {
            console.info("[bluetooth_js] error code connection -> " + error.code + " error info connection  -> " + error.message);
            expect(Number(error.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0100
     * @tc.desc   Test getLastConnectionTime promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            await bluetooth.getLastConnectionTime('54:71:DD:5F:75:06').then((time: number) => {
                console.info('[bluetooth_js] getLastConnectionTime result:' + JSON.stringify(time));
            });
        } catch (error) {
            console.info("[bluetooth_js] error code getLastConnectionTime -> " + error.code + " error info getLastConnectionTime  -> " + error.message);
            if (Number(error.code) == 801) {
                console.info("getLastConnectionTime is not support");
                expect(true).assertTrue();
            }else {
                expect(Number(error.code)).assertEqual(2900099);
            }
            
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0200
     * @tc.desc   Test getLastConnectionTime promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GETLASTCONNECTIONTIME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            await bluetooth.getLastConnectionTime(null).then((time: number) => {
                console.info('[bluetooth_js] getLastConnectionTime result:' + JSON.stringify(time));
            });
        } catch (error) {
            console.info("[bluetooth_js] error code getLastConnectionTime -> " + error.code + " error info getLastConnectionTime  -> " + error.message);
            expect(Number(error.code)).assertEqual(401);
            
        }
        done();
    })

     /**
      * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0400
      * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0400
      * @tc.desc   Test ScanMode enum.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            let SCAN_MODE_NONE = bluetooth.ScanMode.SCAN_MODE_NONE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_NONE: " + SCAN_MODE_NONE);
            expect(SCAN_MODE_NONE).assertEqual(0);

            let SCAN_MODE_CONNECTABLE = bluetooth.ScanMode.SCAN_MODE_CONNECTABLE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_CONNECTABLE: " + SCAN_MODE_CONNECTABLE);
            expect(SCAN_MODE_CONNECTABLE).assertEqual(1);

            let SCAN_MODE_GENERAL_DISCOVERABLE = bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_GENERAL_DISCOVERABLE: " + SCAN_MODE_GENERAL_DISCOVERABLE);
            expect(SCAN_MODE_GENERAL_DISCOVERABLE).assertEqual(2);

            let SCAN_MODE_LIMITED_DISCOVERABLE = bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_LIMITED_DISCOVERABLE: " + SCAN_MODE_LIMITED_DISCOVERABLE);
            expect(SCAN_MODE_LIMITED_DISCOVERABLE).assertEqual(3);

            let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE = bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: " + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
            expect(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE).assertEqual(4);

            let SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE = bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE;
            console.info("[bluetooth_js]ScanMode SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE: " + SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
            expect(SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE).assertEqual(5);
        } catch (err) {
            console.info("bluetooth a2dp CodecType errCode:" + err.code + ",bluetooth a2dp CodecType errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1600
     * @tc.desc   Test onDiscoveryResult offDiscoveryResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let onReceiveEvent: (data: Array<bluetooth.DiscoveryResult>) => void = (data: Array<bluetooth.DiscoveryResult>) => {
        if (data.length > 0) {
            console.info('bluetooth discoveryResult result:'+ JSON.stringify(data));
            console.info('bluetooth discoveryResult deviceId result:'+ JSON.stringify(data[0].deviceId));
            console.info('bluetooth discoveryResult rssi result:'+ JSON.stringify(data[0].rssi));
            console.info('bluetooth discoveryResult deviceName result:'+ JSON.stringify(data[0].deviceName));
            console.info('bluetooth discoveryResult deviceClass result:'+ JSON.stringify(data[0].deviceClass));
            expect(data.length > 0).assertTrue();
        }
        if (data.length == 0) {
            expect(data.length == 0).assertTrue();
        }

        }
        try {
            bluetooth.on('discoveryResult', onReceiveEvent);
            await sleep(900);
            bluetooth.off('discoveryResult', onReceiveEvent);
        } catch (err) {
            console.info("discoveryResult errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("discoveryResult on/off is not support");
                    expect(true).assertTrue();
                }else {
                    expect().assertFail();
                }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0100
     * @tc.desc   Test connectAllowedProfiles callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let connectAP = () => {
                return new Promise<void>((resolve,reject) => {
                    bluetooth.connectAllowedProfiles('00:11:22:33:44:55', (err, data: void)=> {
                        if (err) {
                            console.info('connectAllowedProfiles failed' + JSON.stringify(err));
                            reject(err.code);
                        } else
                        {
                            console.info('[bluetooth_js]connectAllowedProfiles success');
                        }
                        resolve();
                    });
                });
            }
            await connectAP().then(() => {
                console.info("[bluetooth_js]connectAllowedProfiles success");
            },
            (e: BusinessError) => {
                console.info("[bluetooth_js]connectAllowedProfiles failed info:" + JSON.stringify(e));
                if (Number(e) == 801) {
                    console.info("connectAllowedProfiles is not support");
                    expect(true).assertTrue();
                }else {
                    expect(Number(e)).assertEqual(2900099);
                }
            })
        } catch (err) {
            console.info("connectAllowedProfiles errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("connectAllowedProfiles is not support");
                    expect(true).assertTrue();
                }else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0200
     * @tc.desc   Test connectAllowedProfiles promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
                console.info('[bluetooth_js] connectAllowedProfiles success');
            });
            expect().assertFail();
        } catch (err) {
            console.info("connectAllowedProfiles errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    console.info("connectAllowedProfiles is not support");
                    expect(true).assertTrue();
                }else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0300
     * @tc.desc   Test connectAllowedProfiles callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            let connectAP = () => {
                return new Promise<void>((resolve,reject) => {
                    bluetooth.connectAllowedProfiles(null, (err, data: void)=> {
                        if (err) {
                            console.info('connectAllowedProfiles failed' + JSON.stringify(err));
                            reject(err.code);
                        } else
                        {
                            console.info('[bluetooth_js]connectAllowedProfiles success');
                        }
                        resolve();
                    });
                });
            }
            await connectAP().then(() => {
                console.info("[bluetooth_js]connectAllowedProfiles success");
            },
            (e: BusinessError) => {
                console.info("[bluetooth_js]connectAllowedProfiles failed info:" + JSON.stringify(e));
                expect(Number(e.code)).assertEqual(401);
            })
        } catch (err) {
            console.info("connectAllowedProfiles errCode:" + err.code + ",errMessage:" + err.message);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0400
     * @tc.desc   Test connectAllowedProfiles promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_CONNECTALLOWEDPROFILES_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
        try {
            await bluetooth.connectAllowedProfiles(null).then(() => {
                console.info('[bluetooth_js] connectAllowedProfiles success');
            });
            expect().assertFail();
        } catch (err) {
            console.info("connectAllowedProfiles errCode:" + err.code + ",errMessage:" + err.message);
            expect(Number(err.code)).assertEqual(401);
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1700
     * @tc.desc   Test pairDevice callback api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
        let functionPairDevice = async ()=>{
          return new Promise<void>((resolve, reject)=>{
            bluetooth.pairDevice(null, (error) => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
        await functionPairDevice();
        expect(true).assertFalse();
      } catch (e) {
        console.error(`pairDevice callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1800
     * @tc.desc   Test pairDevice promise api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
        await bluetooth.pairDevice(null).then(() => {
          console.info('[bluetooth_js] pairDevice success');
        });
        expect(true).assertFalse();
      } catch (e) {
        console.error(`pairDevice promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3600
     * @tc.desc   Test batteryChange off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        let onReceiveEvent: (data: bluetooth.BatteryInfo) => void = (data: bluetooth.BatteryInfo) => {
        console.info('BatteryInfo = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on('batteryChange', onReceiveEvent);
        } catch (error) {
            console.info(`[bluetooth_js]batteryChange error, code is ${error.code}, 
            message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]batteryChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }

        try {
            bluetooth.off('batteryChange', onReceiveEvent);
        } catch (error) {
            console.info(`[bluetooth_js]batteryChange error, code is ${error.code}, 
            message is ${error.message}`);
            if (error.code == 801) {
                console.info('[bluetooth_js]batteryChange is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_GETREMOTEDEVICETRANSPORT_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_GETREMOTEDEVICETRANSPORT_0100
     * @tc.desc   Test getRemoteDeviceTransport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_GETREMOTEDEVICETRANSPORT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
        try {
            let btTransport = bluetooth.getRemoteDeviceTransport("00:11:22:33:44:55");
            console.info('[bluetooth_js] getRemoteDeviceTransport get:' + btTransport);
        } catch (error) {
            console.info(`[bluetooth_js]getRemoteDeviceTransport grt error, code is ${error.code}, 
            message is ${error.message}`);
            if (Number(error.code) == 801) {
                console.info('[bluetooth_js]getRemoteDeviceTransport is not support');
                expect(true).assertTrue();
            } else {
                expect(Number(error.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_COMMON_PAIRDEVICE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_COMMON_PAIRDEVICE_0100
     * @tc.desc   Test pairDevice with common api21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_COMMON_PAIRDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
        try {
            let deviceId: btCommon.BluetoothAddress = {
                address: "00:11:22:33:44:55",
                addressType: btCommon.BluetoothAddressType.VIRTUAL
            }
            await bluetooth.pairDevice(deviceId).then(() => {
            console.info('[bluetooth_js] pairDevice success');
            });
            expect(true).assertFalse();
        } catch (err) {
            console.error(`pairDevice BluetoothAddress error, error code is: ${err.code}, error message is: ${err.message}`);
            if (Number(err.code) == 801) {
                console.info("[bluetooth_js]pairDevice BluetoothAddress is not support");
                expect(Number(err.code) == 801).assertTrue();
            } else {
                expect(Number(err.code)).assertEqual(2900099);
            }
        }
        done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCOMMON_BLUETOOTHADDRESSTYPE_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCOMMON_BLUETOOTHADDRESSTYPE_0100
     * @tc.desc   Test common BluetoothAddressType api21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHCOMMON_BLUETOOTHADDRESSTYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
        let VIRTUAL = btCommon.BluetoothAddressType.VIRTUAL;
        console.info("[bluetooth_js]VIRTUAL: " + JSON.stringify(VIRTUAL));
        expect(VIRTUAL).assertEqual(1);

        let REAL = btCommon.BluetoothAddressType.REAL;
        console.info("[bluetooth_js]REAL: " + JSON.stringify(REAL));
        expect(REAL).assertEqual(2);
        done();
    })

    /**
 	      * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0100
 	      * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0100
 	      * @tc.desc   Test common onScanModeChange api23
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.onScanModeChange(onReceiveEvent_ScanMode);
            bluetooth.offScanModeChange(onReceiveEvent_ScanMode);
            console.info("[bluetooth_js]connection on/offScanModeChange  is success ");
        } catch (err) {
            console.error("[bluetooth_js]connection on/offScanModeChange is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0200
     * @tc.desc   Test common 入参不一致 api23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_ON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
            bluetooth.onScanModeChange(onReceiveEvent_ScanMode);
            bluetooth.offScanModeChange();
            console.info("[bluetooth_js]connection on/offScanModeChange  is success ");
        } catch (err) {
            console.error("[bluetooth_js]connection on/offScanModeChange is fail , errCode:" + err.code + ",errMessage:" + err.message);
            expect().assertFail();
        }
        done();
    })

})
}