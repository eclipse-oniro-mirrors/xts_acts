/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

class TestValue {
  describe: string;
  setValue: ESObject;
  expectValue: ESObject;
}

class PageConfig {
  testName: string;
  pageName: string;
  pageUrl: string;
  targetGroupView: string;
  parentComponentKey: string;
  referenceComponentKey: string;
  childWidth: number;
  childHeight: number;
  parentWidth: number;
  parentHeight: number;
}

export default function marginLengthTest() {
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
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
    //'MenuItem',
    //'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    //'Web',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    //'Flex',
    //'FlowItem',
    'GridRow',
    'GridCol',
    'Grid',
    //'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'WaterFlow'
  ]
  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPageLength',
    pageUrl: 'MainAbility/pages/margin/MarginPageLength',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      margin: 100,
    },
    expectValue: {
      margin: '100.00vp',
      top: vp2px(100),
      right: vp2px(100),
      bottom: vp2px(100),
      left: vp2px(100)
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      margin: '200px',
    },
    expectValue: {
      margin: '200.00px',
      top: 200,
      right: 200,
      bottom: 200,
      left: 200
    }
  }, {
    describe: 'SetResource',
    setValue: {
      margin: $r('app.float.100vp'),
    },
    expectValue: {
      margin: '100.00vp',
      top: vp2px(100),
      right: vp2px(100),
      bottom: vp2px(100),
      left: vp2px(100)
    }
  }]

  describe('MarginLengthTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      //Component margin
      let top = 0;
      let left = 0;
      let right = 0;
      let bottom = 0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let rectReference = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectReference.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        //parentComponent
        let rectParent = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]);
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      console.info('[' + data.caseTag + ']' + 'top is:' + top);
      console.info('[' + data.caseTag + ']' + 'left is:' + left);
      console.info('[' + data.caseTag + ']' + 'right is:' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is:' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is:' + data.viewObj.$attrs.margin);
      //Confirm if the margin is correct
      expect(data.viewObj.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
      expect(Math.abs(top - data.testValue.expectValue.top) <= 1).assertTrue();
      expect(Math.abs(right - data.testValue.expectValue.right) <= 1).assertTrue();
      expect(Math.abs(bottom - data.testValue.expectValue.bottom) <= 1).assertTrue();
      expect(Math.abs(left - data.testValue.expectValue.left) <= 1).assertTrue();
    });
  })
}