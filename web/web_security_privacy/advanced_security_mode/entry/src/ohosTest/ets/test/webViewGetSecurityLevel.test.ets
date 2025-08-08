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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewGetSecurityLevel() {
  describe('ActsAceWebViewGetSecurityLevel', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewGetSecurityLevel',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewGetSecurityLevel state success " + JSON.stringify(pages));
        if (!("webViewGetSecurityLevel" == pages.name)) {
          console.info("get webViewGetSecurityLevel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewGetSecurityLevel state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewGetSecurityLevel page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })


    /*
     *@tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0001
     *@tc.name testWebViewGetSecurityLevelNone
     *@tc.desc test getSecurityLevel NONE 0
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewGetSecurityLevelNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewGetSecurityLevel01"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewGetSecurityLevelNone", 'success', 8008, done);
      sendEventByKey('webViewGetSecurityLevelButton', 10, '');
    })

  })
}
