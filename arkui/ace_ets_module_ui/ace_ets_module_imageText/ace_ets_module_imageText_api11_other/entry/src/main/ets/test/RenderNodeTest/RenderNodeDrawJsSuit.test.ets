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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'

export default function RenderNodeDrawJsSuit() {
  describe('RenderNodeDrawJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeDrawJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/RenderNodeDraw',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeDrawJsSuit state pages: " + JSON.stringify(pages));
        if (!("RenderNodeDraw" == pages.name)) {
          console.info("get RenderNodeDrawJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeDrawJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeDrawJsSuit page error:" + err);
      }
      done()
    });

    /**
     * @tc.name   RenderNodeDrawJsSuit_0100
     * @tc.number SUB_ACE_TS_COMPONENTselectoptionwith_01
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderNodeDrawJsSuit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RenderNodeDrawJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('invalidate_draw'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RenderNodeDraw_get');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderNodeDrawJsSuit_0100] obj is: " + JSON.stringify(obj));
      console.info("[RenderNodeDrawJsSuit_0100] obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='Draw:0.5').assertTrue();
      console.info('[RenderNodeDrawJsSuit_0100] END');
      done();
    });
  })
}