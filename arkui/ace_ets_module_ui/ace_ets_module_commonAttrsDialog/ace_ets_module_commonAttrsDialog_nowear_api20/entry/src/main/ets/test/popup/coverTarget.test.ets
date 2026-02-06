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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
    UiComponent,
    Driver,
    Component,
    UiWindow,
    On,
    ON,
    BY,
    MatchPattern,
    DisplayRotation,
    ResizeDirection,
    WindowMode,
    PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CoverTargetTest() {
    describe('CoverTargetTest', () => {
        const SLEEP_TIME_1000 = 1000;
        const SLEEP_TIME_2000 = 2000;
        beforeEach(async (done: Function) => {
            console.info('avoidAroundTargetTest beforeEach start');
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/popup/coverTarget',
            };
            try {
                router.clear();
                let pages = router.getState();
                console.info('get current pages:' + JSON.stringify(pages));
                if (!('coverTarget' == pages.name)) {
                    console.info('get avoidAroundTargetTest pages.name:' + JSON.stringify(pages.name));
                    let result = await router.pushUrl(options);
                    await CommonFunc.sleep(SLEEP_TIME_2000);
                    console.info('push avoidAroundTargetTest page result:' + JSON.stringify(result));
                }
            } catch (err) {
                console.error('push avoidAroundTargetTest page error:' + err);
            }
            console.info('avoidAroundTargetTest beforeEach end');
            done();
        });
        afterEach(async () => {
            await CommonFunc.sleep(SLEEP_TIME_1000);
            console.info('avoidAroundTargetTest after each called');
        });

        /**
         * @tc.name   covidTargetPopup_0010
         * @tc.number covidTargetPopup_0010
         * @tc.desc   coverTarget,determine that the y-axis in the upper left corner of the popup is smaller
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('covidTargetPopup_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            console.info('covidTargetPopup_0010 START');
            let driver = await Driver.create();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            let button = await driver.findComponent(ON.id('popup'));
            await button.click();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            const buttonRect = await button.getBounds();
            let on: On = ON.type('Column').within(ON.type('Popup'));
            const popupContent = await driver.findComponent(on);
            await CommonFunc.sleep(SLEEP_TIME_1000);
            const popupRect = await popupContent.getBounds();
            console.info(
                `[covidTargetPopup_0010]  + ${popupRect.left},${popupRect.top},${popupRect.right},${popupRect.bottom}`
            );
            console.info(
                `[covidTargetPopup_0010]  + ${buttonRect.left},${buttonRect.top},${buttonRect.right},
                ${buttonRect.bottom}`
              );
            expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);

            await CommonFunc.sleep(SLEEP_TIME_1000);
            await button.click();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            console.info('[covidTargetPopup_0010] END');
            done();
        });
    });
}
