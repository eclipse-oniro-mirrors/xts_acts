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

export default function TextInputAutoCapitalizationModeModifierTest() {
  describe('TextInputAutoCapitalizationModeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputAutoCapitalizationModeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputAutoCapitalizationModeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputAutoCapitalizationModeModifierTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextInputAutoCapitalizationModeModifier" == pages.name)) {
          console.info("get TextInputAutoCapitalizationModeModifierTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextInputAutoCapitalizationModeModifierTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputAutoCapitalizationModeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputAutoCapitalizationModeModifierTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0010
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0010
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: AutoCapitalizationMode.NONE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0010] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_NONE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0010] TextInput: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0010] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0020
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0020
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: AutoCapitalizationMode.WORDS
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0020] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_WORDS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0020] TextInput: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.WORDS');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0020] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0030
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0030
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: AutoCapitalizationMode.SENTENCES
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0030] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_SENTENCES');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0030] TextInput: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.SENTENCES');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0030] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0040
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0040
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: AutoCapitalizationMode.ALL_CHARACTERS
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0040] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_ALL_CHARACTERS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0040] TextInput: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.ALL_CHARACTERS');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0040] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0050
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0050
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0050] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0050] TextInput: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0050] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_TextInputAutoCapitalizationModeModifierTest_0060
    * @tc.name         TextInputAutoCapitalizationModeModifierTest_0060
    * @tc.desc         test TextInput autoCapitalizationMode Modifier: 0
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('TextInputAutoCapitalizationModeModifierTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputAutoCapitalizationModeModifierTest_0060] START');
      let strJson = getInspectorByKey('TextInput_AutoCapitalizationModeModifier_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputAutoCapitalizationModeModifierTest_0060] TextInput: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextInputAutoCapitalizationModeModifierTest_0060] END");
      done();
    });
  })
}