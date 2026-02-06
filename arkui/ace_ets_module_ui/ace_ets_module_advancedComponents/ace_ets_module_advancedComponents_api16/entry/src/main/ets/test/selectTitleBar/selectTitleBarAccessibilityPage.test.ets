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

export default function selectTitleBarAccessibilityTest() {
  describe('selectTitleBarAccessibilityPage', () => {
    beforeEach(async (done: Function) => {
      console.info('selectTitleBarAccessibilityPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectTitleBar/selectTitleBarAccessibilityPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectTitleBarAccessibilityPage state pages: ' + JSON.stringify(pages));
        if (!('selectTitleBarAccessibilityPage' == pages.name)) {
          console.info('get selectTitleBarAccessibilityPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push selectTitleBarAccessibilityPage page result successful');
        }
      } catch (err) {
        console.error('push selectTitleBarAccessibilityPage page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('selectTitleBarAccessibilityPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectTitleBarAccessibilityPage after each called');
    })

    /**
     * @tc.number selectTitleBarAccessibilityPage
     * @tc.name   selectTitleBarAccessibilityPage_0100
     * @tc.desc   Test selectTitleBarAccessibilityPage
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('selectTitleBarAccessibilityPage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[selectTitleBarAccessibilityPage_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看selectTitleBarAccessibilityPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('所有照片'));
      expect(itemText !== null).assertTrue();
      let status = accessibility.isOpenAccessibilitySync();
      console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100 result: ${status}`);
      expect(typeof (status)).assertEqual('boolean');
      console.info('[selectTitleBarAccessibilityPage_0100] END');
      done();
    });
  })
}