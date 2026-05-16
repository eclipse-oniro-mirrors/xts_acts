/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';

export default function TextInputEnableKeyboardOnFocusNullUndefinedTest() {
  describe('TextInputEnableKeyboardOnFocusNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputEnableKeyboardOnFocusNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEnableKeyboardOnFocusNullUndefined state success " + JSON.stringify(pages));
        if (!("TextInputEnableKeyboardOnFocusNullUndefined" == pages.name)) {
          console.info("get TextInputEnableKeyboardOnFocusNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputEnableKeyboardOnFocusNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEnableKeyboardOnFocusNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   textInputEnableKeyboardOnFocusNullUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_NULL_0100
     * @tc.desc   Test TextInput enableKeyboardOnFocus property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableKeyboardOnFocusNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textInput_enableKeyboardOnFocus_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_enableKeyboardOnFocus_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (TV设备为false，其他设备为true)
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual(objCompare.$attrs.enableKeyboardOnFocus);
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0100] END');
    })

    /**
     * @tc.name   textInputEnableKeyboardOnFocusNullUndefined_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_NULL_0200
     * @tc.desc   Test TextInput enableKeyboardOnFocus property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableKeyboardOnFocusNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('textInput_enableKeyboardOnFocus_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_enableKeyboardOnFocus_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (TV设备为false，其他设备为true)
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual(objCompare.$attrs.enableKeyboardOnFocus);
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0200] END');
    })

    /**
     * @tc.name   textInputEnableKeyboardOnFocusNullUndefined_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_PARAM_0100
     * @tc.desc   Test TextInput enableKeyboardOnFocus property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableKeyboardOnFocusNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('textInput_enableKeyboardOnFocus_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0300] true obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('TextInput');
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0300] END');
    })

    /**
     * @tc.name   textInputEnableKeyboardOnFocusNullUndefined_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEKEYBOARDONFOCUS_PARAM_0200
     * @tc.desc   Test TextInput enableKeyboardOnFocus property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableKeyboardOnFocusNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('textInput_enableKeyboardOnFocus_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableKeyboardOnFocusNullUndefined_0400] false obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('TextInput');
      console.info('[textInputEnableKeyboardOnFocusNullUndefined_0400] END');
    })

  })
}
