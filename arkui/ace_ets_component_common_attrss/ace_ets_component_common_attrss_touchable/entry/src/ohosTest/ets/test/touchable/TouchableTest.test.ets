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

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
}

class TestValues {
  describe: string = '';
  setValue: boolean = false;
  expectValue: boolean = false
}

/**
 * Test of common attribute: touchable
 */
export default function touchableTest() {
  //A list of components that support the touchable attribute, which is required.
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
    'TabContent',
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
    'FlowItem',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
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

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testTouchable',
    pageName: 'TouchablePage',
    pageUrl: 'MainAbility/pages/touchable/TouchablePage',
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [{
    describe: 'SetTrue',
    setValue: true,
    expectValue: true
  }, {
    describe: 'SetFalse',
    setValue: false,
    expectValue: false
  }]

  /**
   * Create test suite.
   */
  describe('TouchableTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      console.info('[' + data.caseTag + ']' + 'touchable is:' + data.viewObj.$attrs.touchable);
      expect(data.viewObj.$attrs.touchable)
        .assertEqual(data.testValue.expectValue);
    })
  })
}