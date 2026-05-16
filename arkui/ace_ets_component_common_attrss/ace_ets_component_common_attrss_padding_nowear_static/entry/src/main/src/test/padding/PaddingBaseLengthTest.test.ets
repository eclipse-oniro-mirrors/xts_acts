'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils , { BasePageConfig, PageConfig, TestValue, RectValue,RectValueExpect }  from '../../../ets/MainAbility/common/Utils';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { $r , Padding, Resource} from '@ohos.arkui.component'
import {
  Color
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

/**
 * Test of common attribute: padding
 */
export default function paddingTest2() {
  //A list of components that support padding attributes is required.
  let supportView: Array<string> = new Array<string>(
    'Select'
    // 'Web'  // 外领域 app died
  )

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
  let testValues: TestValue[] = [{
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
    beforeAll(() => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.padding.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the reference component properties.
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      // AppStorage.setOrCreate<number|string|Padding|Resource>('_padding', data.testValue.setValue.padding as number|string|Padding|Resource)
      await Utils.sleep(1000);

      //Confirm that the padding attribute values have been successfully set.
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.$attrs.padding:' + viewObj.getElement('$attrs').getString('padding'));
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);

      //Confirm that the size attribute values have been successfully set.
      expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);
    })
  })
}