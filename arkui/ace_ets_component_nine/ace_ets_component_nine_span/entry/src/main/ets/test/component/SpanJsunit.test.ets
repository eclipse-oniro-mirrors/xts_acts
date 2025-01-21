// @ts-nocheck
/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function SpanJsunit() {
  describe('spanTest', function () {
    beforeEach(async function (done) {
      console.info("span beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/spanPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get span state pages: " + JSON.stringify(pages));
        if (!("spanPage" == pages.name)) {
          console.info("get span pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push span page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push span page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("span after each called");
    })

   
    /**
     * @tc.number testSpanFontSize01
     * @tc.name   Test the fontSize property of the span component
     * @tc.desc   set the fontSize property value is 68/resources50
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanFontSize01', 0, async function (done) {
      var tagName = 'testSpanFontSize01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontSize).assertEqual("16.00fp");

      try {
        var eventData = {
          data: {
            "mFontSize": 68,
          }
        }
        var innerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontSize).assertEqual("68.00fp");

      try {
        var eventData2 = {
          data: {
            "mFontSize": 'resources50',
          }
        }
        var innerEvent2 = {
          eventId: 6802,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keykeyspan');
      let objNew2 = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// JSON.stringify(objNew));
      
      expect(objNew2.$attrs.fontSize).assertEqual("50.00vp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number testSpanfontFamily02
     * @tc.name   Test the fontFamily property of the span component
     * @tc.desc   set the fontFamily property value is Arial 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanfontFamily02', 0, async function (done) {
      var tagName = 'testSpanfontFamily02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontFamily).assertEqual("HarmonyOS Sans");

      try {
        var eventData = {
          data: {
            "mFontFamily": 'Arial',
          }
        }
        var innerEvent = {
          eventId: 6803,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontFamily).assertEqual("Arial");


      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
     /**
     * @tc.number testSpanlineHeight03
     * @tc.name   Test the lineHeight property of the span component
     * @tc.desc   set the lineHeight property value is 80fp/50 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanlineHeight03', 0, async function (done) {
      var tagName = 'testSpanlineHeight03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.lineHeight).assertEqual("0.00fp");

      try {
        var eventData = {
          data: {
            "mLineHeight": '80fp',
          }
        }
        var innerEvent = {
          eventId: 6804,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.lineHeight).assertEqual("80.00fp");

      try {
        var eventData2 = {
          data: {
            "mLineHeight": 50,
          }
        }
        var innerEvent2 = {
          eventId: 6805,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keykeyspan');
      let objNew2 = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// JSON.stringify(objNew));
      
      expect(objNew2.$attrs.lineHeight).assertEqual("50.00fp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number testSpanfontStyle04
     * @tc.name   Test the fontStyle property of the span component
     * @tc.desc   set the fontStyle property value is FontStyle.Normal/FontStyle.Italic
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanfontStyle04', 0, async function (done) {
      var tagName = 'testSpanfontStyle04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Normal");

      try {
        var eventData = {
          data: {
            "mFontStyle": FontStyle.Italic,
          }
        }
        var innerEvent = {
          eventId: 6806,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Italic");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testSpanfontWeight05
     * @tc.name   Test the fontWeight property of the span component
     * @tc.desc   set the fontWeight property value is 400/FontWeight.Bold
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanfontWeight05', 0, async function (done) {
      var tagName = 'testSpanfontWeight05';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontWeight).assertEqual("400");

      try {
        var eventData = {
          data: {
            "mFontWeight": FontWeight.Bold,
          }
        }
        var innerEvent = {
          eventId: 6807,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontWeight).assertEqual("FontWeight.Bold");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number testSpantextCase06
     * @tc.name   Test the textCase property of the span component
     * @tc.desc   set the textCase property value is TextCase.Normal/TextCase.UpperCase
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpantextCase06', 0, async function (done) {
      var tagName = 'testSpantextCase06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.textCase).assertEqual("TextCase.Normal");

      try {
        var eventData = {
          data: {
            "mTextCase": TextCase.UpperCase,
          }
        }
        var innerEvent = {
          eventId: 6808,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.textCase).assertEqual("TextCase.UpperCase");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testSpandecoration07
     * @tc.name   Test the decoration property of the span component
     * @tc.desc   set the decoration property value is TextDecorationType.Underline Color.Red
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpandecoration07', 0, async function (done) {
      var tagName = 'testSpandecoration07';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      try {
        var eventData = {
          data: {
            "mDecorationType": TextDecorationType.Underline,
            "mDecorationColor" : Color.Red
          }
        }
        var innerEvent = {
          eventId: 6809,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testSpanfontColor08
     * @tc.name   Test the fontColor property of the span component
     * @tc.desc   set the fontColor property value is #FF000000/0xFF00FF
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanfontColor08', 0, async function (done) {
      var tagName = 'testSpanfontColor08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontColor).assertEqual("#FF000000");

      try {
        var eventData = {
          data: {
            "mFontColor": 0xFF00FF
          }
        }
        var innerEvent = {
          eventId: 6810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontColor).assertEqual("#FFFF00FF");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testSpanletterSpacing09
     * @tc.name   Test the letterSpacing property of the span component
     * @tc.desc   set the letterSpacing property value is 0.00fp/5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanletterSpacing09', 0, async function (done) {
      var tagName = 'testSpanletterSpacing09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.letterSpacing).assertEqual("0.00fp");

      try {
        var eventData = {
          data: {
            "mLetterSpacing": 5
          }
        }
        var innerEvent = {
          eventId: 6811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.letterSpacing).assertEqual("5.00fp");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.number testSpanFont10
     * @tc.name   Test the font property of the span component
     * @tc.desc   set the font property value is obj
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testSpanFont10', 0, async function (done) {
      var tagName = 'testSpanFont10';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan2');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.font).assertEqual('{"style":"FontStyle.Normal","size":"16.00fp","weight":"400","family":"HarmonyOS Sans"}');

      try {
        var eventData = {
          data: {
            "numFont": 3
          }
        }
        var innerEvent = {
          eventId: 6812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keykeyspan2');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      let objNew = JSON.parse(strJsonNew);
      
      
      expect(objNew.$attrs.font).assertEqual('{"style":"FontStyle.Italic","size":"50.00vp","weight":"FontWeight.Bold","family":"Arial"}');

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
