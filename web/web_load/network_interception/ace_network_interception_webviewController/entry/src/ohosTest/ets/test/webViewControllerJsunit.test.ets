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
let emitKey = "emitpageDown";
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(6000);
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
     *tc.number SUB_ACE_BASIC_ETS_API_0400
     *tc.name testPageDown
     *tc.desc Go pageDown
     */
    it('testPageDown',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetNetworkAvailable";
      Utils.registerEvent("testPageDown",true,106,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_1101
     *tc.name testSetNetworkAvailable
     *tc.desc test for setNetworkAvailable
     */
    it('testSetNetworkAvailable',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetNetworkAvailableAgain";
      Utils.registerEvent("testSetNetworkAvailable",false,122,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1200
     *tc.name testSetNetworkAvailableAgain
     *tc.desc test for setNetworkAvailable again
     */
    it('testSetNetworkAvailableAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetNetworkAvailableAgain";
      Utils.registerEvent("testSetNetworkAvailableAgain",true,124,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
