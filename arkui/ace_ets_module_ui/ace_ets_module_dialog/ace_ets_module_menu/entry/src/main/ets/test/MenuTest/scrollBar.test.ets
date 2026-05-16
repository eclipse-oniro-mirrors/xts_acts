/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 	 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollBarTest() {
describe('scrollBarTest', () => {
    beforeEach(async (done: Function) => {
        console.info('scrollBarTest beforeEach start');
        let options: router.RouterOptions = {
            url: 'MainAbility/pages/Menu/scrollBar',
        };
        try {
            router.clear();
            let pages = router.getState();
            console.info('get scrollBarTest state pages:' + JSON.stringify(pages));
            if (pages.name !== 'scrollBarTest') { 
            console.info('get scrollBarTest pages.name:' + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await CommonFunc.sleep(2000);
            console.info('push scrollBarTest page result:' + JSON.stringify(result));
            }
        } catch (err) {
            console.error('push scrollBarTest page error:' + JSON.stringify(err));
        }
        console.info('scrollBarTest beforeEach end');
        done();
        });

        afterEach(async () => {
        await CommonFunc.sleep(1000);
        console.info('scrollBarTest after each called');
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_SCROLLBAR_0100
        * @tc.name      scrollBarTest_0100
        * @tc.desc      testing scrollBar Auto
        * @tc.level:    Level 1
        */
        it('scrollBarTest_0100', Level.LEVEL1, async (done: Function) => {
        console.info('[scrollBarTest_0100] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(500);

        let keyBtn = await driver.findComponent(ON.id('get'));
        await keyBtn.click();
        await CommonFunc.sleep(500);

        let keyBtn1 = await driver.findComponent(ON.id('auto'));
        await keyBtn1.click();
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text1');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[scrollBarTest_0100]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('scrollBar Auto:undefined');

        console.info('[scrollBarTest_0100] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_SCROLLBAR_0200
        * @tc.name      scrollBarTest_0200
        * @tc.desc      testing scrollBar On
        * @tc.level:    Level 1
        */
        it('scrollBarTest_0200', Level.LEVEL1, async (done: Function) => {
        console.info('[scrollBarTest_0200] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(500);

        let keyBtn = await driver.findComponent(ON.id('get'));
        await keyBtn.click();
        await CommonFunc.sleep(500);

        let keyBtn2 = await driver.findComponent(ON.id('on'));
        await keyBtn2.click();
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text2');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[scrollBarTest_0200]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('scrollBar On:undefined');

        console.info('[scrollBarTest_0200] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_SCROLLBAR_0300
        * @tc.name      scrollBarTest_0300
        * @tc.desc      testing scrollBar Off
        * @tc.level:    Level 1
        */
        it('scrollBarTest_0300', Level.LEVEL1, async (done: Function) => {
        console.info('[scrollBarTest_0300] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(500);

        let keyBtn = await driver.findComponent(ON.id('get'));
        await keyBtn.click();
        await CommonFunc.sleep(500);

        let keyBtn3 = await driver.findComponent(ON.id('off'));
        await keyBtn3.click();
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text3');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[scrollBarTest_0300]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('scrollBar Off:undefined');

        console.info('[scrollBarTest_0300] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_SCROLLBAR_0400
        * @tc.name      scrollBarTest_0400
        * @tc.desc      testing scrollBar undefined
        * @tc.level:    Level 2
        */
        it('scrollBarTest_0400', Level.LEVEL1, async (done: Function) => {
        console.info('[scrollBarTest_0400] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(500);

        let keyBtn = await driver.findComponent(ON.id('get'));
        await keyBtn.click();
        await CommonFunc.sleep(500);

        let keyBtn4 = await driver.findComponent(ON.id('undefined'));
        await keyBtn4.click();
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text4');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[scrollBarTest_0400]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('scrollBar undefined:undefined');

        console.info('[scrollBarTest_0400] END');
        done();
        });
    });
}