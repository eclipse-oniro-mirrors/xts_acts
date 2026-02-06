/**
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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebviewGetAndSetHttpAuthUsernamePassword() {
  describe('ActsAceWebviewGetAndSetHttpAuthUsernamePassword', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewGetAndSetHttpAuthUsernamePassword',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webviewGetAndSetHttpAuthUsernamePassword state success " + JSON.stringify(pages));
        if (!("webviewGetAndSetHttpAuthUsernamePassword" == pages.name)) {
          console.info("get webviewGetAndSetHttpAuthUsernamePassword state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webviewGetAndSetHttpAuthUsernamePassword page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webviewGetAndSetHttpAuthUsernamePassword page error: " + err);
      }
      await waitForComponent("webviewGetAndSetHttpAuthUsernamePasswordButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0001
    * @tc.name        : testWebviewGetAndSetHttpAuthUsernamePassword
    * @tc.desc        : test webviewGetAndSetHttpAuthUsernamePassword
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebviewGetAndSetHttpAuthUsernamePassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebviewGetAndSetHttpAuthUsernamePassword";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewGetAndSetHttpAuthUsernamePassword", "success", 130010, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0002
    * @tc.name        : testWebviewUpdateHttpAuthPassword
    * @tc.desc        : test webviewUpdateHttpAuthPassword
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewUpdateHttpAuthPassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewUpdateHttpAuthPassword";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewUpdateHttpAuthPassword", "success", 130020, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0003
    * @tc.name        : testWebviewUpdateHttpAuthUsername
    * @tc.desc        : test webviewUpdateHttpAuthUsername
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewUpdateHttpAuthUsername', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewUpdateHttpAuthUsername";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewUpdateHttpAuthUsername", "success", 130030, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0004
    * @tc.name        : testWebviewSetHttpAuthUsernameToNull
    * @tc.desc        : test webviewSetHttpAuthUsernameToNull
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewSetHttpAuthUsernameToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewSetHttpAuthUsernameToNull";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewSetHttpAuthUsernameToNull", "success", 130040, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0005
    * @tc.name        : testWebviewSetHttpAuthPasswordToNull
    * @tc.desc        : test webviewSetHttpAuthPasswordToNull
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewSetHttpAuthPasswordToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewSetHttpAuthPasswordToNull";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewSetHttpAuthPasswordToNull", "success", 130050, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0006
    * @tc.name        : testWebviewSetHttpAuthUsernamePasswordToNull
    * @tc.desc        : test webviewSetHttpAuthUsernamePasswordToNull
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewSetHttpAuthUsernamePasswordToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewSetHttpAuthUsernamePasswordToNull";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewSetHttpAuthUsernamePasswordToNull", "success", 130060, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GETANDSETHTTPAUTHUSERNAMEPASSWORD_API_0007
    * @tc.name        : testWebviewDeleteHttpAuthUsernamePassword
    * @tc.desc        : test webviewDeleteHttpAuthUsernamePassword
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebviewDeleteHttpAuthUsernamePassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewDeleteHttpAuthUsernamePassword";
      Utils.emitEvent(emitKey, 130000);
      Utils.registerEvent("testWebviewDeleteHttpAuthUsernamePassword", "success", 130070, done);
      sendEventByKey('webviewGetAndSetHttpAuthUsernamePasswordButton', 10, '');
    })
  })
}
