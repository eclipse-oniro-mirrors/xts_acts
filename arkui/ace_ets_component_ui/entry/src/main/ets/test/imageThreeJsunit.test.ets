/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function imageThreeJsunit() {
  describe('imageThreeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("imageThreeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageThreeJsunit state pages:" + JSON.stringify(pages));
        if (!("imageThree" == pages.name)) {
          console.info("get imageThreeJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push imageThreeJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push imageThreeJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('imageThreeJsunit_0100', 0, async (done: Function) => {
      console.info('imageThreeJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // test the image complete Event
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('complete');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageThreeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('complete');
      done();
    });

    it('imageThreeJsunit_0200', 0, async (done: Function) => {
      console.info('imageThreeJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // test the image finish Event
      let strJson = getInspectorByKey('Finish');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageThreeJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('init');
      done();
    });  
    
    it('imageThreeJsunit_0300', 0, async (done: Function) => {
      console.info('imageThreeJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // test the image click event
      let driver = UiDriver.create();
      let btn = await driver.findComponent(BY.key('image2'));
      await btn.click();
      await CommonFunc.sleep(100);
      let strJson = getInspectorByKey('click');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageThreeJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('click');
      done();
    });

    it('imageThreeJsunit_0400', 0, async (done: Function) => {
      console.info('imageThreeJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // test the image error event
      globalThis.value.message.notify({name:'imageName',value:'1.png'})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('error');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageThreeJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('error');
      done();
    });
  })
}