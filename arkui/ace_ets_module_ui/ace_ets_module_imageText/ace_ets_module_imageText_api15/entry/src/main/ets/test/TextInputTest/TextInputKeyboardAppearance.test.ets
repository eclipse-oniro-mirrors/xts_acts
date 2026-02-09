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


export default function TextInputKeyboardAppearanceTest() {
  describe('TextInputKeyboardAppearanceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputKeyboardAppearance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputKeyboardAppearanceTest state pages: " + JSON.stringify(pages));
        if (!("TextInputKeyboardAppearance" == pages.name)) {
          console.info("get TextInputKeyboardAppearanceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputKeyboardAppearanceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputKeyboardAppearanceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0010
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0010
     * @tc.desc   set textInput KeyboardAppearance: NONE_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_NONE_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[TextInputKeyboardAppearanceTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0020
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0020
     * @tc.desc   set textInput KeyboardAppearance: IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(1);
      console.info('[TextInputKeyboardAppearanceTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0030
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0030
     * @tc.desc   set textInput KeyboardAppearance: LIGHT_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_LIGHT_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(2);
      console.info('[TextInputKeyboardAppearanceTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0040
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0040
     * @tc.desc   set textInput KeyboardAppearance: DARK_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_DARK_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(3);
      console.info('[TextInputKeyboardAppearanceTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0050
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0050
     * @tc.desc   test default value about textInput KeyboardAppearance: NONE_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0050] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0050] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[TextInputKeyboardAppearanceTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextInputKeyboardAppearanceTest_0060
     * @tc.number SUB_ACE_TextInput_KeyboardAppearanceTest_0060
     * @tc.desc   test Illegal value about textInput KeyboardAppearance: UNDEFINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputKeyboardAppearanceTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TextInputKeyboardAppearance_UNDEFINED');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputKeyboardAppearanceTest_0060] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[TextInputKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

