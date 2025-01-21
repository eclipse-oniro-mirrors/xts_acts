/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function canvasActualBoundingBoxAscentJsunit() {
  describe('canvasActualBoundingBoxAscentTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/canvas',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canvas state success " + JSON.stringify(pages));
        if (!("canvas" == pages.name)) {
          console.info("get canvas state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push canvas page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvas page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("canvasActualBoundingBoxAscent after each called");
    });

    it('testcanvasAttributes0001', 0, async function (done) {
      console.info('canvasAttributes0001 testcanvasAttributes0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(obj.$attrs.width).assertEqual("100.00%");
      console.info("[testcanvasAttributes0001] width value :" + obj.$attrs.width);
      done();
    });

    it('testcanvasAttributes0002', 0, async function (done) {
      console.info('canvasAttributes0002 testcanvasAttributes0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(obj.$attrs.height).assertEqual("100.00%");
      console.info("[testcanvasAttributes0002] height value :" + obj.$attrs.height);
      done();
    });

    it('testcanvasAttributes0003', 0, async function (done) {
      console.info('canvasAttributes0003 testcanvasAttributes0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes0003] component backgroundColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFFFF00");
      console.info("[testcanvasAttributes0003] backgroundColor value :" + obj.$attrs.backgroundColor);
      done();
    });

    it('testcanvasAttributes0004', 0, async function (done) {
      console.info('canvasAttributes0003 testcanvasAttributes0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes0004] component position strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(obj.$attrs.position.x).assertEqual("3.00vp");
      console.info("[testcanvasAttributes0004] position value :" + obj.$attrs.position);
      done();
    });

    it('testcanvasAttributes0005', 0, async function (done) {
      console.info('canvasAttributes0005 testcanvasAttributes0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas');
      expect(obj.$attrs.align).assertEqual("Alignment.Center");
      console.info("[testcanvasAttributes0005] align value :" + obj.$attrs.align);
      done();
    });

  })
}
