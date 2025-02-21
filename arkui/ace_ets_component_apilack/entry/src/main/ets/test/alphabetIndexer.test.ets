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
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function alphabetIndexerOnSelectJsunit() {
  describe('alphabetIndexerOnSelectTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/alphabetIndexer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push alphabetIndexer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("alphabetIndexerOnSelect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testalphabetIndexer0001
     * @tc.desic         acealphabetIndexerEtsTest0001
     */
    it('testalphabetIndexerWidth0001', 0, async function (done) {
      console.info('alphabetIndexerWidth testalphabetIndexerWidth0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerWidth0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testalphabetIndexerWidth0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testalphabetIndexer0002
     * @tc.desic         acealphabetIndexerEtsTest0002
     */
    it('testalphabetIndexerHeight0002', 0, async function (done) {
      console.info('alphabetIndexerHeight testalphabetIndexerHeight0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerHeight0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.height).assertEqual("300.00vp");
      console.info("[testalphabetIndexerHeight0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testalphabetIndexer0003
     * @tc.desic         acealphabetIndexerEtsTest0003
     */
    it('testalphabetIndexerColor0003', 0, async function (done) {
      console.info('alphabetIndexerColor testalphabetIndexerColor0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerColor0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.color).assertEqual('#FFFF0000');
      console.info("[testalphabetIndexerColor0003] color value :" + obj.$attrs.color);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testalphabetIndexer0004
     * @tc.desic         acealphabetIndexerEtsTest0004
     */
    it('testalphabetIndexerSelectedColor0004', 0, async function (done) {
      console.info('alphabetIndexerSelectedColor testalphabetIndexerSelectedColor0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerOnSelect0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.selectedColor).assertEqual("#FFFFFFFF");
      console.info("[testalphabetIndexerSelectedColor0004] selectedColor value :" + obj.$attrs.selectedColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testalphabetIndexer0005
     * @tc.desic         acealphabetIndexerEtsTest0005
     */
    it('testalphabetIndexerPopupColor0005', 0, async function (done) {
      console.info('alphabetIndexerPopupColor testalphabetIndexerPopupColor0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupColor0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.popupColor).assertEqual("#FF48D1CC");
      console.info("[testalphabetIndexerPopupColor0005] popupColor value :" + obj.$attrs.popupColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testalphabetIndexer0006
     * @tc.desic         acealphabetIndexerEtsTest0006
     */
    it('testalphabetIndexerSelectedBackgroundColor0006', 0, async function (done) {
      console.info('alphabetIndexerSelectedBackgroundColor testalphabetIndexerSelectedBackgroundColor0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerSelectedBackgroundColor0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.selectedBackgroundColor).assertEqual("#FF0000E6");
      console.info("[testalphabetIndexerSelectedBackgroundColor0006] selectedBackgroundColor value :" + obj.$attrs.selectedBackgroundColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testalphabetIndexer0007
     * @tc.desic         acealphabetIndexerEtsTest0007
     */
    it('testalphabetIndexerPopupBackground0007', 0, async function (done) {
      console.info('alphabetIndexerPopupBackground testalphabetIndexerPopupBackground0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupBackground0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.popupBackground).assertEqual("#E500DDDD");
      console.info("[testalphabetIndexerPopupBackground0007] popupBackground value :" + obj.$attrs.popupBackground);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testalphabetIndexer0009
     * @tc.desic         acealphabetIndexerEtsTest0009
     */
    it('testalphabetIndexerUsingPopup0009', 0, async function (done) {
      console.info('alphabetIndexerUsingPopup testalphabetIndexerUsingPopup009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerUsingPopup0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.usingPopup).assertEqual(true);
      console.info("[testalphabetIndexerUsingPopup0009] usingPopup value :" + obj.$attrs.usingPopup);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testalphabetIndexer0010
     * @tc.desic         acealphabetIndexerEtsTest0010
     */
    it('testalphabetIndexerItemSize0010', 0, async function (done) {
      console.info('alphabetIndexerItemSize testalphabetIndexerItemSize0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerItemSize0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.itemSize).assertEqual("28.000000");
      console.info("[testalphabetIndexerItemSize0010] itemSize value :" + obj.$attrs.itemSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testalphabetIndexer0011
     * @tc.desic         acealphabetIndexerEtsTest0011
     */
    it('testalphabetIndexerAlignStyle0011', 0, async function (done) {
      console.info('alphabetIndexerAlignStyle testalphabetIndexerAlignStyle0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerAlignStyle0011] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('AlphabetIndexer');
      expect(obj.$attrs.alignStyle).assertEqual("AlignStyle.Left");
      console.info("[testalphabetIndexerItemSize0010] alignStyle value :" + obj.$attrs.alignStyle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testalphabetIndexerOnSelect0012
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0012
     */
    it('testalphabetIndexerOnSelect0012', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0011 START');
      await Utils.sleep(2000);
      try{
        let callback = (indexEvent) => {
          console.info("onSelect_0012 get state result is: " + JSON.stringify(indexEvent));
          expect(indexEvent.data.STATUS).assertEqual(true);
        }
        let indexEvent = {
          eventId: 60201,
          priority: events_emitter.EventPriority.LOW
        }
        sendEventByKey('alphabetIndexer', 10, "")
        events_emitter.on(indexEvent, callback);
      }catch(err){
        console.info("onSelect_0012 on events_emitter err : " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      try {
        var innerEventOne = {
          eventId: 60202,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('alphabetIndexer', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testalphabetIndexerOnSelect0012 END');
      done();

    });
  })
}
