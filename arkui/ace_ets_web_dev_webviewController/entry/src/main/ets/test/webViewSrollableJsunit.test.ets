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
let emitKey = "emitScrollableOne";
export default function webViewSrollableJsunit() {
  describe('ActsAceWebViewScrollableTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/webViewScrollable"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollable" == pages.name)) {
          console.info("get webViewScrollable state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewScrollable page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollable page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewScrollable beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewScrollable afterEach start:"+emitKey);
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
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0100
     * tc.name testScrollableOne
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
    it('testScrollableOne',0,async function(done){
      emitKey="emitScrollableTwo";
      Utils.registerEvent("testScrollableOne","[0,0]",214,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0200
     * tc.name testScrollableTwo
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is greater than the page height
    */
    it('testScrollableTwo',0,async function(done){
      emitKey="emitScrollableThree";
      Utils.registerEvent("testScrollableTwo",false,216,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0300
     * tc.name testScrollableThree
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is less than the page height
    */
    it('testScrollableThree',0,async function(done){
      emitKey="emitScrollableFour";
      Utils.registerEvent("testScrollableThree","[0,0]",218,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0400
     * tc.name testScrollableFour
     * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * positive, which is less than the page length
    */
    it('testScrollableFour',0,async function(done){
      emitKey="emitScrollableFive";
      Utils.registerEvent("testScrollableFour","[0,0]",220,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0500
      * tc.name testScrollableFive
      * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
      * positive, which is greater than the page length
   */
    it('testScrollableFive',0,async function(done){
      emitKey="emitScrollableSix";
      Utils.registerEvent("testScrollableFive",false,222,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0600
     * tc.name testScrollableSix
     * tc.desc When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * is a positive number, both of which are less than the page height
   */
    it('testScrollableSix',0,async function(done){
      emitKey="emitScrollableSeven";
      Utils.registerEvent("testScrollableSix","[0,0]",224,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0700
      * tc.name testScrollableSeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSeven',0,async function(done){
      emitKey="emitScrollableEight";
      Utils.registerEvent("testScrollableSeven",false,226,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0800
      * tc.name testScrollableEight
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEight',0,async function(done){
      emitKey="emitScrollableNine";
      Utils.registerEvent("testScrollableEight",true,228,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0900
      * tc.name testScrollableNine
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableNine',0,async function(done){
      emitKey="emitScrollableTen";
      Utils.registerEvent("testScrollableNine",true,230,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1000
      * tc.name testScrollableTen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTen',0,async function(done){
      emitKey="emitScrollableEleven";
      Utils.registerEvent("testScrollableTen",true,232,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1100
      * tc.name testScrollableEleven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEleven',0,async function(done){
      emitKey="emitScrollableTwelve";
      Utils.registerEvent("testScrollableEleven",false,234,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1200
      * tc.name testScrollableTwelve
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwelve',0,async function(done){
      emitKey="emitScrollableThirteen";
      Utils.registerEvent("testScrollableTwelve",true,236,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1300
      * tc.name testScrollableThirteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirteen',0,async function(done){
      emitKey="emitScrollableFourteen";
      Utils.registerEvent("testScrollableThirteen","[200,200]",238,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1400
      * tc.name testScrollableFourteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableFourteen',0,async function(done){
      emitKey="emitScrollableFifteen";
      Utils.registerEvent("testScrollableFourteen",true,240,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1500
      * tc.name testScrollableFifteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableFifteen',0,async function(done){
      emitKey="emitScrollableSixteen";
      Utils.registerEvent("testScrollableFifteen",true,242,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1600
      * tc.name testScrollableSixteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSixteen',0,async function(done){
      emitKey="emitScrollableSeventeen";
      Utils.registerEvent("testScrollableSixteen",false,244,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1700
      * tc.name testScrollableSeventeen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSeventeen',0,async function(done){
      emitKey="emitScrollableEighteen";
      Utils.registerEvent("testScrollableSeventeen",true,246,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1800
      * tc.name testScrollableEighteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEighteen',0,async function(done){
      emitKey="emitScrollableNineteen";
      Utils.registerEvent("testScrollableEighteen",true,248,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1900
      * tc.name testScrollableNineteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableNineteen',0,async function(done){
      emitKey="emitScrollableTwenty";
      Utils.registerEvent("testScrollableNineteen",true,250,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2000
      * tc.name testScrollableTwenty
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwenty',0,async function(done){
      emitKey="emitScrollableTwentyOne";
      Utils.registerEvent("testScrollableTwenty",true,252,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2100
      * tc.name testScrollableTwentyOne
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyOne',0,async function(done){
      emitKey="emitScrollableTwentyTwo";
      Utils.registerEvent("testScrollableTwentyOne",true,254,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2200
      * tc.name testScrollableTwentyTwo
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyTwo',0,async function(done){
      emitKey="emitScrollableTwentyThree";
      Utils.registerEvent("testScrollableTwentyTwo",true,256,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2300
      * tc.name testScrollableTwentyThree
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyThree',0,async function(done){
      emitKey="emitScrollableTwentyFour";
      Utils.registerEvent("testScrollableTwentyThree",true,258,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2400
      * tc.name testScrollableTwentyFour
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyFour',0,async function(done){
      emitKey="emitScrollableTwentyFive";
      Utils.registerEvent("testScrollableTwentyFour",true,260,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2500
      * tc.name testScrollableTwentyFive
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyFive',0,async function(done){
      emitKey="emitScrollableTwentySix";
      Utils.registerEvent("testScrollableTwentyFive",true,262,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2600
      * tc.name testScrollableTwentySix
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentySix',0,async function(done){
      emitKey="emitScrollableTwentySeven";
      Utils.registerEvent("testScrollableTwentySix",true,264,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2700
      * tc.name testScrollableTwentySeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentySeven',0,async function(done){
      emitKey="emitScrollableTwentyEight";
      Utils.registerEvent("testScrollableTwentySeven",true,266,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2800
      * tc.name testScrollableTwentyEight
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyEight',0,async function(done){
      emitKey="emitScrollableTwentyNine";
      Utils.registerEvent("testScrollableTwentyEight",true,268,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2900
      * tc.name testScrollableTwentyNine
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyNine',0,async function(done){
      emitKey="emitScrollableThirty";
      Utils.registerEvent("testScrollableTwentyNine",true,270,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3000
      * tc.name testScrollableThirty
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirty',0,async function(done){
      emitKey="emitScrollableThirtyOne";
      Utils.registerEvent("testScrollableThirty",true,272,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3100
      * tc.name testScrollableThirtyOne
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyOne',0,async function(done){
      emitKey="emitScrollableThirtyTwo";
      Utils.registerEvent("testScrollableThirtyOne",true,274,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3200
      * tc.name testScrollableThirtyTwo
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyTwo',0,async function(done){
      emitKey="emitScrollableThirtyThree";
      Utils.registerEvent("testScrollableThirtyTwo",true,276,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3300
      * tc.name testScrollableThirtyThree
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyThree',0,async function(done){
      emitKey="emitScrollableThirtyFour";
      Utils.registerEvent("testScrollableThirtyThree",true,278,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3400
      * tc.name testScrollableThirtyFour
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyFour',0,async function(done){
      emitKey="emitScrollableThirtyFive";
      Utils.registerEvent("testScrollableThirtyFour",true,280,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3500
      * tc.name testScrollableThirtyFive
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyFive',0,async function(done){
      emitKey="emitScrollableThirtySix";
      Utils.registerEvent("testScrollableThirtyFive",true,282,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3600
      * tc.name testScrollableThirtySix
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtySix',0,async function(done){
      emitKey="emitScrollableThirtySix";
      Utils.registerEvent("testScrollableThirtySix",true,284,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
  })
}
