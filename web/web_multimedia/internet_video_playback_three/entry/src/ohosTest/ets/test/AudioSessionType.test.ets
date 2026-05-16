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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitAudioSessionType0100";
export default function webViewAudioSessionType() {

  describe('webViewAudioSessionType', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/AudioSessionType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewAudioSessionType state success " + JSON.stringify(pages));
        if (!("AudioSessionType" == pages.name)) {
          console.info("get webViewAudioSessionType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewAudioSessionType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewAudioSessionType page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /**
     *@tc.number SUB_ACE_WEB_AUDIOSESSIONTYPE_0001
     *@tc.name testWebViewAudioSessionType01
     *@tc.desc test objectEmbed
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewAudioSessionType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAudioSessionType0100"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewAudioSessionType01", AudioSessionType.AMBIENT, 20250621, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebAudioSessionTypeButton', 10, '');
    })



  })
}
