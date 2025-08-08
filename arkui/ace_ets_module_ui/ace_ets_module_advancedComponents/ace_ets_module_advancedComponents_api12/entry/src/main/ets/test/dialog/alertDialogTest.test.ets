/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export default function alertDialogTest() {
  describe('alertDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('alertDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/alertDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get alertDialogTest state pages: ' + JSON.stringify(pages));
        if (!('alertDialogTest' == pages.name)) {
          console.info('get alertDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push alertDialogTest page result successful');
        }
      } catch (err) {
        console.error('push alertDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('alertDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('alertDialogTest after each called');
    })

    /**
     * @tc.number alertDialogTest
     * @tc.name   alertDialogTest
     * @tc.desc   Test alertDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('alertDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[alertDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开AlertDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('AlertDialog'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开AlertDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('弹框一级标题'));
      let secondaryTitle = await driver.findComponent(ON.text('弹框二级标题'));
      let content = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('确认'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭AlertDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[alertDialogTest_0100] END');
      done();
    });
  })
}
