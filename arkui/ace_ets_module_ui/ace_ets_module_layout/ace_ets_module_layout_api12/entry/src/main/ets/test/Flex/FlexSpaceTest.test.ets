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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FlexSpaceTest() {
  describe('FlexSpaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexSpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexSpaceTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexSpaceTest state pages:" + JSON.stringify(pages));
        if (!("FlexSpaceTest" == pages.name)) {
          console.info("get FlexSpaceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexSpaceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexSpaceTest page error:" + err);
      }
      console.info("FlexSpaceTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexSpaceTest after each called");
    });


    /**
     * @tc.number    FlexSpaceTest_0100
     * @tc.name      FlexSpaceTest_0100
     * @tc.desc      Test Flex space
     * @tc.level     Level 2
     */
    it('FlexSpaceTest_0100', 0, async (done: Function) => {
      console.info('FlexSpaceTest_0100 START');
      await CommonFunc.sleep(2000);

      let text1Rect = CommonFunc.getComponentRect('FlexSpaceTest_text1');
      console.info("[FlexSpaceTest_0100] text1Rect.bottom " + text1Rect.bottom);
      let text3Rect = CommonFunc.getComponentRect('FlexSpaceTest_text3');
      console.info("[FlexSpaceTest_0100] text3Rect.top " + text3Rect.top);
      expect(Math.abs((text3Rect.top-text1Rect.bottom)-50) <= 1).assertTrue();

      console.info('FlexSpaceTest_0100 END');
      done();
    });



  })
}