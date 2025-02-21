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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function ScrollBarJsunit() {
  describe('ScrollBarJsunit', function () {
    beforeEach(async function (done) {
      console.info("ScrollBarJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/ScrollBarPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollBarJsunit state pages: " + JSON.stringify(pages));
        if (!("ScrollBarPage" == pages.name)) {
          console.info("get ScrollBarJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollBarJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollBarJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ScrollBarJsunit_0100', 0, async function (done) {
      // Get the information of the ScrollBar component
      console.info('[ScrollBarJsunit_0100] START');
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.$attrs.state).assertEqual('BarState.Auto');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_0100] END');
      done();
    });

    it('ScrollBarJsunit_0200', 0, async function (done) {
      // Modify the direction of the ScrollBar component
      console.info('[ScrollBarJsunit_0200] START');
      globalThis.value.message.notify({name:'scrollBarDirection',value:'ScrollBarDirection.Horizontal'})
      await CommonFunc.sleep(2000);
      // Get the direction of the ScrollBar component
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      console.info('[ScrollBarJsunit_0200] END');
      done();
    });

    it('ScrollBarJsunit_0300', 0, async function (done) {
      // Modify the state of the ScrollBar component
      console.info('[ScrollBarJsunit_0300] START');
      globalThis.value.message.notify({name:'state',value:BarState.Auto})
      await CommonFunc.sleep(1500);
      // Get the state value of the ScrollBar component
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.state).assertEqual('BarState.Auto');
      console.info('[ScrollBarJsunit_0300] END');
      done();
    });

    it('ScrollBarJsunit_0400', 0, async function (done) {
      // Modify the backgroundColor of the ScrollBar component
      console.info('[ScrollBarJsunit_0400] START');
      globalThis.value.message.notify({name:'backColor',value:'Color.Blue'})
      await CommonFunc.sleep(2000);
      // Get the backgroundColor of the ScrollBar component
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_0400] END');
      done();
    });

    it('ScrollBarJsunit_0500', 0, async function (done) {
      // Illegal modification of attribute value of the ScrollBar component
      console.info('[ScrollBarJsunit_0500] START');
      globalThis.value.message.notify({name:'scrollBarDirection',value:'1'})
      await CommonFunc.sleep(800);
      globalThis.value.message.notify({name:'state',value:'1'})
      await CommonFunc.sleep(800);
      globalThis.value.message.notify({name:'backColor',value:'1'})
      await CommonFunc.sleep(800);
      // Get the attribute value of the ScrollBar component
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.$attrs.state).assertEqual('BarState.Auto');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_0500] END');
      done();
    });

    it('ScrollBarJsunit_0600', 0, async function (done) {
      // Modify the direction of the Scroll component and ScrollBar component
      console.info('[ScrollBarJsunit_0600] START');
      globalThis.value.message.notify({name:'ScrollDirection',value:'ScrollDirection.Horizontal'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'scrollBarDirection',value:'ScrollBarDirection.Horizontal'})
      await CommonFunc.sleep(2000);
      // Get the direction of the ScrollBar component
      let strJson = getInspectorByKey('scrollBar');
      let obj = JSON.parse(strJson);
      console.info("[ScrollBarJsunit_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      console.info('[ScrollBarJsunit_0600] END');
      done();
    });
  })
}
