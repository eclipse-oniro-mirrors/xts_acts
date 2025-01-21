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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
export default function webViewNativeMediaPlayerProps2() {
  describe('ActsAcewebViewNativeMediaPlayerProps2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webViewNativeMediaPlayerProps2',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerProps2 state success " + JSON.stringify(pages));
        if (!("webViewNativeMediaPlayerProps2" == pages.name)) {
          console.info("get webViewNativeMediaPlayerProps2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewNativeMediaPlayerProps2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerProps2 page error:" + err);
      }
      done()
    });
      
    beforeEach(async (done: Function) => {
        await Utils.sleep(2500);
      console.info("webViewNativeMediaPlayerProps beforeEach start");
      done();
    })
    
    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_Props2_API_0001
     *@tc.name testWebViewNativeMediaPlayerProps2
     *@tc.desc test MediaPlayerProps2
     *@tc.type Function
     *@tc.size MediumTest
     *@tc.level 1
     */
    it('testWebViewNativeMediaPlayerProps2', 0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerProps2";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewNativeMediaPlayerProps2", true, 1355, done);
      sendEventByKey('webViewNativeMediaPlayerProps2', 10, '');
    })
  })
}
