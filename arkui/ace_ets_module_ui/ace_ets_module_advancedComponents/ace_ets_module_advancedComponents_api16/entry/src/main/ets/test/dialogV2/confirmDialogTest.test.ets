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

export default function confirmDialogTest() {
  describe('confirmDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('confirmDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogV2/confirmDialogV2TestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get confirmDialogTest state pages: ' + JSON.stringify(pages));
        if (!('confirmDialogV2TestPage' == pages.name)) {
          console.info('get confirmDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push confirmDialogTest page result successful');
        }
      } catch (err) {
        console.error('push confirmDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('confirmDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('confirmDialogTest after each called');
    })

    /**
     * @tc.name   confirmDialogTest_0100
     * @tc.number confirmDialogTest
     * @tc.desc   Test confirmDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('confirmDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[confirmDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开ConfirmDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('ConfirmDialogV2'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开ConfirmDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('文本标题'));
      let checkTips = await driver.findComponent(ON.text('禁止后不再提示'));
      let content = await driver.findComponent(ON.text('这里是内容区'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('禁止'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('允许'));
      expect(primaryTitle !== null).assertTrue();
      expect(checkTips !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭ConfirmDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[confirmDialogTest_0100] END');
      done();
    });
  })
}