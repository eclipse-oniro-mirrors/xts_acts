/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
export default function stageMediaquery() {
  describe('stageMediaquery', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/stageMediaquery',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageMediaquery state success " + JSON.stringify(pages));
        if (!("stageMediaquery" == pages.name)) {
          console.info("get stageMediaquery state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push stageMediaquery page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageMediaquery page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('testmediaQueryOff0001', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0001 START');
       let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testmediaQueryOff0001] width value :" + obj.$attrs.width);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0002', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0002 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testmediaQueryOff0002] height value :" + obj.$attrs.height);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0003', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0003 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testmediaQueryOff0003] fontSize value :" + obj.$attrs.fontSize);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0004', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0004 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testmediaQueryOff0004] opacity value :" + obj.$attrs.opacity);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0005', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0005 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testmediaQueryOff0005] align value :" + obj.$attrs.align);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0006', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0006 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testmediaQueryOff0006] fontColor value :" + obj.$attrs.fontColor);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0007', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0007 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testmediaQueryOff0007] lineHeight value :" + obj.$attrs.lineHeight);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0009', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff009 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testmediaQueryOff0009] padding value :" + obj.$attrs.padding);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0010', 0, async function (done) {
      setTimeout(()=>{
        try{
      console.info('mediaQueryOff testmediaQueryOff0010 START');
      let strJson = getInspectorByKey('offText');
      console.info("[testmediaQueryOff0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testmediaQueryOff0010] textAlign value :" + obj.$attrs.textAlign);
        } catch(err) {
        }
      done();
      },500)
    });
    it('testmediaQueryOff0011', 0, async function (done) {
      console.info('mediaQueryOff testmediaQueryOff0011 START');
      try {
        var innerEventOne = {
          eventId: 60218,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("testmediaQueryOff0011 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("testmediaQueryOff0011 click result is: " + JSON.stringify(sendEventByKey('offText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0011 END');
      done();
    });
    it('testmediaQueryOff0012', 0, async function (done) {
      console.info('matchMediaSync testmediaQueryOff0012 START');
      try {
        var innerEventOne = {
          eventId: 60219,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("testmediaQueryOff0012 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
        }
        console.info("testmediaQueryOff0012 click result is: " + JSON.stringify(sendEventByKey('matchMediaSyncText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testmediaQueryOff0012 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testmediaQueryOff0012 END');
      done();
    });

    it('testmediaQueryOff0013', 0, async function (done) {
      let mediaQuery = globalThis.uiContent.getMediaQuery();
      console.info('testmediaQueryOff0013 START');
      let result;
      try {
        result = mediaQuery.matchMediaSync('(orientation: landscape)')
        expect(typeof(result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testmediaQueryOff0013 END');
      done();
    });

    it('testRunScopedTask0010', 0, async function (done) {
      let uiContent = globalThis.uiContent
      console.info('testRunScopedTask0010 START');
      let result;
      try {
        result = uiContent.runScopedTask(()=>{
          console.info("success")
        });
        expect(result).assertUndefined();
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testRunScopedTask0010 END');
      done();
    });
  })
}