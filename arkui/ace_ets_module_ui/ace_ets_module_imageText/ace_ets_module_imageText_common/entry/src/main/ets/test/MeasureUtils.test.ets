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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function MeasureUtilsTest() {
  describe('MeasureUtilsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MeasureUtilsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasureUtilsTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MeasureUtilsTest state pages: " + JSON.stringify(pages));
        if (!("MeasureUtilsTestPage" == pages.name)) {
          console.info("get MeasureUtilsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MeasureUtilsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MeasureUtilsTest page error: " + err);
      }
      done();
    });

    // let uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!
    // let measureUtils: MeasureUtils = uiContext.getMeasureUtils();

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_NULL_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_NULL_001
     * @tc.desc   测试 MeasureUtils measureText 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_measureText_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('measureText_null')).assertEqual(undefined);
      AppStorage.delete('measureText_null')
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_UNDEFINED_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_UNDEFINED_001
     * @tc.desc   测试 MeasureUtils measureText 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_measureText_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('measureText_undefined')).assertEqual(undefined);
      AppStorage.delete('measureText_undefined')
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXT_OPTIONS_UNDEFINED_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_NULL_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_NULL_001
     * @tc.desc   测试 MeasureUtils measureTextSize 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_measureTextSize_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('measureTextSize_null_width')).assertEqual(undefined);
      expect(AppStorage.get('measureTextSize_null_height')).assertEqual(undefined);
      AppStorage.delete('measureTextSize_null_width')
      AppStorage.delete('measureTextSize_null_height')
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_UNDEFINED_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_UNDEFINED_001
     * @tc.desc   测试 MeasureUtils measureTextSize 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_measureTextSize_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('measureTextSize_undefined_width')).assertEqual(undefined);
      expect(AppStorage.get('measureTextSize_undefined_height')).assertEqual(undefined);
      AppStorage.delete('measureTextSize_undefined_width')
      AppStorage.delete('measureTextSize_undefined_height')
      console.info("SUB_ARKUI_MEASUREUTILS_MEASURETEXTSIZE_OPTIONS_UNDEFINED_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_NULL_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_NULL_001
     * @tc.desc   测试 MeasureUtils getParagraphs 属性参数 styledString为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_getParagraphs_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getParagraphs_null')).assertEqual(undefined);
      AppStorage.delete('getParagraphs_null')
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_UNDEFINED_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_UNDEFINED_001
     * @tc.desc   测试 MeasureUtils getParagraphs 属性参数 styledString为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_getParagraphs_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getParagraphs_undefined')).assertEqual(undefined);
      AppStorage.delete('getParagraphs_undefined')
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_STYLEDSTRING_UNDEFINED_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_NULL_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_NULL_001
     * @tc.desc   测试 MeasureUtils getParagraphs 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_getParagraphs_options_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getParagraphs_options_null')).assertLarger(0);
      AppStorage.delete('getParagraphs_options_null')
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_UNDEFINED_001
     * @tc.number SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_UNDEFINED_001
     * @tc.desc   测试 MeasureUtils getParagraphs 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_getParagraphs_options_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getParagraphs_options_undefined')).assertLarger(0);
      AppStorage.delete('getParagraphs_options_undefined')
      console.info("SUB_ARKUI_MEASUREUTILS_GETPARAGRAPHS_OPTIONS_UNDEFINED_001 end");
      done();
    });
  });
}
