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
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function stateStylesTest() {
  let supportView:Array<string> = new Array<string>(
    'Select',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )

  let pageConfig: PageConfig = {
    testName: 'testStateStyles',
    pageName: 'StateStylesPage',
    pageUrl: 'MainAbility/pages/stateStyles/StateStylesPage'
  }

  let testValues: TestValue[] = [{
    describe: 'SetDisabled',
    setValue: false,
    expectValue: {
      disabledStyles: 2,
      normalStyles: 1
    }
  }]

  describe('StateStylesTest', () => {
    beforeAll(() => {
      console.info("StateStylesTest beforeEach start");
      console.info("startAbility start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.stateStyle.nowear.test.static", "EntryAbility")
      console.info("startAbility end");
    });
    beforeEach(() => {
      AppStorage.setOrCreate<boolean>('_isEnable', true)
      await Utils.sleep(2000);
    })
    CommonTest.initTest(pageConfig, supportView, testValues,  async (data: BasePageConfig): Promise<void> => {
      // //Obtain target component information before changes
      let strJson = inspector.getInspectorByKey(data.pageConfig.componentKey);
      console.log('targetAfterObjstrJson',strJson)
      await Utils.sleep(2000);
      let targetBeforeObj =  JSON.parseJsonElement(strJson);
      AppStorage.setOrCreate<boolean>('_isEnable', data.testValue.setValue)
      await Utils.sleep(2000);
      // //Obtain target component information after changes
      let strJson1 = inspector.getInspectorByKey(data.pageConfig.componentKey);
      console.log('targetAfterObjstrJson1',strJson1)
      await Utils.sleep(2000);
      //Check results
      console.info('[' + data.caseTag + ']' + 'targetBeforeObj.getElement($attrs).getString(zIndex) is:' + targetBeforeObj.getElement('$attrs').getDouble('zIndex'));
      expect(targetBeforeObj.getElement('$attrs').getDouble('zIndex')).assertEqual(data.testValue.expectValue.normalStyles);
    });
  })
}