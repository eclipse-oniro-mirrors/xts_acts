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

export default function ActsAceWebviewJavaScriptPermission() {
  describe('ActsAceWebviewJavaScriptPermission', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewJavaScriptPermission',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewJavaScriptPermission state success " + JSON.stringify(pages));
        if (!("webViewJavaScriptPermission" == pages.name)) {
          console.info("get webViewJavaScriptPermission state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewJavaScriptPermission state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewJavaScriptPermission page error:" + err);
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
        let backEvent : events_emitter.InnerEvent = {
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
    *@tc.number SUB_ACE_WEBVIEW_JAVASCRIPTPERMISSION_API_0001
    *@tc.name testWebViewJavaScriptPermission
    *@tc.desc test testWebViewJavaScriptPermission
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewJavaScriptPermission', 0, async (done: Function) => {
      emitKey = "emitWebViewJavaScriptPermission"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewJavaScriptPermission", "success", 20003,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewJavaScriptPermissionButton', 10, '');
    })

  })
}
