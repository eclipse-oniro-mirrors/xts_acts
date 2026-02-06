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
import { beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200210;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_001
     *tc.name userAgent
     *tc.desic Sets the Web's user agent
     */
    it('userAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitUserAgent";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let userAgent = "\"Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36\"";
      Utils.registerEvent("", userAgent, 200220, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_003
     *tc.name onUrlLoadIntercept                                                                                                                                                                                                                  *tc.desic Triggered when the URL loading is intercepted
     */
    it('onUrlLoadIntercept', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnUrlLoadIntercept";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("onUrlLoadIntercept", "https://www.example.com/", 200230, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_006
     *tc.name loadUrl
     *tc.desic Loads the given URL
     */
    it('loadUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitLoadUrl";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerContainEvent("loadUrl", "index", 200240, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_009
     *tc.name onRefreshAccessedHistory                                                                                                                                                                                                            *tc.desic Triggered when the Web page refreshes accessed history
     */
    it('onRefreshAccessedHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnRefreshAccessedHistory";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerContainEvent("onRefreshAccessedHistory", "second.html", 200250, done);
      await Utils.waitAndClickComponent(driver, "webcomponent");
    })
  })
}