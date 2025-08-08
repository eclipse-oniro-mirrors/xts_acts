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

export default function TextStyleSuperscriptTest() {
  describe('TextStyleSuperscriptTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyleSuperscriptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/TextStyleSuperscript',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyleSuperscriptTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextStyleSuperscript" == pages.name)) {
          console.info("get TextStyleSuperscriptTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextStyleSuperscriptTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyleSuperscriptTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyleSuperscriptTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextStyleSuperscriptTest_0010
    * @tc.name         TextStyleSuperscriptTest_0010
    * @tc.desc         test TextStyle superscript: SuperscriptStyle.NORMAL
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextStyleSuperscriptTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextStyleSuperscriptTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await getObj.click();
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_0010] superscript: ' + AppStorage.get('TextStyle_superscript_0'));
      expect(AppStorage.get('TextStyle_superscript_0')).assertEqual('SuperscriptStyle.NORMAL');
      console.info("[TextStyleSuperscriptTest_0010] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextStyleSuperscriptTest_0020
    * @tc.name         TextStyleSuperscriptTest_0020
    * @tc.desc         test TextStyle superscript: SuperscriptStyle.SUPERSCRIPT
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextStyleSuperscriptTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextStyleSuperscriptTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await getObj.click();
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_0010] superscript: ' + AppStorage.get('TextStyle_superscript_1'));
      expect(AppStorage.get('TextStyle_superscript_1')).assertEqual('SuperscriptStyle.SUPERSCRIPT');
      console.info("[TextStyleSuperscriptTest_0020] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextStyleSuperscriptTest_0030
    * @tc.name         TextStyleSuperscriptTest_0030
    * @tc.desc         test TextStyle superscript: SuperscriptStyle.SUBSCRIPT
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextStyleSuperscriptTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextStyleSuperscriptTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('get_superscript'))
      await getObj.click();
      await CommonFunc.sleep(1000);
      console.info('[TextStyleSuperscriptTest_0030] superscript: ' + AppStorage.get('TextStyle_superscript_1'));
      expect(AppStorage.get('TextStyle_superscript_2')).assertEqual('SuperscriptStyle.SUBSCRIPT');
      console.info("[TextStyleSuperscriptTest_0030] END");
      done();
    });
  })
}