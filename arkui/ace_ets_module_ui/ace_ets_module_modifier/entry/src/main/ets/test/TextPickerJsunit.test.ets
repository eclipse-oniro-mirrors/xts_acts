/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

export default function textpickerJsunit() {
  describe('textpickerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textpicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get textpicker state pages: " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textpicker state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textpicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_002
     * @tc.name Test the properties of components
     * @tc.desc Set textStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_002', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_002] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_002] obj:" + JSON.stringify(obj.$attrs));
      let textStyle = obj.$attrs.textStyle;
      expect(textStyle["color"]).assertEqual('#FFFF0000');
      expect(textStyle["font"].size).assertEqual('10.00px');
      expect(textStyle["font"].weight).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_003
     * @tc.name Test the properties of components
     * @tc.desc Set selectedTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_003', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_003] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_003] obj:" + JSON.stringify(obj.$attrs));
      let selectedTextStyle = obj.$attrs.selectedTextStyle;
      expect(selectedTextStyle["color"]).assertEqual('#FF0000FF');
      expect(selectedTextStyle["font"].size).assertEqual('20.00px');
      expect(selectedTextStyle["font"].weight).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_004
     * @tc.name Test the properties of components
     * @tc.desc Set disappearTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_004', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_004] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_004] obj:" + JSON.stringify(obj.$attrs));
      let disappearTextStyle = obj.$attrs.disappearTextStyle;
      expect(disappearTextStyle["color"]).assertEqual('#FF000000');
      expect(disappearTextStyle["font"].size).assertEqual('8.00fp');
      expect(disappearTextStyle["font"].weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_005
     * @tc.name Test the properties of components
     * @tc.desc Set canLoop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_005', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_005] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_005] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.canLoop).assertEqual("false");
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_006
     * @tc.name Test the properties of components
     * @tc.desc Set defaultPickerItemHeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_006', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_006] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_006] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.defaultPickerItemHeight).assertEqual('60.00px');
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_001
     * @tc.name Test the properties of components
     * @tc.desc Set selectedIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_001', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_001] START');
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_001] obj:" + JSON.stringify(obj.$attrs));
      let strJson1 = getInspectorByKey('textPickerDefault1');
      let obj1 = JSON.parse(strJson1);
      console.info("[ArkUI_textpicker_001] obj1:" + JSON.stringify(obj1.$attrs));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual(JSON.stringify(obj1.$attrs.selectedIndex));
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_011
     * @tc.name Test the properties of components
     * @tc.desc change canLoop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_textpicker_011', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_011] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJson = getInspectorByKey('textPicker');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_011] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });
  })
}
