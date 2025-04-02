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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';
import Utils from '../Utils';

export default function composeListItemOperateItemCheckbox() {
  describe('composeListItemOperateItemCheckbox', function () {
    beforeEach(async function (done) {
      console.info('composeListItemOperateItemCheckbox beforeEach start');
      let options = {
        uri: 'MainAbility/pages/composeListItem/composeListItemOperateItemCheckbox',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get composeListItemOperateItemCheckbox state pages: ' + JSON.stringify(pages));
        if (!('composeListItemOperateItemCheckbox' == pages.name)) {
          console.info('get composeListItemOperateItemCheckbox pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push composeListItemOperateItemCheckbox page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push composeListItemOperateItemCheckbox page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeListItemOperateItemCheckbox beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('composeListItemOperateItemCheckbox after each called');
    })

    /**
     * @tc.number composeListItemOperateItemCheckbox
     * @tc.name   composeListItemOperateItemCheckbox_0100
     * @tc.desc   Test composeListItemOperateItemCheckbox
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemOperateItemCheckbox_0100', 0, async function (done) {
      console.info('[composeListItemOperateItemCheckbox_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看composeListItemOperateItemCheckbox是否存在以下入口。
      let primaryText = await driver.findComponent(ON.text('operateItemCheckbox'));
      expect(primaryText !== null).assertTrue();
      console.info('[composeListItemOperateItemCheckbox_0100] END');
      done();
    });
  })
}