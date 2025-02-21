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
let emitKey = ''

export default function ActsAceWebViewWebResourceTypeProps2() {
  describe('ActsAceWebViewWebResourceTypeProps2', () => {

      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/webViewWebResourceTypeProps2',
        }

        try {
          await Utils.sleep(1000)
          router.clear();
          let pages = router.getState();
          console.info("get webViewGetFrameUrlResourceType2 state success " + JSON.stringify(pages));
          if (!("webViewGetFrameUrlResourceType2" == pages.name)) {
            console.info("get webViewGetFrameUrlResourceType2 state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await Utils.sleep(1000);
            console.info("push webViewGetFrameUrlResourceType2 state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webViewGetFrameUrlResourceType2 page error:" + err);
        }
        done()
      });

      beforeEach(async (done: Function) => {
        await Utils.sleep(2000);
        done();
      })

      afterEach(async (done: Function) => {
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
          console.error("emit emitKey error:" + JSON.stringify(err));
        }
        await Utils.sleep(1000);
        done();
      })

      /*
       *@tc.number SUB_ACE_WEB_webResourceType_SUB_RESOURCE_0001
       *@tc.name testWebView_webResourceType_SUB_RESOURCE
       *@tc.desc test webResourceType SUB_RESOURCE
       *@tc.size MediumTest
       *@tc.type Function
       *@tc.level 1
       */
      it('testWebView_webResourceType_SUB_RESOURCE', 0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_SUB_RESOURCE"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_webResourceType_SUB_RESOURCE", true, 1550, done);
        sendEventByKey('webViewWebResourceTypeProps2', 10, '');
      })
      /*
       *@tc.number SUB_ACE_WEB_webResourceType_SERVICE_WORKER_0001
       *@tc.name testWebView_webResourceType_SERVICE_WORKER
       *@tc.desc test webResourceType SERVICE_WORKER
       *@tc.size MediumTest
       *@tc.type Function
       *@tc.level 1
       */
      it('testWebView_webResourceType_SERVICE_WORKER', 0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_SERVICE_WORKER"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_webResourceType_SERVICE_WORKER", true, 1551, done);
        sendEventByKey('webViewWebResourceTypeProps2', 10, '');
      })

      /*
       *@tc.number SUB_ACE_WEB_webResourceType_PLUGIN_RESOURCE_0001
       *@tc.name testWebView_webResourceType_PLUGIN_RESOURCE
       *@tc.desc test webResourceType PLUGIN_RESOURCE
       *@tc.size MediumTest
       *@tc.type Function
       *@tc.level 1
       */
      it('testWebView_webResourceType_PLUGIN_RESOURCE', 0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_PLUGIN_RESOURCE"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_webResourceType_PLUGIN_RESOURCE", true, 1552, done);
        sendEventByKey('webViewWebResourceTypeProps2', 10, '');
      })

      /*
     *@tc.number SUB_ACE_WEB_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME_0001
     *@tc.name testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME
     *@tc.desc test webResourceType NAVIGATION_PRELOAD_MAIN_FRAME
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
      it('testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME', 0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME", true, 1553, done);
        sendEventByKey('webViewWebResourceTypeProps2', 10, '');
      })


    /*
    *@tc.number SUB_ACE_WEB_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME_0001
    *@tc.name testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME
    *@tc.desc test webResourceType NAVIGATION_PRELOAD_SUB_FRAME
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME', 0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME", true, 1554, done);
      sendEventByKey('webViewWebResourceTypeProps2', 10, '');
    })
 })
}
