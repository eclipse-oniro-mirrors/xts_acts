/*
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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function RichEditorFromStyledStringTest() {
  describe('RichEditorFromStyledStringTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorFromStyledStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorFromStyledString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorFromStyledStringTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorFromStyledString" == pages.name)) {
          console.info("get RichEditorFromStyledStringTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorFromStyledStringTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorFromStyledStringTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorFromStyledStringTest after each called");
    });

    /**
     * @tc.name   RichEditorFromStyledStringTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditor_FromStyledString_0010
     * @tc.desc   test return value of fromStyledString: Not empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RichEditorFromStyledStringTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorFromStyledStringTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('fromStyledString_return_1'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorFromStyledStringTest_0010] click succ");
      console.info("[RichEditorFromStyledStringTest_0010] return: " + AppStorage.get('fromStyledString_return_1'));
      expect(Number(AppStorage.get('fromStyledString_return_1')) > 0).assertTrue();
      AppStorage.delete('fromStyledString_return_1')
      console.info("[RichEditorFromStyledStringTest_0010] end");
      done();
    });
  })
}