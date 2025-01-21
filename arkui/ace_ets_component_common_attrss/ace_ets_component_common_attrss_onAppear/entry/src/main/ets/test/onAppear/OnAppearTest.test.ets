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
import { describe, expect } from '@ohos/hypium';


export default function onAppearTest() {

  //Component to be tested
  let supportView = [
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    //'ImageAnimator',
    //'LoadingProgress',
    'Marquee',
    //'Menu',
    //'MenuItem',
    //'MenuItemGroup',
    //'Navigation',
    //'NavRouter',
    //'NavDestination',
    //'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    //'RichText',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    //'Stepper',
    'StepperItem',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    //'TextTimer',
    'TimePicker',
    'Toggle',
    //'Badge',
    'Column',
    'ColumnSplit',
    'Flex',
    'FlowItem',
    //'GridRow',
    //'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    //'ListItemGroup',
    'Navigator',
    //'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    //'TabContent',
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Counter'
  ]

  //Custom params.
  let compareTextKey = 'compareTextKey';
  let targetWidth = 60;
  let targetHeight = 60;

  let pageConfig = {
    testName: 'testOnAppear',
    pageName: 'OnAppearPage',
    pageUrl: 'MainAbility/pages/onAppear/OnAppearPage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  //Test content and expected results
  let testValues = [{
    describe: '',
    expectValue: {
      changeAppear: 'onAppear'
    }
  }]

  describe('OnAppearTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      //Get text content,check content is onAppear
      let compareTextObj = Utils.getComponentByKey(data.pageConfig.compareTextKey);
      console.info('compareTextObj.$attrs.content: ' + compareTextObj.$attrs.content);
      expect(compareTextObj.$attrs.content).assertEqual(data.testValue.expectValue.changeAppear);
    });
  })
}