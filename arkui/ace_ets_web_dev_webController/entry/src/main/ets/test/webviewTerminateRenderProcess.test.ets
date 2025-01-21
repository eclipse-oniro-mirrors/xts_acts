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

import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

let emitKey = "emitTerminateRenderProcess0100";

export default function webviewTerminateRenderProcess() {
  describe('TerminateRenderProcess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webviewTerminateRenderProcess',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webviewTerminateRenderProcess state success " + JSON.stringify(pages));
        if (!("webviewTerminateRenderProcess" == pages.name)) {
          console.info("get webviewTerminateRenderProcess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webviewTerminateRenderProcess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webviewTerminateRenderProcess page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webviewTerminateRenderProcess beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webviewTerminateRenderProcess afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0100
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0100', 0, async (done: Function) => {
      emitKey = "emitTerminateRenderProcess0200";
      Utils.registerEvent("emitTerminateRenderProcess0100", true, 5300, done);
      sendEventByKey('TerminateRenderProcess', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0200
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0200', 0, async (done: Function) => {
      emitKey = "emitTerminateRenderProcess0300";
      Utils.registerEvent("emitTerminateRenderProcess0200", true, 5302, done);
      sendEventByKey('TerminateRenderProcess', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0300
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0300', 0, async (done: Function) => {
      emitKey = "emitTerminateRenderProcess0400";
      Utils.registerEvent("emitTerminateRenderProcess0300", true, 5304, done);
      sendEventByKey('TerminateRenderProcess', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0400
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0400', 0, async (done: Function) => {
      emitKey = "emitTerminateRenderProcess0400";
      Utils.registerEvent("emitTerminateRenderProcess0400", true, 5306, done);
      sendEventByKey('TerminateRenderProcess', 10, '');
    })
  })
}