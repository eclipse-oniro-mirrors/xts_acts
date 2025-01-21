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

export default function textMinFontSizeJsunit() {
  describe('textMinFontSizeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text state success " + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push text page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textMinFontSize after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextMinFontSize0001
     * @tc.desic         acetextMinFontSizeEtsTest0001
     */
    it('testtextMinFontSize0001', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testtextMinFontSize0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextMinFontSize0002
     * @tc.desic         acetextMinFontSizeEtsTest0002
     */
    it('testtextMinFontSize0002', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testtextMinFontSize0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextMinFontSize0003
     * @tc.desic         acetextMinFontSizeEtsTest0003
     */
    it('testtextMinFontSize0003', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("30.00px");
      console.info("[testtextMinFontSize0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });


    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextMinFontSize0004
     * @tc.desic         acetextMinFontSizeEtsTest0004
     */
    it('testtextMinFontSize0004', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testtextMinFontSize0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextMinFontSize0005
     * @tc.desic         acetextMinFontSizeEtsTest0005
     */
    it('testtextMinFontSize0005', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextMinFontSize0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextMinFontSize0006
     * @tc.desic         acetextMinFontSizeEtsTest0006
     */
    it('testtextMinFontSize0006', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextMinFontSize0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtextMinFontSize0007
     * @tc.desic         acetextMinFontSizeEtsTest0007
     */
    it('testtextMinFontSize0007', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testtextMinFontSize0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextMinFontSize0009
     * @tc.desic         acetextMinFontSizeEtsTest0009
     */
    it('testtextMinFontSize0009', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testtextMinFontSize0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextMinFontSize0010
     * @tc.desic         acetextMinFontSizeEtsTest0010
     */
    it('testtextMinFontSize0010', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testtextMinFontSize0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    it('testtextMinFontSize0011', 0, async function (done) {
      console.info('textMinFontSize testtextMinFontSize0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0011] component minFontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.minFontSize).assertEqual(undefined);
      console.info("[testtextMinFontSize0011] minFontSize value :" + obj.$attrs.minFontSize);
      done();
    });

    it('testtextCopyOptionText0001', 0, async function (done) {
      console.info('textMinFontSize testtextCopyOptionText0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('copyOptionText');
      console.info("[testtextCopyOptionText0001] component copyOption strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.copyOption).assertEqual(undefined);
      console.info("[testtextCopyOptionText0001] copyOption value :" + obj.$attrs.copyOption);
      done();
    });
  })
}
