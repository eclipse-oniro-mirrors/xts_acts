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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'

export default function shadowAlphaJsunit() {
  describe('shadowAlphaJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("shadowAlphaJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/shadowAlpha',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shadowAlphaJsunit state pages: " + JSON.stringify(pages));
        if (!("shadowAlpha" == pages.name)) {
          console.info("get shadowAlphaJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push shadowAlphaJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shadowAlphaJsunit page error:" + err);
      }
      done()
    });

    /**
     * @tc.number: SUB_ACE_RENDERNODE_SHADOWALPHA_0100
     * @tc.name  : shadowAlphaJsunit_0100
     * @tc.desc  : set api
     * @tc.level : Level 2
     * @tc.type :
     * @tc.size :
     */
    it('shadowAlphaJsunit_0100', 0, async (done: Function) => {
      console.info('[shadowAlphaJsunit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setAlpha'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getAlpha');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[shadowAlphaJsunit_0100] obj is: " + JSON.stringify(obj));
      console.info("[shadowAlphaJsunit_0100] obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("shadowAlpha:0.5");
      console.info('[shadowAlphaJsunit_0100] END');
      done();
    });

  })
}