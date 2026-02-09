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

export default function zoomScaleNull() {
  describe('zoomScaleNull', () => {
    beforeEach(async (done: Function) => {
      console.info("zoomScaleNull beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/zoomScaleNull",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get zoomScaleNull state pages:" + JSON.stringify(pages));
        if (!("zoomScaleNull" == pages.name)) {
          console.info("get zoomScaleNull pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push zoomScaleNull page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push zoomScaleNull page error:" + err);
      }
      console.info("zoomScaleNull beforeEach end");
      done();
    });

    /**
     * @tc.name   zoomScaleNull_0100
     * @tc.number zoomScaleNull_001
     * @tc.desc   Scale setting properties of Scroll component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('zoomScaleNull_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[zoomScaleNull_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_nullZoom');
      console.info("[zoomScaleNull_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[zoomScaleNull_0100] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[zoomScaleNull_0100] minZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.minZoomScale));
      console.info("[zoomScaleNull_0100] maxZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.maxZoomScale));
      console.info("[zoomScaleNull_0100] zoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.zoomScale));
      console.info("[zoomScaleNull_0100] enableBouncesZoom: " + JSON.stringify(JSON.parse(strJson).$attrs.enableBouncesZoom));
      expect(JSON.parse(strJson).$attrs.minZoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.maxZoomScale).assertEqual(2);
      expect(JSON.parse(strJson).$attrs.zoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.enableBouncesZoom).assertEqual(true);
      console.info('[zoomScaleNull_0100] END');
      done();
    });

    /**
     * @tc.name   zoomScaleNull_0200
     * @tc.number zoomScaleNull_002
     * @tc.desc   Scale attribute callback of Scroll component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('zoomScaleNull_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[zoomScaleNull_0200] START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('zoomScaleNull_0200 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let driver: Driver = Driver.create();
      let image: Component = await driver.findComponent(ON.id('img_nullZoom'));
      await image.pinchIn(0.5);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('null_didZoom');
      console.info("[zoomScaleNull_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[zoomScaleNull_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onDidZoom: 1");

      let strJson2 = getInspectorByKey('zoom_nullStart');
      console.info("[zoomScaleNull_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onZoomStart");

      let strJson3 = getInspectorByKey('zoom_nullStop');
      console.info("[zoomScaleNull_0200] content2: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("onZoomStop");
      console.info('[zoomScaleNull_0200] END');
      done();
    });
  })
}
