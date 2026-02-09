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

export default function tipsDialogTest() {
  describe('tipsDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('tipsDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/tipsDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get tipsDialogTest state pages: ' + JSON.stringify(pages));
        if (!('tipsDialogTest' == pages.name)) {
          console.info('get tipsDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push tipsDialogTest page result successful');
        }
      } catch (err) {
        console.error('push tipsDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('tipsDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('tipsDialogTest after each called');
    })

    /**
     * @tc.number tipsDialogTest_0100
     * @tc.name   tipsDialogTest
     * @tc.desc   Test tipsDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('tipsDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[tipsDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开TipsDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialog'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开TipsDialog是否存在以下入口。
      let content = await driver.findComponent(ON.text('想要卸载这个APP嘛?'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭TipsDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[tipsDialogTest_0100] END');
      done();
    });

    /**
     * @tc.number tipsDialogTest_0200
     * @tc.name   tipsDialogTest
     * @tc.desc   Test tipsDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('tipsDialogTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[tipsDialogTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开TipsDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialogTitle'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开TipsDialog是否存在以下入口。
      let title = await driver.findComponent(ON.text('TipsDialog'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
      expect(title !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭TipsDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[tipsDialogTest_0200] END');
      done();
    });

    /**
     * @tc.number tipsDialogTest_0300
     * @tc.name   tipsDialogTest
     * @tc.desc   Test tipsDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('tipsDialogTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[tipsDialogTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开TipsDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialogTips'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开TipsDialog是否存在以下入口。
      let checkTips = await driver.findComponent(ON.text('checkTips'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
      expect(checkTips !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭TipsDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[tipsDialogTest_0300] END');
      done();
    });
  })
}