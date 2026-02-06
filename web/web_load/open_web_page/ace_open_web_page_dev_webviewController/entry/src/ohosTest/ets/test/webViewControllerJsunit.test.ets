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

import { describe, beforeEach, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200320;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitPostUrl";

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
     * @tc.number SUB_ACE_BASIC_ETS_API_2500
     * @tc.name testPostUrl
     * @tc.desc test for PostUrl 
     */
    it('testPostUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPostUrl";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPostUrl", "http://www.example.com/", 200330, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     * @tc.number SUB_ACE_BASIC_ETS_API_0200
     * @tc.name testGetUserAgent
     * @tc.desc Get the UserAgent
     */
    it('testGetUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitgetUserAgent";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUserAgent", "success", 200340, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     * @tc.number SUB_ACE_BASIC_ETS_API_0300
     * @tc.name testGetUserAgentAgain
     * @tc.desc Get the UserAgent again
     */
    it('testGetUserAgentAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitgetUserAgentAgain";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUserAgentAgain", "success", 200350, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     * @tc.number SUB_ACE_BASIC_ETS_API_1000
     * @tc.name testGetOriginalUrl
     * @tc.desc test for getOriginalUrl
     */
    it('testGetOriginalUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginalUrl";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginalUrl", "success", 200360, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_1100
     * @tc.name testGetOriginalUrlTwo
     * @tc.desc test for getOriginalUrl again
     */
    it('testGetOriginalUrlTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginalUrlTwo";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginalUrlTwo", "success", 200370, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
  })
}