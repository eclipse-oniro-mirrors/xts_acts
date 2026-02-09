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
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorKeyboardAppearanceTest() {
  describe('RichEditorKeyboardAppearanceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi15/RichEditorKeyboardAppearance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorKeyboardAppearanceTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorKeyboardAppearance" == pages.name)) {
          console.info("get RichEditorKeyboardAppearanceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorKeyboardAppearanceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorKeyboardAppearanceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0010
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0010
     * @tc.desc   set RichEditor keyboardAppearance: NONE_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_NONE_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0020
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0020
     * @tc.desc   set RichEditor keyboardAppearance: IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(1);
      console.info('[RichEditorKeyboardAppearanceTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0030
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0030
     * @tc.desc   set RichEditor keyboardAppearance: LIGHT_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_LIGHT_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(2);
      console.info('[RichEditorKeyboardAppearanceTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0040
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0040
     * @tc.desc   set RichEditor keyboardAppearance: DARK_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_DARK_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(3);
      console.info('[RichEditorKeyboardAppearanceTest_0040] END');
      done();
    });

    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0050
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0050
     * @tc.desc   test default value about RichEditor keyboardAppearance: NONE_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0050] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0050] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0050] END');
      done();
    });

    /**
     * @tc.name   RichEditorKeyboardAppearanceTest_0060
     * @tc.number SUB_ACE_RichEditor_KeyboardAppearanceTest_0060
     * @tc.desc   test Illegal value about RichEditor keyboardAppearance: UNDEFINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorKeyboardAppearanceTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditor_KeyboardAppearance_UNDEFINED');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorKeyboardAppearanceTest_0060] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[RichEditorKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

