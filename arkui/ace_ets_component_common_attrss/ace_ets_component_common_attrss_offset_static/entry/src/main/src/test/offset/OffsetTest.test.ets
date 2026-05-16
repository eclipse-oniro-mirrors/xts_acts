'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, ExpectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, beforeAll, expect } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  Position, $r } from '@ohos.arkui.component';
import { jsonx } from "std/core"
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function OffsetTest() {
  //A list of components that support the position attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'Text',
    'Button',
    'Radio', 'Blank', 'Checkbox', 'CheckboxGroup', 'DataPanel', 'DatePicker', 'Divider',
    'Gauge'
    , 'LoadingProgress', 'Marquee', 'Navigation', 'Image', 'ImageAnimator',
    'AlphabetIndexer', 'Progress', 'QRCode', 'Rating', 'Search', 'Slider', 'TextArea', 'TextClock',
    'TextInput', 'TextPicker', 'TimePicker', 'Toggle', 'Badge', 'Column', 'Counter', 'Flex', 'Grid', 'GridRow',
    'List', 'Row', 'Scroll', 'Stack', 'Tabs', 'Circle', 'Ellipse', 'Line',
    'Polyline', 'Polygon', 'Path', 'Rect', 'Shape',
    'Panel'
    , 'TabContent', 'ListItem',
    'RelativeContainer', 'Swiper', 'TextTimer',
    'GridItem', 'ScrollBar', 'MenuItem', 'MenuItemGroup',
    'ListItemGroup'
  )


  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 200;
  let parentHeight = 200;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testOffset',
    pageName: 'OffsetPage',
    pageUrl: 'MainAbility/pages/offset/OffsetPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [
    {
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    } as Position,
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50),
    } as ExpectValue
  },
    {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    } as Position,
    expectValue: {
      x: '150.00px', y: '150.00px', left: 150, top: 150,
    } as ExpectValue
  },
    {
    describe: 'StringPercent',
    setValue: {
      x: '50.00%', y: '50.00%'
    } as Position,
    expectValue: {
      x: '50.00%', y: '50.00%'
    } as ExpectValue
  },
    {
    describe: 'Resource',
    setValue: {
      x: $r('app.float.50vp'), y: $r('app.float.50vp')
    } as Position,
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50),
    } as ExpectValue
  }
  ]

  /**
   * Create test suite.
   */

  describe('OffsetTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Restore the target component to its original position

      AppStorage.setOrCreate<Position>('_offset', { x: 0, y: 0 } as Position);
      await Utils.sleep(1000);
      let testData: BasePageConfig = data
      if(testData.testValue.describe == 'Number'){
        testData = {
          pageConfig: data.pageConfig,
          testValue: {
            describe: data.testValue.describe,
            setValue: data.testValue.setValue,
            exceptView: data.testValue.exceptView,
            expectValue:{
              x: '50.00vp', y: '50.00vp',
              left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50),
            }
          },
          caseTag: data.caseTag,
          customParams: data.customParams,
          viewObj: data.viewObj
        }
      }
      if(testData.testValue.describe == 'Resource'){
        testData = {
          pageConfig: data.pageConfig,
          testValue: {
            describe: data.testValue.describe,
            setValue: data.testValue.setValue,
            exceptView: data.testValue.exceptView,
            expectValue:{
              x: '50.00vp', y: '50.00vp',
              left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50),
            }
          },
          caseTag: data.caseTag,
          customParams: data.customParams,
          viewObj: data.viewObj
        }
      }
      //Obtain the region information of the target component.
      console.info('[' + testData.caseTag + '] get target Component rect before position changed.');
      let initialPosition = Utils.getComponentRect(testData.pageConfig.componentKey ?? '');

      //Obtain the region information of the reference component.
      console.info('[' + testData.caseTag + '] get Reference Component rect before position changed.');
      let ReferenceRectBefore = Utils.getComponentRect(testData.pageConfig.referenceComponentKey ?? '');

      //Obtain the region information of the parent component.
      console.info('[' + testData.caseTag + '] get Parent Component rect before position changed.');
      let parentRectBefore = Utils.getComponentRect(testData.pageConfig.parentComponentKey ?? '');

      console.info('[' + testData.caseTag + '] setValue : ' + JSON.stringify(testData.testValue.setValue));
      AppStorage.setOrCreate<Position>('_offset', testData.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain the region information of the target component.
      console.info('[' + testData.caseTag + '] get targetComponent rect after position changed.');
      let targetRectAfter = Utils.getComponentRect(testData.pageConfig.componentKey ?? '');

      //Obtain the region information of the reference component.
      console.info('[' + testData.caseTag + '] get referenceComponent rect after position changed.');
      let ReferenceRectAfter = Utils.getComponentRect(testData.pageConfig.referenceComponentKey);
      console.info('[' + testData.caseTag + '] get parentComponent rect after position changed.');

      //Obtain the region information of the parent component.
      let parentRectAfter = Utils.getComponentRect(testData.pageConfig.parentComponentKey);
      let rectParent = Utils.getComponentRect(testData.pageConfig.parentComponentKey);
      console.info('[' + testData.caseTag + '] check offset value.');

      //Obtain the attribute information of the target component.
      //Confirm that the position attribute value has been set successfully.
      let strJsonComponentKey = inspector.getInspectorByKey(testData.pageConfig.componentKey);
      await Utils.sleep(1000);
      let viewObj = JSON.parseJsonElement(strJsonComponentKey);
      console.log('getStringx',viewObj.getElement('$attrs').getElement('offset').getString('x'))
      console.log('expectValuex',testData.testValue.expectValue.x)
      expect(viewObj.getElement('$attrs').getElement('offset').getString('x')).assertEqual(testData.testValue.expectValue.x);
      expect(viewObj.getElement('$attrs').getElement('offset').getString('y')).assertEqual(testData.testValue.expectValue.y);

      if ('TabContent' == testData.pageConfig.targetView) {
        console.log('testData.pageConfig.targetView',testData.pageConfig.targetView)
        //When the target component is TabContent,
        //the parent component is the Swiper on the outer layer of Tabs.
        let parentComponent = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[0];
        parentComponent.getArray('$children').forEach((element: jsonx.JsonElement) => {
          if ('Swiper' == element.getString('$type')) {
            rectParent = Utils.getComponentRectByObj(element)
          }
        });
      }

      console.info('[' + testData.caseTag + '] check actual position.');
      //Calculate shifting using pre and post setting positions
      //verify the actual shifting of the target component.
      if ('StringPercent' == testData.testValue.describe) {
        if ('GridItem' == testData.pageConfig.targetView) {
          //The width of the target component
          let targetWight = targetRectAfter.right - targetRectAfter.left;
          //The height of the target component
          let targetHeight = targetRectAfter.bottom - targetRectAfter.top;
          expect(Math.abs(Number(targetRectAfter.left - initialPosition.left) - Number((targetWight) * 0.5)) <= 1)
            .assertTrue()
          expect(Math.abs(Number(targetRectAfter.top - initialPosition.top) - Number((targetHeight) * 0.5)) <= 1)
            .assertTrue()
        } else {
          //When setting the type to percentage, use the width/height of the parent container as the base.
          expect(Math.abs(Number(Number((targetRectAfter.left - initialPosition.left)).toFixed(2)) - Number(Number(((rectParent.right - rectParent.left) * 0.5)).toFixed(2))) <= 1)
            .assertTrue()
          expect(Math.abs(Number(Number((targetRectAfter.top - initialPosition.top)).toFixed(2)) - Number(Number(((rectParent.bottom - rectParent.top) * 0.5)).toFixed(2))) <= 1)
            .assertTrue()
        }
      } else {
        // When set to the basic type, verify the calculated shifting
        expect(Math.abs(Number(Number((targetRectAfter.left - initialPosition.left)).toFixed(2)) - Number(Number(testData.testValue.expectValue.left).toFixed(2))) <= 1)
          .assertTrue();
        expect(Math.abs(Number(Number((targetRectAfter.top - initialPosition.top)).toFixed(2)) - Number(Number(testData.testValue.expectValue.top).toFixed(2))) <= 1)
          .assertTrue();
      }

      //Confirm that the region information of the parent component has not changed.
      console.info('[' + testData.caseTag + '] check parentComponent layout not changed.');
      console.log('parentRectBefore.left',parentRectBefore.left)
      console.log('parentRectAfter.left',parentRectAfter.left)
      expect(parentRectBefore.left).assertEqual(parentRectAfter.left);
      expect(parentRectBefore.top).assertEqual(parentRectAfter.top);
      expect(parentRectBefore.right).assertEqual(parentRectAfter.right);
      expect(parentRectBefore.bottom).assertEqual(parentRectAfter.bottom);

      //Confirm that the region information of the reference component has not changed.
      console.info('[' + testData.caseTag + '] check referenceComponent layout not changed.');
      expect(ReferenceRectAfter.left).assertEqual(ReferenceRectBefore.left);
      expect(ReferenceRectAfter.top).assertEqual(ReferenceRectBefore.top);
      expect(ReferenceRectAfter.right).assertEqual(ReferenceRectBefore.right);
      expect(ReferenceRectAfter.bottom).assertEqual(ReferenceRectBefore.bottom);
    })
  })
}