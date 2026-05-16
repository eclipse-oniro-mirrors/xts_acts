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

export default function TextInputSelectionMenuHiddenNullUndefinedTest() {
  describe('TextInputSelectionMenuHiddenNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("TextInputSelectionMenuHiddenNullUndefined beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputSelectionMenuHiddenNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputSelectionMenuHiddenNullUndefined state success " + JSON.stringify(pages));
        if (!("TextInputSelectionMenuHiddenNullUndefined" == pages.name)) {
          console.info("get TextInputSelectionMenuHiddenNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputSelectionMenuHiddenNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputSelectionMenuHiddenNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   textInputSelectionMenuHiddenNullUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTIONMENUHIDDEN_NULL_0100
     * @tc.desc   Test TextInput selectionMenuHidden property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectionMenuHiddenNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputSelectionMenuHiddenNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textInput_selectionMenuHidden_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_selectionMenuHidden_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectionMenuHiddenNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectionMenuHiddenNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (false)
      expect(obj.$attrs.selectionMenuHidden).assertEqual(objCompare.$attrs.selectionMenuHidden);
      console.info('[textInputSelectionMenuHiddenNullUndefined_0100] END');
    })

    /**
     * @tc.name   textInputSelectionMenuHiddenNullUndefined_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTIONMENUHIDDEN_NULL_0200
     * @tc.desc   Test TextInput selectionMenuHidden property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectionMenuHiddenNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[textInputSelectionMenuHiddenNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('textInput_selectionMenuHidden_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_selectionMenuHidden_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectionMenuHiddenNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectionMenuHiddenNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (false)
      expect(obj.$attrs.selectionMenuHidden).assertEqual(objCompare.$attrs.selectionMenuHidden);
      console.info('[textInputSelectionMenuHiddenNullUndefined_0200] END');
    })

    /**
     * @tc.name   textInputSelectionMenuHiddenNullUndefined_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTIONMENUHIDDEN_PARAM_0100
     * @tc.desc   Test TextInput selectionMenuHidden property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectionMenuHiddenNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[textInputSelectionMenuHiddenNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('textInput_selectionMenuHidden_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectionMenuHiddenNullUndefined_0300] true obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('TextInput');
      console.info('[textInputSelectionMenuHiddenNullUndefined_0300] END');
    })

    /**
     * @tc.name   textInputSelectionMenuHiddenNullUndefined_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTIONMENUHIDDEN_PARAM_0200
     * @tc.desc   Test TextInput selectionMenuHidden property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectionMenuHiddenNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[textInputSelectionMenuHiddenNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('textInput_selectionMenuHidden_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectionMenuHiddenNullUndefined_0400] false obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('TextInput');
      console.info('[textInputSelectionMenuHiddenNullUndefined_0400] END');
    })
  })
}
