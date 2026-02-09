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

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetGroupView: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
}

class TestValue {
  describe: string = '';
  exceptView?: string[];
  expectValue: Size = {};
}

class Size {
  margin?: string
  padding?: string
  hitTestBehavior?: string
  constraintSize?: ConstraintSizeOptions
  markAnchor?: Position
  offset?: Position
  layoutWeight?: number
  visibility?: string
  enabled?: boolean
  touchable?: boolean
}

export default function defaultTest() {

  //Component to be tested
  let supportView = [
    'Stepper',
    'StepperItem',
    'Web',
    'ColumnSplit',
    'RowSplit',
    'FlowItem',
    'SideBarContainer',
    'WaterFlow'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'testDefault',
    pageName: 'DefaultPage',
    pageUrl: 'MainAbility/pages/default/DefaultPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'Padding',
    exceptView: ['AlphabetIndexer', 'Button', 'TextArea', 'TextInput', 'Menu', 'RichText'],
    expectValue: {
      padding: '0.00vp'
    }
  }, {
    describe: 'Margin',
    exceptView: ['Checkbox', 'CheckboxGroup', 'Radio', 'Search', 'Toggle', 'RichText', 'RowSplit'],
    expectValue: {
      margin: '0.00vp'
    }
  }, {
    describe: 'ConstraintSize',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': 'Infinityvp', 'maxHeight': 'Infinityvp'
      }
    }
  }, {
    describe: 'LayoutWeight',
    exceptView: ['Web'],
    expectValue: {
      layoutWeight: 0
    }
  }, {
    describe: 'MarkAnchor',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      markAnchor: {
        x: '', y: ''
      }
    }
  }, {
    describe: 'Offset',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      offset: {
        x: '', y: ''
      }
    }
  }, {
    describe: 'Visibility',
    exceptView: ['RichText', 'Web', 'StepperItem', 'TabContent'],
    expectValue: {
      visibility: 'Visibility.Visible'
    }
  }, {
    describe: 'Enabled',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      enabled: true
    }
  }, {
    describe: 'Touchable',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      touchable: true
    }
  },
    //    {
    //    describe: 'ResponseRegion',
    //    exceptView: ['RichText', 'Web'],
    //    expectValue: {
    //      responseRegion: {
    //        x: '0.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
    //      }
    //    }
    //  },
    {
      describe: 'HitTestBehavior',
      exceptView: ['RichText', 'Web'],
      expectValue: {
        hitTestBehavior: 'HitTestMode.Default'
      }
    }
  ]

  describe('DefaultTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      if (data.testValue.describe == 'Padding') {
        // Test padding defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.padding:' + data.viewObj.$attrs.padding);
        expect(data.viewObj.$attrs.padding).assertEqual(data.testValue.expectValue.padding);
      } else if (data.testValue.describe == 'Margin') {
        // Test margin defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.margin:' + data.viewObj.$attrs.margin);
        expect(data.viewObj.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
      } else if (data.testValue.describe == 'ConstraintSize') {
        // Test constraintSize defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.constraintSize:' + data.viewObj.$attrs.constraintSize);
        expect(data.viewObj.$attrs.constraintSize)
          .assertEqual(JSON.stringify(data.testValue.expectValue.constraintSize));
      } else if (data.testValue.describe == 'LayoutWeight') {
        // Test layoutWeight defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.layoutWeight:' + data.viewObj.$attrs.layoutWeight);
        expect(data.viewObj.$attrs.layoutWeight).assertEqual(data.testValue.expectValue.layoutWeight);
      } else if (data.testValue.describe == 'MarkAnchor') {
        // Test markAnchor defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.x:' + data.viewObj.$attrs.markAnchor.x);
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.y:' + data.viewObj.$attrs.markAnchor.y);
        expect(data.viewObj.$attrs.markAnchor.x).assertEqual(data.testValue.expectValue.markAnchor.x);
        expect(data.viewObj.$attrs.markAnchor.y).assertEqual(data.testValue.expectValue.markAnchor.y);
      } else if (data.testValue.describe == 'Offset') {
        // Test offset defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.x:' + data.viewObj.$attrs.offset.x);
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.y:' + data.viewObj.$attrs.offset.y);
        expect(data.viewObj.$attrs.offset.x).assertEqual(data.testValue.expectValue.offset.x);
        expect(data.viewObj.$attrs.offset.y).assertEqual(data.testValue.expectValue.offset.y);
      } else if (data.testValue.describe == 'Visibility') {
        // Test visibility defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.visibility:' + data.viewObj.$attrs.visibility);
        expect(data.viewObj.$attrs.visibility).assertEqual(data.testValue.expectValue.visibility);
      } else if (data.testValue.describe == 'Enabled') {
        // Test enabled defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.enabled:' + data.viewObj.$attrs.enabled);
        expect(data.viewObj.$attrs.enabled).assertEqual(data.testValue.expectValue.enabled);
      } else if (data.testValue.describe == 'Touchable') {
        // Test touchable defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.touchable:' + data.viewObj.$attrs.touchable);
        expect(data.viewObj.$attrs.touchable).assertEqual(data.testValue.expectValue.touchable);
      } else if (data.testValue.describe == 'ResponseRegion') {
        // Test responseRegion defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.responseRegion[0]:' +
        data.viewObj.$attrs.responseRegion[0]);
        expect(data.viewObj.$attrs.responseRegion[0])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion));
      } else if (data.testValue.describe == 'HitTestBehavior') {
        // Test hitTestBehavior defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.hitTestBehavior:' +
        data.viewObj.$attrs.hitTestBehavior);
        expect(data.viewObj.$attrs.hitTestBehavior).assertEqual(data.testValue.expectValue.hitTestBehavior);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
          + data.pageConfig.componentKey);
      }
    });
  })
}