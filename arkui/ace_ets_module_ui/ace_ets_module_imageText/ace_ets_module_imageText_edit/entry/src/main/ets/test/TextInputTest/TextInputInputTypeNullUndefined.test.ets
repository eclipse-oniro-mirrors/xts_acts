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

export default function TextInputInputTypeNullUndefinedTest() {
  describe('TextInputInputTypeNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("TextInputInputTypeNullUndefined beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputInputTypeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputInputTypeNullUndefined state success " + JSON.stringify(pages));
        if (!("TextInputInputTypeNullUndefined" == pages.name)) {
          console.info("get TextInputInputTypeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputInputTypeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputInputTypeNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   textInputInputTypeNullUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_NULL_0100
     * @tc.desc   Test TextInput InputType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textInput_InputType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_InputType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputInputTypeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (InputType.Normal)
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[textInputInputTypeNullUndefined_0100] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_NULL_0200
     * @tc.desc   Test TextInput InputType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('textInput_InputType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_InputType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputInputTypeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (InputType.Normal)
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[textInputInputTypeNullUndefined_0200] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_PARAM_0100
     * @tc.desc   Test TextInput InputType property with InputType.NUMBER_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('textInput_InputType_NUMBER_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0300] NUMBER_PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NUMBER_PASSWORD 的值应该是 'InputType.NUMBER_PASSWORD'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NUMBER_PASSWORD');
      console.info('[textInputInputTypeNullUndefined_0300] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_PARAM_0200
     * @tc.desc   Test TextInput InputType property with InputType.USER_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('textInput_InputType_USER_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0400] USER_NAME obj is: " + JSON.stringify(obj.$attrs));

      // InputType.USER_NAME 的值应该是 'InputType.USER_NAME'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.USER_NAME');
      console.info('[textInputInputTypeNullUndefined_0400] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_PARAM_0300
     * @tc.desc   Test TextInput InputType property with InputType.NEW_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0500', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0500] START');

      let strJson: string = getInspectorByKey('textInput_InputType_NEW_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0500] NEW_PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NEW_PASSWORD 的值应该是 'InputType.NEW_PASSWORD'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NEW_PASSWORD');
      console.info('[textInputInputTypeNullUndefined_0500] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0600
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_PARAM_0400
     * @tc.desc   Test TextInput InputType property with InputType.NUMBER_DECIMAL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0600', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0600] START');

      let strJson: string = getInspectorByKey('textInput_InputType_NUMBER_DECIMAL');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0600] NUMBER_DECIMAL obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NUMBER_DECIMAL 的值应该是 'InputType.NUMBER_DECIMAL'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NUMBER_DECIMAL');
      console.info('[textInputInputTypeNullUndefined_0600] END');
    })

    /**
     * @tc.name   textInputInputTypeNullUndefined_0700
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTTYPE_PARAM_0500
     * @tc.desc   Test TextInput InputType property default value should be InputType.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputTypeNullUndefined_0700', Level.LEVEL2, async () => {
      console.info('[textInputInputTypeNullUndefined_0700] START');

      let strJson: string = getInspectorByKey('textInput_InputType_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputTypeNullUndefined_0700] default obj is: " + JSON.stringify(obj.$attrs));

      // 默认值应该是 InputType.Normal
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Normal');
      console.info('[textInputInputTypeNullUndefined_0700] END');
    })
  })
}
