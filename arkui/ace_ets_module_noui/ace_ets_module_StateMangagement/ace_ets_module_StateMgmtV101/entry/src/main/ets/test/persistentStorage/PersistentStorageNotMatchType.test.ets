/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';



export default function PersistentStorageNotMatchTypeTest() {
  describe('PersistentStorageNotMatchTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PersistentStorageNotMatchTypeTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/persistentStorage/PersistentStorageNotMatchType",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistentStorageNotMatchType" == pages.name)) {
          console.info("get PersistentStorageNotMatchTypeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistentStorageNotMatchTypeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentStorageNotMatchTypeTest page error:" + err);
      }
      console.info("PersistentStorageNotMatchTypeTest beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'PersistentStorageNotMatchTypeTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'PersistentStorageNotMatchTypeTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   PersistentStorageNotMatchType_initial_001
     * @tc.number SUB_ARKUI_PERSISTENTSTSTORAGE_NOTMATCHTYPE_PARAM_001
     * @tc.desc   Test PersistentStorage persistProp with type mismatch - initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('PersistentStorageNotMatchType_initial_001', Level.LEVEL0, async () => {
      console.info('[PersistentStorageNotMatchType_initial_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      try {
        const button1 = await driver.findComponent(ON.id('button_set_array'));
        if (button1) {
          button1.click()
          await CommonFunc.sleep(1000)
        }
        let text_0 = await (await driver.findComponent(ON.id('button_set_array'))).getText();
        expect(text_0).assertEqual('[1,2]')

        const button2 = await driver.findComponent(ON.id('button_set_custom_class'));
        if (button2) {
          button2.click()
          await CommonFunc.sleep(1000)
        }
        let text_1 = await (await driver.findComponent(ON.id('button_set_custom_class'))).getText();
        expect(text_1).assertEqual('{"n1":0}')
        AppStorage.delete("Page1")
        await CommonFunc.sleep(1000)
      } catch (err) {

        expect().assertFail();
      }
    });

  });
}