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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitSetAudioMuted";
export default function webViewSetAudioMuted() {
  describe('ActsAceWebDevWebViewSetAudioMutedTest',  () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewSetAudioMuted',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages));
        if (!("webViewSetAudioMuted" == pages.name)) {
          console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewSetAudioMuted page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSetAudioMuted page error: " + err);
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
      console.info("webViewSetAudioMuted beforeEach start");
      done();
    })
    afterEach(async  (done: Function) => {
      console.info("webViewSetAudioMuted afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0100
     *tc.name testSetAudioMuted
     *tc.desc test interface of setaudiomuted with muted true
     */
    it('testSetAudioMuted',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetAudioDisMuted";
      Utils.registerEvent("testSetAudioMuted","true",405,done);
      Utils.registerEvent("testSetAudioMuted",'"muted"',406,done);
      sendEventByKey('webViewSetAudioMuted',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0200
     *tc.name testSetAudioDisMuted
     *tc.desc test interface of setaudiomuted with muted false
     */
    it('testSetAudioDisMuted',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitSetAudioDisMuted";
      Utils.registerEvent("testSetAudioDisMuted","false",407,done);
      Utils.registerEvent("testSetAudioDisMuted",'"unmuted"',408,done);
      sendEventByKey('webViewSetAudioMuted',10,'');
    })
  })
}