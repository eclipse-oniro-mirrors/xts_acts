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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentBackGroundColor: Color = Color.White;
  parentComponentKey: string = '';
}

class TestValues {
  describe: string = '';
  setValue?: Padding;
  expectValue?: Padding;
}

class Padding {
  padding: ESObject
}


export default function paddingTest() {
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
    'ScrollBar',
    'Rating',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'Menu',
    'MenuItem',
    'MenuItemGroup'
  ]

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingBase',
    pageName: 'PaddingBasePage',
    pageUrl: 'MainAbility/pages/padding/PaddingBasePage',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [
    {
      describe: 'SetPadding',
      setValue: {
        padding: {
          top: 200,
          right: 100,
          bottom: 100,
          left: 100
        }
      },
      expectValue: {
        padding: {
          top: '200.00vp', right: '100.00vp', bottom: '100.00vp', left: '100.00vp'
        }
      }
    }, {
    describe: 'SetPaddingTop',
    setValue: {
      padding: {
        top: 200
      }
    },
    expectValue: {
      padding: {
        top: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingRight',
    setValue: {
      padding: {
        right: 200
      }
    },
    expectValue: {
      padding: {
        right: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingBottom',
    setValue: {
      padding: {
        bottom: 200
      }
    },
    expectValue: {
      padding: {
        bottom: '200.00vp'
      }
    }
  }, {
    describe: 'SetPaddingLeft',
    setValue: {
      padding: {
        left: 200
      }
    },
    expectValue: {
      padding: {
        left: '200.00vp'
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingBaseTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Modify the target component properties.
      AttrsManager.change(data.caseTag, {
        padding: {
          left: 0, right: 0, top: 0, bottom: 0
        } as ESObject
      });
      await Utils.sleep(1000);

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.$attrs.padding);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);

      if (data.testValue.describe == 'SetPaddingTop') {
        //Verify the method of setting top separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).top:'
          + JSON.parse(viewObj.$attrs.padding).top);
        expect(JSON.parse(viewObj.$attrs.padding).top).assertEqual(data.testValue.expectValue.padding.top);
      } else if (data.testValue.describe == 'SetPaddingRight') {
        //Verify the method of setting right separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).right:'
          + JSON.parse(viewObj.$attrs.padding).right);
        expect(JSON.parse(viewObj.$attrs.padding).right).assertEqual(data.testValue.expectValue.padding.right);
      } else if (data.testValue.describe == 'SetPaddingBottom') {
        //Verify the method of setting bottom separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).bottom:'
          + JSON.parse(viewObj.$attrs.padding).bottom);
        expect(JSON.parse(viewObj.$attrs.padding).bottom).assertEqual(data.testValue.expectValue.padding.bottom);
      } else if (data.testValue.describe == 'SetPaddingLeft') {
        //Verify the method of setting left separately.
        console.info('[' + data.caseTag + '] JSON.parse(viewObj.$attrs.padding).left:'
          + JSON.parse(viewObj.$attrs.padding).left);
        expect(JSON.parse(viewObj.$attrs.padding).left).assertEqual(data.testValue.expectValue.padding.left);
      } else if (data.testValue.describe == 'SetPadding') {
        //Method for verifying the setting of padding.
        console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.$attrs.padding);
        expect(viewObj.$attrs.padding).assertEqual(JSON.stringify(data.testValue.expectValue.padding));
      }
    })
  })
}
