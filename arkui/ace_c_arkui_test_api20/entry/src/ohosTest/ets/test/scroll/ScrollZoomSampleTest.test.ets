/*
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect, Component } from '@ohos.UiTest';

export default function ScrollZoomSampleTest() {

  describe('ScrollZoomSampleTest', () => {

    /**
     * @tc.name   ScrollZoomSample_0100
     * @tc.number ScrollZoomSample_0100
     * @tc.desc   Test changes of scroll ZoomScale and NODE_SCROLL_EVENT_ON_ZOOM_START
     * @tc.type   FUNCTION
     * @tc.size   MediumTest
     * @tc.level  Level 1
     */
    it('ScrollZoomSample_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollZoomSample_0100] START');
      await Utils.pushPage(`scroll/ScrollZoomStartTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let pinchText: Component = await driver.findComponent(ON.id('text_zoom'));
      await pinchText.pinchIn(0.5);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('scrollable_zoom');
      console.info("[ScrollZoomSample_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ScrollZoomSample_0100] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[ScrollZoomSample_0100] minZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.minZoomScale));
      console.info("[ScrollZoomSample_0100] maxZoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.maxZoomScale));
      console.info("[ScrollZoomSample_0100] zoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.zoomScale));
      console.info("[ScrollZoomSample_0100] enableBouncesZoom: " + JSON.stringify(JSON.parse(strJson).$attrs.enableBouncesZoom));
      console.info("[ScrollZoomSample_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual("ScrollDirection.Free");
      expect(JSON.parse(strJson).$attrs.minZoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.maxZoomScale).assertEqual(3);
      expect(JSON.parse(strJson).$attrs.zoomScale).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.enableBouncesZoom).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[ScrollZoomSample_0100] END');
      done();
    })

    /**
     * @tc.name   ScrollZoomSample_0200
     * @tc.number ScrollZoomSample_0200
     * @tc.desc   Test changes of scroll NODE_SCROLL_EVENT_ON_DID_ZOOM
     * @tc.type   FUNCTION
     * @tc.size   MediumTest
     * @tc.level  Level 1
     */
    it('ScrollZoomSample_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollZoomSample_0200] START');
      await Utils.pushPage(`scroll/ScrollZoomDidTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let pinchText: Component = await driver.findComponent(ON.id('text_zoom'));
      await pinchText.pinchIn(0.5);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('scrollable_zoom');
      console.info("[ScrollZoomSample_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ScrollZoomSample_0200] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[ScrollZoomSample_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[ScrollZoomSample_0200] END');
      done();
    })

    /**
     * @tc.name   ScrollZoomSample_0300
     * @tc.number ScrollZoomSample_0300
     * @tc.desc   Test changes of scroll NODE_SCROLL_EVENT_ON_ZOOM_STOP
     * @tc.type   FUNCTION
     * @tc.size   MediumTest
     * @tc.level  Level 1
     */
    it('ScrollZoomSample_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollZoomSample_0300] START');
      await Utils.pushPage(`scroll/ScrollZoomStopTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let pinchText: Component = await driver.findComponent(ON.id('text_zoom'));
      await pinchText.pinchIn(0.5);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('scrollable_zoom');
      console.info("[ScrollZoomSample_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ScrollZoomSample_0300] zoomScale: " + JSON.stringify(JSON.parse(strJson).$attrs.zoomScale));
      console.info("[ScrollZoomSample_0300] enableBouncesZoom: " + JSON.stringify(JSON.parse(strJson).$attrs.enableBouncesZoom));
      console.info("[ScrollZoomSample_0300] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[ScrollZoomSample_0300] END');
      done();
    })

  })
}