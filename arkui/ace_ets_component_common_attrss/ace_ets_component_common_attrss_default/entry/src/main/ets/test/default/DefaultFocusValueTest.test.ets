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
import { describe, expect } from '@ohos/hypium';

export default function defaultFocusValueTest() {

  //Component to be tested
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DatePicker',
    'Image',
    'ImageAnimator',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Radio',
    'Rating',
    'Search',
    'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'Text',
    'TextArea',
    'TextInput',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Web',
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
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig = {
    testName: 'test',
    pageName: 'DefaultFocusValuePage',
    pageUrl: 'MainAbility/pages/default/DefaultFocusValuePage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues = [{
    describe: 'TabIndex',
    expectValue: {
      tabIndex: 0
    }
  }, {
    describe: 'DefaultFocus',
    expectValue: {
      defaultFocus: false
    }
  }, {
    describe: 'GroupDefault',
    expectValue: {
      groupDefaultFocus: false
    }
  }, {
    describe: 'FocusOnTouch',
    expectValue: {
      focusOnTouch: false
    }
  }]


  describe('DefaultFocusValueTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      if (data.testValue.describe == 'TabIndex') {
        // Test tabIndex defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.tabIndex:' + data.viewObj.$attrs.tabIndex);
        expect(data.viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue.tabIndex);
      } else if (data.testValue.describe == 'DefaultFocus') {
        // Test defaultFocus defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.defaultFocus:' + data.viewObj.$attrs.defaultFocus);
        expect(data.viewObj.$attrs.defaultFocus).assertEqual(data.testValue.expectValue.defaultFocus);
      } else if (data.testValue.describe == 'GroupDefault') {
        // Test groupDefaultFocus defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.groupDefaultFocus:' +
        data.viewObj.$attrs.groupDefaultFocus);
        expect(data.viewObj.$attrs.groupDefaultFocus)
          .assertEqual(data.testValue.expectValue.groupDefaultFocus);
      } else if (data.testValue.describe == 'FocusOnTouch') {
        // Test focusOnTouch defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.focusOnTouch:' +
        data.viewObj.$attrs.focusOnTouch);
        expect(data.viewObj.$attrs.focusOnTouch).assertEqual(data.testValue.expectValue.focusOnTouch);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
        + data.pageConfig.componentKey);
      }
    });
  })
}