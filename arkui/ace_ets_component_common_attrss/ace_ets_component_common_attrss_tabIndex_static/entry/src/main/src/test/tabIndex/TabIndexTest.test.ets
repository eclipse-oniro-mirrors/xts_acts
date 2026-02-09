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
import Utils, { BasePageConfig, TestValue,PageConfig,TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,focusControl } from '@ohos.arkui.component';
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
async function executeTab(
  data: BasePageConfig,
  referenceOneValue: string,
  textValue: string,
  referenceTwoValue: string
) {
  expect(Utils.performKeyEventDownUp(2049, "Tab")).assertEqual(true)
  if (
    data.pageConfig.targetView == "TextInput" ||
      data.pageConfig.targetView == "TextArea"
  ) {
    await Utils.sleep(4000)
  } else {
    await Utils.sleep(1000)
  }
  console.info("[" + data.caseTag + "] Press Tab.")
  let referenceOneComponent = Utils.getComponentByKey(
    data.pageConfig.referenceOneComponentKey
  )
  let textComponent = Utils.getComponentByKey(
    data.pageConfig.textComponentKey
  )
  let referenceTwoComponent = Utils.getComponentByKey(
    data.pageConfig.referenceTwoComponentKey
  )
  //Confirm reference component one text
  console.info(
    "[" +
    data.caseTag +
      "] referenceOneComponent.getElement('$attrs').getString('label'):" +
    referenceOneComponent.getElement('$attrs').getString('label')
  )
  expect(referenceOneComponent.getElement('$attrs').getString('label')).assertEqual(referenceOneValue)
  //Confirm Text Content
  console.info(
    "[" +
    data.caseTag +
      "] textComponent.getElement('$attrs').getString('content'):" +
    data.testValue.describe
  )
  expect(textComponent.getElement('$attrs').getString('content')).assertEqual(textValue)
  //Confirm reference component two text
  console.info(
    "[" +
    data.caseTag +
      "] referenceTwoComponent.getElement('$attrs').getString('label'):" +
    referenceTwoComponent.getElement('$attrs').getString('label')
  )
  expect(referenceTwoComponent.getElement('$attrs').getString('label')).assertEqual(referenceTwoValue)
}



export default function TabIndexTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    "Button",
    "TextInput",
    "TextArea",
    "Search",
    "Text",
    "Image",
    "Grid",
    "List",
    "Checkbox",
    "CheckboxGroup",
    "DatePicker",
    "Menu",
    "Radio",
    "Rating",
    "Slider",
    "TextPicker",
    "TimePicker",
    "Toggle",
    "AlphabetIndexer",
    "Column",
    "Counter",
    "Flex",
    "GridItem",
    "ListItem",
    "Row",
    "Scroll",
    "Stack",
    "Swiper",
    "Tabs",
  ]
  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: "testTabIndex",
    pageName: "TabIndexPage",
    pageUrl: "MainAbility/pages/tabIndex/TabIndexPage",
    textComponentKey: "textComponentKey",
    referenceOneComponentKey: "referenceOneComponentKey",
    referenceTwoComponentKey: "referenceTwoComponentKey",
    sharePage: false,
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [
    {
      describe: "SetLessThanZero",
      setValue: -1,
      expectValue: -1,
    },
    {
    describe: "SetEqualOne",
    setValue: 1,
    expectValue: 1,
  },
    {
      describe: "SetEqualTwo",
      setValue: 2,
      expectValue: 2,
    },
  ]

  describe("TabIndexTest", () => {
    beforeAll(() => {
      console.info("TabIndexTest beforeEach start");
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(
      pageConfig,
      supportView,
      testValues,
      async (data: BasePageConfig) => {
        let strJson = inspector.getInspectorByKey(pageConfig.componentKey);
        await CommonFunc.sleep(2000);
        data.viewObj = JSON.parseJsonElement(strJson);
        //Place Focus
        let requestFocusText = focusControl.requestFocus(
          data.pageConfig.textComponentKey
        )
        expect(requestFocusText).assertEqual(true)
        if (
          data.pageConfig.targetView == "TextInput" ||
            data.pageConfig.targetView == "TextArea"
        ) {
          await Utils.sleep(4000)
        } else {
          await Utils.sleep(1000)
        }
        if ("SetLessThanZero" == data.testValue.describe) {
          //Press the Tab key for the first time to reference the component (1) and capture the focus
          await executeTab(data, "onFocus", "", "")
          ///Press the Tab key for the second time to reference the component (2) and capture the focus
          await executeTab(data, "onBlur", "", "onFocus")

          //Confirm target component attribute values
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey!
          )
          console.info(
            "[" +
            data.caseTag +
              "] viewObj.getElement('$attrs').getDouble('tabIndex'):" +
            viewObj.getElement('$attrs').getDouble('tabIndex')
          )
          expect(viewObj.getElement('$attrs').getDouble('tabIndex')).assertEqual(
            data.testValue.expectValue
          )
        } else if ("SetEqualZero" == data.testValue.describe) {
          //Press the Tab key for the first time to reference the component (1) and capture the focus
          await executeTab(data, "onFocus", "", "")
          //Press the Tab key for the second time to reference the component (2) and capture the focus
          await executeTab(data, "onBlur", "", "onFocus")
          //Press the Tab key for the third time to focus on the target component
          await executeTab(data, "onBlur", "onFocus", "onBlur")

          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey!
          )
          console.info(
            "[" +
            data.caseTag +
              "] viewObj.getElement('$attrs').getDouble('tabIndex'):" +
            viewObj.getElement('$attrs').getDouble('tabIndex')
          )
          expect(viewObj.getElement('$attrs').getDouble('tabIndex')).assertEqual(
            data.testValue.expectValue
          )
        } else if ("SetEqualOne" == data.testValue.describe) {
          //Press the Tab key for the first time to focus on the target component
          await executeTab(data, "", "onFocus", "")
          //Press the Tab key for the second time to reference the component (1) and capture the focus
          await executeTab(data, "onFocus", "onBlur", "")
          //Press the Tab key for the third time to reference the component (2) and capture the focus
          await executeTab(data, "onBlur", "onBlur", "onFocus")

          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey!
          )
          console.info(
            "[" +
            data.caseTag +
              "] viewObj.getElement('$attrs').getDouble('tabIndex'):" +
            viewObj.getElement('$attrs').getDouble('tabIndex')
          )
          expect(viewObj.getElement('$attrs').getDouble('tabIndex')).assertEqual(
            data.testValue.expectValue
          )
        } else if ("SetEqualTwo" == data.testValue.describe) {
          //Press the Tab key for the first time to reference the component (1) and capture the focus
          await executeTab(data, "onFocus", "", "")
          //Press the Tab key for the second time to focus on the target component
          await executeTab(data, "onBlur", "onFocus", "")
          //Press the Tab key for the third time to reference the component (2) and capture the focus
          await executeTab(data, "onBlur", "onBlur", "onFocus")

          //Confirm target component attribute values
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey!
          )
          console.info(
            "[" +
            data.caseTag +
              "] viewObj.getElement('$attrs').getDouble('tabIndex'):" +
            viewObj.getElement('$attrs').getDouble('tabIndex')
          )
          expect(viewObj.getElement('$attrs').getDouble('tabIndex')).assertEqual(
            data.testValue.expectValue
          )
        }
      }
    )
  })
}
