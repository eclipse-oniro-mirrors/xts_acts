/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function WebTextMenuGestureTest() {

  describe('WebTextMenuGestureTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureType/WebTextMenuGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebTextMenumGestureTest state pages: " + JSON.stringify(pages));
        if (!("WebTextMenumGestureTest" == pages.name)) {
          console.info("get WebTextMenumGestureTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push WebTextMenumGestureTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebTextMenumGestureTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WebTextMenumGestureTest after each called");
    });

    /**
     * @tc.name   WebTextMenumGestureTest_0100
     * @tc.number WebTextMenumGestureTest_0100
     * @tc.desc   test WEB_SCROLL_GESTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebTextMenumGestureTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('WebTextMenumGestureTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let web = await driver.findComponent(ON.id('web'));
      let rect =await web.getBounds()
      let rectCenter =await web.getBoundsCenter()
      await driver.swipe(rect.right,rectCenter.y,rectCenter.x,rectCenter.y)
      await CommonFunc.sleep(500);
      expect(AppStorage.get('WEB_SCROLL_GESTURE')).assertEqual(GestureControl.GestureType.WEB_SCROLL_GESTURE);
      console.info('[WebTextMenumGestureTest_0100] END');
      done();
    });

    /**
     * @tc.name   WebTextMenumGestureTest_0200
     * @tc.number WebTextMenumGestureTest_0200
     * @tc.desc   test TEXT_FIELD_SELECT_GESTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebTextMenumGestureTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('WebTextMenumGestureTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('text'));
      let rect =await text.getBounds()
      let rectCenter =await text.getBoundsCenter()
      await driver.swipe(rectCenter.x,rectCenter.y,rect.left,rectCenter.y)
      await CommonFunc.sleep(500);
      expect(AppStorage.get('TEXT_FIELD_SELECT_GESTURE')).assertEqual(GestureControl.GestureType.TEXT_FIELD_SELECT_GESTURE);
      console.info('[WebTextMenumGestureTest_0200] END');
      done();
    });

    /**
     * @tc.name   WebTextMenumGestureTest_0300
     * @tc.number WebTextMenumGestureTest_0300
     * @tc.desc   test CONTEXT_MENU_HOVER_GESTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WebTextMenumGestureTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('WebTextMenumGestureTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let image = await driver.findComponent(ON.id('image'));
      await image.longClick();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('CONTEXT_MENU_HOVER_GESTURE')).assertEqual(GestureControl.GestureType.CONTEXT_MENU_HOVER_GESTURE);
      console.info('[WebTextMenumGestureTest_0300] END');
      done();
    });
  })
}