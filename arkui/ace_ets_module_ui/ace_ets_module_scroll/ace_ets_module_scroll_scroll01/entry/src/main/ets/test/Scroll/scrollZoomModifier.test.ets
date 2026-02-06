/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function scrollZoomModifier() {
  describe('scrollZoomModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollZoomModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollZoomModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollZoomModifier state pages:" + JSON.stringify(pages));
        if (!("scrollZoomModifier" == pages.name)) {
          console.info("get scrollZoomModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollZoomModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollZoomModifier page error:" + err);
      }
      console.info("scrollZoomModifier beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollZoomModifier_0100
     * @tc.number scrollZoomModifier_001
     * @tc.desc   Scale setting properties of Scroll component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollZoomModifier_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollZoomModifier_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_zoom_modifier');
      console.info("[scrollZoomModifier_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollZoomModifier_0100] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[scrollZoomModifier_0100] minZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.minZoomScale));
      console.info("[scrollZoomModifier_0100] maxZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.maxZoomScale));
      console.info("[scrollZoomModifier_0100] zoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.zoomScale));
      console.info("[scrollZoomModifier_0100] enableBouncesZoom: " + JSON.stringify(JSON.parse(strJson).$attrs.enableBouncesZoom));
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual("ScrollDirection.Free");
      expect(JSON.parse(strJson).$attrs.minZoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.maxZoomScale).assertEqual(3);
      expect(JSON.parse(strJson).$attrs.zoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.enableBouncesZoom).assertEqual(true);
      console.info('[scrollZoomModifier_0100] END');
      done();
    });

    /**
     * @tc.name   scrollZoomModifier_0200
     * @tc.number scrollZoomModifier_002
     * @tc.desc   Scale attribute callback of Scroll component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollZoomModifier_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollZoomModifier_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let image: Component = await driver.findComponent(ON.id('img_zoom_modifier'));
      await image.pinchIn(0.5);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('modifier_didZoom');
      console.info("[scrollZoomModifier_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollZoomModifier_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onDidZoom: 1");

      let strJson2 = getInspectorByKey('zoom_start_modifier');
      console.info("[scrollZoomModifier_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onZoomStart");

      let strJson3 = getInspectorByKey('zoom_stop_modifier');
      console.info("[scrollZoomModifier_0200] content2: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("onZoomStop");
      console.info('[scrollZoomModifier_0200] END');
      done();
    });
  })
}
