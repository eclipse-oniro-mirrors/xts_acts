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
import Utils from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import { describe, expect } from '@ohos/hypium'

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
}

class TestValues {
  describe: string = '';
  setValue: boolean = false;
  expectValue: ESObject
}

export default function stateStylesTest() {
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
    'TabContent',
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

  let pageConfig: PageConfig = {
    testName: 'testStateStyles',
    pageName: 'StateStylesPage',
    pageUrl: 'MainAbility/pages/stateStyles/StateStylesPage'
  }

  let testValues: TestValues[] = [{
    describe: 'SetDisabled',
    setValue: false,
    expectValue: {
      disabledStyles: 2,
      normalStyles: 1
    }
  }]

  describe('StateStylesTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Obtain target component information before changes
      let targetBeforeObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain target component information after changes
      let targetAfterObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);

      //Check results
      console.info('[' + data.caseTag + ']' + 'targetBeforeObj.$attrs.zIndex is:' + targetBeforeObj.$attrs.zIndex);
      expect(targetBeforeObj.$attrs.zIndex).assertEqual(data.testValue.expectValue.normalStyles);
      console.info('[' + data.caseTag + ']' + 'targetAfterObj.$attrs.zIndex is:' + targetAfterObj.$attrs.zIndex);
      expect(targetAfterObj.$attrs.zIndex).assertEqual(data.testValue.expectValue.disabledStyles);
    });
  })
}