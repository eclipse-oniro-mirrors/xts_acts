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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

export default function SearchPropertiesNullUndefined03Test() {
  describe('SearchPropertiesNullUndefined03Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchPropertiesNullUndefined03Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchPropertiesNullUndefined03Test',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchPropertiesNullUndefined03Test state pages: " + JSON.stringify(pages));
        if (!("SearchPropertiesNullUndefined03Test" == pages.name)) {
          console.info("get SearchPropertiesNullUndefined03Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchPropertiesNullUndefined03Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchPropertiesNullUndefined03Test page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   searchSearchButton_value_null_0100
     * @tc.number SUB_ARKUI_SEARCH_SEARCHBUTTON_VALUE_NULL_0100
     * @tc.desc   Test Search searchButton property value with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSearchButton_value_null_0100', Level.LEVEL2, async () => {
      console.info('[searchSearchButton_value_null_0100] START');
      let strJson: string = getInspectorByKey('Search_searchButton_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSearchButton_value_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('Search');
      console.info('[searchSearchButton_value_null_0100] END');
    })

    /**
     * @tc.name   searchSearchButton_value_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SEARCHBUTTON_VALUE_UNDEFINED_0100
     * @tc.desc   Test Search searchButton property value with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSearchButton_value_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchSearchButton_value_undefined_0100] START');

      let strJson: string = getInspectorByKey('Search_searchButton_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSearchButton_value_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('Search');
      console.info('[searchSearchButton_value_undefined_0100] END');
    })


    /**
     * @tc.name   searchCustomKeyboard_value_null_0100
     * @tc.number SUB_ARKUI_SEARCH_CUSTOMKEYBOARD_VALUE_NULL_0100
     * @tc.desc   Test Search customKeyboard property value with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCustomKeyboard_value_null_0100', Level.LEVEL2, async () => {
      console.info('[searchCustomKeyboard_value_null_0100] START');

      let strJson: string = getInspectorByKey('Search_customKeyboard_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCustomKeyboard_value_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('Search');
      console.info('[searchCustomKeyboard_value_null_0100] END');
    })

    /**
     * @tc.name   searchCustomKeyboard_value_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_CUSTOMKEYBOARD_VALUE_UNDEFINED_0100
     * @tc.desc   Test Search customKeyboard property value with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCustomKeyboard_value_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchCustomKeyboard_value_undefined_0100] START');

      let strJson: string = getInspectorByKey('Search_customKeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCustomKeyboard_value_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('Search');
      console.info('[searchCustomKeyboard_value_undefined_0100] END');
    })

    /**
     * @tc.name   searchFontFeature_null_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTFEATURE_NULL_0100
     * @tc.desc   Test Search fontFeature property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontFeature_null_0100', Level.LEVEL2, async () => {
      console.info('[searchFontFeature_null_0100] START');
      let strJsonCompare: string = getInspectorByKey('Search_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontFeature_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontFeature_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontFeature_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontFeature_null_0100] default fontFeature is: " + JSON.stringify(objCompare.$attrs.fontFeature));
      console.info("[searchFontFeature_null_0100] null fontFeature is: " + JSON.stringify(obj.$attrs.fontFeature));

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[searchFontFeature_null_0100] END');
    })

    /**
     * @tc.name   searchFontFeature_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTFEATURE_UNDEFINED_0100
     * @tc.desc   Test Search fontFeature property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontFeature_undefined_0100', Level.LEVEL2, async () => {
      let strJsonCompare: string = getInspectorByKey('Search_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontFeature_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontFeature_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontFeature_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontFeature_undefined_0100] default fontFeature is: " + JSON.stringify(objCompare.$attrs.fontFeature));
      console.info("[searchFontFeature_undefined_0100] undefined fontFeature is: " + JSON.stringify(obj.$attrs.fontFeature));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[searchFontFeature_undefined_0100] END');
    })

    /**
     * @tc.name   searchFontFeature_emptyString_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTFEATURE_EMPTYSTRING_0100
     * @tc.desc   Test Search fontFeature property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontFeature_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[searchFontFeature_emptyString_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontFeature_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontFeature_emptyString_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontFeature_emptyString_0100] emptyString obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontFeature_emptyString_0100] default fontFeature is: " + JSON.stringify(objCompare.$attrs.fontFeature));
      console.info("[searchFontFeature_emptyString_0100] emptyString fontFeature is: " + JSON.stringify(obj.$attrs.fontFeature));

      // emptyString 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[searchFontFeature_emptyString_0100] END');
    })

    /**
     * @tc.name   searchEnableEnablePreviewText_null_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEPREVIEWTEXT_NULL_0100
     * @tc.desc   Test Search enablePreviewText property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableEnablePreviewText_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableEnablePreviewText_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enablePreviewText_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enablePreviewText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableEnablePreviewText_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableEnablePreviewText_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableEnablePreviewText_null_0100] default enablePreviewText is: " + JSON.stringify(objCompare.$attrs.enablePreviewText));
      console.info("[searchEnableEnablePreviewText_null_0100] null enablePreviewText is: " + JSON.stringify(obj.$attrs.enablePreviewText));

      // null 应该恢复为默认值
      expect(obj.$attrs.enablePreviewText).assertEqual(objCompare.$attrs.enablePreviewText);
      console.info('[searchEnableEnablePreviewText_null_0100] END');
    })

    /**
     * @tc.name   searchEnableEnablePreviewText_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEPREVIEWTEXT_UNDEFINED_0100
     * @tc.desc   Test Search enablePreviewText property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableEnablePreviewText_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableEnablePreviewText_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enablePreviewText_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enablePreviewText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableEnablePreviewText_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableEnablePreviewText_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableEnablePreviewText_undefined_0100] default enablePreviewText is: " + JSON.stringify(objCompare.$attrs.enablePreviewText));
      console.info("[searchEnableEnablePreviewText_undefined_0100] undefined enablePreviewText is: " + JSON.stringify(obj.$attrs.enablePreviewText));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enablePreviewText).assertEqual(objCompare.$attrs.enablePreviewText);
      console.info('[searchEnableEnablePreviewText_undefined_0100] END');
    })

    /**
     * @tc.name   searchEnableEnablePreviewText_true_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEPREVIEWTEXT_TRUE_0100
     * @tc.desc   Test Search enablePreviewText property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableEnablePreviewText_true_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableEnablePreviewText_true_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enablePreviewText_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enablePreviewText_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableEnablePreviewText_true_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableEnablePreviewText_true_0100] true obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableEnablePreviewText_true_0100] default enablePreviewText is: " + JSON.stringify(objCompare.$attrs.enablePreviewText));
      console.info("[searchEnableEnablePreviewText_true_0100] true enablePreviewText is: " + JSON.stringify(obj.$attrs.enablePreviewText));

      // true 应该为 true
      expect(obj.$attrs.enablePreviewText).assertEqual(true);
      console.info('[searchEnableEnablePreviewText_true_0100] END');
    })
  })
}
