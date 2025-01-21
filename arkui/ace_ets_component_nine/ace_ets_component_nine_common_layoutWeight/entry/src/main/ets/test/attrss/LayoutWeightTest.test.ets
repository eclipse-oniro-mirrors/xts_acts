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
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

export default function layoutWeightTest() {
  let supportView = ['Flex']
  let childWidth = 100;
  let childHeight = 100;
  let parentWidth = 400;
  let parentHeight = 600;
  let pageConfig = {
    testName: 'testLayoutWeight',
    pageName: 'LayoutWeightPage',
    pageUrl: 'MainAbility/pages/common/LayoutWeightPage',
    targetGroupView: 'targetGroupView',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentComponentKey: 'parentComponentKey'    
  }
  let testValues = [{
    describe: 'SetNumber',
    setValue: {
      layoutWeight: 2
    },
    expectValue: {
      layoutWeight: 2
    }
  }, {
    describe: 'SetNumberDecimal',
    setValue: {
      layoutWeight: 2.5
    },
    expectValue: {
      layoutWeight: 2
    }
  }, {
    describe: 'SetString',
    setValue: {
      layoutWeight: '2'
    },
    expectValue: {
      layoutWeight: 2
    }
  }]
   /**
   * @tc.number Common_LayoutWeight_10010
   * @tc.name   testCommonLayoutWeightAll
   * @tc.desc   The LayoutWeight property of the Common component is set to all
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('LayoutWeightTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      AttrsManager.change(data.caseTag, 1);
      await Utils.sleep(1000);
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'expectValue layoutWeight is:' + data.testValue.expectValue.layoutWeight);
      console.info('[' + data.caseTag + ']' + 'layoutWeight is:' + viewObj.$attrs.layoutWeight);
      expect(viewObj.$attrs.layoutWeight).assertEqual(data.testValue.expectValue.layoutWeight);
    });
  })
}