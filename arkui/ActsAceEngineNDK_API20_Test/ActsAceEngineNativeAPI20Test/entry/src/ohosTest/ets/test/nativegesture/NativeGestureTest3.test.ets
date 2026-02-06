/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativegesturendk from 'libnativegesturendk.so'
import Utils from '../common/Utils'
import { ON, Component, Point } from '@kit.TestKit';

const ARKUI_ERROR_CODE_NO_ERROR = 0

export default function NativeGestureTest3() {
  describe('NativeGestureTest3', () => {
    let Component: Component;
    let ComponentPoint: Point;
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`NativeGestureTest/NativeGestureTest3`);
      Component = await Utils.driver.findComponent(ON.id('Scroll1'));
      ComponentPoint = await Component.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ComponentPoint.x} y====${ComponentPoint.y}`);
      done();
    });

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLBEGIN_0100
     * @tc.name    : testGestureEventTargetInfo_IsScrollBegin0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollBegin0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollBegin0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollBegin0100();
          console.info(`====>testGestureEventTargetInfo_IsScrollBegin0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);

          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollBegin0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLEND_0100
     * @tc.name    : testGestureEventTargetInfo_IsScrollEnd0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollEnd0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollEnd0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollEnd0100();
          console.info(`====>testGestureEventTargetInfo_IsScrollEnd0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollEnd0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}