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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import Utils from '../Utils/Utils';
import router from '@ohos.router'
export default function textpickerJsunit() {
  describe('textpickerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textpicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/textPicker',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textpicker state pages: " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textpicker state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(5000);
          console.info("push textpicker page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textpicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_001', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_001] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_001] obj:" + JSON.stringify(obj.$attrs));

      let strJson1 = getInspectorByKey('textPickerDefault1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ArkUI_textpicker_001] obj1:" + JSON.stringify(obj1.$attrs));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual(JSON.stringify(obj1.$attrs.selectedIndex));
      done();
    });

    /**
     * @tc.number ArkUI_textpicker_002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_002', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_002] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_002] obj:" + JSON.stringify(obj.$attrs));

      let textStyle: ESObject = obj.$attrs.textStyle;

      expect(textStyle["color"]).assertEqual('#FFFF0000');
      expect(textStyle["font"].size).assertEqual('10.00px');
      expect(textStyle["font"].weight).assertEqual('FontWeight.Normal');

      done();
    });

    /**
     * @tc.number ArkUI_textpicker_003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_003', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_003] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_003] obj:" + JSON.stringify(obj.$attrs));
      let selectedTextStyle: ESObject = obj.$attrs.selectedTextStyle;

      expect(selectedTextStyle["color"]).assertEqual('#FF0000FF');
      expect(selectedTextStyle["font"].size).assertEqual('20.00px');
      expect(selectedTextStyle["font"].weight).assertEqual('FontWeight.Bold');


      done();
    });

    /**
     * @tc.number ArkUI_textpicker_004
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_004', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_004] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_004] obj:" + JSON.stringify(obj.$attrs));

      let disappearTextStyle: ESObject = obj.$attrs.disappearTextStyle;

      expect(disappearTextStyle["color"]).assertEqual('#FF000000');
      expect(disappearTextStyle["font"].size).assertEqual('8.00fp');
      expect(disappearTextStyle["font"].weight).assertEqual('FontWeight.Lighter');

      done();
    });

    /**
     * @tc.number ArkUI_textpicker_005
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_005', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_005] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_005] obj:" + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.canLoop).assertEqual("false");

      done();
    });

    /**
     * @tc.number ArkUI_textpicker_006
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_textpicker_006', 0, async (done: Function) => {
      console.info('[ArkUI_textpicker_006] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textpicker_006] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.defaultPickerItemHeight).assertEqual('60.00px');
      done();
    });
  })
}
