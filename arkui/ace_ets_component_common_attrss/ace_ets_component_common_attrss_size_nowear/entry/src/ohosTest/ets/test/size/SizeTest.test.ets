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

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
  parentBackGroundColor: Color = Color.White;
  BackGroundColor: Color = Color.White;
}

class TestValues {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

/**
 * Test of common attribute: size
 */
export default function sizeTest() {
  //A list of components that support size attributes is required.
  let supportView = [
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow',
    'Stepper',
    'FlowItem'
  ]

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red;
  let BackGroundColor = Color.Orange;

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testSize',
    pageName: 'SizePage',
    pageUrl: 'MainAbility/pages/size/SizePage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [{
    describe: 'StringNumber',
    setValue: {
      width: 200, height: 200
    },
    expectValue: {
      widthCompare: '200.00vp', heightCompare: '200.00vp',
      width: vp2px(200), height: vp2px(200)
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      width: '50%', height: '50%'
    },
    expectValue: {
      widthCompare: '50.00%', heightCompare: '50.00%',
      width: vp2px(parentWidth) * 0.5, height: vp2px(parentHeight) * 0.5
    }
  }, {
    describe: 'Resource',
    setValue: {
      width: $r('app.float.200vp'),
      height: $r('app.float.100vp')
    },
    expectValue: {
      widthCompare: '200.00vp', heightCompare: '100.00vp',
      width: vp2px(200),
      height: vp2px(100)
    }
  }, {
    describe: 'StringPx',
    setValue: {
      width: '300px',
      height: '300px'
    },
    expectValue: {
      widthCompare: '300.00px', heightCompare: '300.00px',
      width: 300, height: 300
    }
  }, {
    describe: 'SetStringWidth',
    setValue: {
      width: '300px'
    },
    expectValue: {
      widthCompare: '300.00px',
      width: 300
    }
  },
    {
      describe: 'SetStringHeight',
      setValue: {
        height: '300px'
      },
      expectValue: {
        heightCompare: '300.00px',
        height: 300
      }
    }]

  /**
   * Create test suite.
   */
  describe('SizeTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Obtain dimensional information for reference components.
      let rect: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the target component.
      let strJsonRectWidth = rect.right - rect.left;

      //Verify the height size of the target component.
      let strJsonRectHeight = rect.bottom - rect.top;

      console.info('[' + data.caseTag + '] strJsonRectWidth is: ' + strJsonRectWidth);
      console.info('[' + data.caseTag + '] strJsonRectHeight is: ' + strJsonRectHeight);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue.width);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.width:' + data.viewObj.$attrs.width);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.height:' + data.viewObj.$attrs.height);

      if (data.testValue.describe == 'SetStringWidth') {
        //When the use case is SetStringWidth.
        //Assertion width is consistent with expected value.
        expect(data.viewObj.$attrs.size.width).assertEqual(data.testValue.expectValue.widthCompare);
        expect(Math.abs(Math.round(strJsonRectWidth) - Math.round(data.testValue.expectValue.width)) <= 2).assertTrue();
      } else if (data.testValue.describe == 'SetStringHeight') {
        //When the use case is SetStringHeight.
        //Assertion height is consistent with expected value.
        expect(data.viewObj.$attrs.size.height).assertEqual(data.testValue.expectValue.heightCompare);
        expect(Math.abs(Math.round(strJsonRectHeight) - Math.round(data.testValue.expectValue.height)) <= 2).assertTrue();
      } else {
        //Confirm that the size attribute values have been successfully set.
        expect(data.viewObj.$attrs.size.width).assertEqual(data.testValue.expectValue.widthCompare);
        expect(data.viewObj.$attrs.size.height).assertEqual(data.testValue.expectValue.heightCompare);

        //Confirm that the calculated value is consistent with the expected value.
        expect(Math.abs(Math.round(strJsonRectWidth) - Math.round(data.testValue.expectValue.width)) <= 2).assertTrue()
        expect(Math.abs(Math.round(strJsonRectHeight) - Math.round(data.testValue.expectValue.height)) <= 2).assertTrue()
      }
    })
  })
}
