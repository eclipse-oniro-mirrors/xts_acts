/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

interface ValueType { 
  type?:TextDecorationType,
  color?:ResourceColor
}
export default function textTextDecorationTest() {
  describe('textTextDecorationTest', ()=> {
    beforeEach(async (done: Function)=> {
      console.info("TextDecoration beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/text/textDecoration',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDecoration state pages: " + JSON.stringify(pages));
        if (!("TextShadow" == pages.name)) {
          console.info("get TextDecoration pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextDecoration page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDecoration page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("TextDecoration beforeEach end");
      done()
    });

    afterEach(async  ()=> {
      await Utils.sleep(1000);
      console.info("TextDecoration after each called");
    })

    /**
     * @tc.number textTextDecoration0100
     * @tc.name   Test the decoration property of the text component
     * @tc.desc   Do not set decoration property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextDecoration0100', Level.LEVEL0, async (done: Function) => {
      let tagName = 'textTextDecoration0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let value:ValueType = { type: undefined, color: undefined };

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textDecoration": JSON.stringify( value )
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 610,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textDecoration');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$attrs.decoration)
      .assertEqual('{"type":"TextDecorationType.None","color":"#FF000000","style":"TextDecorationStyle.SOLID"}'); 
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textTextDecoration0200
     * @tc.name   Test the decoration property of the text component
     * @tc.desc   set decoration property type  TextDecorationType to TextDecorationType.Underline, color to Color.Black
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextDecoration0200', Level.LEVEL0, async (done: Function) => {
      let tagName = 'textTextDecoration0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let value:ValueType = { type: TextDecorationType.Underline, color: Color.Black };

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textDecoration": JSON.stringify( value )
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 611,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textDecoration');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$attrs.decoration)
      .assertEqual('{"type":"TextDecorationType.Underline","color":"#FF000000","style":"TextDecorationStyle.SOLID"}'); 
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 

    /**
     * @tc.number textTextDecoration0300
     * @tc.name   Test the decoration property of the text component
     * @tc.desc   set decoration property type  TextDecorationType to TextDecorationType.Overline, color to Color.Red
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextDecoration0300', Level.LEVEL0, async (done: Function) => {
      let tagName = 'textTextDecoration0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
      let value:ValueType = { type: TextDecorationType.Overline, color: Color.Red };

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textDecoration": JSON.stringify( value )
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 612,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textDecoration');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$attrs.decoration)
      .assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}'); 
 
       
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 

     /**
     * @tc.number textTextDecoration0400
     * @tc.name   Test the decoration property of the text component
     * @tc.desc   set decoration property type  TextDecorationType to TextDecorationType.Overline, color to Color.Blue
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTextDecoration0400', Level.LEVEL0, async (done: Function) => {
      let tagName = 'textTextDecoration0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
  
      let value:ValueType = { type: TextDecorationType.None, color: Color.Blue };

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textDecoration": JSON.stringify( value )
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 613,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textDecoration');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$attrs.decoration)
      .assertEqual('{"type":"TextDecorationType.None","color":"#FF0000FF","style":"TextDecorationStyle.SOLID"}'); 
  
        
      console.info('[' + tagName + '] END ===========================');
      done();
    }); 

     /**
     * @tc.number textTextDecoration0500
     * @tc.name   Test the decoration property of the text component
     * @tc.desc   set decoration property type  TextDecorationType to TextDecorationType.Overline, 
     *                   color to  $r('app.color.color_D90013_red') 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
     it('textTextDecoration0500', Level.LEVEL0, async (done: Function) => {
      let tagName = 'textTextDecoration0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
  
      //let value = { radius: undefined }
      let value:ValueType = { type: TextDecorationType.None, color: $r('app.color.color_D90013_red') };

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textDecoration": JSON.stringify( value )
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 613,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_text_textDecoration');
      let obj:ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$attrs.decoration)
      .assertEqual('{"type":"TextDecorationType.None","color":"#FFD90013","style":"TextDecorationStyle.SOLID"}'); 
  
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
