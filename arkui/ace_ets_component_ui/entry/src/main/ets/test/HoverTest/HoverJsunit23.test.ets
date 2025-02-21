/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function HoverJsunit23() {
  describe('HoverJsunit23', () => {
   beforeEach(async (done: Function) => {
     console.info("HoverJsunit beforeEach start");
     let options: router.RouterOptions = {
       url: 'MainAbility/pages/Hover/Hover23',
     }
     try {
       router.clear();
       let pages = router.getState();
       console.info("get HoverJsunit state pages: " + JSON.stringify(pages));
       if (!("Hover23" == pages.name)) {
         console.info("get HoverJsunit state pages.name: " + JSON.stringify(pages.name));
         let result = await router.push(options);
         await CommonFunc.sleep(2000);
         console.info("push HoverJsunit success: " + JSON.stringify(result));
       }
     } catch (err) {
       console.error("push HoverJsunit page error: " + err);
       expect().assertFail();
     }
     done();
   });



    it('HoverJsunit_0100', 0, async (done: Function) => {
      console.info('HoverJsunit_0200 START');
      let driver = await Driver.create()
      await driver.mouseMoveTo({x:200, y:300})
      await CommonFunc.sleep(1000);
      let strJsonA = getInspectorByKey('hoverA23');
      let objA: ESObject = JSON.parse(strJsonA);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objA.$attrs.content));
      expect(objA.$attrs.content).assertEqual('Atrue');

      let strJsonB = getInspectorByKey('hoverB23');
      let objB: ESObject = JSON.parse(strJsonB);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objB.$attrs.content));
      expect(objB.$attrs.content).assertEqual('Bfalse');
      console.info('[HoverJsunit_0200] END');
      done();
    });

    it('HoverJsunit_0200', 0, async (done: Function) => {
      console.info('HoverJsunit_0200 START');
      let driver = await Driver.create()
      await driver.mouseMoveTo({x:500, y:300})
      await CommonFunc.sleep(1000);
      let strJsonA = getInspectorByKey('hoverA23');
      let objA: ESObject = JSON.parse(strJsonA);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objA.$attrs.content));
      expect(objA.$attrs.content).assertEqual('Afalse');

      let strJsonB = getInspectorByKey('hoverB23');
      let objB: ESObject = JSON.parse(strJsonB);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objB.$attrs.content));
      expect(objB.$attrs.content).assertEqual('Btrue');
      console.info('[HoverJsunit_0200] END');
      done();
    });

    it('HoverJsunit_0300', 0, async (done: Function) => {
      console.info('HoverJsunit_0300 START');
      let driver = await Driver.create()
      await driver.mouseMoveTo({x:800, y:300})
      await CommonFunc.sleep(1000);
      let strJsonA = getInspectorByKey('hoverA23');
      let objA: ESObject = JSON.parse(strJsonA);
      console.info("[HoverJsunit_0300] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0300] title: " + JSON.stringify(objA.$attrs.content));
      expect(objA.$attrs.content).assertEqual('Afalse');

      let strJsonB = getInspectorByKey('hoverB23');
      let objB: ESObject = JSON.parse(strJsonB);
      console.info("[HoverJsunit_0300] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0300] title: " + JSON.stringify(objB.$attrs.content));
      expect(objB.$attrs.content).assertEqual('Btrue');
      console.info('[HoverJsunit_0300] END');
      done();
    });


  })
}

