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
import nativerenderndk from 'libnoderenderndk.so'
import Utils from '../common/Utils';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function ScrollStateTest() {
  describe('ScrollStateTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const speed: number = 5000;
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scrollstateTest/ScrollStateTest`, done);
    });

    /**
     * @tc.name   testARKUI_SCROLL_STATE_IDLE0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_STATE_IDLE_0100
     * @tc.desc   testing ARKUI_SCROLL_STATE_IDLE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testARKUI_SCROLL_STATE_IDLE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_STATE_IDLE0100 start====");
          await Utils.driver.swipeBetween({ x: x1, y: y1 }, { x: x2, y: y1 }, speed);
          await Utils.driver.click(x2, y1);
          let result: number = nativerenderndk.ScrollStateTest_001();
          console.info(`====>testARKUI_SCROLL_STATE_IDLE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_STATE_IDLE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testARKUI_SCROLL_STATE_SCROLL0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_STATE_SCROLL_0100
     * @tc.desc   testing ARKUI_SCROLL_STATE_SCROLL interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testARKUI_SCROLL_STATE_SCROLL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_STATE_SCROLL0100 start====");
          await Utils.driver.swipeBetween({ x: x1, y: y1 }, { x: x2, y: y1 }, speed);
          await Utils.driver.click(x2, y1);
          let result: number = nativerenderndk.ScrollStateTest_002();
          console.info(`====>testARKUI_SCROLL_STATE_SCROLL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_STATE_SCROLL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testARKUI_SCROLL_STATE_FLING0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_ARKUI_SCROLL_STATE_FLING_0100
     * @tc.desc   testing ARKUI_SCROLL_STATE_FLING interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testARKUI_SCROLL_STATE_FLING0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUI_SCROLL_STATE_FLING0100 start====");
          await Utils.driver.swipeBetween({ x: x1, y: y1 }, { x: x2, y: y1 }, speed);
          await Utils.driver.click(x2, y1);
          await Utils.driver.swipeBetween({ x: x1, y: y1 }, { x: x2, y: y1 }, speed);
          await Utils.driver.click(x2, y1);
          let result: number = nativerenderndk.ScrollStateTest_003();
          console.info(`====>testARKUI_SCROLL_STATE_FLING0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testARKUI_SCROLL_STATE_FLING0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
  })
}