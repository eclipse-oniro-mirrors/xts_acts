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

export default function TextInputEnterKeyTypeNullUndefinedTest() {
  describe('TextInputEnterKeyTypeNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("TextInputEnterKeyTypeNullUndefined beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputEnterKeyTypeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEnterKeyTypeNullUndefined state success " + JSON.stringify(pages));
        if (!("TextInputEnterKeyTypeNullUndefined" == pages.name)) {
          console.info("get TextInputEnterKeyTypeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputEnterKeyTypeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEnterKeyTypeNullUndefined page error: " + err);
      }
    });

    /**
     * @tc.name   textInputEnterKeyTypeNullUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENTERKEYTYPE_NULL_0100
     * @tc.desc   Test TextInput enterKeyType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnterKeyTypeNullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnterKeyTypeNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textInput_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_enterKeyType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnterKeyTypeNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnterKeyTypeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 (EnterKeyType.Done)
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[textInputEnterKeyTypeNullUndefined_0100] END');
    })

    /**
     * @tc.name   textInputEnterKeyTypeNullUndefined_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_ENTERKEYTYPE_NULL_0200
     * @tc.desc   Test TextInput enterKeyType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnterKeyTypeNullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[textInputEnterKeyTypeNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('textInput_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textInput_enterKeyType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnterKeyTypeNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnterKeyTypeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 (EnterKeyType.Done)
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[textInputEnterKeyTypeNullUndefined_0200] END');
    })

    /**
     * @tc.name   textInputEnterKeyTypeNullUndefined_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_ENTERKEYTYPE_PARAM_0100
     * @tc.desc   Test TextInput enterKeyType property with valid value EnterKeyType.Go
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnterKeyTypeNullUndefined_0300', Level.LEVEL2, async () => {
      console.info('[textInputEnterKeyTypeNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('textInput_enterKeyType_Go');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnterKeyTypeNullUndefined_0300] Go obj is: " + JSON.stringify(obj.$attrs));

      // EnterKeyType.Go 的值应该是 EnterKeyType.Go
      let enterKeyTypeValue: string = obj.$attrs.enterKeyType as string;
      expect(enterKeyTypeValue).assertEqual('EnterKeyType.Go');
      console.info('[textInputEnterKeyTypeNullUndefined_0300] END');
    })

    /**
     * @tc.name   textInputEnterKeyTypeNullUndefined_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_ENTERKEYTYPE_PARAM_0200
     * @tc.desc   Test TextInput enterKeyType property with valid value EnterKeyType.Search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnterKeyTypeNullUndefined_0400', Level.LEVEL2, async () => {
      console.info('[textInputEnterKeyTypeNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('textInput_enterKeyType_Search');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnterKeyTypeNullUndefined_0400] Search obj is: " + JSON.stringify(obj.$attrs));

      // EnterKeyType.Search 的值应该是 EnterKeyType.Search
      let enterKeyTypeValue: string = obj.$attrs.enterKeyType as string;
      expect(enterKeyTypeValue).assertEqual('EnterKeyType.Search');
      console.info('[textInputEnterKeyTypeNullUndefined_0400] END');
    })

    /**
     * @tc.name   textInputEnterKeyTypeNullUndefined_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_ENTERKEYTYPE_PARAM_0300
     * @tc.desc   Test TextInput enterKeyType property default value should be EnterKeyType.Done
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnterKeyTypeNullUndefined_0500', Level.LEVEL2, async () => {
      console.info('[textInputEnterKeyTypeNullUndefined_0500] START');

      let strJson: string = getInspectorByKey('textInput_enterKeyType_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnterKeyTypeNullUndefined_0500] default obj is: " + JSON.stringify(obj.$attrs));

      // 默认值应该是 EnterKeyType.Done
      let enterKeyTypeValue: string = obj.$attrs.enterKeyType as string;
      expect(enterKeyTypeValue).assertEqual('EnterKeyType.Done');
      console.info('[textInputEnterKeyTypeNullUndefined_0500] END');
    })
  })
}
