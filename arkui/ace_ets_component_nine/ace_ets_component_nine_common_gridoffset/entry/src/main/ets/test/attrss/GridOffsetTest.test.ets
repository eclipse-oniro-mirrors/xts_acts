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

import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

export default function gridOffsetTest() {
  let supportView = [
    // 'AlphabetIndexer',
    // 'Button',
    // 'Blank',
    // 'Checkbox',
    // 'CheckboxGroup',
    // 'DataPanel',
    // 'DatePicker',
    // 'Divider',
    // 'Gauge',
    // 'Image',
    // 'ImageAnimator',
    // 'LoadingProgress',
    // 'Marquee',
    // 'Menu',
    // 'MenuItem',
    // 'MenuItemGroup',
    // 'Navigation',
    // 'NavRouter',
    // 'Progress',
    // 'QRCode',
    // 'Radio',
    // 'Rating',
    // 'ScrollBar',
    // 'Search',
    // 'Select',
    // 'Slider',
    // 'Stepper',
    // 'StepperItem',
     'Text',
    // 'TextArea',
    // 'TextClock',
    // 'TextInput',
    // 'TextPicker',
    // 'TextTimer',
    // 'TimePicker',
    // 'Toggle',
    // 'Badge',
    // 'Column',
    // 'ColumnSplit',
    // 'Counter',
    // 'Flex',
    // 'FlowItem',
    // 'GridCol',
    // 'GridRow',
    // 'Grid',
    // 'GridItem',
    // 'List',
    // 'ListItem',
    // 'ListItemGroup',
    // 'Navigator',
    // 'Panel',
    // 'Refresh',
    // 'RelativeContainer',
    // 'Row',
    // 'RowSplit',
    // 'Scroll',
    // 'SideBarContainer',
    // 'Stack',
    // 'Swiper',
    // 'Tabs',
    // 'TabContent',
    // 'Circle',
    // 'Ellipse',
    // 'Polyline',
    // 'Polygon',
    // 'Path',
    // 'Rect',
    // 'Shape',
    // 'Line',
    // 'WaterFlow'
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testGridOffset',
    pageName: 'GridOffsetPage',
    pageUrl: 'MainAbility/pages/common/GridOffsetPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues = [{
    describe: 'SetNumber',
    setValue: 2,
    expectValue: {
      gridOffset: 2
    }
  }]
   /**
   * @tc.number Common_GridOffset_10010
   * @tc.name   testCommonGridOffsetNumber
   * @tc.desc   The GridOffset property of the Common component is set to number
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('GridOffsetTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'gridOffset is:' + data.viewObj.$attrs.gridOffset);
      expect(data.viewObj.$attrs.gridOffset).assertEqual(data.testValue.expectValue.gridOffset);
    });
  })
}