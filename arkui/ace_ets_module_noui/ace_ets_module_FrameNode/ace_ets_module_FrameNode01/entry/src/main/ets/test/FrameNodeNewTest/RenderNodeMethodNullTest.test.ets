/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function RenderNodeMethodNullTest() {
  describe('RenderNodeMethodNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeMethodNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/RenderNodeMethodNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeMethodNullTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get RenderNodeMethodNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeMethodNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeMethodNullTest page error:" + err);
      }
      console.info("RenderNodeMethodNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RenderNodeMethodNullTest after each called");
    });

    /**
     * @tc.name   RenderNodeMethodNullTest_0100
     * @tc.number RenderNodeMethodNullTest_0100
     * @tc.desc   renderNode method return null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RenderNodeMethodNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RenderNodeMethodNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_renderNodeMethodNull'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('renderNodeGetChildNull')).assertEqual(null);
      expect(AppStorage.get('renderNodeGetFirstChildNull')).assertEqual(null);
      expect(AppStorage.get('renderNodeGetNextSiblingNull')).assertEqual(null);
      expect(AppStorage.get('renderNodeGetPreviousSiblingNull')).assertEqual(null);
      AppStorage.delete('renderNodeGetChildNull')
      AppStorage.delete('renderNodeGetFirstChildNull')
      AppStorage.delete('renderNodeGetNextSiblingNull')
      AppStorage.delete('renderNodeGetPreviousSiblingNull')
      console.info('[RenderNodeMethodNullTest_0100] END');
      done();
    });
  })
}