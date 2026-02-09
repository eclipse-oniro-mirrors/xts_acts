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


export default function gestureInterceptionEnhancementCallbackTest() {
  describe('gestureInterceptionEnhancementCallbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureInterceptionEnhancementCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancementcallbackTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsInterceptionEnhancementcallbackTest state pages: " + JSON.stringify(pages));
        if (!("tabsInterceptionEnhancementcallbackTest" == pages.name)) {
          console.info("get tabsInterceptionEnhancementcallbackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsInterceptionEnhancementcallbackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsInterceptionEnhancementcallbackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

     afterEach(async () => {
      await CommonFunc.sleep(1500);
    });

    /**
     * @tc.name   gestureInterceptionEnhancementCallbackTest_0010
     * @tc.number gestureInterceptionEnhancementCallbackTest_0010
     * @tc.desc   test the BaseGestureEvent callBackData when invoke gesture Interception Enhancement interface (exposeInnerGesture value true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureInterceptionEnhancementCallbackTest_0010', Level.LEVEL0, async (done: Function) => {
        console.info('gestureInterceptionEnhancementCallbackTest_0010 START');
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
      
        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);

        await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left),Math.round(top + height/2));
        await CommonFunc.sleep(2500);
         // check the callback data
         let strJson = getInspectorByKey('eventtest');
         let obj: ESObject = JSON.parse(strJson);
         console.info("[gestureInterceptionEnhancementCallbackTest_0010 ] content: " + JSON.stringify(obj.$attrs.content));
         let obj2 : ESObject = JSON.parse(obj.$attrs.content);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" + obj2.offsetX);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" + obj2.offsetY);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" + obj2.velocityX);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" + obj2.velocityY);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" + obj2.velocity);
         expect(obj2.offsetX <=0).assertTrue();
         expect(obj2.offsetY ==0).assertTrue();
         expect(Math.abs(obj2.velocityX) > 0).assertTrue();
         expect(Math.abs(obj2.velocityY) > 0).assertTrue();
         expect(obj2.velocity > 0).assertTrue();
         expect(obj2.source == 2).assertTrue();
         expect(obj2.pressure == 0).assertTrue();
         expect(obj2.tiltX == 0).assertTrue();
         expect(obj2.tiltY == 0).assertTrue();
         expect(obj2.sourceTool == 1).assertTrue();
         expect(obj2.deviceId == -1).assertTrue();
         console.info("gestureInterceptionEnhancementCallbackTest_0010" +  JSON.stringify(obj2.fingerList));
         console.info("gestureInterceptionEnhancementCallbackTest_0010" +   obj2.fingerList[0].id);
         expect(obj2.fingerList[0].id == 0).assertTrue();
         let actualGlobalX:number = Math.round(left + width * 0.8);
         let actualGlobalY:number = Math.round(height /2 + top);
         console.info("gestureInterceptionEnhancementCallbackTest_0010" +  "actualGlobalX " + actualGlobalX + "actualGlobalY = " + actualGlobalY);
         console.info("gestureInterceptionEnhancementCallbackTest_0010_fingerList " + Math.floor(vp2px(obj2.fingerList[0].globalX)) + " ** "+ Math.floor(vp2px(obj2.fingerList[0].globalY)) + 
         "**" + Math.floor(vp2px(obj2.fingerList[0].localX)) + "** " + Math.floor(vp2px(obj2.fingerList[0].localY)) + "**" + Math.floor(vp2px(obj2.fingerList[0].displayX)) + "**" + Math.floor((vp2px(obj2.fingerList[0].displayY))));
         
         expect(Math.floor(vp2px(obj2.fingerList[0].globalX)) <= actualGlobalX).assertTrue();
         expect(Math.floor(vp2px(obj2.fingerList[0].globalY)) <= actualGlobalY).assertTrue();
         expect(Math.floor(vp2px(obj2.fingerList[0].localX)) <= actualGlobalX).assertTrue();
         expect(Math.floor(vp2px(obj2.fingerList[0].localY)) <= actualGlobalY).assertTrue();
         expect(Math.floor(vp2px(obj2.fingerList[0].displayX)) <= actualGlobalX).assertTrue();
         expect(Math.floor(vp2px(obj2.fingerList[0].displayY)) <= actualGlobalY).assertTrue();
         console.info("gestureInterceptionEnhancementCallbackTest_0010_target " + Math.floor(vp2px(obj2.target.area.globalPosition.x)) + "--" + Math.floor(vp2px(obj2.target.area.globalPosition.y))
         + Math.floor(vp2px(obj2.target.area.position.x)) + "..." + Math.floor(vp2px(obj2.target.area.position.y)) + "..." + Math.floor(vp2px(obj2.target.area.width)) + ".." + vp2px(obj2.target.area.height));
     
         expect(Math.floor(vp2px(obj2.target.area.globalPosition.x)) <= actualGlobalX).assertTrue();
         expect(Math.floor(vp2px(obj2.target.area.globalPosition.y)) <= actualGlobalY).assertTrue();
         expect(Math.floor(vp2px(obj2.target.area.position.x)) <= actualGlobalX).assertTrue();
         expect(Math.floor(vp2px(obj2.target.area.position.y)) <= actualGlobalY).assertTrue();
         expect(Math.floor(vp2px(obj2.target.area.width)) <= width).assertTrue(); 
         expect(Math.floor(vp2px(obj2.target.area.height)) <= height).assertTrue();
         done();
    });


  
  })
}

