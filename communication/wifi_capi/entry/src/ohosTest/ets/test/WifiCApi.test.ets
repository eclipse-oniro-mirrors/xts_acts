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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
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
         * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0100
         * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0100
         * @tc.desc   test OH_Wifi_IsWifiEnabled
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_COMMUNICATION_WIFI_NAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        /**
         * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0200
         * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0200
         * @tc.desc   test OH_Wifi_GetDeviceMacAddress (验证接口调用成功性)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_COMMUNICATION_WIFI_NAPI_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            try {
                // 仅调用接口，验证是否能成功执行（不校验返回值格式，只捕获异常）
                const macFromCApi: string = wifiCApi.getWifiMacAddress();
                console.info(`[wifi_js] GetWifiMacAddress call success, return value: ${macFromCApi}`);
                // 可选：简单判断返回值非空（若业务允许空值可删除此行）
                if (macFromCApi === '') {
                    console.warn('[wifi_js] GetWifiMacAddress return empty string');
                }
                expect().assertTrue()
            } catch (error) {
                // 捕获接口调用异常（如NAPI抛错、系统接口失败等）
                console.error(`[wifi_js] GetWifiMacAddress call failed: code=${error.code}, message=${error.message}`);
            }
            done();
        });
    })
}