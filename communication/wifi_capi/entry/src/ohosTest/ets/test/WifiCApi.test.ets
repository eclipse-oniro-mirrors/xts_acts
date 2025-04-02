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
import wifiCApi from 'libentry.so';
import wifiMg from '@ohos.wifiManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

async function openPhone() {
    try{
        let drivers = Driver.create();
        console.info('[wifi_js] bt driver create:'+ drivers);            
        await drivers.delayMs(900);
        await drivers.wakeUpDisplay();
        await drivers.delayMs(3000);
        await drivers.swipe(1500, 1000, 1500, 100);
        await drivers.delayMs(5000);
    } catch (error) {
        console.info('[wifi_js] driver error info:'+ error);
    }
}

export default function wifiCApiTest() {
  describe('wifiCApiTest', () => {
    beforeAll(async (done : Function) =>  {
        console.info('beforeAll called')
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
     * @tc.number     : SUB_COMMUNICATION_WIFI_NAPI_0100
     * @tc.name       : testOHWifiIsWifiEnabled
     * @tc.desc       : test OH_Wifi_IsWifiEnabled
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0100', 0, async (done: Function) => {
      try {
        let state:boolean = wifiMg.isWifiActive();
        console.info('[wifi_js] getState info: ' + JSON.stringify(state));
        let states:number = wifiCApi.getWifiSwitchState();
        console.info('[wifi_js] GetWifiSwitchState info: ' + JSON.stringify(states));
        if (state) {
            expect(1).assertEqual(states);
        } else {
            expect(0).assertEqual(states);
        }
      } catch (error) {
            console.info(`[wifi_js]GetWifiSwitchState error, code is ${error.code}, 
            message is ${error.message}`);
        }
        done();
    });
  })
}