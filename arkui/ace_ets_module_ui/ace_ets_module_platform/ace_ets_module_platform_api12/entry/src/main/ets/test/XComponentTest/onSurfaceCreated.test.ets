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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function onSurfaceCreatedJsunit() {
  describe('onSurfaceCreatedJsunit', function () {
    beforeEach(async function (done) {
      console.info("onSurfaceCreated beforeEach start");
      let options = {
        uri: "MainAbility/pages/XComponent/onSurfaceCreated",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSurfaceCreated state pages: " + JSON.stringify(pages));
        if (!("onSurfaceCreated" == pages.name)) {
          console.info("get onSurfaceCreated state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSurfaceCreated success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSurfaceCreated page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    onSurfaceCreatedTest_0010
     * @tc.name      onSurfaceCreatedTest_0010
     * @tc.desc      Xcomponent: get the api of onSurfaceCreated
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSurfaceCreatedTest_0010', 0, async function (done) {
      console.info('onSurfaceCreatedTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onSurfaceCreated_text'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onSurfaceCreated_text');
      let obj = JSON.parse(strJson);
      console.info("[onSurfaceCreatedTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onSurfaceCreated succ');
      console.info('[onSurfaceCreatedTest_0010] END');
      done();
    });

    /**
     * @tc.number    onSurfaceChangedTest_0020
     * @tc.name      onSurfaceChangedTest_0020
     * @tc.desc      Xcomponent: get the api of onSurfaceChanged
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSurfaceChangedTest_0020', 0, async function (done) {
      console.info('onSurfaceChangedTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('onSurfaceChanged_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('onSurfaceChanged_text'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onSurfaceChanged_text');
      let obj = JSON.parse(strJson);
      console.info("[onSurfaceChangedTest_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onSurfaceChanged succ');
      console.info('[onSurfaceChangedTest_0020] END');
      done();
    }); 

    /**
     * @tc.number    onSurfaceDestroyedTest_0030
     * @tc.name      onSurfaceDestroyedTest_0030
     * @tc.desc      Xcomponent: get the api of onSurfaceDestroyed
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSurfaceDestroyedTest_0030', 0, async function (done) {
      console.info('onSurfaceDestroyedTest_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('onSurfaceDestroyed_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('onSurfaceDestroyed_text'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onSurfaceDestroyed_text');
      let obj = JSON.parse(strJson);
      console.info("[onSurfaceDestroyedTest_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onSurfaceDestroyed succ');
      console.info('[onSurfaceDestroyedTest_0030] END');
      done();
    }); 
  })
}

