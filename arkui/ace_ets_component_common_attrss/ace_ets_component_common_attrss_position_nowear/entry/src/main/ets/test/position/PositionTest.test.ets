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
import Utils, { RectValue } from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
}

class TestValues {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

/**
 * Test of common attribute: position
 */
export default function positionTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'RowSplit',
    'ColumnSplit',
    'Stepper',
    'StepperItem',
    'FlowItem',
    'Select',
    'SideBarContainer',
    'WaterFlow'
  ]

  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 300;
  let parentHeight = 400;

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPosition',
    pageName: 'PositionPage',
    pageUrl: 'MainAbility/pages/position/PositionPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [{
    describe: 'SetNumber',
    setValue: {
      x: 200, y: 100
    },
    expectValue: {
      x: '200.00vp', y: '100.00vp', left: vp2px(200), top: vp2px(100)
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      x: '200px', y: '100px'
    },
    expectValue: {
      x: '200.00px', y: '100.00px', left: 200, top: 100
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      x: '20%', y: '10%', xp: 0.2, yp: 0.1
    },
    expectValue: {
      x: '20.00%', y: '10.00%', left: vp2px(parentWidth) * 0.2, top: vp2px(parentHeight) * 0.1
    }
  }, {
    describe: 'SetResource',
    setValue: {
      x: $r('app.float.200vp'), y: $r('app.float.100vp')
    },
    expectValue: {
      x: '200.00vp', y: '100.00vp', left: vp2px(200), top: vp2px(100)
    }
  }]

  /**
   * Create test suite.
   */
  describe('PositionTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get referenceComponent rect before position changed.');
      let referenceRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

      //Obtain the region information of the parent component.
      console.info('[' + data.caseTag + '] get parentComponent rect before position changed.');
      let parentRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Modify the target component properties.
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get referenceComponent rect after position changed.');
      let referenceRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

      //Obtain the region information of the parent component.
      console.info('[' + data.caseTag + '] get parentComponent rect after position changed.');
      let parentRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] check actual position.');
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);

      //When the target component is TabContent or StepperItem,
      //the parent component is the Swiper on the outer layer of Tabs or Stepper.
      let rectParent = parentRectAfter;
      let benchmarkChanged = false;
      if ('TabContent' == data.pageConfig.targetView || 'StepperItem' == data.pageConfig.targetView) {
        let parentComponent: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0];
        parentComponent.$children.forEach((element: ESObject) => {
          if ('Swiper' == element.$type) {
            rectParent = Utils.getComponentRectByObj(element)
            benchmarkChanged = true;
          }
        });
      }

      //Base when setting percentage.
      let percentBaseX = rectParent.right - rectParent.left;
      let percentBaseY = rectParent.bottom - rectParent.top;

      //When using GridItem and FlowItem, use themselves as the percentage base.
      if ('GridItem' == data.pageConfig.targetView || 'FlowItem' == data.pageConfig.targetView) {
        percentBaseX = rect.right - rect.left;
        percentBaseY = rect.bottom - rect.top;
        benchmarkChanged = true;
      }

      //Using the upper left corner of the parent container as the reference point,
      //verify the actual offset of the target component.
      if ('SetStringPercent' == data.testValue.describe && benchmarkChanged) {
        console.info('[' + data.caseTag + '] benchmark changed after component rendered.');
        console.info('[' + data.caseTag + '] check actual offset x.');
        expect(Math.abs(Number(rect.left - rectParent.left) - Number(percentBaseX * data.testValue.setValue.xp)) <= 1)
          .assertTrue();
        console.info('[' + data.caseTag + '] check actual offset y.');
        expect(Math.abs(Number(rect.top - rectParent.top) - Number(percentBaseY * data.testValue.setValue.yp)) <= 1)
          .assertTrue();
      } else {
        console.info('[' + data.caseTag + '] check actual offset x.');
        expect(Math.abs(Number(rect.left - rectParent.left) - Number(data.testValue.expectValue.left)) <= 1)
          .assertTrue();
        console.info('[' + data.caseTag + '] check actual offset y.');
        expect(Math.abs(Number(rect.top - rectParent.top) - Number(data.testValue.expectValue.top)) <= 1).assertTrue();
      }

      //Confirm that the position attribute value has been set successfully.
      console.info('[' + data.caseTag + '] check position attr value.');
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] check position x.');
      expect(viewObj.$attrs.position.x).assertEqual(data.testValue.expectValue.x);
      console.info('[' + data.caseTag + '] check position y.');
      expect(viewObj.$attrs.position.y).assertEqual(data.testValue.expectValue.y);

      //Confirm that the region information of the reference component has not changed.
      console.info('[' + data.caseTag + '] check referenceComponent layout not changed.');
      expect(Math.abs(referenceRectBefore.left - referenceRectAfter.left) <= 1).assertTrue()
      expect(Math.abs(referenceRectBefore.right - referenceRectAfter.right) <= 1).assertTrue()
      expect(Math.abs(referenceRectBefore.top - referenceRectAfter.top) <= 1).assertTrue()
      expect(Math.abs(referenceRectBefore.bottom - referenceRectAfter.bottom) <= 1).assertTrue()

      //Confirm that the region information of the parent component has not changed.
      console.info('[' + data.caseTag + '] check parentComponent layout not changed.');
      expect(Math.abs(parentRectBefore.left - parentRectAfter.left) <= 1).assertTrue()
      expect(Math.abs(parentRectBefore.right - parentRectAfter.right) <= 1).assertTrue()
      expect(Math.abs(parentRectBefore.top - parentRectAfter.top) <= 1).assertTrue()
      expect(Math.abs(parentRectBefore.bottom - parentRectAfter.bottom) <= 1).assertTrue()
    })
  })
}