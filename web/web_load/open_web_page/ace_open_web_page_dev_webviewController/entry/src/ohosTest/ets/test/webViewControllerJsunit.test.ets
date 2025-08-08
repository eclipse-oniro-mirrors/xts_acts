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
 
import { describe, beforeEach, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitPostUrl";
export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("web afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_API_2500
     *tc.name testPostUrl
     *tc.desc test for PostUrl 
     */
    it('testPostUrl',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitgetUserAgent";  
      Utils.registerEvent("testPostUrl","http://www.example.com/",150,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0200
     *tc.name testGetUserAgent
     *tc.desc Get the UserAgent
     */
    it('testGetUserAgent',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitgetUserAgentAgain";
      let userAgent= "success";
      Utils.registerEvent("testGetUserAgent",userAgent,1020,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0300
     *tc.name testGetUserAgentAgain
     *tc.desc Get the UserAgent again
     */
    it('testGetUserAgentAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitGetOriginalUrl";
      let userAgent= "success";
      Utils.registerEvent("testGetUserAgentAgain",userAgent,104,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1000
     *tc.name testGetOriginalUrl
     *tc.desc test for getOriginalUrl
     */
    it('testGetOriginalUrl',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitGetOriginalUrlTwo";    
      let indexUrl = "//rawfile/indexCopy.html";
      Utils.registerEvent("testGetOriginalUrl",indexUrl,118,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_1100
     *tc.name testGetOriginalUrlTwo
     *tc.desc test for getOriginalUrl again
     */
    it('testGetOriginalUrlTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitGetOriginalUrlTwo";
      let indexUrl = "//rawfile/indexCopy.html//rawfile/indexTwo.html";
      Utils.registerEvent("testGetOriginalUrlTwo",indexUrl,120,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}