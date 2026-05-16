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
import Utils, { RectValue } from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

class TestValue {
  describe: string = '';
  setValue: Margin = {} as Margin;
  expectValue: Margin = {} as Margin;
}

class Margin {
  margin?: ESObject;
  top?: number;
  right?: number;
  bottom?: number;
  left?: number;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetGroupView: string = '';
  parentComponentKey: string = '';
  buttonComponentKey: string = '';
  childWidth: number = 0;
  childHeight: number = 0;
  parentWidth: number = 0;
  parentHeight: number = 0;
}

export default function marginTest() {
  let setInit: RectValue = {
    top: 0, right: 0, bottom: 0, left: 0
  }
  let getInit = '0.00vp';
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView = [
    'Select',
    'Stepper',
    'StepperItem',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  ]

  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPage',
    pageUrl: 'MainAbility/pages/margin/MarginPage',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    buttonComponentKey: 'buttonComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetAll',
    setValue: {
      margin: {
        top: 20,
        right: 30,
        bottom: 30,
        left: 20
      }
    },
    expectValue: {
      margin: {
        top: '20.00vp', right: '30.00vp', bottom: '30.00vp', left: '20.00vp'
      },
      top: vp2px(20),
      right: vp2px(30),
      bottom: vp2px(30),
      left: vp2px(20)
    }
  }, {
    describe: 'SetTop',
    setValue: {
      margin: {
        top: 50
      }
    },
    expectValue: {
      margin: {
        top: '50.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      top: vp2px(50),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetRight',
    setValue: {
      margin: {
        right: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '50.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(50),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetBottom',
    setValue: {
      margin: {
        bottom: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '50.00vp', left: '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(50),
      left: vp2px(0)
    }
  }, {
    describe: 'SetLeft',
    setValue: {
      margin: {
        left: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '50.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(50)
    }
  }]

  describe('MarginTest', () => {
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Initialize margin properties
      console.info('[' + data.caseTag + '] setValue : ' + setInit);
      AttrsManager.change(data.caseTag, setInit);
      await Utils.sleep(1000);
      //Confirm successful setting of margin attribute
      let referenceRectBefore: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(referenceRectBefore.$attrs.margin).assertEqual(getInit);
      //Set test values
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue.margin);
      await Utils.sleep(1000);
      let referenceRectAfter: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      //Component margin
      let top = 0;
      let left = 0;
      let right = 0;
      let bottom = 0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = referenceRect.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        //parentComponent
        let rectParent = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]);
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if ((data.pageConfig.componentKey == 'GridCol')
        || (data.pageConfig.componentKey == 'FlowItem')
        || (data.pageConfig.componentKey == 'GridItem')
        || (data.pageConfig.componentKey == 'MenuItem')
        || (data.pageConfig.componentKey == 'MenuItemGroup')) {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey)
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = referenceRect.left - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      console.info('[' + data.caseTag + ']' + 'top is: ' + top);
      console.info('[' + data.caseTag + ']' + 'left is: ' + left);
      console.info('[' + data.caseTag + ']' + 'right is: ' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is: ' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is: ' + referenceRectAfter.$attrs.margin);
      //Confirm if the margin is correct
      expect(referenceRectAfter.$attrs.margin).assertEqual(JSON.stringify(data.testValue.expectValue.margin));
      expect(Math.abs(top - data.testValue.expectValue.top) <= 1).assertTrue();
      expect(Math.abs(right - data.testValue.expectValue.right) <= 1).assertTrue();
      expect(Math.abs(bottom - data.testValue.expectValue.bottom) <= 1).assertTrue();
      expect(Math.abs(left - data.testValue.expectValue.left) <= 1).assertTrue();
    });
  })
}