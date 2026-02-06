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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent,waitForComponent } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";
const  driver: Driver = Driver.create();

export default function webviewTerminateRenderProcess() {
  describe('TerminateRenderProcess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewTerminateRenderProcess',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webviewTerminateRenderProcess state success " + JSON.stringify(pages));
        if (!("webviewTerminateRenderProcess" == pages.name)) {
          console.info("get webviewTerminateRenderProcess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webviewTerminateRenderProcess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webviewTerminateRenderProcess page error: " + err);
      }
      await waitForComponent("TerminateRenderProcess");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webviewTerminateRenderProcess beforeEach start");
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0100
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcess0100", 152130)
      Utils.registerEvent("emitTerminateRenderProcess0100", true, 152140, done);
      waitAndClickComponent('TerminateRenderProcess',driver)
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0200
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcess0200", 152130)
      Utils.registerEvent("emitTerminateRenderProcess0200", true, 152150, done);
      waitAndClickComponent('TerminateRenderProcess',driver)
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0300
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcess0300", 152130)
      Utils.registerEvent("emitTerminateRenderProcess0300", true, 152160, done);
      waitAndClickComponent('TerminateRenderProcess',driver)
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_TERMINATERENDERPROCESS_API_0400
     *tc.name testTerminateRenderProcess
     *tc.desc terminateRenderProcess
     */
    it('emitTerminateRenderProcess0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcess0400", 152130)
      Utils.registerEvent("emitTerminateRenderProcess0400", true, 152170, done);
      waitAndClickComponent('TerminateRenderProcess',driver)
    })
  })
}