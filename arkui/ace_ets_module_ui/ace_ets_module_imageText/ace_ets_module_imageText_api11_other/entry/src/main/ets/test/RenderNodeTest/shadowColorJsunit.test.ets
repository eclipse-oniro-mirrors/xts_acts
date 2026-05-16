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

export default function shadowColorJsunit() {
  describe('shadowColorJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("shadowColorJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/shadowColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shadowColorJsunit state pages: " + JSON.stringify(pages));
        if (!("shadowColor" == pages.name)) {
          console.info("get shadowColorJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push shadowColorJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shadowColorJsunit page error:" + err);
      }
      done()
    });

    /**
     * @tc.name   shadowColorJsunit_0100
     * @tc.number SUB_ACE_RENDERNODE_SHADOWCOLOR_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('shadowColorJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('shadowColorJsunit_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getSet_shadowColor'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('render_shadowColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[shadowColorJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('shadowColor:4278255360');
      console.info('[shadowColorJsunit_0100] END');
      done();
    });
  })
}