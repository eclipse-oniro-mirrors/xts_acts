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

export default function defaultFlexByGridRowTest() {

  //Component to be tested
  let supportView = ['GridCol']

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig = {
    testName: 'test',
    pageName: 'DefaultFlexByGridRowPage',
    pageUrl: 'MainAbility/pages/default/DefaultFlexByGridRowPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues = [{
    describe: 'FlexBasis',
    expectValue: {
      flexBasis: 'auto'
    }
  }, {
    describe: 'FlexGrow',
    expectValue: {
      flexGrow: 0
    }
  }, {
    describe: 'AlignSelf',
    expectValue: {
      alignSelf: 'ItemAlign.Auto'
    }
  }]


  describe('DefaultFlexByGridRowTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      if (data.testValue.describe == 'FlexBasis') {
        // Test flexBasis defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.flexBasis:' + data.viewObj.$attrs.flexBasis);
        expect(data.viewObj.$attrs.flexBasis).assertEqual(data.testValue.expectValue.flexBasis);
      } else if (data.testValue.describe == 'FlexGrow') {
        // Test flexGrow defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.flexGrow:' + data.viewObj.$attrs.flexGrow);
        expect(data.viewObj.$attrs.flexGrow).assertEqual(data.testValue.expectValue.flexGrow);
      } else if (data.testValue.describe == 'AlignSelf') {
        // Test alignSelf defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.alignSelf:' + data.viewObj.$attrs.alignSelf);
        expect(data.viewObj.$attrs.alignSelf).assertEqual(data.testValue.expectValue.alignSelf);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
        + data.pageConfig.componentKey);
      }
    });
  })
}