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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function gestureInterceptionEnhancementCallbackSwiperTest() {
  describe('gestureInterceptionEnhancementCallbackSwiperTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureInterceptionEnhancementCallbackSwiperTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancementcallbackRecognizerSwiperTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureInterceptionEnhancementCallbackSwiperTest state pages: " + JSON.stringify(pages));
        if (!("gestureInterceptionEnhancementCallbackSwiperTest" == pages.name)) {
          console.info("get gestureInterceptionEnhancementCallbackSwiperTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push gestureInterceptionEnhancementCallbackSwiperTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementCallbackSwiperTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

     afterEach(async () => {
       await router.replaceUrl({url: 'MainAbility/pages/index/indexassist'})
       await CommonFunc.sleep(2000);
    });

    /**
     * @tc.number    gestureInterceptionEnhancementCallbackSwiperTest_0010
     * @tc.name      gestureInterceptionEnhancementTest
     * @tc.desc      test  GestureRecognizerJudgeBegin trigger when invoke gesture Interception Enhancement interface (exposeInnerGesture value true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('gestureInterceptionEnhancementCallbackSwiperTest_0010', 0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementCallbackSwiperTest_0010 START');
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let firstswiper = CommonFunc.getComponentRectOnScreen('swiperRecogniserTest');
        let top = firstswiper.top;
        let right = firstswiper.right;
        let left = firstswiper.left;
        let bottom = firstswiper.bottom;
        console.info("gestureInterceptionEnhancementCallbackSwiperTest_0010 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(3000);
      
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(3000);

         // check the GestureRecognizerJudgeBegin trigger
         let strJson = getInspectorByKey('callBackString');
         let obj: ESObject = JSON.parse(strJson);
         console.info("[gestureInterceptionEnhancementCallbackSwiperTest_0010 ] content: " + JSON.stringify(obj.$attrs.content));
         expect(obj.$attrs.content).assertEqual("接口触发");
         done();
    });

     /**
     * @tc.number    gestureInterceptionEnhancementCallbackSwiperTest_0020
     * @tc.name      gestureInterceptionEnhancementTest
     * @tc.desc      test  GestureRecognizerJudgeBegin trigger when invoke gesture Interception Enhancement interface (exposeInnerGesture value false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('gestureInterceptionEnhancementCallbackSwiperTest_0020', 0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementCallbackSwiperTest_0020 START');

        globalThis.value.message.notify({
             name: 'exposeInnerGesture', value: false
        });
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let firstswiper = CommonFunc.getComponentRectOnScreen('swiperRecogniserTest');
        let top = firstswiper.top;
        let right = firstswiper.right;
        let left = firstswiper.left;
        let bottom = firstswiper.bottom;
        console.info("gestureInterceptionEnhancementCallbackSwiperTest_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(3000);
      
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(3000);

         // check the GestureRecognizerJudgeBegin trigger
         let strJson = getInspectorByKey('callBackString');
         let obj: ESObject = JSON.parse(strJson);
         console.info("[gestureInterceptionEnhancementCallbackSwiperTest_0020 ] content: " + JSON.stringify(obj.$attrs.content));
         expect(obj.$attrs.content).assertEqual("接口触发");
         done();
    });


  
  })
}

