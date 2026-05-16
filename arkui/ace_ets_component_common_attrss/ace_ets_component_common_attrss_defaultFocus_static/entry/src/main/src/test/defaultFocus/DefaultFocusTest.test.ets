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
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function DefaultFocusTest() {
  //A list of components that support the position attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'Button',
    'TextInput',
    'TextArea',
    'Search',
    'Text',
    'Image',
    'Grid',
    'List',
    'Checkbox',
    'CheckboxGroup',
    'DatePicker',
    //    'ImageAnimator',
    'Menu',
    'MenuItem',
    //    'MenuItemGroup',
    'Radio',
    'Rating',
    'Slider',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'AlphabetIndexer',
    'Column',
    //    'ColumnSplit',
    'Counter',
    'Flex',
    //    'GridCol',
    //    'GridRow',
    'GridItem',
    'ListItem',
    //    'ListItemGroup',
    'Row',
    //    'RowSplit',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    //    'TabContent'
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

      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    //Generate test cases (it) through a loop based on the support view * test values.

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      console.info('[' + data.caseTag + '] Press Tab.');
      // AppStorage.setOrCreate<boolean>('_defaultFocus', data.testValue.setValue)
      // console.info('DefaultFocusTest123456 is: ', data.testValue.setValue)

      if ('SetTrue' == data.testValue.describe) {
        //Confirm if the focus is on the target component
        let firstComponent: jsonx.JsonElement =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.textComponentKey));

        console.info('[' + data.caseTag + '] firstComponent.$attrs.content 120: ' +
        firstComponent.getElement('$attrs').getString('content'));
        expect(firstComponent.getElement('$attrs').getString('content')).assertEqual('onFocus');
        //Confirm if the focus is on the reference component
        let firstReferenceComponent: jsonx.JsonElement =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.referenceComponentKey));
        console.info('[' + data.caseTag + '] firstReferenceComponent.$attrs.label: ' +
        firstReferenceComponent.getElement('$attrs').getString('label'));
        expect(firstReferenceComponent.getElement('$attrs').getString('label')).assertEqual('');
        //Confirm target component attribute values
        let viewObj: jsonx.JsonElement =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.componentKey));
        console.info('[' + data.caseTag + '] DefaultFocus is ' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus') + '1123');

        await Utils.backOnly();
        console.log('test textComponentKey is:1 ' + data.pageConfig.textComponentKey)
        await Utils.pushPage(pageConfig);
        console.log('test textComponentKey is:2 ' + data.pageConfig.textComponentKey)

        expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertTrue();
        await Utils.sleep(2000);
        console.info('[' + data.caseTag + '] Press Tab.1123');

        //Confirm if the focus is on the target component
        console.log('test textComponentKey is: ' + data.pageConfig.textComponentKey)
        let secondComponent =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.textComponentKey));
        console.info('[' + data.caseTag + '] secondComponent.$attrs.content 142: ' +
        secondComponent.getElement('$attrs').getString('content'));
        expect(secondComponent.getElement('$attrs').getString('content')).assertEqual('onFocus')
        //Confirm if the focus is on the reference component
        let secondReferenceComponent: jsonx.JsonElement =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.referenceComponentKey));
        console.info('[' + data.caseTag + '] secondReferenceComponent.$attrs.label: ' +
        secondReferenceComponent.getElement('$attrs').getString('label'));
        expect(secondReferenceComponent.getElement('$attrs').getString('label')).assertEqual('');
        //Confirm target component attribute values
        viewObj = JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.componentKey));
        await Utils.sleep(2000)
        console.info('[' + data.caseTag + '] DefaultFocus is 151' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus') + ' ');
        expect(viewObj.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(true);

      } else if ('SetFalse' == data.testValue.describe) {
        //Confirm if the focus is on the target component
        expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertTrue();
        await Utils.sleep(2000);
        console.info('[' + data.caseTag + '] Press Tab.1123');

        let component =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.textComponentKey));
        await Utils.sleep(2000)
        console.info('[' + data.caseTag + '] component.$attrs.content 157: ' +
        component.getElement('$attrs').getString('content'));
        expect(component.getElement('$attrs').getString('content')).assertEqual('');

        let viewObj =
          JSON.parseJsonElement(inspector.getInspectorByKey(data.pageConfig.componentKey));
        await Utils.sleep(2000)
        console.info('[' + data.caseTag + '] DefaultFocus is 161' +
        viewObj.getElement('$attrs').getBoolean('defaultFocus') + ' ');
        expect(viewObj.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(false);
      }
    })
  })
}