/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GraphicsFourBoundaryTest() {
  describe('GraphicsFourBoundaryTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GraphicsFourBoundaryTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/GraphicsFourBoundary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GraphicsFourBoundary state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GraphicsFourBoundary pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GraphicsFourBoundary page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GraphicsFourBoundary page error:" + err);
      }
      console.info("GraphicsFourBoundary beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetFrameNodeNullTest after each called");
    });

    /**
     * @tc.name   GraphicsFourBoundaryTest_0100
     * @tc.number SUB_ARKUI_API_GraphicsFourBoundaryTest_0100
     * @tc.desc   GraphicsFourBoundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicsFourBoundaryTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GraphicsFourBoundaryTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('setRgba_-1');
      console.info("[GraphicsFourBoundaryTest_0100] width is: " + JSON.stringify(JSON.parse(strJson1).$attrs.width));   
      expect(JSON.parse(strJson1).$attrs.width).assertEqual('80.00vp');

      console.info('[GraphicsFourBoundaryTest_0100] END');
      done();
    });

  })
}