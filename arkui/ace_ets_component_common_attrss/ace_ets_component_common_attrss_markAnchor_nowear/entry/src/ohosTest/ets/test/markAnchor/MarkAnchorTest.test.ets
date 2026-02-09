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

interface pageConfigObj {
  testName: string,
  pageName: string,
  pageUrl: string,
  parentWidth: number,
  parentHeight: number,
  subassemblyWidth: number,
  subassemblyHeight: number,
}

class TestValue {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

export default function MarkAnchorTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = ['Select', 'SideBarContainer', 'WaterFlow', 'RowSplit', 'ColumnSplit', 'FlowItem', 'Stepper', 'StepperItem']


  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 300;
  let parentHeight = 400;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  //Page config, this param is required.
  let pageConfig: pageConfigObj = {
    testName: 'testMarkAnchor',
    pageName: 'MarkAnchorPage',
    pageUrl: 'MainAbility/pages/markAnchor/MarkAnchorPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
  }

  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50)
    }
  }, {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    },
    expectValue: {
      x: '150.00px', y: '150.00px', left: 150, top: 150
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      x: '50%', y: '50%'
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
      x: '50.00vp', y: '50.00vp', left: vp2px(50), top: vp2px(50)
    }
  }]

  describe('MarkAnchorTest', () => {
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Restore the target component to its original position
      console.info('[' + data.caseTag + '] restore the target Component to its original position');
      AttrsManager.change(data.caseTag, {
        x: 0, y: 0
      });
      await Utils.sleep(1000);

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get Target Component rect before position changed.');
      let initialPosition: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain the attribute information of the target component.
      //Confirm that the position attribute value has been set successfully.
      console.info('[' + data.caseTag + '] check markAnchor value.');
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(viewObj.$attrs.markAnchor.x).assertEqual(data.testValue.expectValue.x);
      expect(viewObj.$attrs.markAnchor.y).assertEqual(data.testValue.expectValue.y);

      //Obtain the region information of the target component.
      console.info('[' + data.caseTag + '] get targetComponent rect after position changed.');
      let targetRectAfter: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      console.info('[' + data.caseTag + '] check actual position.');
      //Calculate shifting using pre and post setting positions
      //verify the actual shifting of the target component.
      if ('StringPercent' == data.testValue.describe) {
        //When setting the type to percentage, use the width/height of the parent container as the base.
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number((targetRectAfter.right - targetRectAfter.left) * 0.5)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number((targetRectAfter.bottom - targetRectAfter.top) * 0.5)) <= 1).assertTrue();
      } else {
        //When set to the basic type, verify the calculated shifting
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number(data.testValue.expectValue.left)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number(data.testValue.expectValue.top)) <= 1).assertTrue();
      }
    })
  })
}