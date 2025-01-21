/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import router from '@ohos.router';

export default function composeListItemPageTest() {
  describe('composeListItemPageTest', () => {
    beforeEach(async (done: Function) => {
      console.info('composeListItemPageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/composeListItemPageTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get composeListItemPageTest state pages: ' + JSON.stringify(pages));
        if (!('composeListItemPageTest' == pages.name)) {
          console.info('get composeListItemPageTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push composeListItemPageTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeListItemPageTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeListItemPageTest after each called');
    })

    /**
     * @tc.number composeListItemPageTest
     * @tc.name composeListItemPageTest_0100
     * @tc.desc Test composeListItemPage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('composeListItemPageTest_0100', 0, async (done:Function) =>{
      console.info('[composeListItemPageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看composeListItemPageTest是否存在以下入口。
      let primaryText = await driver.findComponent(ON.text('双行列表'));
      let secondaryText = await driver.findComponent(ON.text('辅助文字'));
      let description = await driver.findComponent(ON.text('描述内容文字'));
      let rightText = await driver.findComponent(ON.text('右侧文本'));
      expect(primaryText !== null).assertTrue();
      expect(secondaryText !== null).assertTrue();
      expect(description !== null).assertTrue();
      expect(rightText !== null).assertTrue();
      console.info('[composeListItemPageTest_0100] END');
      done();
    });
  })
}