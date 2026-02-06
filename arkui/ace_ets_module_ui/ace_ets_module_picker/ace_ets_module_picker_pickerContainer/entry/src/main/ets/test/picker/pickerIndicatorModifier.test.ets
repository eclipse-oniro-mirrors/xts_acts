/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let hexString = resourceColor.toString(16).toUpperCase();
  while (hexString.length < 8) {
    hexString = '0' + hexString;
  }
  let newArgb: string = '#' + hexString;
  return newArgb;
}

export default function pickerIndicatorModifierTest() {
  describe('pickerIndicatorModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerIndicatorModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerIndicatorModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerIndicatorModifierTest state pages:' + JSON.stringify(pages));
        if (!('pickerIndicatorModifier' == pages.name)) {
          console.info('get pickerIndicatorModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push pickerIndicatorModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerIndicatorModifierTest page error:' + err);
      }
      console.info('pickerIndicatorModifierTest beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_001
     * @tc.name  : PickerIndicatorModifier_001
     * @tc.desc  : To test the selectionIndicator interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker1');
      console.log('PickerIndicatorModifier_001')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("2.00vp");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_002
     * @tc.name  : PickerIndicatorModifier_002
     * @tc.desc  : To test the selectionIndicator interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker2');
      console.log('PickerIndicatorModifier_002')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual("#FFFF0000");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_003
     * @tc.name  : PickerIndicatorModifier_003
     * @tc.desc  : To test the selectionIndicator interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker3');
      console.log('PickerIndicatorModifier_003')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [2.00vp]radiusTopRight: [2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_004
     * @tc.name  : PickerIndicatorModifier_004
     * @tc.desc  : To test the selectionIndicator interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker4');
      console.log('PickerIndicatorModifier_004')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [2.00vp]radiusTopRight: [2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_005
     * @tc.name  : PickerIndicatorModifier_005
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker5');
      console.log('PickerIndicatorModifier_005')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [10.00vp]radiusTopRight: [10.00vp]radiusBottomLeft: [10.00vp]radiusBottomRight: [10.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_006
     * @tc.name  : PickerIndicatorModifier_006
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker6');
      console.log('PickerIndicatorModifier_006')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_007
     * @tc.name  : PickerIndicatorModifier_007
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker7');
      console.log('PickerIndicatorModifier_007')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_008
     * @tc.name  : PickerIndicatorModifier_008
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker8');
      console.log('PickerIndicatorModifier_008')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_009
     * @tc.name  : PickerIndicatorModifier_009
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker9');
      console.log('PickerIndicatorModifier_009')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_010
     * @tc.name  : PickerIndicatorModifier_010
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker10');
      console.log('PickerIndicatorModifier_010')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_011
     * @tc.name  : PickerIndicatorModifier_011
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker11');
      console.log('PickerIndicatorModifier_011')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_012
     * @tc.name  : PickerIndicatorModifier_012
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker12');
      console.log('PickerIndicatorModifier_012')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_013
     * @tc.name  : PickerIndicatorModifier_013
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker13');
      console.log('PickerIndicatorModifier_013')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_014
     * @tc.name  : PickerIndicatorModifier_014
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker14');
      console.log('PickerIndicatorModifier_014')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_015
     * @tc.name  : PickerIndicatorModifier_015
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker15');
      console.log('PickerIndicatorModifier_015')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicatorModifier_016
     * @tc.name  : PickerIndicatorModifier_016
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicatorModifier_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker16');
      console.log('PickerIndicatorModifier_016')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });
  })
}