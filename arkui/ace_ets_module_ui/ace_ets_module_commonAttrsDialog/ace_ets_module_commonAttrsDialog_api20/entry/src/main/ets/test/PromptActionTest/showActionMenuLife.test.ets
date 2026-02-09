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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ShowActionMenuLife() {
    describe('ShowActionMenuLife', () => {
        const SLEEP_TIME_1000 = 1000;
        beforeEach(async (done: Function) => {
            console.info('PromptAction beforeEach start');
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/PromptAction/showActionMenuLife',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info('get PromptAction state pages: ' + JSON.stringify(pages));
                if (!('showActionMenuLife' == pages.name)) {
                    console.info('get PromptAction pages.name: ' + JSON.stringify(pages.name));
                    await router.push(options);
                    await CommonFunc.sleep(2000);
                }
            } catch (err) {
                console.error('push PromptAction page error: ' + err);
            }

            await CommonFunc.sleep(1000);
            console.info('PromptAction beforeEach end');
            done()
        });

        afterEach(async () => {
            await CommonFunc.sleep(1000);
            console.info('PromptAction after each called');
        })

        /**
         * @tc.name   showActionMenu_0010
         * @tc.number showActionMenu_0010
         * @tc.desc   open actionMenu,call onWillAppear and onDidAppear;close contextMenu,call onWillDisappear and
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('showActionMenu_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('[showActionMenu_0010] START');
            let driver = await Driver.create();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            let button = await driver.findComponent(ON.id('showActionMenu'));
            await button.click();
            await CommonFunc.sleep(SLEEP_TIME_1000);

            let strJson = getInspectorByKey('actionMenuText');
            let content: String = JSON.parse(strJson).$attrs.content;
            let disappStrJson = getInspectorByKey('disappearMenuText');
            let disappContent: String = JSON.parse(disappStrJson).$attrs.content;
            console.info('[showActionMenu_0010] content is: ' + content);
            console.info('[showActionMenu_0010] disappContent is: ' + disappContent);
            expect(content).assertEqual('onWillAppear_onDidAppear');
            expect(disappContent).assertEqual('');

            let buttons = await driver.findComponent(ON.text('取消'));
            await buttons.click();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            disappStrJson = getInspectorByKey('disappearMenuText');
            disappContent = JSON.parse(disappStrJson).$attrs.content;
            console.info('[showActionMenu_0010] disappContents is: ' + disappContent);
            expect(disappContent).assertEqual('onWillDisappear_onDidDisappear');
            console.info('[showActionMenu_0010] END');
            done();
          });
    })
}