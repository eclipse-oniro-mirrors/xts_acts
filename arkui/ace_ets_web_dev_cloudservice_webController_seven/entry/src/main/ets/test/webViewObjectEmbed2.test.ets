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

export default function ActsAceWebViewObjectEmbed2() {
  describe('ActsAceWebViewObjectEmbed2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewObjectEmbed2',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewObjectEmbed2 state success " + JSON.stringify(pages));
        if (!("webViewObjectEmbed2" == pages.name)) {
          console.info("get webViewObjectEmbed2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewObjectEmbed2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewObjectEmbed2 page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })



    /*
     *@tc.number SUB_ACE_WEB_OBJECTEMBED2_API_0002
     *@tc.name testWebViewObjectEmbed2
     *@tc.desc test objectEmbed2
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewObjectEmbed02', 0, async (done: Function) => {
      emitKey = "emitWebViewObjectEmbed02"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewObjectEmbed02", 'success', 8015, done);
      sendEventByKey('webViewObjectEmbedButton2', 10, '');
    })


  })
}
