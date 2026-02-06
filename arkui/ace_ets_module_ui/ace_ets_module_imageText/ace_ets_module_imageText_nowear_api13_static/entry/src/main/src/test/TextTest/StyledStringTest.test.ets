'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
let domain: Int = 0x0000;

let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StyledStringUrl() {
    describe('StyledStringUrl', () => {
        beforeAll(() => {
            console.info("StyledStringUrl beforeAll start");

            await UtilsTest.msSleep(4000)
            await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });

        beforeEach(async (): Promise<void> => {
            console.info("StyledString beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/Text/StyledString',
            }
            try {
                const router = AppStorage.get<Router>("router") as Router
                router.clear();
                let pages = router.getState();
                console.info("get StyledString state pages:" + JSON.stringify(pages));
                if (!("StyledString" == pages.name)) {
                    console.info("get StyledString pages.name:" + JSON.stringify(pages.name));
                    // let result = await router.push(options);
                    router.pushUrl(options);
                    await CommonFunc.sleep(2000);
                    // console.info("push StyledString page result:" + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push StyledString page error:" + err);
            }
            console.info("StyledString beforeEach end");
        });

        afterEach(async () => {
            await CommonFunc.sleep(1000);
            console.info("StyledString after each called");
        });

        
        /**
     * @tc.number   StyledString_static_0100
     * @tc.name     StyledString_static_0100
     * @tc.desc     StyledString_static_0100
     * @tc.level    Level.LEVEL2
     */
it('StyledString_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('[StyledString_static_0100] START');
            let driver = Driver.create();
            await CommonFunc.sleep(1000);
            let button1 = await driver.findComponent(ON.id('searchStyle'));
            await (button1?.click() as Promise<void>)
            await CommonFunc.sleep(1000);

                let text = inspector.getInspectorByKey('urlId');
                let Obj= JSON.parseJsonElement(text);
                expect(Obj.getElement('$attrs').getString('content')).assertEqual('7');
            await CommonFunc.sleep(500);
            console.info('[StyledString_static_0100] END');
            done();
        });
    })
}