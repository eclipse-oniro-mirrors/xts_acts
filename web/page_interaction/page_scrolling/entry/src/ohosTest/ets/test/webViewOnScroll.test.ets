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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitOnscroll";
export default function webViewOnScroll() {
  describe('ActsAceWebDevWbViewOnScrollTest', () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnScroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnScroll state success " + JSON.stringify(pages));
        if (!("webViewOnScroll" == pages.name)) {
          console.info("get webViewOnScroll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewOnScroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnScroll page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewOnScroll beforeEach start");
      done();
    })
    afterEach(async (done: Function) =>{
      console.info("webViewOnScroll afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR3_API_0100
     *tc.name testOnscroll
     *tc.desc onscroll after scrollby 100,100
     */
    it('testOnscroll',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitOnscrollAgain";
      Utils.registerEvent("testOnscroll",100,312,done);
      Utils.registerEvent("testOnscroll",100,314,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR3_API_0200
     *tc.name testOnscrollAgain
     *tc.desc onscroll after scrollby -100,-100
     */
    it('testOnscrollAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitpageDown";
      Utils.registerEvent("testOnscrollAgain",50,316,done);
      Utils.registerEvent("testOnscrollAgain",50,318,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0400
     *tc.name testPageDown
     *tc.desc Go pageDown
     */
    it('testPageDown',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitpageUp";    
      Utils.registerEvent("testPageDown",true,106,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0500
     *tc.name testPageUp
     *tc.desc Go pageUp
     */
    it('testPageUp',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitpageDownAgain";    
      Utils.registerEvent("testPageUp",true,108,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_0600
     *tc.name testPageDownAgain
     *tc.desc Go PageDown Again
     */
    it('testPageDownAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitpageUpAgain";    
      Utils.registerEvent("testPageDownAgain",true,110,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0700
     *tc.name testPageUpAgain
     *tc.desc Go PageUp again
     */
    it('testPageUpAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitpageUpAgain";    
      Utils.registerEvent("testPageUpAgain",true,112,done);
      sendEventByKey('webViewOnScroll',10,'');
    })
  })
}