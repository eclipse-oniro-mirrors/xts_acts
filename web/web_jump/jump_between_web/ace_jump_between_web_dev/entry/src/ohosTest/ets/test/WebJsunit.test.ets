/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
     beforeAll(async (done: Function) => {
      await waitForComponent("webcomponent");
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
      console.info("web afterEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_009
     *tc.name onRefreshAccessedHistory                                                                                                                                                                                                            *tc.desic Triggered when the Web page refreshes accessed history
     */
    it('onRefreshAccessedHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnRefreshAccessedHistory', 133750);
      Utils.registerContainEvent("emitOnRefreshAccessedHistory", "second.html", 133760, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_015
     *tc.name accessBackward
     *tc.desic Checks whether the web page can go back
     */
    it('accessBackward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessBackward', 133750);
      Utils.registerEvent("emitAccessBackward", "true", 133770, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_016
     *tc.name accessForward
     *tc.desic Checks whether the web page can go forward
     */
    it('accessForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessForward', 133750);
      Utils.registerEvent("emitAccessForward", "false", 133780, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_017
     *tc.name accessStep
     *tc.desic Checks whether the web page can go back or forward the given number of steps
     */
    it('accessStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessStep', 133750);
      Utils.registerEvent("emitAccessStep", "true", 133790, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_018
     *tc.name backward
     *tc.desic Goes back in the history of the web page
     */
    it('backward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitBackward', 133750);
      Utils.registerEvent("emitBackward", "\"index\"", 133800, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_019
     *tc.name forward
     *tc.desic Goes forward in the history of the web page
     */
    it('forward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitForward', 133750);
      Utils.registerEvent("emitForward", "resource://rawfile/second.html", 133810, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
