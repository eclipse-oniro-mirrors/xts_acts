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

export default function textAreaOnCutJsunit() {
  describe('textAreaOnCutTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/textArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textArea page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textAreaOnCut after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testtextAreaOnCut0001
     * @tc.desic         acetextAreaOnCutEtsTest0001
     */
    it('testtextAreaOnCut0001', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testtextAreaOnCut0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testtextAreaOnCut0002
     * @tc.desic         acetextAreaOnCutEtsTest0002
     */
    it('testtextAreaOnCut0002', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testtextAreaOnCut0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testtextAreaOnCut0003
     * @tc.desic         acetextAreaOnCutEtsTest0003
     */
    it('testtextAreaOnCut0003', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtextAreaOnCut0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testtextAreaOnCut0004
     * @tc.desic         acetextAreaOnCutEtsTest0004
     */
    it('testtextAreaOnCut0004', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testtextAreaOnCut0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testtextAreaOnCut0005
     * @tc.desic         acetextAreaOnCutEtsTest0005
     */
    it('testtextAreaOnCut0005', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtextAreaOnCut0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testtextAreaOnCut0006
     * @tc.desic         acetextAreaOnCutEtsTest0006
     */
    it('testtextAreaOnCut0006', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtextAreaOnCut0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testtextAreaOnCut0007
     * @tc.desic         acetextAreaOnCutEtsTest0007
     */
    it('testtextAreaOnCut0007', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.lineHeight).assertEqual(undefined);
      console.info("[testtextAreaOnCut0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testtextAreaOnCut0009
     * @tc.desic         acetextAreaOnCutEtsTest0009
     */
    it('testtextAreaOnCut0009', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.padding).assertEqual("0.00px");
      console.info("[testtextAreaOnCut0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testtextAreaOnCut0010
     * @tc.desic         acetextAreaOnCutEtsTest0010
     */
    it('testtextAreaOnCut0010', 0, async function (done) {
      console.info('textAreaOnCut testtextAreaOnCut0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testtextAreaOnCut0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testtextAreaOnCut0011
     * @tc.desic         acetextAreaOnCutEtsTest0011
     */
    it('testtextAreaCopyOption0011', 0, async function (done) {
      console.info('textAreaCopyOption testtextAreaCopyOption0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textAreaCopyOptionText');
      console.info("[testtextAreaCopyOption0011] component copyOption strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.copyOption).assertEqual(undefined);
      console.info("[testtextAreaCopyOption0011] copyOption value :" + obj.$attrs.copyOption);
      done();
    });


  })
}
