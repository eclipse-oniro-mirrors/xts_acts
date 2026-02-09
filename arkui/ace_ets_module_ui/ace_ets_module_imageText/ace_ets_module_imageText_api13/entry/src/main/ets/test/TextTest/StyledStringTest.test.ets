/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function StyledStringUrl() {
    describe('StyledStringUrl', () => {
        beforeEach(async (done: Function) => {
            console.info("StyledString beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/Text/StyledString',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get StyledString state pages:" + JSON.stringify(pages));
                if (!("StyledString" == pages.name)) {
                    console.info("get StyledString pages.name:" + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push StyledString page result:" + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push StyledString page error:" + err);
            }
            console.info("StyledString beforeEach end");
            done();
        });
        afterEach(async () => {
            await CommonFunc.sleep(1000);
            console.info("StyledString after each called");
        });
        
        /**
         * @tc.name   StyledString_0100
         * @tc.number StyledString_0100
         * @tc.desc   Each styledKey
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('StyledString_0100', Level.LEVEL2, async (done: Function) => {
            console.info('[StyledString_0100] START');
            let driver = Driver.create();
            await CommonFunc.sleep(1000);
            let button1 = await driver.findComponent(ON.id('searchStyle'));
            await button1.click();
            await CommonFunc.sleep(1000);

            let text = getInspectorByKey('urlId');
            let Obj: ESObject = JSON.parse(text);
            expect(Obj.$attrs.content).assertEqual('7');
            await CommonFunc.sleep(500);
            console.info('[StyledString_0100] END');
            done();
        });
    })
}