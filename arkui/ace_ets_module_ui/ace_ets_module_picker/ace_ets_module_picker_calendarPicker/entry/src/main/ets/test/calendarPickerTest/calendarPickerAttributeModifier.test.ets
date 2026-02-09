/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils/Utils';
import router from '@ohos.router'

export default function CalendarPickerAttributeModifierTest() {
  describe('CalendarPickerAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/calendarPickerAttributeModifier',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerAttributeModifierTest state pages: ' + JSON.stringify(pages));
        if (!('calendarPickerAttributeModifier' == pages.name)) {
          console.info('get CalendarPickerAttributeModifierTest state pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(5000);
          console.info('push CalendarPickerAttributeModifierTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerAttributeModifierTest page error: ' + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_CalendarPicker_0100
     * @tc.number ArkUI_Stage_CalendarPicker_attributeModifier_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_Stage_CalendarPicker_0100] START');
      let strJson = getInspectorByKey('CalendarPickerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ArkUI_Stage_CalendarPicker_0100] obj is: ' + JSON.stringify(obj.$attrs));
      let edgeAlign: ESObject = obj.$attrs.edgeAlign;

      expect(edgeAlign.alignType).assertEqual('CalendarAlign.END');
      expect(edgeAlign.offset.dx).assertEqual('10.00vp');
      expect(edgeAlign.offset.dy).assertEqual('15.00vp');
      console.info('[ArkUI_Stage_CalendarPicker_0100] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_CalendarPicker_attributeModifier_0101
     * @tc.number ArkUI_Stage_CalendarPicker_attributeModifier_0101
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_attributeModifier_0101', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_0101] START');
      let strJson = getInspectorByKey('CalendarPickerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_0101] obj is: ' + JSON.stringify(obj.$attrs));

      let textStyle: ESObject = obj.$attrs.textStyle;

      expect(textStyle.color).assertEqual('#FF182431');
      expect(textStyle.font.size).assertEqual('8.00fp');
      expect(textStyle.font.weight).assertEqual('FontWeight.Lighter');
      console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_0101] END');
      done();
    });
  })
}
