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
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck

const driver = Driver.create();

export default function webViewSetAudioMuted() {
  describe('ActsAceWebDevWebViewSetAudioMutedTest',  () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewSetAudioMuted',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages));
        if (!("WebViewSetAudioMuted" == pages.name)) {
          console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewSetAudioMuted page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSetAudioMuted page error: " + err);
      }
      await waitForComponents('webViewSetAudioMuted');
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewSetAudioMuted beforeEach start");
      done();
    })
    afterEach(async  (done: Function) => {
      console.info("webViewSetAudioMuted afterEach start");
      done();
    })
    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0100
     * @tc.name testSetAudioMuted
     * @tc.desc test interface of setaudiomuted with muted true
     */
    it('testSetAudioMuted',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitSetAudioMuted", 132620)
      Utils.registerBaseEvent("testSetAudioMuted", 'true_"muted"', 132630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewSetAudioMuted');
    })
    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0200
     * @tc.name testSetAudioDisMuted
     * @tc.desc test interface of setaudiomuted with muted false
     */
    it('testSetAudioDisMuted',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitSetAudioDisMuted", 132620)
      Utils.registerBaseEvent("testSetAudioDisMuted", 'false_"unmuted"', 132640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewSetAudioMuted');
    })
  })
}