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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function toolBarV2AccessibilityTest() {
  describe('toolBarV2AccessibilityPage', () => {
    beforeEach(async (done: Function) => {
      console.info('toolBarV2AccessibilityPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBarV2/ToolBarV2AccessibilityPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ToolBarV2AccessibilityPage state pages: ' + JSON.stringify(pages));
        if ('ToolBarV2AccessibilityPage' !== pages.name) {
          console.info('get ToolBarV2AccessibilityPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ToolBarV2AccessibilityPage Test result successful');
        }
      } catch (err) {
        console.error('push ToolBarV2AccessibilityPage  error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('ToolBarV2AccessibilityPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('ToolBarV2AccessibilityPage after each called');
    })

    /**
     * @tc.number ToolBarV2AccessibilityPageTest
     * @tc.name   ToolBarV2AccessibilityPageTest_0100
     * @tc.desc   Test ToolBarV2AccessibilityPage
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level.LEVEL0
     */
    it('ToolBarV2AccessibilityPageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[ToolBarV2AccessibilityPageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let disableItem = await driver.findComponent(ON.text('Copy'));
      let enableItem = await driver.findComponent(ON.text('Share'));
      expect(disableItem !== null).assertTrue();
      expect(enableItem !== null).assertTrue();
      console.info('[ToolBarV2AccessibilityPageTest_0100] END');
      done();
    });
  })
}