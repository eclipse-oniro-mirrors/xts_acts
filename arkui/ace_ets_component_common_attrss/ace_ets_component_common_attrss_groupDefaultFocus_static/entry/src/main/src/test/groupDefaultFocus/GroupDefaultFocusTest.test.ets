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
import CommonTest from "../common/CommonTest"
import { describe, beforeAll, expect } from "../../../../hypium/index"
import { focusControl } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;




export default function GroupDefaultFocusTest() {
    //A list of components that support the position attribute, which is required.
    let supportView:Array<string> = new Array<string>(
        "Button",
        "TextArea",
        "Search",
        "Text",
        "Image",
        "Grid",
        "List",
        "Checkbox",
        "CheckboxGroup",
        "Menu",
        "MenuItem",
        "Radio",
        "Rating",
        "Slider",
        "Toggle",
        "AlphabetIndexer",
        "Column",
        "Counter",
        "Flex",
        "GridItem",
        "ListItem",
        "Scroll",
        "Stack",
        "Swiper",
        "Tabs"
    )

    //Page config, this param is required.
    let pageConfig: PageConfig = {
        testName: "testGroupDefaultFocus",
        pageName: "GroupDefaultFocusPage",
        pageUrl: "MainAbility/pages/groupDefaultFocus/GroupDefaultFocusPage",
        textComponentKey: "textComponentKey",
        referenceOneComponentKey: "referenceOneComponentKey",
        referenceTwoComponentKey: "referenceTwoComponentKey",
        sharePage: false,
    }
    //Test values, looped to create cases, this param is required.
    let testValues: TestValue[] = [
        {
            describe: "SetTrue",
            setValue: true,
        },
        {
            describe: "SetFalse",
            setValue: false,
        },
    ]

    /**
     * Create test suite.
     */

    describe("GroupDefaultFocusTest", () => {
        beforeAll(() => {
            console.info("GroupDefaultFocusTest beforeEach start");
            await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });

        //Generate test cases (it) through a loop based on the support view * test values.
        CommonTest.initTest(
            pageConfig,
            supportView,
            testValues,
            async (data: BasePageConfig): Promise<void> => {
                //Place Focus
                let requestFocusText = focusControl.requestFocus(
                    data.pageConfig.referenceOneComponentKey
                )
                expect(requestFocusText).assertEqual(true)
                if (data.pageConfig.targetView == "TextArea") {
                    await Utils.sleep(4000)
                } else {
                    await Utils.sleep(1000)
                }
                //Pressing the Tab key for the first time
                let tab = Utils.performKeyEventDownUp(2049, "Tab")
                expect(tab).assertEqual(true)
                if (data.pageConfig.targetView == "TextArea") {
                    await Utils.sleep(4000)
                } else {
                    await Utils.sleep(1000)
                }

                if ("SetTrue" == data.testValue.describe) {
                    //First confirmation of target component focus
                    let textComponent: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponent.getElement('$attrs').getString('content') is " +
                        textComponent.getElement('$attrs').getString('content')
                    )
                    expect(textComponent.getElement('$attrs').getString('content')).assertContain(
                        "onFocus"
                    )

                    //Confirm target component properties
                    let viewObj: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.componentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] groupDefaultFocus is " +
                        viewObj.getElement('$attrs').getBoolean('groupDefaultFocus')
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('groupDefaultFocus')).assertEqual(true)

                    //Focus the reference component
                    let secondFocus = focusControl.requestFocus(
                        data.pageConfig.referenceOneComponentKey
                    )
                    await Utils.sleep(1000)
                    expect(secondFocus).assertEqual(true)

                    //Pressing the Tab key for the second time
                    let secondTab = Utils.performKeyEventDownUp(2049, "Tab")
                    expect(secondTab).assertEqual(true)
                    await Utils.sleep(1000)

                    //Second confirmation of target component focus
                    let textComponentTwo: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponentTwo.getElement('$attrs').getString('content'): " +
                        textComponentTwo.getElement('$attrs').getString('content')
                    )
                    expect(textComponentTwo.getElement('$attrs').getString('content')).assertEqual(
                        "onFocus"
                    )
                } else if ("SetFalse" == data.testValue.describe) {
                    //Confirmation of target component focus
                    let textComponent: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponent.getElement('$attrs').getString('content'): " +
                        textComponent.getElement('$attrs').getString('content')
                    )
                    expect(textComponent.getElement('$attrs').getString('content')).assertEqual("")

                    //Confirm target component properties
                    let viewObj: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.componentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] viewObj.getElement('$attrs').getString('groupDefaultFocus'):" +
                        viewObj.getElement('$attrs').getBoolean('groupDefaultFocus')
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('groupDefaultFocus')).assertEqual(false)
                }
            }
        )
    })
}
