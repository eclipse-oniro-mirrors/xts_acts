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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  Level } from "@ohos/hypium"
import router from '@system.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import display from '@ohos.display';

interface optionsObj {
  uri: string
}

export default function ArcSlider004() {
    describe('ArcSlider', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcSlider/ArcSlider3',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get Arcslider state pages: " + JSON.stringify(pages));
                if (!("Arcslider" == pages.name)) {
                    console.info("get Arcslider state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push Arcslider page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push Arcslider page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        it('arcSliderTest004',  Level.LEVEL0, async (done: Function) => {
            console.info('arcSliderTest004 START');
            let driver = await UiDriver.create();
            await CommonFunc.sleep(1000);
            let buttonComponent = await driver.findComponent(BY.key('buttonTest'));
            let flagText000 = await buttonComponent.getText();
            expect(flagText000).assertEqual('false');
            await buttonComponent.click();
            await CommonFunc.sleep(1000);
            let size = display.getDefaultDisplaySync().width;
            let flagText = await buttonComponent.getText();
            expect(flagText).assertEqual('true');
            await buttonComponent.click();
            await CommonFunc.sleep(1000);
            let flagText001 = await buttonComponent.getText();
            expect(flagText001).assertEqual('false');
            if(size > 500) {
                await driver.click(650, 256);
            } else {
                await driver.click(416, 123);
            }
            await CommonFunc.sleep(1000);
            await buttonComponent.click();
            await CommonFunc.sleep(1000);
            let flagText002 = await buttonComponent.getText();
            expect(flagText002).assertEqual('false');
            await CommonFunc.sleep(500);
            console.info('arcSliderTest004 END');
            done();
        });
    })
}