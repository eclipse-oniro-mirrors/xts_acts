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
import Utils from '../../MainAbility/common/Utils';

export default function alignSelfTest() {
  let supportView = [
//     'AlphabetIndexer',
// //    'Blank',
//     'Button',
//     'Checkbox',
//     'CheckboxGroup',
//     'DataPanel',
//     'DatePicker',
//     'Divider',
//     'Gauge',
//     'Image',
//     'ImageAnimator',
//     'LoadingProgress',
//     'Marquee',
//     'Menu',
//     'Navigation',
//     'NavRouter',
//     'ScrollBar',
//     'RowSplit',
//     'Row',
//     'RelativeContainer',
//     'Navigator',
//     'ColumnSplit',
//     'TextTimer',
//     'Stepper',
// //    'Flex',
//     'Progress',
//     'QRCode',
//     'Radio',
//     'Rating',
//     'Search',
//     'Select',
//     'Slider',
    'Text',
//     'TextArea',
//     'TextClock',
//     'TextInput',
//     'TextPicker',
//     'TimePicker',
//     'Toggle',
//     'Badge',
//     'Column',
//     'Counter',
// //    'GridRow',
//     'Grid',
//     'List',
//     'Panel',
//     'Refresh',
//     'Scroll',
//     'SideBarContainer',
//     'Stack',
//     'Swiper',
//     'Tabs',
//     'WaterFlow',
//     'Circle',
//     'Ellipse',
//     'Line',
//     'Polyline',
//     'Polygon',
//     'Path',
//     'Rect',
//     'Shape'
  ]
  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']
  let parentWidth = 400;
  let parentHeight = 400;
  let pageConfig = {
    testName: 'testAlignSelf',
    pageName: 'AlignSelfPage',
    pageUrl: 'MainAbility/pages/common/AlignSelfPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentComponentKey: 'parentComponentKey'
  }
  let defaultAlignItems = {
    Row: VerticalAlign.Top,
    Column: HorizontalAlign.Start,
    Flex: ItemAlign.Start,
    GridRow: ItemAlign.Start
  }
  let testValues = [{
    describe: 'SetAuto',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Auto
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Auto'
    }
  }, {
    describe: 'SetStart',
    setValue: {
      defaultAlignItems: {
        Row: VerticalAlign.Center,
        Column: HorizontalAlign.Center,
        Flex: ItemAlign.Center,
        GridRow: ItemAlign.Center
      },
      alignSelf: ItemAlign.Start
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Start'
    }
  }, {
    describe: 'SetCenter',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Center
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Center'
    }
  }, {
    describe: 'SetEnd',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.End
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.End'
    }
  }, {
    describe: 'SetStretch',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Stretch
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Stretch'
    }
  }, {
    describe: 'SetBaseLine',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Baseline
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Baseline'
    }
  }]
   /**
   * @tc.number Common_AlignSelf_10010
   * @tc.name   testCommonAlignSelfEnumeration
   * @tc.desc   The AlignSelf property of the Common component is set to enumeration
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('AlignSelfTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async data => {
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'alignSelf is:' + JSON.stringify(viewObj.$attrs.alignSelf));
      expect(viewObj.$attrs.alignSelf).assertEqual(data.testValue.expectValue.expectAlignSelf);
    })
  })
}