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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

export default function flexGrowTest() {

  let supportView = [
    // 'AlphabetIndexer',
    'Button',
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
    // 'Navigation',
    // 'NavRouter',
    // 'ScrollBar',
    // 'RowSplit',
    // 'Row',
    // 'RelativeContainer',
    // 'Navigator',
    // 'ColumnSplit',
    // 'TextTimer',
    // 'Stepper',
//    'Flex',
    // 'Progress',
    // 'QRCode',
    // 'Radio',
    // 'Rating',
    // 'Search',
    // 'Select',
    // 'Slider',
    // 'Text',
    // 'TextArea',
    // 'TextClock',
    // 'TextInput',
    // 'TextPicker',
    // 'TimePicker',
    // 'Toggle',
    // 'Badge',
    // 'Column',
    // 'Counter',
//    'GridRow',
    // 'Grid',
    // 'List',
    // 'Panel',
    // 'Refresh',
    // 'Scroll',
    // 'SideBarContainer',
    // 'Stack',
    // 'Swiper',
    // 'Tabs',
    // 'WaterFlow',
    // 'Circle',
    // 'Ellipse',
    // 'Line',
    // 'Polyline',
    // 'Polygon',
    // 'Path',
    // 'Rect',
    // 'Shape'
  ]

  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']
  let parentWidth = 500;
  let parentHeight = 500;
  let compareWidth = 100;
  let compareHeight = 100;
  let standardWidth = 100;
  let standardHeight = 100;
  let flexGrow = 3;
  let compareFlexGrow = 1;
  let targetWidth = 100;
  let targetHeight = 100;
  let pageConfig = {
    testName: 'testFlexGrow',
    pageName: 'CommonFlexGrowPage',
    pageUrl: 'MainAbility/pages/common/CommonFlexGrowPage',
    compareWidth: compareWidth,
    compareHeight: compareHeight,
    standardWidth: standardWidth,
    standardHeight: standardHeight,
    standardComponentKey: 'standardComponentKey',
    compareComponentKey: 'compareComponentKey',
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }
  let testValues = [{
    describe: 'SetFlexGrow01',
    setValue: 0,
    expectValue: {
      flexGrow: 0
    }
  }, {
    describe: 'SetFlexGrow02',
    setValue: 1, 
    expectValue: {
      flexGrow: 1
    }
  }, {
    describe: 'SetFlexGrow03',
    setValue: 2, 
    expectValue: {
      flexGrow: 2
    }
  }]
   /**
   * @tc.number Common_FlexGrow_10010
   * @tc.name   testCommonFlexGrowNumber
   * @tc.desc   The FlexGrow property of the Common component is set to number
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('FlexGrowTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, null, async data => {
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'flexGrow is:' + viewObj.$attrs.flexGrow);
      expect(viewObj.$attrs.flexGrow).assertEqual(data.testValue.expectValue.flexGrow);
    })
  })
}