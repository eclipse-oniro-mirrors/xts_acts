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

export default function NodeEventTypeTest1() {
  describe('NodeEventTypeTest1', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`nodeeventtypetest/NodeEventTypeTest1`, done);
    });

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_SWIPER_EVENT_ON_UNSELECTED_0100
       * @tc.name       : testNODE_SWIPER_EVENT_ON_UNSELECTED0100
       * @tc.desc       : testing NODE_SWIPER_EVENT_ON_UNSELECTED interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_SWIPER_EVENT_ON_UNSELECTED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_SWIPER_EVENT_ON_UNSELECTED0100 start====");
          await Utils.sleep(4000)
          let result: number = nativerenderndk.NodeEventTypeTest_012();
          console.info(`====>testNODE_SWIPER_EVENT_ON_UNSELECTED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_SWIPER_EVENT_ON_UNSELECTED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL_0100
       * @tc.name       : testNODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL0100
       * @tc.desc       : testing NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testNODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL0100 start====");
          await Utils.driver.swipe(x1, y1, x2, y1)
          let result: number = nativerenderndk.NodeEventTypeTest_013();
          console.info(`====>testNODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED_0100
       * @tc.name       : testNODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED0100
       * @tc.desc       : testing NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testNODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (done: Function) => {
        try {
          console.info("====>testNODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED0100 start====");
          await Utils.sleep(4000)
          let result: number = nativerenderndk.NodeEventTypeTest_014();
          console.info(`====>testNODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testNODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}