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

export default function popoverDialogTest() {
  describe('popoverDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('popoverDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogV2/popoverDialogV2TestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get popoverDialogTest state pages: ' + JSON.stringify(pages));
        if (!('popoverDialogV2TestPage' == pages.name)) {
          console.info('get popoverDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push popoverDialogTest page result successful');
        }
      } catch (err) {
        console.error('push popoverDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('popoverDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('popoverDialogTest after each called');
    })

    /**
     * @tc.name   popoverDialogTest_0100
     * @tc.number popoverDialogTest
     * @tc.desc   Test popoverDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('popoverDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[popoverDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开popoverDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('跟手弹窗目标组件'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开popoverDialog是否存在以下入口。
      let content = await driver.findComponent(ON.text('跟手弹出框'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      // 关闭popoverDialog
      await cancelButton.click();
      await driver.delayMs(1000);
      console.info('[popoverDialogTest_0100] END');
      done();
    });
  })
}