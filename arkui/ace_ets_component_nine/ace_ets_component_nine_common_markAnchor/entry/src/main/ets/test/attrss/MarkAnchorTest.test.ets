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

export default function MarkAnchorTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = ['Button']


  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 300;
  let parentHeight = 400;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  //Page config, this param is required.
  let pageConfig = {
    testName: 'testMarkAnchor',
    pageName: 'MarkAnchorPage',
    pageUrl: 'MainAbility/pages/common/MarkAnchorPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
  }

  //Test values, looped to create cases, this param is required.
  let testValues = [{
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp'
    }
  }, {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    },
    expectValue: {
      x: '150.00px', y: '150.00px'
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
      x: '50.00vp', y: '50.00vp'
    }
  }
]
   /**
   * @tc.number Common_MarkAnchor_10010
   * @tc.name   testCommonMarkAnchorAll
   * @tc.desc   The MarkAnchor property of the Common component is set to all
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('MarkAnchorTest', () => {
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      AttrsManager.change(data.caseTag, {
        x: 0, y: 0
      });
      await Utils.sleep(1000);
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'expectValue.x:' + data.testValue.expectValue.x);
      console.info('[' + data.caseTag + ']' + 'expectValue.y:' + data.testValue.expectValue.y);
      console.info('[' + data.caseTag + ']' + 'markAnchor.x is:' + viewObj.$attrs.markAnchor.x);
      console.info('[' + data.caseTag + ']' + 'markAnchor.y is:' + viewObj.$attrs.markAnchor.y);
      expect(viewObj.$attrs.markAnchor.x).assertEqual(data.testValue.expectValue.x);
      expect(viewObj.$attrs.markAnchor.y).assertEqual(data.testValue.expectValue.y);
    })
  })
}