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

export default function StyledStringUrl13Test() {
    describe('StyledStringUrl13Test', () => {
        beforeEach(async (done: Function) => {
            console.info("StyledString beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/StyledString/StyledStringUrl13',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get StyledStringUrl13 state pages:" + JSON.stringify(pages));
                if (!("StyledStringUrl13" == pages.name)) {
                    console.info("get StyledStringUrl13 pages.name:" + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push StyledStringUrl13 page result:" + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push StyledStringUrl13 page error:" + err);
            }
            console.info("StyledStringUrl13 beforeEach end");
            done();
        });
        afterEach(async () => {
            await CommonFunc.sleep(1000);
            console.info("StyledStringUrl13 after each called");
        });
        
        /**
         * @tc.name   StyledStringUrl13Test_0100
         * @tc.number StyledStringUrl13Test_0100
         * @tc.desc   Each styledKey
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('StyledStringUrl13Test_0100', Level.LEVEL2, async (done: Function) => {
            console.info('[StyledStringUrl13Test_0100] START');
            let driver = Driver.create();
            await CommonFunc.sleep(1000);
            let button1 = await driver.findComponent(ON.id('searchStyleStyledStringUrl13Test'));
            await button1.click();
            await CommonFunc.sleep(1000);

            let text = getInspectorByKey('urlIdStyledStringUrl13Test');
            let Obj: ESObject = JSON.parse(text);
            expect(Obj.$attrs.content).assertEqual('7');
            await CommonFunc.sleep(500);
            console.info('[StyledStringUrl13Test_0100] END');
            done();
        });
    })
}