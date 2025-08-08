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

export default function ContextMenuLife() {
    describe('ContextMenuLife', () => {
        const SLEEP_TIME_1000 = 1000;
        const SLEEP_TIME_2000 = 2000;
        beforeEach(async (done: Function) => {
            console.info('ContextMenuLife beforeEach start');
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/BindContextMenu/contextMenuLife',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info('get BindContextMenu state pages: ' + JSON.stringify(pages));
                if (!('contextMenuLife' == pages.name)) {
                    console.info('get BindContextMenu pages.name: ' + JSON.stringify(pages.name));
                    await router.push(options);
                    await CommonFunc.sleep(2000);
                }
            } catch (err) {
                console.error('push BindContextMenu page error: ' + err);
            }

            await CommonFunc.sleep(1000)
            console.info('BindContextMenu beforeEach end');
            done()
        });

        afterEach(async () => {
            await CommonFunc.sleep(1000);
            console.info('BindMenu after each called');
        })

        /* 
         * @tc.number: contextMenu_0010
         * @tc.name  : contextMenu_0010
         * @tc.desc  : open contextMenu,call onWillAppear and onDidAppear;close contextMenu,call onWillDisappear and
         *             onDidDisappear
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('contextMenu_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('[contextMenu_0010] START');
            let driver = await Driver.create();
            await CommonFunc.sleep(SLEEP_TIME_1000);
            let button = await driver.findComponent(ON.id('showID'));
            await button.click();
            await CommonFunc.sleep(SLEEP_TIME_1000);

            let strJson = getInspectorByKey('appearText1');
            let disappStrJson = getInspectorByKey('disappearText1');
            let content: String = JSON.parse(strJson).$attrs.content;
            let disappContent: String = JSON.parse(disappStrJson).$attrs.content;
            console.info('[contextMenu_0010] content is: ' + content);
            console.info('[contextMenu_0010] disappContent is: ' + disappContent);
            expect(content).assertEqual('onWillAppear_onDidAppear');
            expect(disappContent).assertEqual('');

            await CommonFunc.sleep(SLEEP_TIME_2000);
            disappStrJson = getInspectorByKey('disappearText1');
            disappContent = JSON.parse(disappStrJson).$attrs.content;
            console.info('[contextMenu_0010] disappContents is: ' + disappContent);
            expect(disappContent).assertEqual('onWillDisappear_onDidDisappear');
            console.info('[contextMenu_0010] END');
            done();
          });
    })
}