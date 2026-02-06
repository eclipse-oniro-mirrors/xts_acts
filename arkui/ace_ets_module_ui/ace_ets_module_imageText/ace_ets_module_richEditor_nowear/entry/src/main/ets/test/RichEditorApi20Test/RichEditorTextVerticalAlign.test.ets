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
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorTextVerticalAlignTest() {
  describe('RichEditorTextVerticalAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextVerticalAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi20/RichEditorTextVerticalAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextVerticalAlignTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextVerticalAlign" == pages.name)) {
          console.info("get RichEditorTextVerticalAlignTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorTextVerticalAlignTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextVerticalAlignTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorTextVerticalAlignTest_0010
     * @tc.number SUB_ACE_RichEditorTextVerticalAlignTest_0010
     * @tc.desc   test the attr of RichEditor: TextVerticalAlign.BASELINE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextVerticalAlignTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextVerticalAlignTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RichEditor_TextVerticalAlign_BASELINE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_input'));
      await RichEditor.inputText('666')
      await CommonFunc.sleep(1000);
      console.info('[RichEditorTextVerticalAlignTest_0010] value: ' +
        AppStorage.get('RichEditor_TextVerticalAlign_BASELINE'));
      expect(AppStorage.get('RichEditor_TextVerticalAlign_BASELINE')).assertEqual('TextVerticalAlign.BASELINE');
      AppStorage.delete('RichEditor_TextVerticalAlign_BASELINE');
      console.info('[RichEditorTextVerticalAlignTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorTextVerticalAlignTest_0020
     * @tc.number SUB_ACE_RichEditorTextVerticalAlignTest_0020
     * @tc.desc   test the attr of RichEditor: TextVerticalAlign.BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextVerticalAlignTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextVerticalAlignTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RichEditor_TextVerticalAlign_BOTTOM'));
      await button.click();
      await CommonFunc.sleep(1000);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_input'));
      await RichEditor.inputText('666')
      await CommonFunc.sleep(1000);
      console.info('[RichEditorTextVerticalAlignTest_0020] value: ' +
        AppStorage.get('RichEditor_TextVerticalAlign_BOTTOM'));
      expect(AppStorage.get('RichEditor_TextVerticalAlign_BOTTOM')).assertEqual('TextVerticalAlign.BOTTOM');
      AppStorage.delete('RichEditor_TextVerticalAlign_BOTTOM');
      console.info('[RichEditorTextVerticalAlignTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorTextVerticalAlignTest_0030
     * @tc.number SUB_ACE_RichEditorTextVerticalAlignTest_0030
     * @tc.desc   test the attr of RichEditor: TextVerticalAlign.CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextVerticalAlignTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextVerticalAlignTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RichEditor_TextVerticalAlign_CENTER'));
      await button.click();
      await CommonFunc.sleep(1000);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_input'));
      await RichEditor.inputText('666')
      await CommonFunc.sleep(1000);
      console.info('[RichEditorTextVerticalAlignTest_0030] value: ' +
        AppStorage.get('RichEditor_TextVerticalAlign_CENTER'));
      expect(AppStorage.get('RichEditor_TextVerticalAlign_CENTER')).assertEqual('TextVerticalAlign.CENTER');
      AppStorage.delete('RichEditor_TextVerticalAlign_CENTER');
      console.info('[RichEditorTextVerticalAlignTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorTextVerticalAlignTest_0040
     * @tc.number SUB_ACE_RichEditorTextVerticalAlignTest_0040
     * @tc.desc   test the attr of RichEditor: TextVerticalAlign.TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextVerticalAlignTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextVerticalAlignTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RichEditor_TextVerticalAlign_TOP'));
      await button.click();
      await CommonFunc.sleep(1000);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_input'));
      await RichEditor.inputText('666')
      await CommonFunc.sleep(1000);
      console.info('[RichEditorTextVerticalAlignTest_0040] value: ' +
        AppStorage.get('RichEditor_TextVerticalAlign_TOP'));
      expect(AppStorage.get('RichEditor_TextVerticalAlign_TOP')).assertEqual('TextVerticalAlign.TOP');
      AppStorage.delete('RichEditor_TextVerticalAlign_TOP');
      console.info('[RichEditorTextVerticalAlignTest_0040] END');
      done();
    });
  })
}