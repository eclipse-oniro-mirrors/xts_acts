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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function toolBarItemState() {
  describe('toolBarItemState', () => {
    beforeEach(async (done: Function) => {
      console.info("toolBarItemState beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBar/toolBarItemState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get toolBarItemState state pages: " + JSON.stringify(pages));
        if (!('toolBarItemState' == pages.name)) {
          console.info("get toolBarItemState pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push toolBarItemState page result successful");
        }
      } catch (err) {
        console.error("push toolBarItemState page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('toolBarItemState beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('toolBarItemState after each called');
    })

    /**
     * @tc.number toolBarItemState
     * @tc.name   toolBarItemState_0100
     * @tc.desc   Test toolBarItemState
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level.LEVEL0
     */
    it('toolBarItemState_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[toolBarItemState_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看ToolBarPage是否存在以下入口。
      let enableItem = await driver.findComponent(ON.text('ENABLE'));
      let disableItem = await driver.findComponent(ON.text('DISABLE'));
      let activateItem = await driver.findComponent(ON.text('ACTIVATE'));
      expect(enableItem !== null).assertTrue();
      expect(disableItem !== null).assertTrue();
      expect(activateItem !== null).assertTrue();
      console.info('[toolBarItemState_0100] END');
      done();
    });
  })
}
