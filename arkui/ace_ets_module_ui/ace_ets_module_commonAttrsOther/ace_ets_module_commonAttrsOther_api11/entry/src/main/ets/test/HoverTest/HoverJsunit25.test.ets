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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function HoverJsunit25() {
  describe('HoverJsunit25', () => {
   beforeEach(async (done: Function) => {
     console.info("HoverJsunit beforeEach start");
     let options: router.RouterOptions = {
       url: 'MainAbility/pages/Hover/Hover25',
     }
     try {
       router.clear();
       let pages = router.getState();
       console.info("get HoverJsunit state pages: " + JSON.stringify(pages));
       if (!("Hover25" == pages.name)) {
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
      console.info('HoverJsunit_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('hover25');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[HoverJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit25sun] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      console.info('[HoverJsunit_0100] END');
      done();
    });

    it('HoverJsunit_0200', 0, async (done: Function) => {
      console.info('HoverJsunit_0200 START');
      let driver = await Driver.create()
      let buttonCl = await driver.findComponent(ON.id('hover25'));
      await CommonFunc.sleep(500);
      let point = await buttonCl.getBoundsCenter();
      await driver.mouseMoveTo({x:point.x , y:point.y })
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('hover25');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[HoverJsunit_0200] END');
      done();
    });





  })
}

