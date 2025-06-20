/*
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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitScrollToOne";
export default function webViewSrollToJsunit() {
  describe('ActsAceWebViewScrollToTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewSrollToJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollTo" == pages.name)) {
          console.info("get webViewScrollTo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewScrollTo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollTo page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewScrollTo beforeEach start");
      done();
    })
    afterEach(async  (done: Function) => {
      console.info("webViewScrollTo afterEach start:"+emitKey);
      try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent: events_emitter.InnerEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0100
     * tc.name testScrollToOne
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
    it('testScrollToOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToTwo";
      Utils.registerEvent("testScrollToOne","[0,0]",214,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0200
     * tc.name testScrollToTwo
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is greater than the page height
    */
    it('testScrollToTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToThree";
      Utils.registerEvent("testScrollToTwo",true,216,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0300
     * tc.name testScrollToThree
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is less than the page height
    */
    it('testScrollToThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToFour";
      Utils.registerEvent("testScrollToThree","[0,200]",218,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0400
     * tc.name testScrollToFour
     * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * positive, which is less than the page length
    */
    it('testScrollToFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToFive";
      Utils.registerEvent("testScrollToFour","[200,0]",220,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0500
      * tc.name testScrollToFive
      * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
      * positive, which is greater than the page length
   */
    it('testScrollToFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToSix";
      Utils.registerEvent("testScrollToFive",true,222,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0600
     * tc.name testScrollToSix
     * tc.desc When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * is a positive number, both of which are less than the page height
   */
    it('testScrollToSix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToSeven";
      Utils.registerEvent("testScrollToSix","[200,200]",224,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0700
      * tc.name testScrollToSeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollToSeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollToEight";
      Utils.registerEvent("testScrollToSeven",true,226,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
     /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0800
     * tc.name testScrollToEight
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
   it('testScrollToEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
     emitKey="emitScrollToNine";
     Utils.registerEvent("testScrollToEight",true,228726,done);
     sendEventByKey('webcomponentScrolTo',10,'');
   })
   /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_0900
     * tc.name testScrollToNine
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
   it('testScrollToNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
    emitKey="emitScrollToTen";
    Utils.registerEvent("testScrollToNine",true,230726,done);
    sendEventByKey('webcomponentScrolTo',10,'');
  })
  /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_1000
     * tc.name testScrollToTen
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
  it('testScrollToTen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
    emitKey="emitScrollToEleven";
    Utils.registerEvent("testScrollToTen",true,232726,done);
    sendEventByKey('webcomponentScrolTo',10,'');
  })
  /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLTO_1100
     * tc.name testScrollToEleven
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
  it('testScrollToEleven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
    emitKey="emitScrollToEleven";
    Utils.registerEvent("testScrollToEleven",true,234726,done);
    sendEventByKey('webcomponentScrolTo',10,'');
  })

  })
}
