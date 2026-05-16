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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StyledStringFontWeightConfigsTest() {
  describe('StyledStringFontWeightConfigsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringFontWeightConfigsTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringFontWeightConfigsTest state pages:" + JSON.stringify(pages));
        if (!("StyledStringFontWeightConfigsTest" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/StyledString/StyledStringFontWeightConfigsTest"})
          await CommonFunc.sleep(2000);
          console.info("push StyledStringFontWeightConfigsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringFontWeightConfigsTest page error:" + err);
      }
      console.info("StyledStringFontWeightConfigsTest foreEach end");
      done();
    });
    afterAll(async () => {
      await CommonFunc.sleep(500);
      AppStorage.delete('enableVariableFontWeight')
      AppStorage.delete('enableDeviceFontWeightCategory')
    });
    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0100
     * @tc.desc   test styledString TextStyle fontConfigs no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0100',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('undefined');
      expect(enableDeviceFontWeightCategory).assertEqual('undefined');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0200
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0200
     * @tc.desc   test styledString TextStyle fontConfigs no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0200',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('undefined');
      expect(enableDeviceFontWeightCategory).assertEqual('undefined');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0300
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0300
     * @tc.desc   test styledString TextStyle fontConfigs no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0300',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('undefined');
      expect(enableDeviceFontWeightCategory).assertEqual('undefined');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0400
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0400
     * @tc.desc   test styledString TextStyle fontConfigs no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0400',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('false');
      expect(enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0400] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0500
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0500
     * @tc.desc   test styledString TextStyle fontConfigs all set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0500',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0500] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('true');
      expect(enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0500] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0600
     * @tc.number SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0600
     * @tc.desc   test styledString TextStyle fontConfigs all set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0600',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0600] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setAndGetMutableStyledString5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let enableVariableFontWeight:string|undefined = AppStorage.get('enableVariableFontWeight')
      let enableDeviceFontWeightCategory:string|undefined = AppStorage.get('enableDeviceFontWeightCategory')
      expect(enableVariableFontWeight).assertEqual('false');
      expect(enableDeviceFontWeightCategory).assertEqual('false');
      console.info('[SUB_ARKUI_STYLEDSTRING_TEXTSTYLE_FONTCONFIGS_TEST_0600] END');
      done();
    });
  })
}
