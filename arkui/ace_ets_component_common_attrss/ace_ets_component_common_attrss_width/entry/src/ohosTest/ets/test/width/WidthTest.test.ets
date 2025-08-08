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
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class TestValue {
  describe: string = '';
  setValue: ESObject
  expectValue: ESObject;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
  parentBackGroundColor: Color = Color.White;
  BackGroundColor: Color = Color.White;
  parentComponentKey: string = '';
}

/**
 * Test of common attribute: width
 */
export default function widthTest() {
  //A list of components that support width attributes is required.
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'BlankRow',
    'BlankColumn',
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
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    //    'ScrollBar',
    'Rating',
    //    'Search',
    'RichText',
    'Slider',
    'Text',
    //    'TextArea',
    'TextClock',
    //    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    //    'Counter',
    'Flex',
    'GridRow',
    'Grid',
    'List',
    'ListItem',
    //    'Panel',
    'Refresh',
    'Row',
    //    'Scroll',
    //    'SideBarContainer',
    'Stack',
    'Swiper',
    //    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    //    'StepperItem',
    //    'GridCol',
    'GridItem',
    'RelativeContainer',
    'Navigator',
  ]

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testWidth',
    pageName: 'WidthPage',
    pageUrl: 'MainAbility/pages/width/WidthPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'ExceedParent',
    setValue: {
      width: 400
    },
    expectValue: {
      widthCompare: '400.00vp',
      width: vp2px(400), ExceedParent: true
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      width: '50%'
    },
    expectValue: {
      widthCompare: '50.00%',
      width: vp2px(parentWidth) * 0.5
    }
  }, {
    describe: 'Resource',
    setValue: {
      width: $r('app.float.200vp')
    },
    expectValue: {
      widthCompare: '200.00vp',
      width: vp2px(200)
    }
  }, {
    describe: 'StringPx',
    setValue: {
      width: '300px'
    },
    expectValue: {
      widthCompare: '300.00px',
      width: 300
    }
  }]

  /**
   * Create test suite.
   */
  describe('WidthTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Obtain dimensional information for reference components.
      let rect: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      //Obtain the region information of the parent component.
      let rectParent: ESObject = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue.width);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.width:' + data.viewObj.$attrs.width);

      //Verify the width width of the target component.
      let strJsonRectWidth = rect.right - rect.left;
      console.info('[' + data.caseTag + '] strJsonRectWidth is:' + strJsonRectWidth);

      if (data.testValue.describe == 'ExceedParent') {
        //Confirm that the calculated value is consistent with the expected value.
        expect((rectParent.left > rect.left || rectParent.right < rect.right))
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }

      //Confirm that the width attribute values have been successfully set.
      expect(data.viewObj.$attrs.width).assertEqual(data.testValue.expectValue.widthCompare);

      //Confirm that the calculated value is consistent with the expected value.
      expect(Math.abs(strJsonRectWidth - data.testValue.expectValue.width) <= 1).assertTrue();
    })
  })
}