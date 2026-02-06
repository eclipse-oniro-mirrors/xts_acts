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

import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import router from '@ohos.router';

export default function composeListItemAccessibilityTest() {
  describe('composeListItemAccessibilityPageTest', () => {
    beforeEach(async (done: Function) => {
      console.info('composeListItemAccessibilityPageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/composeListItemAccessibilityPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get composeListItemAccessibilityPageTest state pages: ' + JSON.stringify(pages));
        if (!('composeListItemAccessibilityPage' == pages.name)) {
          console.info('get composeListItemAccessibilityPageTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push composeListItemAccessibilityPageTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeListItemAccessibilityPageTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeListItemAccessibilityPageTest after each called');
    })

    /**
     * @tc.number composeListItemAccessibilityPageTest
     * @tc.name composeListItemAccessibilityPageTest_0100
     * @tc.desc Test composeListItemAccessibilityPage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('composeListItemAccessibilityPageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      console.info('[composeListItemAccessibilityPageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看composeListItemAccessibilityPage是否存在以下入口。
      let primaryText = await driver.findComponent(ON.text('双行列表'));
      let secondaryText = await driver.findComponent(ON.text('辅助文字'));
      let description = await driver.findComponent(ON.text('描述内容文字'));
      let rightText = await driver.findComponent(ON.text('确定'));
      expect(primaryText !== null).assertTrue();
      expect(secondaryText !== null).assertTrue();
      expect(description !== null).assertTrue();
      expect(rightText !== null).assertTrue();
      console.info('[composeListItemAccessibilityPageTest_0100] END');
      done();
    });
  })
}