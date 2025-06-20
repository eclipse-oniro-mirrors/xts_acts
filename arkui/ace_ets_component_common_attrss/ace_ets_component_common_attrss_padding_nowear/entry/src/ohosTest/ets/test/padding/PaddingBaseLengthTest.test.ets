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
  setValue: ESObject;
  expectValue: ESObject;
}

/**
 * Test of common attribute: padding
 */
export default function paddingTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Select',
    'Stepper',
    'StepperItem',
    'Web'
  ]

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingBaseLength',
    pageName: 'PaddingBasePageLength',
    pageUrl: 'MainAbility/pages/padding/PaddingBasePageLength',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [{
    describe: 'SetNumber',
    setValue: {
      padding: 100,
    },
    expectValue: {
      padding: '100.00vp'
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      padding: '200px',
    },
    expectValue: {
      padding: '200.00px'
    }
  }, {
    describe: 'SetResource',
    setValue: {
      padding: $r('app.float.100vp'),
    },
    expectValue: {
      padding: '100.00vp'
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      padding: '20%',
    },
    expectValue: {
      padding: '20.00%'
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingBaseLengthTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Confirm that the padding attribute values have been successfully set.
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.$attrs.padding);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);

      //Confirm that the size attribute values have been successfully set.
      expect(viewObj.$attrs.padding).assertEqual(data.testValue.expectValue.padding);
    })
  })
}