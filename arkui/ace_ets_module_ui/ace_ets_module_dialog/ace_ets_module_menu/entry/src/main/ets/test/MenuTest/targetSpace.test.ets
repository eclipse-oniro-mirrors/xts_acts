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

export default function targetSpaceTest() {
describe('targetSpaceTest', () => {
    beforeAll(async () => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
    });
    beforeEach(async (done: Function) => {
        console.info('targetSpaceTest beforeEach start');
        let options: router.RouterOptions = {
            url: 'MainAbility/pages/Menu/targetSpace',
        };
        try {
            router.clear();
            let pages = router.getState();
            console.info('get targetSpaceTest state pages:' + JSON.stringify(pages));
            if (pages.name !== 'targetSpace') { 
            console.info('get targetSpaceTest pages.name:' + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await CommonFunc.sleep(2000);
            console.info('push targetSpaceTest page result:' + JSON.stringify(result));
            }
        } catch (err) {
            console.error('push targetSpaceTest page error:' + JSON.stringify(err));
        }
        console.info('targetSpaceTest beforeEach end');
        done();
        });

        afterEach(async () => {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        await driver.pressBack();
        console.info('targetSpaceTest after each called');
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0100
        * @tc.name      targetSpaceTest_0100
        * @tc.desc      testing targetSpace LengthMetrics percent
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0100', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0100] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn1 = await driver.findComponent(ON.id('percent'));
        await keyBtn1.click();
        await CommonFunc.sleep(1000);

        let menuComponent1: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent1.getBounds();
        console.info('[targetSpaceTest_0100] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0100] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0100] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0200
        * @tc.name      targetSpaceTest_0200
        * @tc.desc      testing targetSpace LengthMetrics vp
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0200', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0200] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn2 = await driver.findComponent(ON.id('vp'));
        await keyBtn2.click();
        await CommonFunc.sleep(1000);

        let menuComponent2: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent2.getBounds();
        console.info('[targetSpaceTest_0200] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0200] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0200] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0300
        * @tc.name      targetSpaceTest_0300
        * @tc.desc      testing targetSpace LengthMetrics px
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0300', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0300] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn3 = await driver.findComponent(ON.id('px'));
        await keyBtn3.click();
        await CommonFunc.sleep(1000);

        let menuComponent3: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent3.getBounds();
        console.info('[targetSpaceTest_0300] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0300] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0300] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0400
        * @tc.name      targetSpaceTest_0400
        * @tc.desc      testing targetSpace LengthMetrics fp
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0400', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0400] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn4 = await driver.findComponent(ON.id('fp'));
        await keyBtn4.click();
        await CommonFunc.sleep(1000);

        let menuComponent4: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent4.getBounds();
        console.info('[targetSpaceTest_0400] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0400] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0400] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0500
        * @tc.name      targetSpaceTest_0500
        * @tc.desc      testing targetSpace LengthMetrics lpx
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0500', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0500] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn5 = await driver.findComponent(ON.id('lpx'));
        await keyBtn5.click();
        await CommonFunc.sleep(1000);

        let menuComponent5: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent5.getBounds();
        console.info('[targetSpaceTest_0500] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0500] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0500] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0600
        * @tc.name      targetSpaceTest_0600
        * @tc.desc      testing targetSpace LengthMetrics 0
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0600', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0600] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn6 = await driver.findComponent(ON.id('0'));
        await keyBtn6.click();
        await CommonFunc.sleep(1000);

        let menuComponent6: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent6.getBounds();
        console.info('[targetSpaceTest_0600] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0600] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0600] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0700
        * @tc.name      targetSpaceTest_0700
        * @tc.desc      testing targetSpace LengthMetrics -1
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0700', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0700] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn7 = await driver.findComponent(ON.id('-1'));
        await keyBtn7.click();
        await CommonFunc.sleep(1000);

        let menuComponent7: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent7.getBounds();
        console.info('[targetSpaceTest_0700] rect is: ' + JSON.stringify(rect));
        console.info('[targetSpaceTest_0700] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0700] END');
        done();
        });

        /**
        * @tc.number    SUB_ARKUI_CONTEXTMENUOPTION_MENU_TARGETSPACE_0800
        * @tc.name      targetSpaceTest_0800
        * @tc.desc      testing targetSpace LengthMetrics undefined
        * @tc.level:    Level 1
        */
        it('targetSpaceTest_0800', Level.LEVEL1, async (done: Function) => {
        console.info('[targetSpaceTest_0800] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1500);

        let keyBtn8 = await driver.findComponent(ON.id('undefined'));
        await keyBtn8.click();
        await CommonFunc.sleep(1000);

        let menuComponent8: Component = await driver.findComponent(ON.id('menu'));
        let rect = await menuComponent8.getBounds();
        console.info('[targetSpaceTest_0800] rect is: '+ JSON.stringify(rect));
        console.info('[targetSpaceTest_0800] rect.top is: ' + rect.top);
        await CommonFunc.sleep(1000);

        expect(rect.top == 0).assertFalse();
        expect(rect.top > 0).assertTrue();
        await CommonFunc.sleep(1000);

        console.info('[targetSpaceTest_0800] END');
        done();
        });
    });
}