/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
let emitKey = "emitScrollToOne";
export default function webViewSrollToJsunit() {
  describe('ActsAceWebViewScrollToTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/webViewScrollTo"
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
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewScrollTo beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewScrollTo afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
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
    it('testScrollToOne',0,async function(done){
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
    it('testScrollToTwo',0,async function(done){
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
    it('testScrollToThree',0,async function(done){
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
    it('testScrollToFour',0,async function(done){
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
    it('testScrollToFive',0,async function(done){
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
    it('testScrollToSix',0,async function(done){
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
    it('testScrollToSeven',0,async function(done){
      emitKey="emitScrollToSeven";
      Utils.registerEvent("testScrollToSeven",true,226,done);
      sendEventByKey('webcomponentScrolTo',10,'');
    })
  })
}
