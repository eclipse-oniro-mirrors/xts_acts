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
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class TestValue {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
  subassemblyWidth: number = 0;
  subassemblyHeight: number = 0;
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
}

export default function OffsetTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
	'Select',
    'SideBarContainer',
	'WaterFlow', 
    'RowSplit', 
	'ColumnSplit',
    'Stepper', 
	'FlowItem',
	'StepperItem'
    ]

  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 200;
  let parentHeight = 200;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testOffset',
    pageName: 'OffsetPage',
    pageUrl: 'MainAbility/pages/offset/OffsetPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50),
    }
  }, {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    },
    expectValue: {
      x: '150.00px', y: '150.00px', left: 150, top: 150,
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      x: '50.00%', y: '50.00%'
    },
    expectValue: {
      x: '50.00%', y: '50.00%'
    }
  }, {
    describe: 'Resource',
    setValue: {
      x: $r('app.float.50vp'), y: $r('app.float.50vp')
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50),
    }
  }]

  /**
   * Create test suite.
   */

  describe('OffsetTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Restore the target component to its original position
      console.info('[' + data.caseTag + '] restore the target component to its original position');
      AttrsManager.change(data.caseTag, {
        x: 0, y: 0
      });
      await Utils.sleep(1000);

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get target Component rect before position changed.');
      let initialPosition = Utils.getComponentRect(data.pageConfig.componentKey);

      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get Reference Component rect before position changed.');
      let ReferenceRectBefore = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

      //Obtain the region information of the parent component.
      console.info('[' + data.caseTag + '] get Parent Component rect before position changed.');
      let parentRectBefore = Utils.getComponentRect(data.pageConfig.parentComponentKey);

      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get targetComponent rect after position changed.');
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);

      //Obtain the region information of the reference component.
      console.info('[' + data.caseTag + '] get referenceComponent rect after position changed.');
      let ReferenceRectAfter = Utils.getComponentRect(data.pageConfig.referenceComponentKey);
      console.info('[' + data.caseTag + '] get parentComponent rect after position changed.');

      //Obtain the region information of the parent component.
      let parentRectAfter = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      console.info('[' + data.caseTag + '] check offset value.');

      //Obtain the attribute information of the target component.
      //Confirm that the position attribute value has been set successfully.
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(viewObj.$attrs.offset.x).assertEqual(data.testValue.expectValue.x);
      expect(viewObj.$attrs.offset.y).assertEqual(data.testValue.expectValue.y);

      if ('TabContent' == data.pageConfig.targetView || 'StepperItem' == data.pageConfig.targetView) {
        //When the target component is TabContent or StepperItem,
        //the parent component is the Swiper on the outer layer of Tabs or Stepper.
        let parentComponent: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0];
        parentComponent.$children.forEach((element: ESObject) => {
          if ('Swiper' == element.$type) {
            rectParent = Utils.getComponentRectByObj(element)
          }
        });
      }

      console.info('[' + data.caseTag + '] check actual position.');
      //Calculate shifting using pre and post setting positions
      //verify the actual shifting of the target component.
      if ('StringPercent' == data.testValue.describe) {
        if ('GridItem' == data.pageConfig.targetView) {
          //The width of the target component
          let targetWight = targetRectAfter.right - targetRectAfter.left;
          //The height of the target component
          let targetHeight = targetRectAfter.bottom - targetRectAfter.top;
          expect(Math.abs(Number(targetRectAfter.left - initialPosition.left) - Number((targetWight) * 0.5)) <= 1)
            .assertTrue()
          expect(Math.abs(Number(targetRectAfter.top - initialPosition.top) - Number((targetHeight) * 0.5)) <= 1)
            .assertTrue()
        } else {
          //When setting the type to percentage, use the width/height of the parent container as the base.
          expect(Math.abs(Number((targetRectAfter.left - initialPosition.left).toFixed(2)) - Number(((rectParent.right - rectParent.left) * 0.5).toFixed(2))) <= 1)
            .assertTrue()
          expect(Math.abs(Number((targetRectAfter.top - initialPosition.top).toFixed(2)) - Number(((rectParent.bottom - rectParent.top) * 0.5).toFixed(2))) <= 1)
            .assertTrue()
        }
      } else {
        //When set to the basic type, verify the calculated shifting
        expect(Math.abs(Number((targetRectAfter.left - initialPosition.left).toFixed(2)) - Number(data.testValue.expectValue.left.toFixed(2))) <= 1)
          .assertTrue();
        expect(Math.abs(Number((targetRectAfter.top - initialPosition.top).toFixed(2)) - Number(data.testValue.expectValue.top.toFixed(2))) <= 1)
          .assertTrue();
      }

      //Confirm that the region information of the parent component has not changed.
      console.info('[' + data.caseTag + '] check parentComponent layout not changed.');
      expect(parentRectBefore.left).assertEqual(parentRectAfter.left);
      expect(parentRectBefore.top).assertEqual(parentRectAfter.top);
      expect(parentRectBefore.right).assertEqual(parentRectAfter.right);
      expect(parentRectBefore.bottom).assertEqual(parentRectAfter.bottom);

      //Confirm that the region information of the reference component has not changed.
      console.info('[' + data.caseTag + '] check referenceComponent layout not changed.');
      expect(ReferenceRectAfter.left).assertEqual(ReferenceRectBefore.left);
      expect(ReferenceRectAfter.top).assertEqual(ReferenceRectBefore.top);
      expect(ReferenceRectAfter.right).assertEqual(ReferenceRectBefore.right);
      expect(ReferenceRectAfter.bottom).assertEqual(ReferenceRectBefore.bottom);
    })
  })
}