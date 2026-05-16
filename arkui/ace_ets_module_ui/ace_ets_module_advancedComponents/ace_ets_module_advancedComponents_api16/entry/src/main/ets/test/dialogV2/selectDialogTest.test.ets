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

export default function selectDialogTest() {
  describe('selectDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('selectDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogV2/selectDialogV2TestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectDialogTest state pages: ' + JSON.stringify(pages));
        if (!('selectDialogV2TestPage' == pages.name)) {
          console.info('get selectDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push selectDialogTest page result successful');
        }
      } catch (err) {
        console.error('push selectDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('selectDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectDialogTest after each called');
    })

    /**
     * @tc.name   selectDialogTest_0100
     * @tc.number selectDialogTest
     * @tc.desc   Test selectDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[selectDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开SelectDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('SelectDialogV2'))
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

    /**
     * @tc.name   selectDialogTest_0200
     * @tc.number selectDialogTest
     * @tc.desc   Test selectDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectDialogTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[selectDialogTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开SelectDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('SecSelectDialogV2'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开SelectDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('文本标题'));
      let content = await driver.findComponent(ON.text('文本内容'));
      let selectContent = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      expect(primaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(selectContent !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      // 关闭SelectDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[selectDialogTest_0200] END');
      done();
    });
  })
}