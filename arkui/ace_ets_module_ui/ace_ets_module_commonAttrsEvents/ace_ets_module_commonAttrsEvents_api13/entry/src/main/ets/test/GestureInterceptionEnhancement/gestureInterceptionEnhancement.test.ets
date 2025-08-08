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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function gestureInterceptionEnhancementTest() {
  describe('gestureInterceptionEnhancementTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureInterceptionEnhancementTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancement",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get followTransformOfTargetCustomPopup state pages: " + JSON.stringify(pages));
        if (!("gestureInterceptionEnhancementTest" == pages.name)) {
          console.info("get gestureInterceptionEnhancementTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push gestureInterceptionEnhancementTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

     afterEach(async () => {
      await router.replaceUrl({url: 'MainAbility/pages/index/indexassist'})
      await CommonFunc.sleep(2000);
    });

    /**
     * @tc.number    gestureInterceptionEnhancementTest_0010
     * @tc.name      gestureInterceptionEnhancementTest
     * @tc.desc      check the tabs nest scroll when invoke gesture Interception Enhancement interface (exposeInnerGesture value true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('gestureInterceptionEnhancementTest_0010', Level.LEVEL0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementTest_0010 START');
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
        let top = firstTabs.top;
        let right = firstTabs.right;
        let left = firstTabs.left;
        let bottom = firstTabs.bottom;
        console.info("gestureInterceptionEnhancementTest_0010 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text01: Component = await driver.findComponent(ON.text("BlueTest"))
        let textContent01:string = await text01.getText();
        expect(textContent01).assertEqual("BlueTest");

        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text02: Component = await driver.findComponent(ON.text("PinkTest"))
        let textContent02:string = await text02.getText();
        expect(textContent02).assertEqual("PinkTest");

        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text03: Component = await driver.findComponent(ON.text("blue and pink test"))
        let textContent03:string = await text03.getText();
        expect(textContent03).assertEqual("blue and pink test");
        done();
    });


    /**
     * @tc.number    gestureInterceptionEnhancementTest_0020
     * @tc.name      gestureInterceptionEnhancementTest
     * @tc.desc      check the tabs nest scroll when invoke gesture Interception Enhancement interface (exposeInnerGesture value false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('gestureInterceptionEnhancementTest_0020', Level.LEVEL0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementTest_0020 START');
    
        globalThis.value.message.notify({
             name: 'exposeInnerGesture', value: false
        });
        await CommonFunc.sleep(1000);
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
        let top = firstTabs.top;
        let right = firstTabs.right;
        let left = firstTabs.left;
        let bottom = firstTabs.bottom;
        console.info("gestureInterceptionEnhancementTest_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text01: Component = await driver.findComponent(ON.text("BlueTest"));
        let textContent01:string = await text01.getText();
        expect(textContent01).assertEqual("BlueTest");

        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text02: Component = await driver.findComponent(ON.text("PinkTest"))
        let textContent02:string = await text02.getText();
        expect(textContent02).assertEqual("PinkTest");

        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let text03: Component = await driver.findComponent(ON.text("PinkTest"))
        let textContent03:string = await text03.getText();
        expect(textContent03).assertEqual("PinkTest");
        done();
    });

     /**
     * @tc.number    gestureInterceptionEnhancementTest_0030
     * @tc.name      gestureInterceptionEnhancementTest
     * @tc.desc      check the callback trigger when invoke gesture Interception Enhancement interface (exposeInnerGesture value false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('gestureInterceptionEnhancementTest_0030', Level.LEVEL0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementTest_0030 START');
    
        globalThis.value.message.notify({
             name: 'exposeInnerGesture', value: false
        });
        await CommonFunc.sleep(1000);
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContent');
        let top = firstTabs.top;
        let right = firstTabs.right;
        let left = firstTabs.left;
        let bottom = firstTabs.bottom;
        console.info("gestureInterceptionEnhancementTest_0030 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
        let strJson = getInspectorByKey('callBackS');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[gestureInterceptionEnhancementTest_0030] content: " + JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.content).assertEqual("");
        done();
    });



  })
}

