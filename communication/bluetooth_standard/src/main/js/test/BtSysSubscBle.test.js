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

import bluetooth from '@ohos.bluetooth';
import bluetoothsys from '@system.bluetooth';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btSubscBleTest() {
describe('btSubscBleTest', function() {

    function sleep(delay) {
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

  async function clickTheWindow() {
    try {
      console.info('[bluetooth_js] clickRequestPermission start');
      let driver = Driver.create();
      await driver.delayMs(3000);
      let button = await driver.findComponent(ON.text("开启"));
      await button.click();
      await driver.delayMs(3000);
      console.info('[bluetooth_js] clickRequestPermission end');
  } catch (err) {
      console.info('[bluetooth_js] clickRequestPermission failed');
  }
  }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta1 = bluetooth.getState();
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
                bluetooth.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNACATION_BLUETOOTH_BLESUBSFOUND_0100
     * @tc.name testsubscribeBLEFound
     * @tc.desc Test subscribeBLEFound api.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_BLUETOOTH_BLESUBSFOUND_0100', 0, async function (done) {
        bluetoothsys.startBLEScan({
          interval:0,
          success() {
            console.log('[bluetooth_js] startBLEScan1 success.');
             bluetoothsys.subscribeBLEFound({
              success(data) {
                console.log('[bluetooth_js] bluetooth.subscribeBLEFound1 success.');
                const [device] = data.devices;
                console.log('[bluetooth_js] devices:'+ JSON.stringify(data.devices) + 'length:' + data.devices.length);
                expect(data.devices.length >= 0).assertTrue();
                for (let i = 0; i < data.devices.length; i++) {
                console.log(`subscribeBLEFound device, addrType: ${data.devices[i].addrType}`);
                console.log(`subscribeBLEFound device, addr: ${data.devices[i].addr}`);
                console.log(`subscribeBLEFound device, rssi: ${data.devices[i].rssi}`);
                console.log(`subscribeBLEFound device, txpower: ${data.devices[i].txpower}`);
                console.log(`subscribeBLEFound device, data: ${data.devices[i].data}`);
                }
              },
              fail(code, data) {
                console.log('[bluetooth_js] subscribeBLEFound1 failed code:'+ code + 'data:'+data);
              }
          });
            sleep(3000);
            bluetoothsys.unsubscribeBLEFound();
            bluetoothsys.stopBLEScan({
              success() {
                console.log('[bluetooth_js] stopBLEScan success.');
              },
              fail(data, code) {
                console.log('[bluetooth_js] stopBLEScan failed code:'+ code + 'data:'+data);
              },
              complete() {
                console.log('[bluetooth_js] stopBLEScan complete.');
              }
            });
          },
          fail(code, data) {
            console.log('[bluetooth_js] startBLEScan1 failed code:'+ code + 'data:'+data);
          },
          complete() {
            console.log('[bluetooth_js] startBLEScan1 complete.');
          }
        });
        done();
    })

})

}

