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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function spanTest() {
  describe('spanTest', () => {
    beforeEach(async (done: Function) => {
      console.info("span beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/spanPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get span state pages: " + JSON.stringify(pages));
        if (!("spanPage" == pages.name)) {
          console.info("get span pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push span page result success");
        }
      } catch (err) {
        console.error("push span page error: " + err);
      }
      done()
    });
    let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_font_size').id);
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("span after each called");
    })

   
    /**
     * @tc.name   testSpanFontSize01
     * @tc.number testSpanFontSize01
     * @tc.desc   set the fontSize property value is 68/resources50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanFontSize01',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanFontSize01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontSize).assertEqual("16.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontSize": 68,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontSize).assertEqual("68.00fp");

      try {
        let eventData2: events_emitter.EventData = {
          data: {
            "mFontSize": 'resources50',
          }
        }
        let innerEvent2: events_emitter.InnerEvent = {
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
      let objNew2: ESObject = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// JSON.stringify(objNew));
      
      expect(objNew2.$attrs.fontSize).assertEqual("50.00vp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSpanfontFamily02
     * @tc.number testSpanfontFamily02
     * @tc.desc   set the fontFamily property value is Arial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanfontFamily02',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanfontFamily02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontFamily).assertEqual("HarmonyOS Sans");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontFamily": 'Arial',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontFamily).assertEqual("Arial");


      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSpanlineHeight03
     * @tc.number testSpanlineHeight03
     * @tc.desc   set the lineHeight property value is 80fp/50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanlineHeight03',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanlineHeight03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.lineHeight).assertEqual("0.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mLineHeight": '80fp',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.lineHeight).assertEqual("80.00fp");

      try {
        let eventData2: events_emitter.EventData = {
          data: {
            "mLineHeight": 50,
          }
        }
        let innerEvent2: events_emitter.InnerEvent = {
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
      let objNew2: ESObject = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// JSON.stringify(objNew));
      
      expect(objNew2.$attrs.lineHeight).assertEqual("50.00fp");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSpanfontStyle04
     * @tc.number testSpanfontStyle04
     * @tc.desc   set the fontStyle property value is FontStyle.Normal/FontStyle.Italic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanfontStyle04',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanfontStyle04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Normal");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontStyle": FontStyle.Italic,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Italic");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSpanfontWeight05
     * @tc.number testSpanfontWeight05
     * @tc.desc   set the fontWeight property value is 400/FontWeight.Bold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanfontWeight05',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanfontWeight05';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontWeight).assertEqual("400");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontWeight": FontWeight.Bold,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontWeight).assertEqual("FontWeight.Bold");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSpantextCase06
     * @tc.number testSpantextCase06
     * @tc.desc   set the textCase property value is TextCase.Normal/TextCase.UpperCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpantextCase06',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpantextCase06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.textCase).assertEqual("TextCase.Normal");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mTextCase": TextCase.UpperCase,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.textCase).assertEqual("TextCase.UpperCase");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSpandecoration07
     * @tc.number testSpandecoration07
     * @tc.desc   set the decoration property value is TextDecorationType.Underline Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpandecoration07',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpandecoration07';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mDecorationType": TextDecorationType.Underline,
            "mDecorationColor" : Color.Red
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSpanfontColor08
     * @tc.number testSpanfontColor08
     * @tc.desc   set the fontColor property value is #FF000000/0xFF00FF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanfontColor08',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanfontColor08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontColor).assertEqual("#FF000000");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mFontColor": 0xFF00FF
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.fontColor).assertEqual("#FFFF00FF");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   testSpanletterSpacing09
     * @tc.number testSpanletterSpacing09
     * @tc.desc   set the letterSpacing property value is 0.00fp/5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanletterSpacing09',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanletterSpacing09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.letterSpacing).assertEqual("0.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mLetterSpacing": 5
          }
        }
        let innerEvent : events_emitter.InnerEvent= {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      expect(objNew.$attrs.letterSpacing).assertEqual("5.00fp");

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
    /**
     * @tc.name   testSpanFont10
     * @tc.number testSpanFont10
     * @tc.desc   set the font property value is obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpanFont10',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'testSpanFont10';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyspan2');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Span');
      expect(JSON.parse(obj.$attrs.font).style).assertEqual("FontStyle.Normal");
      expect(JSON.parse(obj.$attrs.font).size).assertEqual(px2fp(resourceSize)+'.00fp');
      expect(JSON.parse(obj.$attrs.font).weight).assertEqual("FontWeight.Normal");
      expect(JSON.parse(obj.$attrs.font).family).assertEqual("HarmonyOS Sans");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "numFont": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
      let objNew: ESObject = JSON.parse(strJsonNew);
      
      
      expect(objNew.$attrs.font).assertEqual('{"style":"FontStyle.Italic","size":"50.00vp","weight":"FontWeight.Bold","family":"Arial"}');

      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
