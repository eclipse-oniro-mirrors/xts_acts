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

export default function pickerIndicatorTest() {
  describe('pickerIndicatorTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerIndicatorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerIndicator',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerIndicatorTest state pages:' + JSON.stringify(pages));
        if (!('pickerIndicator' == pages.name)) {
          console.info('get pickerIndicatorTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push pickerIndicatorTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerIndicatorTest page error:' + err);
      }
      console.info('pickerIndicatorTest beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerIndicator_001
     * @tc.name  : PickerIndicator_001
     * @tc.desc  : To test the selectionIndicator interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker1');
      console.log('PickerIndicator_001')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("2.00vp");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_002
     * @tc.name  : PickerIndicator_002
     * @tc.desc  : To test the selectionIndicator interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker2');
      console.log('PickerIndicator_002')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual("#FFFF0000");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_003
     * @tc.name  : PickerIndicator_003
     * @tc.desc  : To test the selectionIndicator interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker3');
      console.log('PickerIndicator_003')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [2.00vp]radiusTopRight: [2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_004
     * @tc.name  : PickerIndicator_004
     * @tc.desc  : To test the selectionIndicator interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker4');
      console.log('PickerIndicator_004')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [2.00vp]radiusTopRight: [2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_005
     * @tc.name  : PickerIndicator_005
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker5');
      console.log('PickerIndicator_005')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [10.00vp]radiusTopRight: [10.00vp]radiusBottomLeft: [10.00vp]radiusBottomRight: [10.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_006
     * @tc.name  : PickerIndicator_006
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker6');
      console.log('PickerIndicator_006')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_007
     * @tc.name  : PickerIndicator_007
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker7');
      console.log('PickerIndicator_007')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_008
     * @tc.name  : PickerIndicator_008
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker8');
      console.log('PickerIndicator_008')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual("#FF0000FF");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_009
     * @tc.name  : PickerIndicator_009
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker9');
      console.log('PickerIndicator_009')
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
     * @tc.number: PickerIndicator_010
     * @tc.name  : PickerIndicator_010
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker10');
      console.log('PickerIndicator_010')
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
     * @tc.number: PickerIndicator_011
     * @tc.name  : PickerIndicator_011
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker11');
      console.log('PickerIndicator_011')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_012
     * @tc.name  : PickerIndicator_012
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker12');
      console.log('PickerIndicator_012')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_013
     * @tc.name  : PickerIndicator_013
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker13');
      console.log('PickerIndicator_013')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.BACKGROUND");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.backgroundColor).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.borderRadius).assertEqual("radiusTopLeft: [12.00vp]radiusTopRight: [12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_014
     * @tc.name  : PickerIndicator_014
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker14');
      console.log('PickerIndicator_014')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });

    /* *
     * @tc.number: PickerIndicator_015
     * @tc.name  : PickerIndicator_015
     * @tc.desc  : To test the selectionIndicator interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerIndicator_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker15');
      console.log('PickerIndicator_015')
      expect(JSON.parse(strJson).$attrs.selectionIndicator.type).assertEqual("PickerIndicatorType.DIVIDER");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.strokeWidth).assertEqual("2.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.dividerColor).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(JSON.parse(strJson).$attrs.selectionIndicator.startMargin).assertEqual("0.00px");
      expect(JSON.parse(strJson).$attrs.selectionIndicator.endMargin).assertEqual("0.00px");
      done();
    });
  })
}