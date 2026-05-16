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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router'

export default function textPickerPropertiesModifierTest() {
  describe('textPickerPropertiesModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textPickerPropertiesModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerPropertiesModifier',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPickerPropertiesModifierTest state pages: " + JSON.stringify(pages));
        if (!("textPickerPropertiesModifier" == pages.name)) {
          console.info("get textPickerPropertiesModifierTest state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(5000);
          console.info("push textPickerPropertiesModifierTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPickerPropertiesModifierTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_001
     * @tc.number ArkUI_textPickerPropertiesModifierTest_001
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_001] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_001] obj:" + JSON.stringify(obj.$attrs));

      let strJson1 = getInspectorByKey('textPickerDefault1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ArkUI_textPickerPropertiesModifierTest_001] obj1:" + JSON.stringify(obj1.$attrs));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual(JSON.stringify(obj1.$attrs.selectedIndex));
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_002
     * @tc.number ArkUI_textPickerPropertiesModifierTest_002
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_002] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_002] obj:" + JSON.stringify(obj.$attrs));
      let textStyle: ESObject = obj.$attrs.textStyle;
      expect(textStyle["color"]).assertEqual('#FFFF0000');
      expect(textStyle["font"].size).assertEqual('10.00px');
      expect(textStyle["font"].weight).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_003
     * @tc.number ArkUI_textPickerPropertiesModifierTest_003
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_003] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_003] obj:" + JSON.stringify(obj.$attrs));
      let selectedTextStyle: ESObject = obj.$attrs.selectedTextStyle;
      expect(selectedTextStyle["color"]).assertEqual('#FF0000FF');
      expect(selectedTextStyle["font"].size).assertEqual('20.00px');
      expect(selectedTextStyle["font"].weight).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_004
     * @tc.number ArkUI_textPickerPropertiesModifierTest_004
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_004] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_004] obj:" + JSON.stringify(obj.$attrs));
      let disappearTextStyle: ESObject = obj.$attrs.disappearTextStyle;
      expect(disappearTextStyle["color"]).assertEqual('#FF000000');
      expect(disappearTextStyle["font"].size).assertEqual('8.00fp');
      expect(disappearTextStyle["font"].weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_005
     * @tc.number ArkUI_textPickerPropertiesModifierTest_005
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_005] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_005] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.canLoop).assertEqual("false");
      done();
    });

    /**
     * @tc.name   ArkUI_textPickerPropertiesModifierTest_006
     * @tc.number ArkUI_textPickerPropertiesModifierTest_006
     * @tc.desc   Test the properties of components,Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_textPickerPropertiesModifierTest_006', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_textPickerPropertiesModifierTest_006] START');
      let strJson = getInspectorByKey('textPickerDefault');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_textPickerPropertiesModifierTest_006] obj:" + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.defaultPickerItemHeight).assertEqual('60.00px');
      done();
    });
  })
}
