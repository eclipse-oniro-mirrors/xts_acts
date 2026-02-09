'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color, Resource, $r } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
const SLEEP_TIME_L = 1000;
function spliceColor(sysColor: Resource) {
  const context = AppStorage.get<UIContext>('uiContext') as UIContext;
  if (!context) {
    console.error('spliceColor: UIAbilityContext 不存在');
    return '';
  }
  let resourceColor = context.getHostContext()?.resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '' + resourceColor?.toString(16).toUpperCase()
  while(newArgb.length < 8){
    newArgb = '0' + newArgb
  }
  newArgb = '#' + newArgb
  return newArgb;
}

export default function UIPickerIndicatorModifierTest() {
  describe('UIPickerIndicatorModifierTest', () => {

    beforeAll(() => {
      console.info("UIPickerIndicatorModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('UIPickerIndicatorModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerIndicatorModifier',
      }
      await UtilsTest.msSleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerIndicatorModifierTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerIndicatorModifier' == pages.name)) {
          console.info('get UIPickerIndicatorModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerIndicatorModifierTest page error:' + err);
      }
      console.info('UIPickerIndicatorModifierTest beforeEach end');
    });


    /**
     * @tc.number   UIPickerIndicatorModifier_static_001
     * @tc.name     UIPickerIndicatorModifier_static_001
     * @tc.desc     Test the normal value of the modifier for the selectionIndicator interface
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_001 START');
      let strJson = inspector.getInspectorByKey('picker1');
      console.log('UIPickerIndicatorModifier_static_001 picker1');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.DIVIDER');
      expect(obj1.getString('strokeWidth')).assertEqual('2.00vp');
      expect(obj1.getString('dividerColor')).assertEqual('#FF0000FF');
      expect(obj1.getString('startMargin')).assertEqual('2.00vp');
      expect(obj1.getString('endMargin')).assertEqual('2.00vp');
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_002
     * @tc.name     UIPickerIndicatorModifier_static_002
     * @tc.desc     Test the outlier values of the modifier for the selectionIndicator interface
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_002 START');
      let strJson = inspector.getInspectorByKey('picker2');
      console.log('UIPickerIndicatorModifier_static_002 picker2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.DIVIDER');
      expect(obj1.getString('strokeWidth')).assertEqual('2.00px');
      expect(obj1.getString('dividerColor')).assertEqual('#FFFF0000');
      expect(obj1.getString('startMargin')).assertEqual('0.00px');
      expect(obj1.getString('endMargin')).assertEqual('0.00px');
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_003
     * @tc.name     UIPickerIndicatorModifier_static_003
     * @tc.desc     The type of the test interface selectionIndicator is BACKGROUND
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_003 START');
      let strJson = inspector.getInspectorByKey('picker3');
      console.log('UIPickerIndicatorModifier_static_003 picker3');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [2.00vp]radiusTopRight: ' +
        '[2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_004
     * @tc.name     UIPickerIndicatorModifier_static_004
     * @tc.desc     The borderRadius of the selectionIndicator interface of type LengthMetrics
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_004 START');
      let strJson = inspector.getInspectorByKey('picker4');
      console.log('UIPickerIndicatorModifier_static_004 picker4');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [2.00vp]radiusTopRight: ' +
        '[2.00vp]radiusBottomLeft: [2.00vp]radiusBottomRight: [2.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_005
     * @tc.name     UIPickerIndicatorModifier_static_005
     * @tc.desc     The borderRadius of the selectionIndicator interface of type LocalizedBorderRadiuses
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_005 START');
      let strJson = inspector.getInspectorByKey('picker5');
      console.log('UIPickerIndicatorModifier_static_005 picker5');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [10.00vp]radiusTopRight: ' +
        '[10.00vp]radiusBottomLeft: [10.00vp]radiusBottomRight: [10.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_006
     * @tc.name     UIPickerIndicatorModifier_static_006
     * @tc.desc     To test the selectionIndicator interface default value
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_006 START');
      let strJson = inspector.getInspectorByKey('picker6');
      console.log('UIPickerIndicatorModifier_static_006 picker6');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_007
     * @tc.name     UIPickerIndicatorModifier_static_007
     * @tc.desc     To test the selectionIndicator interface default value
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicator_static_007 START');
      let strJson = inspector.getInspectorByKey('picker7');
      console.log('UIPickerIndicator_static_007 picker7');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_008
     * @tc.name     UIPickerIndicatorModifier_static_008
     * @tc.desc     To test the selectionIndicator interface LocalizedBorderRadiuses
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_008 START');
      let strJson = inspector.getInspectorByKey('picker8');
      console.log('UIPickerIndicatorModifier_static_008 picker8');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual('#FF0000FF');
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_009
     * @tc.name     UIPickerIndicatorModifier_static_009
     * @tc.desc     To test the selectionIndicator interface undefined
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_009 START');
      let strJson = inspector.getInspectorByKey('picker9');
      console.log('UIPickerIndicatorModifier_static_009 picker9');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      expect(obj1.getString('strokeWidth')).assertEqual('2.00px');
      expect(obj1.getString('dividerColor')).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(obj1.getString('startMargin')).assertEqual('0.00px');
      expect(obj1.getString('endMargin')).assertEqual('0.00px');
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_010
     * @tc.name     UIPickerIndicatorModifier_static_010
     * @tc.desc     The test does not set the interface selectionIndicator interface
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_010 START');
      let strJson = inspector.getInspectorByKey('picker10');
      console.log('UIPickerIndicatorModifier_static_010 picker10');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('strokeWidth')).assertEqual('2.00px');
      expect(obj1.getString('dividerColor')).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(obj1.getString('startMargin')).assertEqual('0.00px');
      expect(obj1.getString('endMargin')).assertEqual('0.00px');
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_011
     * @tc.name     UIPickerIndicatorModifier_static_011
     * @tc.desc     To test the selectionIndicator interface default value
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_011 START');
      let strJson = inspector.getInspectorByKey('picker11');
      console.log('UIPickerIndicatorModifier_static_011 picker11');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.BACKGROUND');
      expect(obj1.getString('backgroundColor')).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let radius : string = 'radiusTopLeft: [12.00vp]radiusTopRight: ' +
        '[12.00vp]radiusBottomLeft: [12.00vp]radiusBottomRight: [12.00vp]';
      expect(obj1.getString('borderRadius')).assertEqual(radius);
      done();
    });
    /**
     * @tc.number   UIPickerIndicatorModifier_static_012
     * @tc.name     UIPickerIndicatorModifier_static_012
     * @tc.desc     To test the selectionIndicator interface default value
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerIndicatorModifier_static_012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerIndicatorModifier_static_012 START');
      let strJson = inspector.getInspectorByKey('picker12');
      console.log('UIPickerIndicatorModifier_static_012 picker12');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = obj.getElement('$attrs').getElement('selectionIndicator');
      expect(obj1.getString('type')).assertEqual('PickerIndicatorType.DIVIDER');
      expect(obj1.getString('strokeWidth')).assertEqual('2.00px');
      expect(obj1.getString('dividerColor')).assertEqual(spliceColor($r('sys.color.comp_divider')));
      expect(obj1.getString('startMargin')).assertEqual('0.00px');
      expect(obj1.getString('endMargin')).assertEqual('0.00px');
      done();
    });
  })
}