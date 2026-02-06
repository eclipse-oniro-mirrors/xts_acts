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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function editableTitleBarAccessibilityTest() {
  describe('editableTitleBarAccessibilityPage', () => {
    beforeEach(async (done: Function) => {
      console.info('editableTitleBarAccessibilityPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/editableTitleBar/editableTitleBarAccessibilityPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get editableTitleBarAccessibilityPage state pages: ' + JSON.stringify(pages));
        if (!('editableTitleBarAccessibilityPage' == pages.name)) {
          console.info('get editableTitleBarAccessibilityPage pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push editableTitleBarAccessibilityPage page result successful');
        }
      } catch (err) {
        console.error('push editableTitleBarAccessibilityPage page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('editableTitleBarAccessibilityPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('editableTitleBarAccessibilityPage after each called');
    })

    /**
     * @tc.name   editableTitleBarAccessibilityPage_0100
     * @tc.number editableTitleBarAccessibilityPage
     * @tc.desc   Test editableTitleBarAccessibilityPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editableTitleBarAccessibilityPage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info('[editableTitleBarAccessibilityPage_0100] START');
        let driver = await Driver.create();
        await driver.delayMs(2000);
        // 点击打开editableTitleBar是否存在以下入口。
        let title = await driver.findComponent(ON.text('编辑页面'));
        expect(title !== null).assertTrue();
        await driver.delayMs(1000);
        console.info('[editableTitleBarAccessibilityPage_0100] END');
        done();
      });
  })
}