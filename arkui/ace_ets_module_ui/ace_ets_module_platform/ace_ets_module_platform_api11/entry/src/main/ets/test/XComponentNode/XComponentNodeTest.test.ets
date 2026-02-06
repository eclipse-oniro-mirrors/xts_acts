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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function XComponentNodeTest() {
  describe('XComponentNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponentNode/XComponentNodePage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentNodeTest state pages: " + JSON.stringify(pages));
        if (!("XComponentNodeTest" == pages.name)) {
          console.info("get XComponentNodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentNodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentNodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async (done: Function) => {
      if (AppStorage.get('XComponentNodePage_onCreate') != undefined) {
        AppStorage.delete('XComponentNodePage_onCreate');
      }
      if (AppStorage.get('XComponentNodePage_onDestroy') != undefined) {
        AppStorage.delete('XComponentNodePage_onDestroy');
      }
      if (AppStorage.get('XComponentNodePage_changeRenderType') != undefined) {
        AppStorage.delete('XComponentNodePage_changeRenderType');
      }
      await CommonFunc.sleep(500)
      console.info("XComponentNodeTest after each called");
      done()
    })

    /**
     * @tc.name   XComponentNodeTest_0010
     * @tc.number XComponentNodeTest_0010
     * @tc.desc   test XComponentNode onCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('XComponentNodeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('XComponentNodeTest_0010 START');
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('XComponentNodePage_onCreate')).assertEqual('onCreate succ');
  
      console.info('[XComponentNodeTest_0010] END');
      done();
    });

    /**
     * @tc.name   XComponentNodeTest_0020
     * @tc.number XComponentNodeTest_0020
     * @tc.desc   test XComponentNode changeRenderType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('XComponentNodeTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('XComponentNodeTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('changeRenderType_display'));
      await button.click();
      console.info("[XComponentTypeNodeTest_0200] Click changeRenderType_display.");
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('XComponentNodePage_changeRenderType')).assertEqual(false);

      button = await driver.findComponent(ON.id('changeRenderType_texture'));
      await button.click();
      console.info("[XComponentTypeNodeTest_0200] Click changeRenderType_texture.");
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('XComponentNodePage_changeRenderType')).assertEqual(true);
  
      console.info('[XComponentNodeTest_0020] END');
      done();
    });
  })
}

