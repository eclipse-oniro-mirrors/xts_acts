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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function tabsBarPositionJsunit() {
  describe('tabsBarPositionTest2', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/tabs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabs state success " + JSON.stringify(pages));
        if (!("tabs" == pages.name)) {
          console.info("get tabs state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabs page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("tabsBarPosition after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtabsBarPosition0001
     * @tc.desic         acetabsBarPositionEtsTest0001
     */
    it('testtabsBarPosition0001', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testtabsBarPosition0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtabsBarPosition0002
     * @tc.desic         acetabsBarPositionEtsTest0002
     */
    it('testtabsBarPosition0002', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testtabsBarPosition0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtabsBarPosition0003
     * @tc.desic         acetabsBarPositionEtsTest0003
     */
    it('testtabsBarPosition0003', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtabsBarPosition0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtabsBarPosition0004
     * @tc.desic         acetabsBarPositionEtsTest0004
     */
    it('testtabsBarPosition0004', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testtabsBarPosition0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtabsBarPosition0005
     * @tc.desic         acetabsBarPositionEtsTest0005
     */
    it('testtabsBarPosition0005', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtabsBarPosition0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtabsBarPosition0006
     * @tc.desic         acetabsBarPositionEtsTest0006
     */
    it('testtabsBarPosition0006', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtabsBarPosition0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtabsBarPosition0007
     * @tc.desic         acetabsBarPositionEtsTest0007
     */
    it('testtabsBarPosition0007', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testtabsBarPosition0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtabsBarPosition0009
     * @tc.desic         acetabsBarPositionEtsTest0009
     */
    it('testtabsBarPosition0009', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testtabsBarPosition0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtabsBarPosition0010
     * @tc.desic         acetabsBarPositionEtsTest0010
     */
    it('testtabsBarPosition0010', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtabsBarPosition0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testtabsBarPosition0011
     * @tc.desic         acetabsBarPositionEtsTest0011
     */
    it('testtabsBarPosition0011', 0, async function (done) {
      console.info('tabsBarPosition testtabsBarPosition0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionTabs');
      console.info("[testtabsBarPosition0011] component barPosition strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      console.info("[testtabsBarPosition0011] barPosition value :" + obj.$attrs.barPosition);
      done();
    });
  })
}
