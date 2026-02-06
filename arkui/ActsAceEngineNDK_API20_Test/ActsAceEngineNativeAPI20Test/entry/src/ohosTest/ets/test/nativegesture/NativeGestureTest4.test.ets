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
const ARKUI_ERROR_CODE_PARAM_INVALID = 401
const ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED = 180102
export default function NativeGestureTest4() {
  describe('NativeGestureTest4', () => {
    let Component: Component;
    let ComponentPoint: Point;
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`NativeGestureTest/NativeGestureTest4`);
      Component = await Utils.driver.findComponent(ON.id('Column1'));
      ComponentPoint = await Component.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ComponentPoint.x} y====${ComponentPoint.y}`);
      done();
    });

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_GETDISTANCEBYTOOLTYPE_0100
     * @tc.name    : testGetDistanceByToolType0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetDistanceByToolType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetDistanceByToolType0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetDistanceByToolType0100();
          console.info(`====>testGetDistanceByToolType0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetDistanceByToolType0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_GETDISTANCEBYTOOLTYPE_0200
     * @tc.name    : testGetDistanceByToolType0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetDistanceByToolType0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetDistanceByToolType0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetDistanceByToolType0200();
          console.info(`====>testGetDistanceByToolType0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetDistanceByToolType0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_GETDISTANCEBYTOOLTYPE_0300
     * @tc.name    : testGetDistanceByToolType0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetDistanceByToolType0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetDistanceByToolType0300 start====");
          let com1 = await Utils.driver.findComponent(ON.id('buttonId1'));
          let com2 = await Utils.driver.findComponent(ON.id('buttonId2'));
          await com1.dragTo(com2);
          await Utils.sleep(1000);
          let result: number = nativegesturendk.GetDistanceByToolType0300();
          console.info(`====>testGetDistanceByToolType0300 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetDistanceByToolType0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}