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
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import { Color, $r } from '@ohos.arkui.component'
import Utils, {
  CurrentRatio,
  BasePageConfig,
  PageConfig,
  TestValue,
  RectValue,
  StrJsonObj
} from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FocusableTest() {

  
  let supportView = [
    'Select',
    'TextPicker',
    'TimePicker',

    // 'Web',


    'SideBarContainer',
  ]

  
  let pageConfig: PageConfig = {
    testName: 'testFocusable',
    pageName: 'FocusablePage',
    pageUrl: 'MainAbility/pages/focusable/FocusablePage',
    referenceComponentKey: 'referenceComponentKey'
  }
  
  let testValues: TestValue[] = [{
    describe: 'SetTrue',
    setValue: true
  }, {
    describe: 'SetFalse',
    setValue: false
  }]

  /**
   * Create test suite.
   */

  describe('FocusableTest', () => {
    beforeAll(() => {
      console.info("FocusableDefaultTest beforeEach start");
      
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs2.test.static", "EntryAbility")
      
    });
    
    CommonTest.initTest(
      pageConfig,
      supportView,
      testValues,
      async (data: BasePageConfig): Promise<void> => {
        let res = Utils.requestFocus(
          data.pageConfig.componentKey ?? ''
        )
        if (
          data.pageConfig.targetView == "TextInput" ||
            data.pageConfig.targetView == "TextArea"
        ) {
          await Utils.sleep(4000)
        } else {
          await Utils.sleep(1000)
        }
        console.info(
          "[" + data.caseTag + "] FocusControlCallback is " + res
        )

        if ("SetTrue" == data.testValue.describe) {
          
          expect(res).assertEqual(true)
          
          let referenceComponent = Utils.getComponentByKey(
            data.pageConfig.referenceComponentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] referenceComponent.getElement('$attrs').getString('label'): " +
            referenceComponent.getElement('$attrs').getString('label')
          )
          expect(referenceComponent.getElement('$attrs').getString('label')).assertContain(
            "onFocus"
          )
          
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] Focusable is " +
            viewObj.getElement('$attrs').getBoolean('focusable')
          )
          expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(true)
        } else if ("SetFalse" == data.testValue.describe) {
          
          expect(res).assertEqual(false)
          
          let referenceComponent = Utils.getComponentByKey(
            data.pageConfig.referenceComponentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] referenceComponent.getElement('$attrs').getString('label'): " +
            referenceComponent.getElement('$attrs').getString('label')
          )
          expect(referenceComponent.getElement('$attrs').getString('label')).assertEqual("")
          
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] Focusable is " +
            viewObj.getElement('$attrs').getBoolean('focusable')
          )
          expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(false)
        }
      }
    )

  })
}