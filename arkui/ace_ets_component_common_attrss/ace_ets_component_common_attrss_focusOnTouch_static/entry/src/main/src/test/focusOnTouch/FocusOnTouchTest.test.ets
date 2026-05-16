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
import {Color,$r} from '@ohos.arkui.component'
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function FocusOnTouchTest() {

    let supportView = [
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
        "Row",
    ]

    let pageConfig: PageConfig = {
        testName: "testFocusOnTouch",
        pageName: "FocusOnTouchPage",
        pageUrl: "MainAbility/pages/focusOnTouch/FocusOnTouchPage",
        referenceComponentKey: "referenceComponentKey",
        sharePage: false,
    }
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

    describe("FocusOnTouchTest", () => {
        beforeAll(() => {
            console.info("FocusOnTouchTest beforeEach start");

            
            await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
            
        });

            CommonTest.initTest(
            pageConfig,
            supportView,
            testValues,
            async (data: BasePageConfig): Promise<void> => {

                AppStorage.setOrCreate<boolean>('_focusOnTouch',  data.testValue.setValue)

                console.info("[" + data.caseTag + "] verify onClick.")
                let clickResult = Utils.performClick(
                    data.pageConfig.componentKey !== null ? data.pageConfig.componentKey as string : ''
                )
                expect(clickResult).assertEqual(true)
                await Utils.sleep(1000)

                if ("SetTrue" == data.testValue.describe) {

                    let referenceComponent = Utils.getComponentByKey(
                        data.pageConfig.referenceComponentKey??''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] referenceComponent.$attrs.label: " +
                            referenceComponent.getElement('$attrs').getString('label')
                    )
                    expect(referenceComponent.getElement('$attrs').getString('label')).assertContain(
                        "onFocus"
                    )


                    let viewObj = Utils.getComponentByKey(
                        data.pageConfig.componentKey !== null ? data.pageConfig.componentKey as string : ''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] focusOnTouch is " +
                            viewObj.getElement('$attrs').getBoolean('focusOnTouch')
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('focusOnTouch')).assertEqual(true)
                } else if ("SetFalse" == data.testValue.describe) {

                    let referenceComponent = Utils.getComponentByKey(
                        data.pageConfig.referenceComponentKey??''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] referenceComponent.$attrs.label: " +
                            referenceComponent.getElement('$attrs').getString('label')
                    )
                    if ("Web" == data.pageConfig.targetView) {
                        expect(referenceComponent.getElement('$attrs').getString('label')).assertContain(
                            "onFocus"
                        )
                    } else {
                        expect(referenceComponent.getElement('$attrs').getString('label')).assertEqual("")
                    }

                    let viewObj = Utils.getComponentByKey(
                        data.pageConfig.componentKey !== null ? data.pageConfig.componentKey as string : ''
                    )
                    console.info(
                        "[" +
                            data.caseTag +
                            "] focusOnTouch is " +
                            viewObj.getElement('$attrs').getBoolean('focusOnTouch')
                    )
                    expect(viewObj.getElement('$attrs').getBoolean('focusOnTouch')).assertEqual(false)
                }
            }
        )
    })
}
