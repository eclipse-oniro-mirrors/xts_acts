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

export default function ResourceNormalTest() {
  describe('ResourceNormalTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceNormalTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/ResourceNormal',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceNormalTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("ResourceNormal" == pages.name)) {
          console.info("get ResourceNormalTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ResourceNormalTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceNormalTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ResourceNormalTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         ResourceNormalTest_0010
    * @tc.desic        set Resource
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('ResourceNormalTest_0010', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ResourceNormalTest_0010 START');
      let getObj = await driver.findComponent(ON.id('getObj_Resource'))
      await CommonFunc.sleep(500);
      await getObj.click();
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('RichEditorValue')).assertEqual('RichEditor_addTextSpan_two');
      expect(''+AppStorage.get('TextLetterSpacing')).assertEqual('0.00vp');
      expect(''+AppStorage.get('TextBaselineOffset')).assertEqual('0');
      expect(''+AppStorage.get('TextFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get('TextInputFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get('TextAreaFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get('SpanLetterSpacing')).assertEqual('0.00vp');
      expect(''+AppStorage.get('SpanFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get('SearchSearchButton')).assertEqual('Search_Test');
      expect(''+AppStorage.get('SearchValue')).assertEqual('创建搜索组件');
      AppStorage.delete('RichEditorValue');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      AppStorage.delete('SearchValue');
      console.info("[ResourceNormalTest_0010] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         ResourceNormalTest0002
    * @tc.desic        set Resource
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('ResourceNormalTest_0020', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ResourceNormalTest_0020 START');
      let change = await driver.findComponent(ON.id('change_Resource'));
      await CommonFunc.sleep(500);
      await change.click();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('getObj_Resource'));
      await CommonFunc.sleep(500);
      await getObj.click();
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('RichEditorValue')).assertEqual('创建不使用属性字符串构建的RichEditor组件.');
      expect(''+AppStorage.get('TextLetterSpacing')).assertEqual('0.00px');
      expect(''+AppStorage.get('TextBaselineOffset')).assertEqual('0');
      expect(''+AppStorage.get('TextFontWeight')).assertEqual('400');
      expect(''+AppStorage.get('TextInputFontWeight')).assertEqual('400');
      expect(''+AppStorage.get('TextAreaFontWeight')).assertEqual('400');
      expect(''+AppStorage.get('SpanLetterSpacing')).assertEqual('0.00px');
      expect(''+AppStorage.get('SpanFontWeight')).assertEqual('400');
      expect(''+AppStorage.get('SearchSearchButton')).assertEqual('搜索');
      expect(''+AppStorage.get('SearchValue')).assertEqual('Search');
      AppStorage.delete('RichEditorValue');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      AppStorage.delete('SearchValue');
      console.info("[ResourceNormalTest_0020] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         ResourceNormalTest_0030
    * @tc.desic        set Resource
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('ResourceNormalTest_0030', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ResourceNormalTest_0030 START');
      let change = await driver.findComponent(ON.id('change_Resource'));
      await CommonFunc.sleep(500);
      await change.click();
      await CommonFunc.sleep(500);
      await change.click();
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('getObj_Resource'));
      await CommonFunc.sleep(500);
      await getObj.click();
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('RichEditorValue')).assertEqual('10000000000.000000');
      expect(''+AppStorage.get('TextLetterSpacing')).assertEqual('20.00vp');
      expect(''+AppStorage.get('TextBaselineOffset')).assertEqual('50');
      expect(''+AppStorage.get('TextFontWeight')).assertEqual('900');
      expect(''+AppStorage.get('TextInputFontWeight')).assertEqual('900');
      expect(''+AppStorage.get('TextAreaFontWeight')).assertEqual('900');
      expect(''+AppStorage.get('SpanLetterSpacing')).assertEqual('20.00vp');
      expect(''+AppStorage.get('SpanFontWeight')).assertEqual('900');
      expect(''+AppStorage.get('SearchSearchButton')).assertEqual('100.000000');
      expect(''+AppStorage.get('SearchValue')).assertEqual('');
      AppStorage.delete('RichEditorValue');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      AppStorage.delete('SearchValue');
      console.info("[ResourceNormalTest_0030] end");
      done();
    });
  })
}