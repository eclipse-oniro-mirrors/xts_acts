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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { Visibility } from '@ohos.arkui.component';
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function visibilityTest() {
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'WaterFlow'
  ]
  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;

  let pageConfig: PageConfig = {
    testName: 'testVisibility',
    pageName: 'VisibilityPage',
    pageUrl: 'MainAbility/pages/visibility/VisibilityPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey'
  }


  let testValues: TestValue[] = [
   {
    describe: 'SetHidden',
    setValue: Visibility.Hidden,
    expectValue: {
      visibility: 'Visibility.Hidden'
    }
  },
    {
    describe: 'SetVisible',
    setValue: Visibility.Visible,
    expectValue: {
      visibility: 'Visibility.Visible'
    }
  }]

  describe('VisibilityTest', () => {

    beforeAll(() => {
      console.info("VisibilityTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues,async (data: BasePageConfig): Promise<void> => {
      await Utils.sleep(1000);

      //Reference component area information before getting case execution
      console.info('[' + data.caseTag + '] get referenceComponent rect before position changed.' + data.pageConfig.referenceComponentKey);
      let referenceRectBefore = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

      //Reference Component Previous Size
      let referenceBeforeHeight = referenceRectBefore.bottom - referenceRectBefore.top;
      let referenceBeforeWidth = referenceRectBefore.right - referenceRectBefore.left;

      //Target component area information before getting case execution
      console.info('[' + data.caseTag + '] get Component rect before position changed.');
      let rectBefore = Utils.getComponentRect(data.pageConfig.componentKey as string);

      //Target Component Previous Size
      let rectBeforeHeight = rectBefore.bottom - rectBefore.top;
      let rectBeforeWidth = rectBefore.right - rectBefore.left;

      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      await Utils.sleep(1000);

      //Get reference component and target component area information
      let rectAfter = Utils.getComponentRect(data.pageConfig.componentKey as string);
      let referenceRectAfter = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
      let parentComponentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Component width and height calculation
      let height = rectAfter.bottom - rectAfter.top;
      let width = rectAfter.right - rectAfter.left;
      let referenceHeight = referenceRectAfter.bottom - referenceRectAfter.top;
      let referenceWidth = referenceRectAfter.right - referenceRectAfter.left;
      console.info('[' + data.caseTag + ']' + 'width is:' + JSON.stringify(width));
      console.info('[' + data.caseTag + ']' + 'height is:' + JSON.stringify(height));
      console.info('[' + data.caseTag + ']' + 'rectBeforeWidth is:' + JSON.stringify(rectBeforeWidth));
      console.info('[' + data.caseTag + ']' + 'rectBeforeHeight is:' + JSON.stringify(rectBeforeHeight));
      if ('SetNone' == data.testValue.describe) {
        if ((data.pageConfig.componentKey == 'FlowItem') || (data.pageConfig.componentKey == 'GridItem')) {
          expect(referenceRectAfter.top).assertEqual(referenceRectBefore.top);
          expect(referenceRectAfter.left).assertEqual(referenceRectBefore.left);
        } else if ((data.pageConfig.componentKey == 'MenuItem')
          || (data.pageConfig.componentKey == 'MenuItemGroup')
          || (data.pageConfig.componentKey == 'ListItem')
          || (data.pageConfig.componentKey == 'ListItemGroup')
          || (data.pageConfig.componentKey == 'GridCol')) {
          expect(referenceRectAfter.top).assertEqual(rectBefore.top);
          expect(referenceRectAfter.left).assertEqual(rectBefore.left);
        } else {
          //The left side of the reference component coincides with the left side of the parent component
          expect(referenceRectAfter.left).assertEqual(parentComponentRect.left);
        }
        expect(width).assertEqual(data.testValue.expectValue.width);
        expect(height).assertEqual(data.testValue.expectValue.height);
      } else {
        expect(referenceRectAfter.top).assertEqual(referenceRectBefore.top);
        expect(referenceRectAfter.left).assertEqual(referenceRectBefore.left);
        console.info('[' + data.caseTag + ']' + 'height is:' + height);
        console.info('[' + data.caseTag + ']' + 'width is:' + width);
        //Expect the size of the component to remain the same before and after
        expect(width).assertEqual(rectBeforeWidth);
        expect(height).assertEqual(rectBeforeHeight);
        //Component size not equal to 0
        expect(width > 0).assertEqual(true);
        expect(height > 0).assertEqual(true);
      }
      let rect = Utils.getComponentByKey(data.pageConfig.componentKey as string);
      console.info('[' + data.caseTag + ']' + 'visibility is:' + rect.getElement('$attrs').getString('visibility'));
      expect(rect.getElement('$attrs').getString('visibility')).assertEqual(data.testValue.expectValue.visibility);
      //The expected size of the reference component remains unchanged before and after
      expect(referenceHeight).assertEqual(referenceBeforeHeight);
      expect(referenceWidth).assertEqual(referenceBeforeWidth);
    });
  })
}