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

export default function RenderNodeShadowRadiusJsSuit() {
  describe('RenderNodeShadowRadiusJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeShadowRadiusJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/RenderNodeShadowRadius',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeShadowRadiusJsSuit state pages: " + JSON.stringify(pages));
        if (!("RenderNodeShadowRadius" == pages.name)) {
          console.info("get RenderNodeShadowRadiusJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeShadowRadiusJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeShadowRadiusJsSuit page error:" + err);
      }
      done()
    });


    /**
     * @tc.name   RenderNodeShadowRadiusJsSuit_0100
     * @tc.number RenderNodeShadowRadiusJsSuit_0100
     * @tc.desc   RenderNodeShadowRadiusJsSuit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderNodeShadowRadiusJsSuit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RenderNodeShadowRadiusJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('getshadowRadiusNull'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('shadowRadiusNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderNodeShadowRadiusJsSuit_0100] obj is: " + JSON.stringify(obj));
      console.info("[RenderNodeShadowRadiusJsSuit_0100] obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='getshadowRadiusNull:80').assertTrue();
      console.info('[RenderNodeShadowRadiusJsSuit_0100] END');
      done();
    });
  })
}