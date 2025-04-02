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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewObjectEmbed3() {
  describe('ActsAceWebViewObjectEmbed3', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewObjectEmbed3',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectEmbed3 state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbed3" == pages.name)) {
          console.info("get webViewObjectEmbed3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewObjectEmbed3 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectEmbed3 page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })



    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED3_API_0003
     *@tc.name testWebViewObjectEmbed3
     *@tc.desc test objectEmbed3
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbed03', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbed03"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbed03", 'error', 8016, done);
      sendEventByKey('webViewObjectEmbedButton3', 10, '');
    })


  })
}
