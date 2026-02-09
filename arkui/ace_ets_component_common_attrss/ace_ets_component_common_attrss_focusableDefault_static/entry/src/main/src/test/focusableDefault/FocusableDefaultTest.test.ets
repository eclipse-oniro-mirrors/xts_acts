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
import {Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function FocusableDefaultTest() {
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

        "DatePicker",
        "ImageAnimator",
        "Menu",
        "MenuItem",

        "Radio",
        "Rating",

        "Slider",

        "Toggle",

        "AlphabetIndexer",
        "Column",

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
        testName: "testFocusableDefault",
        pageName: "FocusableDefaultPage",
        pageUrl: "MainAbility/pages/focusableDefault/FocusableDefaultPage",
        referenceComponentKey: "referenceComponentKey",
    }
    //Test values, looped to create cases, this param is required.
    let testValues: TestValue[] = [
        {
            describe: "InitialValue",
        },
    ]

    /**
     * Create test suite.
     */

    describe("FocusableDefaultTest", () => {
        beforeAll(() => {
            console.info("FocusableDefaultTest beforeEach start");
            
            await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
            
        });
        //Generate test cases (it) through a loop based on the support view * test values.
CommonTest.initTest(
            pageConfig,
            supportView,
            testValues,
            async (data: BasePageConfig): Promise<void> => {
                //Focus the target component
                let res = Utils.requestFocus(
                    data.pageConfig.componentKey??''
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

                if (
                    "Text" == data.pageConfig.targetView ||
                    "Image" == data.pageConfig.targetView ||
                    "ImageAnimator" == data.pageConfig.targetView
                ) {
                    //Confirm focus shift
                    expect(res).assertEqual(false)
                    console.info(
                        "[" + data.caseTag + "] FocusControlCallback is " + res
                    )
                    //Confirm reference component text
                    let referenceComponent = Utils.getComponentByKey(
                        data.pageConfig.referenceComponentKey??''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] referenceComponent.$attrs.label: " +
                            referenceComponent.getElement('$attrs').getString('label')
                    )
                    expect(referenceComponent.getElement('$attrs').getString('label')).assertEqual("")
                    //Confirm target component properties
                    let viewObj = Utils.getComponentByKey(
                        data.pageConfig.componentKey??''
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(false)
                } else {
                    //Confirm focus shift
                    expect(res).assertEqual(true)
                    console.info(
                        "[" + data.caseTag + "] FocusControlCallback is " + res
                    )
                    //Confirm reference component text
                    let referenceComponent = Utils.getComponentByKey(
                        data.pageConfig.referenceComponentKey??''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] referenceComponent.$attrs.label: " +
                            referenceComponent.getElement('$attrs').getString('label')
                    )
                    expect(referenceComponent.getElement('$attrs').getString('label')).assertEqual(
                        "onFocus"
                    )
                    //Confirm target component properties
                    let viewObj = Utils.getComponentByKey(
                        data.pageConfig.componentKey??''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] DefaultFocusable is " +
                            viewObj.getElement('$attrs').getBoolean('focusable')
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(true)
                }
            }
        )
    })
}
