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

export default function customContentDialogTest() {
  describe('customContentDialogTest', function () {
    beforeEach(async function (done) {
      console.info('alertDialogTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/dialog/customContentDialogTest',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get customContentDialogTest state pages: ' + JSON.stringify(pages));
        if (!('customContentDialogTest' == pages.name)) {
          console.info('get customContentDialogTest pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push customContentDialogTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push customContentDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('customContentDialogTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('customContentDialogTest after each called');
    })

    /**
     * @tc.number customContentDialogTest
     * @tc.name   customContentDialogTest
     * @tc.desc   Test customContentDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('customContentDialogTest_0100', 0, async function (done) {
      console.info('[customContentDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开CustomContentDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('CustomContentDialog'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开CustomContentDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('标题'));
      let secondaryTitle = await driver.findComponent(ON.text('辅助文本'));
      let content = await driver.findComponent(ON.text('内容区'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('按钮1'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('按钮2'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭CustomContentDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[customContentDialogTest_0100] END');
      done();
    });
  })
}