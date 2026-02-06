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
  setValue: ESObject;
  expectValue: ESObject;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentHeight: number = 0;
  parentWidth: number = 0;
  parentBackGroundColor: Color = Color.White;
  parentComponentKey: string = '';
  BackGroundColor: Color = Color.White;
}

/**
 * Test of common attribute: height
 */
export default function heightTest() {
  //A list of components that support padding attributes is required.
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
    'Search',
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
    //    'GridRow',
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
    'Menu',
    'MenuItem',
  //    'MenuItemGroup'
  ]

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testHeight',
    pageName: 'HeightPage',
    pageUrl: 'MainAbility/pages/height/HeightPage',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    BackGroundColor: BackGroundColor
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'ExceedParent',
    setValue: {
      height: 550
    },
    expectValue: {
      heightCompare: '550.00vp',
      height: vp2px(550), ExceedParent: true
    }
  },
    {
      describe: 'StringPercent',
      setValue: {
        height: '50%'
      },
      expectValue: {
        heightCompare: '50.00%',
        height: vp2px(parentHeight) * 0.5
      }
    }, {
      describe: 'Resource',
      setValue: {
        height: $r('app.float.200vp')
      },
      expectValue: {
        heightCompare: '200.00vp',
        height: vp2px(200)
      }
    }, {
      describe: 'StringPx',
      setValue: {
        height: '300px'
      },
      expectValue: {
        heightCompare: '300.00px',
        height: 300
      }
    }]

  /**
   * Create test suite.
   */
  describe('HeightTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      //Obtain dimensional information for target components.
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);

      //Obtain the region information of the parent component.
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Verify the height height of the target component.
      let strJsonRectHeight = rect.bottom - rect.top;
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.height:' + data.viewObj.$attrs.height);
      console.info('[' + data.caseTag + '] strJsonRectHeight is: ' + strJsonRectHeight);

      if (data.testValue.describe == 'ExceedParent') {
        //Confirm that the calculated value is consistent with the expected value.
        expect(rectParent.top > rect.top || rectParent.bottom < rect.bottom)
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }

      //Confirm that the height attribute values have been successfully set.
      expect(data.viewObj.$attrs.height).assertEqual(data.testValue.expectValue.heightCompare);

      //Confirm that the calculated value is consistent with the expected value.
      expect(Math.abs(strJsonRectHeight - data.testValue.expectValue.height) <= 1).assertTrue();
    })
  })
}