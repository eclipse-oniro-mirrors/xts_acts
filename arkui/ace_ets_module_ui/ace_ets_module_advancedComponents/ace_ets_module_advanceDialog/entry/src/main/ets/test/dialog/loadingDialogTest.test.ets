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

export default function loadingDialogTest() {
  describe('loadingDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info('loadingDialogTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/loadingDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get loadingDialogTest state pages: ' + JSON.stringify(pages));
        if (!('loadingDialogTest' == pages.name)) {
          console.info('get loadingDialogTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push loadingDialogTest page result successful');
        }
      } catch (err) {
        console.error('push loadingDialogTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('loadingDialogTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('loadingDialogTest after each called');
    })

    /**
     * @tc.number loadingDialogTest
     * @tc.name   loadingDialogTest
     * @tc.desc   Test loadingDialog
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('loadingDialogTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[loadingDialogTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开loadingDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('LoadingDialog'))
      await openAlertDialog.click();
      await driver.delayMs(1000);
      // 点击打开loadingDialog是否存在以下入口。
      let content = await driver.findComponent(ON.text('text'));
      expect(content !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[loadingDialogTest_0100] END');
      done();
    });
  })
}