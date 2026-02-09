
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
import ble from '@ohos.bluetooth.ble';
import bluetooth from '@ohos.bluetoothManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

let gattServer = null;

function sleep(delay) {
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

async function tryToEnableBt() {
    let sta = bluetooth.getState();
    switch(sta){
        case 0:
            console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
            bluetooth.enableBluetooth();
            await clickTheWindow(OPEN_BT_TEXT);
            await sleep(10000);
            break;
        case 1:
            console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
            await sleep(3000);
            break;
        case 2:
            console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
            break;
        case 3:
            console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
            bluetooth.enableBluetooth();
            await clickTheWindow(OPEN_BT_TEXT);
            await sleep(10000);
            break;
        default:
            console.info('[bluetooth_js] enable success');
    }
}
export default function btBleError401Test() {
     describe('btBleError401Test', function() {
          beforeAll(async function (done) {
               console.info('beforeAll start');
               let PERMISSION_TEXT = "允许";
               await sleep(2000);
               await openPhone();
               await clickTheWindow(PERMISSION_TEXT);
               gattServer = bluetooth.BLE.createGattServer();
               console.info('beforeAll end');
               done();
          })
          beforeEach(async function (done) {
               console.info('beforeEach start');
               await tryToEnableBt();
               console.info('beforeEach end');
               done();
          })
          afterEach(function () {
               console.info('afterEach called')
          })
          afterAll(async function (done) {
               console.info('afterAll start');
               await sleep(900);
               if(gattServer !=null){
                 gattServer.close();
                 console.info('delete gattServer');
               };
               await tryToEnableBt();
               console.info('afterAll end');
               done();
          })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_C_SETPHY_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_C_SETPHY_0100
         * @tc.desc API23 client setPhy readPhytest normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_C_SETPHY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let device = ble.createGattClientDevice('00:11:22:33:44:55');
                await device.setPhy(null);
                console.info('[bt_arkts] client setPhy success');
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
                expect(Number(error.code)).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_S_SETPHY_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_S_SETPHY_0100
         * @tc.desc API23 server setPhy readPhytest normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
         it('SUB_COMMUNICATION_BLUETOOTHBLE_S_SETPHY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let gattServer = ble.createGattServer();   
                await gattServer.setPhy(null,null);
                console.info('[bt_arkts] server setPhy success');
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
                expect(Number(error.code)).assertEqual(401);
            }
            done();
        })
       /**
         * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_S_READPHY_0100
         * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_S_READPHY_0100
         * @tc.desc API23 server setPhy readPhytest normal
         * @tc.type Method
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it('SUB_COMMUNICATION_BLUETOOTHBLE_S_READPHY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let gattServer = ble.createGattServer();   
                await gattServer.readPhy(null);
                console.info('[bt_arkts] server readPhy success');
                expect().assertFail();
            } catch (error) {
                console.error(`[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
                expect(Number(error.code)).assertEqual(401);
            }
            done();
        })

    })
}
