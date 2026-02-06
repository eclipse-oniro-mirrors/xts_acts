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

export default function RichEditorGetCaretRectTest() {
  describe('RichEditorGetCaretRectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorGetCaretRectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorGetCaretRect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorGetCaretRectTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorGetCaretRect" == pages.name)) {
          console.info("get RichEditorGetCaretRectTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorGetCaretRectTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorGetCaretRectTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorGetCaretRectTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_RichEditor_GetCaretRect_0010
    * @tc.name         RichEditorGetCaretRectTest_0010
    * @tc.desc        test return value of getCaretRect: undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
    */
    it('RichEditorGetCaretRectTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('RichEditorGetCaretRectTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('getCaretRect_return'))
      await CommonFunc.sleep(500);
      await Button.click();
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetCaretRectTest_0010] click succ");
      console.info("[RichEditorGetCaretRectTest_0010] return: " + AppStorage.get('getCaretRect_return'));
      expect(AppStorage.get('getCaretRect_return')).assertEqual(undefined);
      AppStorage.delete('getCaretRect_return')
      console.info("[RichEditorGetCaretRectTest_0010] end");
      done();
    });
  })
}