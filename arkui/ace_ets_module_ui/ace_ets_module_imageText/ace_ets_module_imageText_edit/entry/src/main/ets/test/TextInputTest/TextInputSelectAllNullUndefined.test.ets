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

export default function TextInputSelectAllNullUndefinedTest() {
  describe('TextInputSelectAllNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("TextInputSelectAllNullUndefined beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputSelectAllNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputSelectAllNullUndefined state success " + JSON.stringify(pages));
        if (!("TextInputSelectAllNullUndefined" == pages.name)) {
          console.info("get TextInputSelectAllNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputSelectAllNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputSelectAllNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   textInputSelectAllNullUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTALL_NULL_0100
     * @tc.desc   Test TextInput selectAll property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectAllNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputSelectAllNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textInput_selectAll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_selectAll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectAllNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectAllNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (false)
      expect(obj.$attrs.selectAll).assertEqual(objCompare.$attrs.selectAll);
      console.info('[textInputSelectAllNullUndefined_0100] END');
    })

    /**
     * @tc.name   textInputSelectAllNullUndefined_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTALL_NULL_0200
     * @tc.desc   Test TextInput selectAll property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectAllNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[textInputSelectAllNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('textInput_selectAll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_selectAll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectAllNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectAllNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (false)
      expect(obj.$attrs.selectAll).assertEqual(objCompare.$attrs.selectAll);
      console.info('[textInputSelectAllNullUndefined_0200] END');
    })

    /**
     * @tc.name   textInputSelectAllNullUndefined_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTALL_PARAM_0100
     * @tc.desc   Test TextInput selectAll property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectAllNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[textInputSelectAllNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('textInput_selectAll_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectAllNullUndefined_0300] true obj is: " + JSON.stringify(obj.$attrs));

      // selectAll 设置为 true
      let selectAllValue: string = obj.$attrs.selectAll as string;
      expect(selectAllValue).assertEqual(true);
      console.info('[textInputSelectAllNullUndefined_0300] END');
    })

    /**
     * @tc.name   textInputSelectAllNullUndefined_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTALL_PARAM_0200
     * @tc.desc   Test TextInput selectAll property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectAllNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[textInputSelectAllNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('textInput_selectAll_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectAllNullUndefined_0400] false obj is: " + JSON.stringify(obj.$attrs));

      // selectAll 设置为 false
      let selectAllValue: string = obj.$attrs.selectAll as string;
      expect(selectAllValue).assertEqual(false);
      console.info('[textInputSelectAllNullUndefined_0400] END');
    })

    /**
     * @tc.name   textInputSelectAllNullUndefined_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTALL_PARAM_0300
     * @tc.desc   Test TextInput selectAll property default value should be false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectAllNullUndefined_0500', Level.LEVEL2, async () => {
      console.info('[textInputSelectAllNullUndefined_0500] START');

      let strJson: string = getInspectorByKey('textInput_selectAll_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectAllNullUndefined_0500] default obj is: " + JSON.stringify(obj.$attrs));

      // 默认值应该是 false
      let selectAllValue: string = obj.$attrs.selectAll as string;
      expect(selectAllValue).assertEqual(false);
      console.info('[textInputSelectAllNullUndefined_0500] END');
    })
  })
}
