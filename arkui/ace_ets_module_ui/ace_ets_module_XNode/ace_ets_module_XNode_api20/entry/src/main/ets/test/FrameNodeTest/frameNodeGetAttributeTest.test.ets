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

export default function frameNodeGetAttributeTest() {
  describe('frameNodeGetAttributeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeGetAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeGetAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get frameNodeGetAttributeTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get frameNodeGetAttributeTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push frameNodeGetAttributeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeGetAttributeTest page error:" + err);
      }
      console.info("frameNodeGetAttributeTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeGetAttributeTest after each called");
    });

    /**
     * @tc.name   frameNodeGetAttributeTest_0100
     * @tc.number frameNodeGetAttributeTest_0100
     * @tc.desc   frameNode: frameNode getAttribute Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('frameNodeGetAttributeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('frameNodeGetAttributeTest_0100 START');
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getAttributeProgress')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeLoadingProgress')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeImage')).assertEqual(undefined);
      AppStorage.delete('getAttributeProgress')
      AppStorage.delete('getAttributeLoadingProgress')
      AppStorage.delete('getAttributeImage')
      console.info('[frameNodeGetAttributeTest_0100] END');
      done();
    });

    /**
     * @tc.name   frameNodeGetAttributeTest_0200
     * @tc.number frameNodeGetAttributeTest_0200
     * @tc.desc   frameNode: frameNode getAttribute Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('frameNodeGetAttributeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('frameNodeGetAttributeTest_0200 START');
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getAttributeButton')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeCheckbox')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeRadio')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeSlider')).assertEqual(undefined);
      expect(AppStorage.get('getAttributeToggle')).assertEqual(undefined);
      AppStorage.delete('getAttributeButton')
      AppStorage.delete('getAttributeCheckbox')
      AppStorage.delete('getAttributeRadio')
      AppStorage.delete('getAttributeSlider')
      AppStorage.delete('getAttributeToggle')
      console.info('[frameNodeGetAttributeTest_0200] END');
      done();
    });

  })
}