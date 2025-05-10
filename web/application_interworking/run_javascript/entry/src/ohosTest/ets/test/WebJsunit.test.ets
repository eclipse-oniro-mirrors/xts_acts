/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitJavaScriptProxy";

export default function webJsunit() {
  describe('webJsunit', () => {
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
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_002
     *tc.name javaScriptProxy                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('javaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRunJavaScript";
      Utils.registerEvent("javaScriptProxy", "backToEts", 102, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_007
     *tc.name runJavaScript
     *tc.desic Loads a piece of code and execute JS code in the context of the currently displayed page
     */
    it('runJavaScript', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnConsole";
      Utils.registerEvent("runJavaScript", "\"testRunJavaScript\"", 112, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_040
     *tc.name onConsole
     *tc.desic Triggered when the web page receives a JavaScript console message
     */
    it('onConsole', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJavaScriptAccess";
      Utils.registerEvent("onConsole", "console test", 62, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_060
     *tc.name javaScriptAccess
     *tc.desic Sets whether the Web allows JavaScript scripts to execute
     */
    it('javaScriptAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testRunJavaScript001";
      Utils.registerEvent("javaScriptAccess", true, 88, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_RUNJAVASCRIPT_0100
     * @tc.name       : testRunJavaScript001
     * @tc.desc       : test runJavaScript
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRunJavaScript001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerEvent("testRunJavaScript001", "\"testRunJavaScript\"", 31004, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
