/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import bluetoothCApi from 'libentry.so';
import access from '@ohos.bluetooth.access';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

function sleep(delay : number) : Promise<void> {
  return new Promise(resovle => setTimeout(resovle, delay))
}

async function openPhone() {
    try{
        let drivers = Driver.create();
        console.info('[bluetooth_js] bt driver create:'+ drivers);            
        await drivers.delayMs(900);
        await drivers.wakeUpDisplay();
        await drivers.delayMs(3000);
        await drivers.swipe(1500, 1000, 1500, 100);
        await drivers.delayMs(5000);
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
    await driver.delayMs(900);
    try {
        let button = await driver.findComponent(ON.text(text));
        await button.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] clickRequestPermission end');
    } catch (err) {
        console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
    }
}

async function tryToEnableBt() {
    let sta = access.getState();
    switch(sta){
        case 0:
            console.info('[bluetooth_js] bt state off:' + JSON.stringify(sta));
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta1 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta1));
            break;
        case 1:
            console.info('[bluetooth_js] bt state turning on:' + JSON.stringify(sta));
            await sleep(3000);
            break;
        case 2:
            console.info('[bluetooth_js] bt state on:' + JSON.stringify(sta));
            break;
        case 3:
            console.info('[bluetooth_js] bt state turning off:' + JSON.stringify(sta));
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta2 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta2));
            break;
        case 4:
            console.info('[bluetooth_js] bt state ble turning on:' + JSON.stringify(sta));
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta3 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta3));
            break;
        case 5:
            console.info('[bluetooth_js] bt state ble on:' + JSON.stringify(sta));
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta4 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta4));
            break;
        case 6:
            console.info('[bluetooth_js] bt state ble turning off:' + JSON.stringify(sta));
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta5 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta5));
            await sleep(3000);
          access.enableBluetooth();
            await clickRequestPermission(OPEN_BT_TEXT);
            await sleep(3000);
            let sta6 = access.getState();
            console.info('[bluetooth_js] bt state:' + JSON.stringify(sta6));
            break;
        default:
            console.info('[bluetooth_js] getState fail: ' + JSON.stringify(sta));
    }
}

export default function bluetoothCApiTest() {
  describe('bluetoothCApiTest', () => {
    beforeAll(async (done : Function) =>  {
        console.info('beforeAll called')
        await clickRequestPermission(PERMISSION_TEXT);
        await openPhone();
        done();
    })
    beforeEach(() => {
      console.info('beforeEach case');
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_NAPI_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0100
     * @tc.desc   test OH_Bluetooth_GetBluetoothSwitchState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_NAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let state:number = access.getState();
        console.info('[bluetooth_js] getState info: ' + JSON.stringify(state));
        let states:number = bluetoothCApi.getBluetoothSwitchState();
        console.info('[bluetooth_js] GetBluetoothSwitchState info: ' + JSON.stringify(states));
        expect(state).assertEqual(states);
      } catch (error) {
            console.info(`[bluetooth_js]GetBluetoothSwitchState error, code is ${error.code}, 
            message is ${error.message}`);
        }
        done();
    });
  })
}