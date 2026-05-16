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

export default function TextInputTypeParamTest() {
  describe('TextInputTypeParamTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputTypeParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputTypeParamTest state success " + JSON.stringify(pages));
        if (!("TextInputTypeParam" == pages.name)) {
          console.info("get TextInputTypeParamTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputTypeParamTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputTypeParamTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextInputTypeParamTest after each called");
    });

    /**
     * @tc.name   textInputTypeParam_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0100
     * @tc.desc   Test TextInput type property default value should be InputType.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0100', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0100] START');

      let strJson: string = getInspectorByKey('TextInput_type_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0100] default obj is: " + JSON.stringify(obj.$attrs));

      // 默认值应该是 InputType.Normal
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Normal');
      console.info('[textInputTypeParam_0100] END');
    })

    /**
     * @tc.name   textInputTypeParam_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_NULL_0100
     * @tc.desc   Test TextInput type property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0200', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0200] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_type_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_type_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTypeParam_0200] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (InputType.Normal)
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[textInputTypeParam_0200] END');
    })

    /**
     * @tc.name   textInputTypeParam_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_UNDEFINED_0100
     * @tc.desc   Test TextInput type property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0300', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0300] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_type_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_type_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0300] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTypeParam_0300] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (InputType.Normal)
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[textInputTypeParam_0300] END');
    })

    /**
     * @tc.name   textInputTypeParam_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0200
     * @tc.desc   Test TextInput type property with InputType.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0400', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0400] START');

      let strJson: string = getInspectorByKey('TextInput_type_Normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0400] Normal obj is: " + JSON.stringify(obj.$attrs));

      // InputType.Normal 的值应该是 'InputType.Normal'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Normal');
      console.info('[textInputTypeParam_0400] END');
    })

    /**
     * @tc.name   textInputTypeParam_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0300
     * @tc.desc   Test TextInput type property with InputType.Number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0500', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0500] START');

      let strJson: string = getInspectorByKey('TextInput_type_Number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0500] Number obj is: " + JSON.stringify(obj.$attrs));

      // InputType.Number 的值应该是 'InputType.Number'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Number');
      console.info('[textInputTypeParam_0500] END');
    })

    /**
     * @tc.name   textInputTypeParam_0600
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0400
     * @tc.desc   Test TextInput type property with InputType.PhoneNumber
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0600', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0600] START');

      let strJson: string = getInspectorByKey('TextInput_type_PhoneNumber');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0600] PhoneNumber obj is: " + JSON.stringify(obj.$attrs));

      // InputType.PhoneNumber 的值应该是 'InputType.PhoneNumber'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.PhoneNumber');
      console.info('[textInputTypeParam_0600] END');
    })

    /**
     * @tc.name   textInputTypeParam_0700
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0500
     * @tc.desc   Test TextInput type property with InputType.Email
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0700', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0700] START');

      let strJson: string = getInspectorByKey('TextInput_type_Email');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0700] Email obj is: " + JSON.stringify(obj.$attrs));

      // InputType.Email 的值应该是 'InputType.Email'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Email');
      console.info('[textInputTypeParam_0700] END');
    })

    /**
     * @tc.name   textInputTypeParam_0800
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0600
     * @tc.desc   Test TextInput type property with InputType.Password
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0800', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0800] START');

      let strJson: string = getInspectorByKey('TextInput_type_Password');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0800] Password obj is: " + JSON.stringify(obj.$attrs));

      // InputType.Password 的值应该是 'InputType.Password'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.Password');
      console.info('[textInputTypeParam_0800] END');
    })

    /**
     * @tc.name   textInputTypeParam_0900
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0700
     * @tc.desc   Test TextInput type property with InputType.NUMBER_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_0900', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_0900] START');

      let strJson: string = getInspectorByKey('TextInput_type_NUMBER_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_0900] NUMBER_PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NUMBER_PASSWORD 的值应该是 'InputType.NUMBER_PASSWORD'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NUMBER_PASSWORD');
      console.info('[textInputTypeParam_0900] END');
    })

    /**
     * @tc.name   textInputTypeParam_1000
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0800
     * @tc.desc   Test TextInput type property with InputType.USER_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_1000', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_1000] START');

      let strJson: string = getInspectorByKey('TextInput_type_USER_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_1000] USER_NAME obj is: " + JSON.stringify(obj.$attrs));

      // InputType.USER_NAME 的值应该是 'InputType.USER_NAME'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.USER_NAME');
      console.info('[textInputTypeParam_1000] END');
    })

    /**
     * @tc.name   textInputTypeParam_1100
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_0900
     * @tc.desc   Test TextInput type property with InputType.NEW_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_1100', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_1100] START');

      let strJson: string = getInspectorByKey('TextInput_type_NEW_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_1100] NEW_PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NEW_PASSWORD 的值应该是 'InputType.NEW_PASSWORD'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NEW_PASSWORD');
      console.info('[textInputTypeParam_1100] END');
    })

    /**
     * @tc.name   textInputTypeParam_1200
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_1000
     * @tc.desc   Test TextInput type property with InputType.NUMBER_DECIMAL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_1200', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_1200] START');

      let strJson: string = getInspectorByKey('TextInput_type_NUMBER_DECIMAL');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_1200] NUMBER_DECIMAL obj is: " + JSON.stringify(obj.$attrs));

      // InputType.NUMBER_DECIMAL 的值应该是 'InputType.NUMBER_DECIMAL'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.NUMBER_DECIMAL');
      console.info('[textInputTypeParam_1200] END');
    })

    /**
     * @tc.name   textInputTypeParam_1300
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_1100
     * @tc.desc   Test TextInput type property with InputType.URL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_1300', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_1300] START');

      let strJson: string = getInspectorByKey('TextInput_type_URL');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_1300] URL obj is: " + JSON.stringify(obj.$attrs));

      // InputType.URL 的值应该是 'InputType.URL'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.URL');
      console.info('[textInputTypeParam_1300] END');
    })

    /**
     * @tc.name   textInputTypeParam_1400
     * @tc.number SUB_ARKUI_TEXTINPUT_TYPE_PARAM_1200
     * @tc.desc   Test TextInput type property with InputType.ONE_TIME_CODE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTypeParam_1400', Level.LEVEL2, async () => {
      console.info('[textInputTypeParam_1400] START');

      let strJson: string = getInspectorByKey('TextInput_type_ONE_TIME_CODE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTypeParam_1400] ONE_TIME_CODE obj is: " + JSON.stringify(obj.$attrs));

      // InputType.ONE_TIME_CODE 的值应该是 'InputType.ONE_TIME_CODE'
      let typeValue: string = obj.$attrs.type as string;
      expect(typeValue).assertEqual('InputType.ONE_TIME_CODE');
      console.info('[textInputTypeParam_1400] END');
    })
  })
}
