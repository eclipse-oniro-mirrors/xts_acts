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

let emitKey = "emitJsMessageExtGetStringError";

export default function webViewContJsMessageExtReturnError() {
  describe('ActsAceWebDevWebViewContJsMessageExtReturnErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContJsMessageExtReturnError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContJsMessageExtReturnError state success " + JSON.stringify(pages));
        if (!("webViewContJsMessageExtReturnError" == pages.name)) {
          console.info("get webViewContJsMessageExtReturnError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContJsMessageExtReturnError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContJsMessageExtReturnError page error: " + err);
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
      console.info("webViewContJsMessageExtReturnError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContJsMessageExtReturnError afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1000
     *tc.name testJsMessageExtGetStringError
     *tc.desc test interface of JsMessageExt getString with unmatched type
     */
    it('testJsMessageExtGetStringError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetNumberError";
      Utils.registerEvent("testJsMessageExtGetStringError", "17100014", 816, done);
      Utils.registerEvent("testJsMessageExtGetStringError", "The type and value of the message do not match.", 817, done);
      sendEventByKey('webViewContJsMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1100
     *tc.name testJsMessageExtGetNumberError
     *tc.desc test interface of JsMessageExt getNumber with unmatched type
     */
    it('testJsMessageExtGetNumberError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetBooleanError";
      Utils.registerEvent("testJsMessageExtGetNumberError", "17100014", 818, done);
      Utils.registerEvent("testJsMessageExtGetNumberError", "The type and value of the message do not match.", 819, done);
      sendEventByKey('webViewContJsMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1200
     *tc.name testJsMessageExtGetBooleanError
     *tc.desc test interface of JsMessageExt getBoolean with unmatched type
     */
    it('testJsMessageExtGetBooleanError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetArrayBufferError";
      Utils.registerEvent("testJsMessageExtGetBooleanError", "17100014", 820, done);
      Utils.registerEvent("testJsMessageExtGetBooleanError", "The type and value of the message do not match.", 821, done);
      sendEventByKey('webViewContJsMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1300
     *tc.name testJsMessageExtGetArrayBufferError
     *tc.desc test interface of JsMessageExt getArrayBuffer with unmatched type
     */
    it('testJsMessageExtGetArrayBufferError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetArrayError";
      Utils.registerEvent("testJsMessageExtGetArrayBufferError", "17100014", 822, done);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError", "The type and value of the message do not match.", 823, done);
      sendEventByKey('webViewContJsMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1400
     *tc.name testJsMessageExtGetArrayError
     *tc.desc test interface of JsMessageExt getArray with unmatched type
     */
    it('testJsMessageExtGetArrayError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessageExtGetArrayError";
      Utils.registerEvent("testJsMessageExtGetArrayError", "17100014", 824, done);
      Utils.registerEvent("testJsMessageExtGetArrayError", "The type and value of the message do not match.", 825, done);
      sendEventByKey('webViewContJsMessageExtReturnError', 10, '');
    })
  })
}