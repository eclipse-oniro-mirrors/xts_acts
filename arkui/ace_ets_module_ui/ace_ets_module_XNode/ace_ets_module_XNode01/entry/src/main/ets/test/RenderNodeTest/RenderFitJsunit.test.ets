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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function RenderFitJsunit() {
  describe('RenderFitJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderFitJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/RenderFit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderFitJsunit state pages: " + JSON.stringify(pages));
        if (!("RenderFit" == pages.name)) {
          console.info("get RenderFitJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RenderFitJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderFitJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0100
     * @tc.number RenderFitJsunit_0100
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0100', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0100] START');
      let strJson = getInspectorByKey('LEFT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0100] LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.LEFT');
      console.info('[RenderFitJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0200
     * @tc.number RenderFitJsunit_0200
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0200', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0200] START');
      let strJson = getInspectorByKey('RIGHT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0200] RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RIGHT');
      console.info('[RenderFitJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0300
     * @tc.number RenderFitJsunit_0300
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0300', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0300] START');
      let strJson = getInspectorByKey('TOP_LEFT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0300] TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.TOP_LEFT');
      console.info('[RenderFitJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0400
     * @tc.number RenderFitJsunit_0400
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0400', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0400] START');
      let strJson = getInspectorByKey('TOP_RIGHT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0400] TOP_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.TOP_RIGHT');
      console.info('[RenderFitJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0500
     * @tc.number RenderFitJsunit_0500
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0500', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0500] START');
      let strJson = getInspectorByKey('BOTTOM_LEFT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0500] BOTTOM_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.BOTTOM_LEFT');
      console.info('[RenderFitJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0600
     * @tc.number RenderFitJsunit_0600
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0600', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0600] START');
      let strJson = getInspectorByKey('BOTTOM_RIGHT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0600] BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_0600] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0700
     * @tc.number RenderFitJsunit_0700
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0700', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0700] START');
      let strJson = getInspectorByKey('RESIZE_FILL');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0700] RESIZE_FILL: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_FILL');
      console.info('[RenderFitJsunit_0700] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0800
     * @tc.number RenderFitJsunit_0800
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0800', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0800] START');
      let strJson = getInspectorByKey('RESIZE_CONTAIN');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0800] RESIZE_CONTAIN: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_CONTAIN');
      console.info('[RenderFitJsunit_0800] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_0900
     * @tc.number RenderFitJsunit_0900
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_0900', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_0900] START');
      let strJson = getInspectorByKey('RESIZE_CONTAIN_TOP_LEFT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_0900] RESIZE_CONTAIN_TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_CONTAIN_TOP_LEFT');
      console.info('[RenderFitJsunit_0900] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_1000
     * @tc.number RenderFitJsunit_1000
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_1000', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_1000] START');
      let strJson = getInspectorByKey('RESIZE_CONTAIN_BOTTOM_RIGHT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_1000] RESIZE_CONTAIN_BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_CONTAIN_BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_1000] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_1100
     * @tc.number RenderFitJsunit_1100
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_1100', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_1100] START');
      let strJson = getInspectorByKey('RESIZE_COVER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_1100] RESIZE_COVER: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_COVER');
      console.info('[RenderFitJsunit_1100] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_1200
     * @tc.number RenderFitJsunit_1200
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_1200', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_1200] START');
      let strJson = getInspectorByKey('RESIZE_COVER_TOP_LEFT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_1200] RESIZE_COVER_TOP_LEFT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_COVER_TOP_LEFT');
      console.info('[RenderFitJsunit_1200] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_1300
     * @tc.number RenderFitJsunit_1300
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_1300', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_1300] START');
      let strJson = getInspectorByKey('RESIZE_COVER_BOTTOM_RIGHT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_1300] RESIZE_COVER_BOTTOM_RIGHT: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.RESIZE_COVER_BOTTOM_RIGHT');
      console.info('[RenderFitJsunit_1300] END');
      done();
    });

    /**
     * @tc.name   RenderFitJsunit_1400
     * @tc.number RenderFitJsunit_1400
     * @tc.desc   Confirm if there is a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RenderFitJsunit_1400', Level.LEVEL2, async (done: Function) => {
      // Get the information of the RenderFit
      console.info('[RenderFitJsunit_1400] START');
      let strJson = getInspectorByKey('RenderFit_TOP');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RenderFitJsunit_1400] TOP: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.renderFit).assertEqual('RenderFit.TOP');
      console.info('[RenderFitJsunit_1400] END');
      done();
    });
  })
}
