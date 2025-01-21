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
import router from '@system.router';
import Utils from '../Utils';

export default function selectDialogTest() {
  describe('selectDialogTest', function () {
    beforeEach(async function (done) {
      console.info('selectDialogTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/dialog/selectDialogTest',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectDialogTest state pages: ' + JSON.stringify(pages));
        if (!('selectDialogTest' == pages.name)) {
          console.info('get selectDialogTest pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push selectDialogTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push selectDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('selectDialogTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('selectDialogTest after each called');
    })

    /**
     * @tc.number selectDialogTest
     * @tc.name   selectDialogTest
     * @tc.desc   Test selectDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('selectDialogTest_0100', 0, async function (done) {
      console.info('[selectDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开SelectDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('SelectDialog'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开SelectDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('文本标题'));
      let content = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      expect(primaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      // 关闭SelectDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[selectDialogTest_0100] END');
      done();
    });
  })
}