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
import events_emitter from '@ohos.events.emitter';

export default function mediaQueryOffJsunit() {
  describe('mediaQueryOffTest', function () {

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
      console.info('[mediaQueryOffTest] before each called')

      let result;
      let options = {
        uri: 'MainAbility/pages/mediaQuery'
      }
      try {
        result = router.push(options)
        console.info("push mediaQuery page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push mediaQuery page error " + JSON.stringify(result));
      }
      await Utils.sleep(4000)
      done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
      console.info('[mediaQueryOffTest] after each called')
      await Utils.sleep(1000)
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testmediaQueryOff0001
     * @tc.desic         acemediaQueryOffEtsTest0001
     */
    it('testmediaQueryOff0001', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testmediaQueryOff0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testmediaQueryOff0002
     * @tc.desic         acemediaQueryOffEtsTest0002
     */
    it('testmediaQueryOff0002', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testmediaQueryOff0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testmediaQueryOff0003
     * @tc.desic         acemediaQueryOffEtsTest0003
     */
    it('testmediaQueryOff0003', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testmediaQueryOff0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testmediaQueryOff0004
     * @tc.desic         acemediaQueryOffEtsTest0004
     */
    it('testmediaQueryOff0004', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testmediaQueryOff0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testmediaQueryOff0005
     * @tc.desic         acemediaQueryOffEtsTest0005
     */
    it('testmediaQueryOff0005', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testmediaQueryOff0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testmediaQueryOff0006
     * @tc.desic         acemediaQueryOffEtsTest0006
     */
    it('testmediaQueryOff0006', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testmediaQueryOff0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testmediaQueryOff0007
     * @tc.desic         acemediaQueryOffEtsTest0007
     */
    it('testmediaQueryOff0007', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testmediaQueryOff0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testmediaQueryOff0009
     * @tc.desic         acemediaQueryOffEtsTest0009
     */
    it('testmediaQueryOff0009', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testmediaQueryOff0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testmediaQueryOff0010
     * @tc.desic         acemediaQueryOffEtsTest0010
     */
    it('testmediaQueryOff0010', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testmediaQueryOff0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testmediaQueryOff0011
     * @tc.desic         acemediaQueryOffEtsTest0011
     */
    it('testmediaQueryOff0011', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0011 START');
      await Utils.sleep(2000);
      try {
        var innerEventOne = {
          eventId: 60218,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('offText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0011 END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testmatchMediaSync0001
     * @tc.desic         acetestmatchMediaSyncEtsTest0001
     */
    it('testmatchMediaSync0001', 0, async function (done) {
      console.info('matchMediaSync testmatchMediaSync0001 START');
      await Utils.sleep(2000);
      try {
        var innerEventOne = {
          eventId: 60219,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("onRequestPopupData_0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('matchMediaSyncText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("onRequestPopupData_0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmatchMediaSync0001 END');
      done();
    });
  })
}
