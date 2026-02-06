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
import accessibility from '@ohos.accessibility';

export default function tabTitleBarAccessibilityTest() {
  describe('tabTitleBarAccessibilityPage', () => {
    beforeEach(async (done: Function) => {
      console.info('tabTitleBarAccessibilityPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabTitleBar/tabTitleBarAccessibilityPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get tabTitleBarAccessibilityPage state pages: ' + JSON.stringify(pages));
        if (!('tabTitleBarAccessibilityPage' == pages.name)) {
          console.info('get tabTitleBarAccessibilityPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push tabTitleBarAccessibilityPage page result successful');
        }
      } catch (err) {
        console.error('push tabTitleBarAccessibilityPage page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('tabTitleBarAccessibilityPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('tabTitleBarAccessibilityPage after each called');
    })

    /**
     * @tc.number tabTitleBarAccessibilityPage
     * @tc.name   tabTitleBarAccessibilityPage_0100
     * @tc.desc   Test tabTitleBarAccessibilityPage
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('tabTitleBarAccessibilityPage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[tabTitleBarAccessibilityPage_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看tabTitleBarAccessibilityPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('页签1'));
      expect(itemText !== null).assertTrue();
      let status = accessibility.isOpenAccessibilitySync();
      console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100 result: ${status}`);
      expect(typeof (status)).assertEqual('boolean');
      console.info('[tabTitleBarAccessibilityPage_0100] END');
      done();
    });
  })
}