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

export default function TextAreaAutoCapitalizationModeModifierTest() {
  describe('TextAreaAutoCapitalizationModeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaAutoCapitalizationModeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi20/TextAreaAutoCapitalizationModeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaAutoCapitalizationModeModifierTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextAreaAutoCapitalizationModeModifier" == pages.name)) {
          console.info("get TextAreaAutoCapitalizationModeModifierTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextAreaAutoCapitalizationModeModifierTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaAutoCapitalizationModeModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaAutoCapitalizationModeModifierTest after each called");
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0010
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: AutoCapitalizationMode.NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0010] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_NONE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0010] TextArea: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0020
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: AutoCapitalizationMode.WORDS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0020] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_WORDS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0020] TextArea: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.WORDS');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0020] END");
      done();
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0030
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0030
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: AutoCapitalizationMode.SENTENCES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0030] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_SENTENCES');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0030] TextArea: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.SENTENCES');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0030] END");
      done();
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0040
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0040
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: AutoCapitalizationMode.ALL_CHARACTERS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0040] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_ALL_CHARACTERS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0040] TextArea: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.ALL_CHARACTERS');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0040] END");
      done();
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0050
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0050
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0050] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0050] TextArea: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0050] END");
      done();
    });

    /**
     * @tc.name   TextAreaAutoCapitalizationModeModifierTest_0060
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaAutoCapitalizationModeModifierTest_0060
     * @tc.desc   test TextArea autoCapitalizationMode Modifier: 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaAutoCapitalizationModeModifierTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0060] START');
      let strJson = getInspectorByKey('TextArea_AutoCapitalizationModeModifier_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaAutoCapitalizationModeModifierTest_0060] TextArea: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[TextAreaAutoCapitalizationModeModifierTest_0060] END");
      done();
    });
  })
}