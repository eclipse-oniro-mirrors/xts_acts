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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorParagraphStyleTest() {
  describe('RichEditorParagraphStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorParagraphStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi23/RichEditorParagraphStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorParagraphStyleTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorParagraphStyle" == pages.name)) {
          console.info("get RichEditorParagraphStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorParagraphStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorParagraphStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorParagraphStyleTest_0010
     * @tc.number SUB_ACE_RichEditorParagraphStyleTest_0010
     * @tc.desc   test the ParagraphStyle.textDirection of RichEditor: LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorParagraphStyleTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorParagraphStyleTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('RichEditorParagraphStyle_1'));
      await richEditor1.inputText('1');
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('RichEditorParagraphStyle_get_textDirection'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('textDirection')).assertEqual("0");
      AppStorage.delete('ParagraphStyle_textDirection');
      console.info('[RichEditorParagraphStyleTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorParagraphStyleTest_0020
     * @tc.number SUB_ACE_RichEditorParagraphStyleTest_0020
     * @tc.desc   test the RichEditorTextSpanResult.strokeWidth of RichEditor: 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorParagraphStyleTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorParagraphStyleTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('RichEditorTextStyleResult_1'));
      await richEditor1.inputText('1');
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextStyleResult_strokeWidth')).assertEqual("10");
      AppStorage.delete('RichEditorTextStyleResult_strokeWidth');
      console.info('[RichEditorParagraphStyleTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorParagraphStyleTest_0030
     * @tc.number SUB_ACE_RichEditorParagraphStyleTest_0030
     * @tc.desc   test the RichEditorTextSpanResult.strokeColor of RichEditor: '#FFFF0000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorParagraphStyleTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorParagraphStyleTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('RichEditorTextStyleResult_1'));
      await richEditor1.inputText('1');
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextStyleResult_strokeColor')).assertEqual('"#FFFF0000"');
      AppStorage.delete('RichEditorTextStyleResult_strokeColor');
      console.info('[RichEditorParagraphStyleTest_0030] END');
      done();
    });
  })
}