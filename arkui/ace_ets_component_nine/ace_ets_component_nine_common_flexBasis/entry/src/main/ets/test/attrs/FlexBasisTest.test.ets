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

export default function flexBasisTest() {
  let supportView = ['Text']
  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']
  let parentWidth = 300;
  let parentHeight = 300;
  let targetWidth = 120;
  let targetHeight = 120;
  let pageConfig = {
    testName: 'testFlexBasis',
    pageName: 'FlexBasisPage',
    pageUrl: 'MainAbility/pages/common/FlexBasisPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }
  let testValues = [{
    describe: 'SetNumber',
    setValue: {
      flexBasis: 100.00
    },
    expectValue: {
      flexBasis: '100.00vp'
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      flexBasis: '200.00px'
    },
    expectValue: {
      flexBasis: '200.00px'
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      flexBasis: '50%'
    },
    expectValue: {
      flexBasis: '50.00%'
    }
  }]
   /**
   * @tc.number Common_FlexBasis_10010
   * @tc.name   testCommonFlexBasisAll
   * @tc.desc   The FlexBasis property of the Common component is set to all
   * @tc.size   MediumTest
   * @tc.type   Function
   * @tc.level  0
   */
  describe('FlexBasisTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async data => {
      AttrsManager.change(data.caseTag, 1);
      await Utils.sleep(1000);
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'expectValue flexBasis is:' + data.testValue.expectValue.flexBasis);
      console.info('[' + data.caseTag + ']' + 'flexBasis is:' + viewObj.$attrs.flexBasis);
      expect(viewObj.$attrs.flexBasis).assertEqual(data.testValue.expectValue.flexBasis);    
    })
  })
}