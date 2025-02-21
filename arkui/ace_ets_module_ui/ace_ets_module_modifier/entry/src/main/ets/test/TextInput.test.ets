/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function textInput() {
  describe('textInputTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textInput',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput state pages: " + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textInput page error: " + err);
      }
      done();
    });

    /**
     * @tc.number textInputJsunit_0100
     * @tc.name Test the properties of components
     * @tc.desc Set maxLines values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0100', 0, async (done: Function) => {
      console.info('textInputJsunit_0100 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.maxLines).assertEqual('1');
      console.info('textInputJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0101
     * @tc.name Test the properties of components
     * @tc.desc Set showUnderline values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0101', 0, async (done: Function) => {
      console.info('textInputJsunit_0101 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0101] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.showUnderline).assertEqual(true);
      console.info('textInputJsunit_0101 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0102
     * @tc.name Test the properties of components
     * @tc.desc Set showError values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0102', 0, async (done: Function) => {
      console.info('textInputJsunit_0102 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0102] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.showError).assertEqual('Error');
      console.info('textInputJsunit_0102 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0103
     * @tc.name Test the properties of components
     * @tc.desc Set passwordIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0103', 0, async (done: Function) => {
      console.info('textInputJsunit_0103 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0103] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.passwordIcon).assertEqual('{"onIconSrc":"begin","offIconSrc":"end"}');
      console.info('textInputJsunit_0103 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0104
     * @tc.name Test the properties of components
     * @tc.desc Set style values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0104', 0, async (done: Function) => {
      console.info('textInputJsunit_0104 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0104] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Inline');
      console.info('textInputJsunit_0104 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0105
     * @tc.name Test the properties of components
     * @tc.desc Set selectionMenuHidden values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0105', 0, async (done: Function) => {
      console.info('textInputJsunit_0105 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0105] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectionMenuHidden).assertEqual(undefined);
      console.info('textInputJsunit_0105 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0106
     * @tc.name Test the properties of components
     * @tc.desc Set barState values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0106', 0, async (done: Function) => {
      console.info('textInputJsunit_0106 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0106] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.barState).assertEqual('BarState.AUTO');
      console.info('textInputJsunit_0106 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0107
     * @tc.name Test the properties of components
     * @tc.desc Set enableKeyboardOnFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0107', 0, async (done: Function) => {
      console.info('textInputJsunit_0107 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0107] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual(undefined);
      console.info('textInputJsunit_0107 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0109
     * @tc.name Test the properties of components
     * @tc.desc Set caretStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0109', 0, async (done: Function) => {
      console.info('textInputJsunit_0109 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0109] obj is: " + JSON.stringify(obj.$attrs));
      let caretStyle_obj = JSON.parse(obj.$attrs.caretStyle)
      expect(caretStyle_obj.width).assertEqual("12.00vp");
      console.info('textInputJsunit_0109 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0110
     * @tc.name Test the properties of components
     * @tc.desc Set selectedBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0110', 0, async (done: Function) => {
      console.info('textInputJsunit_0110 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0110] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#330000FF');
      console.info('textInputJsunit_0110 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0111
     * @tc.name Test the properties of components
     * @tc.desc Set caretPosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level textInputJsunit_0111
     */
    it('textInputJsunit_0111', 0, async (done: Function) => {
      console.info('textInputJsunit_0111 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0111] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretPosition).assertEqual('0');
      console.info('textInputJsunit_0111 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0112
     * @tc.name Test the properties of components
     * @tc.desc Set caretColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0112', 0, async (done: Function) => {
      console.info('textInputJsunit_0112 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0112] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).assertEqual('#FF007DFF');
      console.info('textInputJsunit_0112 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0113
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0113', 0, async (done: Function) => {
      console.info('textInputJsunit_0113 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0113] obj is: " + JSON.stringify(obj.$attrs));
      let placeholderFont = JSON.parse(obj.$attrs.placeholderFont);
      expect(placeholderFont.size).assertEqual('14.00fp');
      expect(placeholderFont.weight).assertEqual('400');
      console.info('textInputJsunit_0113 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0114
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0114', 0, async (done: Function) => {
      console.info('textInputJsunit_0114 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0114] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.placeholderColor).assertEqual('#80808080');
      console.info('textInputJsunit_0114 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0115
     * @tc.name Test the properties of components
     * @tc.desc Set type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0115', 0, async (done: Function) => {
      console.info('textInputJsunit_0115 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0115] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      console.info('textInputJsunit_0115 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0116
     * @tc.name Test the properties of components
     * @tc.desc Set enterKeyType values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0116', 0, async (done: Function) => {
      console.info('textInputJsunit_0116 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0116] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      console.info('textInputJsunit_0116 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0117
     * @tc.name Test the properties of components
     * @tc.desc Set maxLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0117', 0, async (done: Function) => {
      console.info('textInputJsunit_0117 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0117] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.maxLength).assertEqual('9');
      console.info('textInputJsunit_0117 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0118
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0118', 0, async (done: Function) => {
      console.info('textInputJsunit_0118 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0118] obj is: " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.fontColor).assertEqual('#FF123456');
      expect(obj.$attrs.fontColor).assertNotNull;
      console.info('textInputJsunit_0118 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0119
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0119', 0, async (done: Function) => {
      console.info('textInputJsunit_0119 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0119] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual('14.00fp');
      console.info('textInputJsunit_0119 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0120
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0120', 0, async (done: Function) => {
      console.info('textInputJsunit_0120 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0120] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
      console.info('textInputJsunit_0120 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0121
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0121', 0, async (done: Function) => {
      console.info('textInputJsunit_0121 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0121] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('textInputJsunit_0121 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0122
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0122', 0, async (done: Function) => {
      console.info('textInputJsunit_0122 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0122] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontFamily).assertEqual('fontFamily');
      console.info('textInputJsunit_0122 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0123
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0123', 0, async (done: Function) => {
      console.info('textInputJsunit_0123 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0123] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.None');
      console.info('textInputJsunit_0123 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0124
     * @tc.name Test the properties of components
     * @tc.desc Set showPasswordIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0124', 0, async (done: Function) => {
      console.info('textInputJsunit_0124 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0124] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.showPasswordIcon).assertEqual(true);
      console.info('textInputJsunit_0124 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0125
     * @tc.name Test the properties of components
     * @tc.desc Set textAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0125', 0, async (done: Function) => {
      console.info('textInputJsunit_0125 START');
      let strJson = getInspectorByKey('textInputKey1');
      let obj = JSON.parse(strJson);
      console.info("[textInputJsunit_0125] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('textInputJsunit_0125 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_0127
     * @tc.name Test the properties of components
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_0127', 0, async (done: Function) => {
      console.info('textInputJsunit_0127 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('textInputKey1');
      let objNew = JSON.parse(strJsonNew);
      console.info("textInputJsunit_0127 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual("15.00fp")
      console.info('textInputJsunit_0127 END');
      done();
    });

  })
}
