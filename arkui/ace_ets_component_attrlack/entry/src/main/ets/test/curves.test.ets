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

export default function curvesEaseOutJsunit() {
  describe('curvesEaseOutTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/curves',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get curves state success " + JSON.stringify(pages));
        if (!("curves" == pages.name)) {
          console.info("get curves state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push curves page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curves page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("curvesEaseOut after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testeaseOutText0001
    * @tc.desic         aceeaseOutTextEtsTest0001
    */
    it('testeaseOutText0001', 0, async function (done){
      console.info('easeOutText testeaseOutText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('EaseOutText')
      console.info("[testeaseOutText0001] component EaseOutText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testeaseOutText0001] width value :" + obj.$attrs.width);
      console.info("[testeaseOutText0001] height value :" + obj.$attrs.height);
      console.info("[testeaseOutText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testeaseInOutText0001
    * @tc.desic         aceeaseInOutTextEtsTest0001
    */
    it('testeaseInOutText0001', 0, async function (done){
      console.info('easeInOutText testeaseInOutText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('EaseInOutText')
      console.info("[testeaseInOutText0001] component EaseInOutText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testeaseInOutText0001] width value :" + obj.$attrs.width);
      console.info("[testeaseInOutText0001] height value :" + obj.$attrs.height);
      console.info("[testeaseInOutText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
      console.info("[testeaseInOutText0001] animation value :" + obj.$attrs.animation);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testfastOutSlowInText0001
    * @tc.desic         acefastOutSlowInTextEtsTest0001
    */
    it('testfastOutSlowInText0001', 0, async function (done){
      console.info('fastOutSlowInText testfastOutSlowInText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('FastOutSlowInText')
      console.info("[testfastOutSlowInText0001] component fastOutSlowInText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testfastOutSlowInText0001] width value :" + obj.$attrs.width);
      console.info("[testfastOutSlowInText0001] height value :" + obj.$attrs.height);
      console.info("[testfastOutSlowInText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
      console.info("[testfastOutSlowInText0001] animation value :" + obj.$attrs.animation);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testlinearOutSlowInText0001
    * @tc.desic         acelinearOutSlowInTextEtsTest0001
    */
    it('testlinearOutSlowInText0001', 0, async function (done){
      console.info('linearOutSlowInText testlinearOutSlowInText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('LinearOutSlowInText')
      console.info("[testlinearOutSlowInText0001] component linearOutSlowInText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testlinearOutSlowInText0001] width value :" + obj.$attrs.width);
      console.info("[testlinearOutSlowInText0001] height value :" + obj.$attrs.height);
      console.info("[testlinearOutSlowInText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
      console.info("[testlinearOutSlowInText0001] animation value :" + obj.$attrs.animation);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testfastOutLinearInText0001
    * @tc.desic         acefastOutLinearInTextEtsTest0001
    */
    it('testfastOutLinearInText0001', 0, async function (done){
      console.info('fastOutLinearInText testfastOutLinearInText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fastOutLinearInText')
      console.info("[testfastOutLinearInText0001] component fastOutLinearInText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testfastOutLinearInText0001] width value :" + obj.$attrs.width);
      console.info("[testfastOutLinearInText0001] height value :" + obj.$attrs.height);
      console.info("[testfastOutLinearInText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testextremeDecelerationText0001
    * @tc.desic         aceextremeDecelerationTextEtsTest0001
    */
    it('testextremeDecelerationText0001', 0, async function (done){
      console.info('extremeDecelerationText testextremeDecelerationText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ExtremeDecelerationText')
      console.info("[testextremeDecelerationText0001] component extremeDecelerationText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testextremeDecelerationText0001] width value :" + obj.$attrs.width);
      console.info("[testextremeDecelerationText0001] height value :" + obj.$attrs.height);
      console.info("[testextremeDecelerationText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
      console.info("[testextremeDecelerationText0001] animation value :" + obj.$attrs.animation);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testsharpText0001
    * @tc.desic         acesharpTextEtsTest0001
    */
    it('testsharpText0001', 0, async function (done){
      console.info('sharpText testsharpText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('SharpText')
      console.info("[testSharpText0001] component sharpText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testsharpText0001] width value :" + obj.$attrs.width);
      console.info("[testsharpText0001] height value :" + obj.$attrs.height);
      console.info("[testsharpText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testrhythmText0001
    * @tc.desic         acerhythmTextEtsTest0001
    */
    it('testrhythmText0001', 0, async function (done){
      console.info('rhythmText testrhythmText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('RhythmText');
      console.info("[testrhythmText0001] component rhythmText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testrhythmText0001] width value :" + obj.$attrs.width);
      console.info("[testrhythmText0001] height value :" + obj.$attrs.height);
      console.info("[testrhythmText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testsmoothText0001
    * @tc.desic         acesmoothTextEtsTest0001
    */
    it('testsmoothText0001', 0, async function (done){
      console.info('smoothText testsmoothText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('SmoothText');
      console.info("[testsmoothText0001] component smoothText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testsmoothText0001] width value :" + obj.$attrs.width);
      console.info("[testsmoothText0001] height value :" + obj.$attrs.height);
      console.info("[testsmoothText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         testfrictionText0001
    * @tc.desic         acefrictionTextEtsTest0001
    */
    it('testfrictionText0001', 0, async function (done){
      console.info('frictionText testfrictionText0001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('FrictionText');
      console.info("[testfrictionText0001] component frictionText strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.width).assertEqual("400.00vp");
      expect(obj.$attrs.height).assertEqual("200.00vp");
      expect(obj.$attrs.backgroundColor).assertEqual("#FF317AFF");
      expect(obj.$attrs.animation).assertEqual(undefined);
      console.info("[testfrictionText0001] width value :" + obj.$attrs.width);
      console.info("[testfrictionText0001] height value :" + obj.$attrs.height);
      console.info("[testfrictionText0001] backgroundColor value :" + obj.$attrs.backgroundColor);
    });
  })
}
