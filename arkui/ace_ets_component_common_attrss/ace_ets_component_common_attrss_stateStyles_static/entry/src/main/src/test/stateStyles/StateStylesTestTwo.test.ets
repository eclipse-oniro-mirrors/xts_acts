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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll,beforeEach } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function stateStylesTestTwo() {
  let supportView = [
    'Checkbox',
    'CheckboxGroup',
    'Radio',
    'Toggle',
    'MenuItem'
  ]

  let pageConfig: PageConfig = {
    testName: 'testStateStylesTwo',
    pageName: 'StateStylesPageTwo',
    pageUrl: 'MainAbility/pages/stateStyles/StateStylesPageTwo'
  }

  let testValues: TestValue[] = [{
    describe: 'SetSelected',
    setValue: false,
    expectValue: {
      selectedStyles: 2,
      normalStyles: 1
    }
  }]

  describe('StateStylesTestTwo', () => {
    beforeAll(() => {
      console.info("StateStylesTest beforeEach start");
      console.info("startAbility start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      console.info("startAbility end");
    });
    beforeEach(()=>{
    })
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Obtain target component information before changes
      let targetBeforeObjKey = inspector.getInspectorByKey(data.pageConfig.componentKey);
      await Utils.sleep(1000);
      let targetBeforeObj = JSON.parseJsonElement(targetBeforeObjKey)
      // //Check results
      console.info('[' + data.caseTag + ']' + 'targetBeforeObj.$attrs.zIndex is:' + targetBeforeObj.getElement('$attrs').getDouble('zIndex'));
      console.info('[' + data.caseTag + ']' + 'data.testValue.expectValue.selectedStyles is:' + data.testValue.expectValue.selectedStyles);
      expect(targetBeforeObj.getElement('$attrs').getDouble('zIndex')).assertEqual(data.testValue.expectValue.selectedStyles);
    });
  })
}