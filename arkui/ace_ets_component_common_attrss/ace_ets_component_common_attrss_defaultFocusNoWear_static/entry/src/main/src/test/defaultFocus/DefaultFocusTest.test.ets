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

import Utils, { BasePageConfig, PageConfig, RectValue, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { AlignRuleOption, HorizontalAlign, VerticalAlign } from '@ohos.arkui.component';
import { jsonx } from 'std/core';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function DefaultFocusTest() {
  //A list of components that support the position attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'Select',
    // 'Web',
    'SideBarContainer'
  )
  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testDefaultFocus',
    pageName: 'DefaultFocusPage',
    pageUrl: 'MainAbility/pages/defaultFocus/DefaultFocusPage',
    textComponentKey: 'textComponentKey',
    referenceComponentKey: 'referenceComponentKey',
    sharePage: false
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [
    {
      describe: 'SetTrue',
      setValue: true,
    },
    {
      describe: 'SetFalse',
      setValue: false,
    }
  ]

  /**
   * Create test suite.
   */

  describe('DefaultFocusTest', () => {
    beforeAll(() => {
      console.info("DefaultFocusTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.defaultfocus.testwear.static", "EntryAbility")

    });

    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      //Set value
      console.info('DefaultFocusTest.test113', data.pageConfig.textComponentKey)
      console.info('DefaultFocusTest.test113', data.testValue.setValue)
      // AppStorage.setOrCreate<boolean>('_defaultFocus', data.testValue.setValue)
      await Utils.sleep(1000);

      if ('SetTrue' == data.testValue.describe) {
        //Confirm if the focus is on the target component
        let firstComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] firstComponent.$attrs.content: ' +
        firstComponent.getElement('$attrs').getString('content'));
        expect(firstComponent.getElement('$attrs').getString('content')).assertEqual('onFocus');
        // Confirm if the focus is on the reference component
        let firstReferenceComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] firstReferenceComponent.$attrs.label: ' +
        firstReferenceComponent.getElement('$attrs').getString('label'));
        expect(firstReferenceComponent.getElement('$attrs').getString('label')).assertEqual('');
        // Confirm target component attribute values
        let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] DefaultFocus is ' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus') + ' ');
        expect(viewObj.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(true);

        await Utils.backOnly();
        await Utils.sleep(1000);

        console.log('test before push')
        console.log('test defaulemsg : ' + JSON.stringify(pageConfig))
        await Utils.pushPage(pageConfig);
        console.log('test after push')

        expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertEqual(true);
        await Utils.sleep(1000);
        console.info('[' + data.caseTag + '] Press Tab.');

        //Confirm if the focus is on the target component
        let secondComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] secondComponent.$attrs.content: ' +
        secondComponent.getElement('$attrs').getString('content'));
        expect(secondComponent.getElement('$attrs').getString('content')).assertEqual('onFocus')
        //Confirm if the focus is on the reference component
        let secondReferenceComponent: jsonx.JsonElement =
          Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] secondReferenceComponent.$attrs.label: ' +
        secondReferenceComponent.getElement('$attrs').getString('label'));
        expect(secondReferenceComponent.getElement('$attrs').getString('label')).assertEqual('');
        // Confirm target component attribute values
        viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] DefaultFocus is ' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus') + ' ');
        expect(viewObj.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(true);

      } else if ('SetFalse' == data.testValue.describe) {
        console.log('setValue is:  ' + data.testValue.setValue)
        //Confirm if the focus is on the target component
        await Utils.sleep(2000);
        let component: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] component.$attrs.content: ' +
        component.getElement('$attrs').getString('content'));
        expect(component.getElement('$attrs').getString('content')).assertEqual('');

        let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
        await Utils.sleep(2000);
        console.info('[' + data.caseTag + '] DefaultFocus is ' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus'));
        expect(viewObj.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(false);
      }
    })
  })
}