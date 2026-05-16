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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function HyperlinkPropertiesNullUndefinedTest() {
  describe('HyperlinkPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hyperlink/HyperlinkPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HyperlinkPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("HyperlinkPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get HyperlinkPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push HyperlinkPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HyperlinkPropertiesNullUndefinedTest page error: " + err);
      }
    });

    /**
     * @tc.name   hyperlinkColor_null_0100
     * @tc.number SUB_ARKUI_HYPERLINK_COLOR_NULL_0100
     * @tc.desc   Test Hyperlink color property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('hyperlinkColor_null_0100', Level.LEVEL0, async () => {
      console.info('[hyperlinkColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Hyperlink_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Hyperlink_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[hyperlinkColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[hyperlinkColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[hyperlinkColor_null_0100] default color is: " + objCompare.$attrs.color);
      console.info("[hyperlinkColor_null_0100] null color is: " + obj.$attrs.color);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.color as string;
      let nullColor: string = obj.$attrs.color as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[hyperlinkColor_null_0100] END');
    })

    /**
     * @tc.name   hyperlinkColor_undefined_0100
     * @tc.number SUB_ARKUI_HYPERLINK_COLOR_UNDEFINED_0100
     * @tc.desc   Test Hyperlink color property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('hyperlinkColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[hyperlinkColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Hyperlink_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Hyperlink_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[hyperlinkColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[hyperlinkColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[hyperlinkColor_undefined_0100] default color is: " + objCompare.$attrs.color);
      console.info("[hyperlinkColor_undefined_0100] undefined color is: " + obj.$attrs.color);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.color as string;
      let undefinedColor: string = obj.$attrs.color as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[hyperlinkColor_undefined_0100] END');
    })

    /**
     * @tc.name   hyperlinkColor_empty_0100
     * @tc.number SUB_ARKUI_HYPERLINK_COLOR_EMPTY_0100
     * @tc.desc   Test Hyperlink color property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('hyperlinkColor_empty_0100', Level.LEVEL0, async () => {
      console.info('[hyperlinkColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Hyperlink_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Hyperlink_color_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[hyperlinkColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[hyperlinkColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[hyperlinkColor_empty_0100] default color is: " + objCompare.$attrs.color);
      console.info("[hyperlinkColor_empty_0100] empty color is: " + obj.$attrs.color);

      // 空字符串 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.color as string;
      let emptyColor: string = obj.$attrs.color as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[hyperlinkColor_empty_0100] END');
    })
  })
}
