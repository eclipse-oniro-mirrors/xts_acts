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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitScrollableOne";
export default function webViewSrollableJsunit() {
  describe('ActsAceWebViewScrollableTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewSrollableJsunit"
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
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewScrollable beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("webViewScrollable afterEach start:"+emitKey);
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
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0100
     * tc.name testScrollableOne
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
    it('testScrollableOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwo";
      Utils.registerEvent("testScrollableOne","[0,0]",214214,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0200
     * tc.name testScrollableTwo
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is greater than the page height
    */
    it('testScrollableTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThree";
      Utils.registerEvent("testScrollableTwo",false,216216,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0300
     * tc.name testScrollableThree
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is less than the page height
    */
    it('testScrollableThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableFour";
      Utils.registerEvent("testScrollableThree","[0,0]",218218,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0400
     * tc.name testScrollableFour
     * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * positive, which is less than the page length
    */
    it('testScrollableFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableFive";
      Utils.registerEvent("testScrollableFour","[0,0]",220220,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0500
      * tc.name testScrollableFive
      * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
      * positive, which is greater than the page length
   */
    it('testScrollableFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableSix";
      Utils.registerEvent("testScrollableFive",false,222222,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0600
     * tc.name testScrollableSix
     * tc.desc When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * is a positive number, both of which are less than the page height
   */
    it('testScrollableSix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableSeven";
      Utils.registerEvent("testScrollableSix","[0,0]",224224,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0700
      * tc.name testScrollableSeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableEight";
      Utils.registerEvent("testScrollableSeven",false,226226,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0800
      * tc.name testScrollableEight
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableNine";
      Utils.registerEvent("testScrollableEight",true,228228,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0900
      * tc.name testScrollableNine
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTen";
      Utils.registerEvent("testScrollableNine",true,230230,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1000
      * tc.name testScrollableTen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableEleven";
      Utils.registerEvent("testScrollableTen",true,232232,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1100
      * tc.name testScrollableEleven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEleven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwelve";
      Utils.registerEvent("testScrollableEleven",false,234234,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1200
      * tc.name testScrollableTwelve
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwelve',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirteen";
      Utils.registerEvent("testScrollableTwelve",true,236236,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1300
      * tc.name testScrollableThirteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableFourteen";
      Utils.registerEvent("testScrollableThirteen","[200,200]",238238,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1400
      * tc.name testScrollableFourteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableFourteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableFifteen";
      Utils.registerEvent("testScrollableFourteen",true,240240,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1500
      * tc.name testScrollableFifteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableFifteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableSixteen";
      Utils.registerEvent("testScrollableFifteen",true,242242,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1600
      * tc.name testScrollableSixteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSixteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableSeventeen";
      Utils.registerEvent("testScrollableSixteen",false,244244,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1700
      * tc.name testScrollableSeventeen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSeventeen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableEighteen";
      Utils.registerEvent("testScrollableSeventeen",true,246246,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1800
      * tc.name testScrollableEighteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableEighteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableNineteen";
      Utils.registerEvent("testScrollableEighteen",true,248248,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1900
      * tc.name testScrollableNineteen
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableNineteen',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwenty";
      Utils.registerEvent("testScrollableNineteen",true,250250,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2000
      * tc.name testScrollableTwenty
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwenty',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyOne";
      Utils.registerEvent("testScrollableTwenty",true,252252,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2100
      * tc.name testScrollableTwentyOne
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyTwo";
      Utils.registerEvent("testScrollableTwentyOne",true,254254,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2200
      * tc.name testScrollableTwentyTwo
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyThree";
      Utils.registerEvent("testScrollableTwentyTwo",true,256256,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2300
      * tc.name testScrollableTwentyThree
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyFour";
      Utils.registerEvent("testScrollableTwentyThree",true,258258,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2400
      * tc.name testScrollableTwentyFour
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyFive";
      Utils.registerEvent("testScrollableTwentyFour",true,260260,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2500
      * tc.name testScrollableTwentyFive
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentySix";
      Utils.registerEvent("testScrollableTwentyFive",true,262262,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2600
      * tc.name testScrollableTwentySix
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentySix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentySeven";
      Utils.registerEvent("testScrollableTwentySix",true,264264,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2700
      * tc.name testScrollableTwentySeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentySeven',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function)=>{
      emitKey="emitScrollableTwentyEight";
      Utils.registerEvent("testScrollableTwentySeven",true,266266,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2800
      * tc.name testScrollableTwentyEight
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyEight',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableTwentyNine";
      Utils.registerEvent("testScrollableTwentyEight",true,268268,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_2900
      * tc.name testScrollableTwentyNine
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwentyNine',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirty";
      Utils.registerEvent("testScrollableTwentyNine",true,270270,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3000
      * tc.name testScrollableThirty
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirty',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtyOne";
      Utils.registerEvent("testScrollableThirty",true,272272,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3100
      * tc.name testScrollableThirtyOne
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtyTwo";
      Utils.registerEvent("testScrollableThirtyOne",true,274274,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3200
      * tc.name testScrollableThirtyTwo
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtyThree";
      Utils.registerEvent("testScrollableThirtyTwo",true,276276,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3300
      * tc.name testScrollableThirtyThree
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyThree',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtyFour";
      Utils.registerEvent("testScrollableThirtyThree",true,278278,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3400
      * tc.name testScrollableThirtyFour
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyFour',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtyFive";
      Utils.registerEvent("testScrollableThirtyFour",true,280280,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3500
      * tc.name testScrollableThirtyFive
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtyFive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtySix";
      Utils.registerEvent("testScrollableThirtyFive",true,282282,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_3600
      * tc.name testScrollableThirtySix
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableThirtySix',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitScrollableThirtySix";
      Utils.registerEvent("testScrollableThirtySix",true,284284,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
  })
}
