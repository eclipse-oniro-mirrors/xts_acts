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


export default function RichEditorCompressLeadingPunctuationTest() {
  describe('RichEditorCompressLeadingPunctuationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCompressLeadingPunctuationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi23/RichEditorCompressLeadingPunctuation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCompressLeadingPunctuationTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorCompressLeadingPunctuation" == pages.name)) {
          console.info("get RichEditorCompressLeadingPunctuationTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorCompressLeadingPunctuationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCompressLeadingPunctuationTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorCompressLeadingPunctuationTest_0010
     * @tc.number SUB_ACE_RichEditorCompressLeadingPunctuationTest_0010
     * @tc.desc   test the compressLeadingPunctuation of RichEditor: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorCompressLeadingPunctuationTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorCompressLeadingPunctuationTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_compressLeadingPunctuation');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.compressLeadingPunctuation);
      console.info("[RichEditorCompressLeadingPunctuationTest_0010] obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj).assertEqual(false);
      console.info('[RichEditorCompressLeadingPunctuationTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorCompressLeadingPunctuationTest_0020
     * @tc.number SUB_ACE_RichEditorCompressLeadingPunctuationTest_0020
     * @tc.desc   test the compressLeadingPunctuation of RichEditor: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorCompressLeadingPunctuationTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorCompressLeadingPunctuationTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('RichEditor_compressLeadingPunctuation_true'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_compressLeadingPunctuation');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.compressLeadingPunctuation);
      console.info("[RichEditorCompressLeadingPunctuationTest_0020] obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj).assertEqual(true);
      console.info('[RichEditorCompressLeadingPunctuationTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorCompressLeadingPunctuationTest_0030
     * @tc.number SUB_ACE_RichEditorCompressLeadingPunctuationTest_0030
     * @tc.desc   test the compressLeadingPunctuation of RichEditor: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorCompressLeadingPunctuationTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorCompressLeadingPunctuationTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('RichEditor_compressLeadingPunctuation_false'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_compressLeadingPunctuation');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.compressLeadingPunctuation);
      console.info("[RichEditorCompressLeadingPunctuationTest_0030] obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj).assertEqual(false);
      console.info('[RichEditorCompressLeadingPunctuationTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorCompressLeadingPunctuationTest_0040
     * @tc.number SUB_ACE_RichEditorCompressLeadingPunctuationTest_0040
     * @tc.desc   test the compressLeadingPunctuation of RichEditor: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorCompressLeadingPunctuationTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorCompressLeadingPunctuationTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('RichEditor_compressLeadingPunctuation_null'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_compressLeadingPunctuation');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.compressLeadingPunctuation);
      console.info("[RichEditorCompressLeadingPunctuationTest_0040] obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj).assertEqual(false);
      console.info('[RichEditorCompressLeadingPunctuationTest_0040] END');
      done();
    });
  })
}