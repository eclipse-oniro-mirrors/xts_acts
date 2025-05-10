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
import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level  } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ''

export default function webResourceHandlerTest() {
  describe('webResourceHandlerTest', () => {

      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/webResourceHandlerTest',
        }

        try {
          await Utils.sleep(1000)
          router.clear();
          let pages = router.getState();
          console.info("get webResourceHandlerTest state success " + JSON.stringify(pages));
          if (!("webResourceHandlerTest" == pages.name)) {
            console.info("get webResourceHandlerTest state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await Utils.sleep(1000);
            console.info("push webResourceHandlerTest state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webResourceHandlerTest page error:" + err);
        }
        done()
      });

      beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
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
       *@tc.number :SUB_ACE_WEB_didReceiveResponse_INVAILD_0100
       *@tc.name :testWebView_didReceiveResponse_INVAILD
       *@tc.desc :test WebView_didReceiveResponse_INVAILD
       *@tc.size :MediumTest
       *@tc.type :Function
       *@tc.level :Level 1
       */
      it('testWebView_didReceiveResponse_INVAILD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didReceiveResponse_INVAILD"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_didReceiveResponse_INVAILD", 17100021, 1550, done);
        sendEventByKey('webView', 10, '');
      })
      /*
       *@tc.number  :SUB_ACE_WEB_didReceiveResponseBody_INVALID_0100
       *@tc.name  :testWebView_didReceiveResponseBody_INVALID
       *@tc.desc  :test WebView_didReceiveResponseBody_INVALID
       *@tc.size  :MediumTest
       *@tc.type  :Function
       *@tc.level  :Level 1
       */
      it('testWebView_didReceiveResponseBody_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didReceiveResponseBody_INVALID"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_didReceiveResponseBody_INVALID", 17100021, 1551, done);
        sendEventByKey('webView', 10, '');
      })

      /*
       *@tc.number  :SUB_ACE_WEB_didFinish_INVALID_0100
       *@tc.name  :testWebView_didFinish_INVALID
       *@tc.desc  :test WebView_didFinish_INVALID
       *@tc.size  :MediumTest
       *@tc.type  :Function
       *@tc.level  :Level 1
       */
      it('testWebView_didFinish_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didFinish_INVALID"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_didFinish_INVALID", 17100021, 1552, done);
        sendEventByKey('webView', 10, '');
      })

      /*
       *@tc.number :SUB_ACE_WEB_didFail_INVAILD_0100
       *@tc.name :testWebView_didFail_INVALID
       *@tc.desc :test WebView_didFail_INVALID
       *@tc.size :MediumTest
       *@tc.type :Function
       *@tc.level :Level 1
     */
      it('testWebView_didFail_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didFail_INVALID"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_didFail_INVALID", 17100021, 1553, done);
        sendEventByKey('webView', 10, '');
      })
    /*
    * @tc.number     : SUB_WEB_WEBNAVIGATIONTYPE_0100
    * @tc.name       : testWebNavigationType001
    * @tc.desc       : test webNavigationType MAIN_FRAME_NEW_ENTRY
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebNavigationType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebNavigationType001", true, 202503212, done);
      sendEventByKey('webView', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBNAVIGATIONTYPE_0200
    * @tc.name       : testWebNavigationType002
    * @tc.desc       : test webNavigationType MAIN_FRAME_EXISTING_ENTRY
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebNavigationType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebNavigationType002", true, 202503213, done);
      sendEventByKey('webView', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBNAVIGATIONTYPE_0300
    * @tc.name       : testWebNavigationType003
    * @tc.desc       : test webNavigationType NAVIGATION_TYPE_NEW_SUBFRAME
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebNavigationType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebNavigationType003", true, 202503214, done);
      sendEventByKey('webView', 10, '');
    })

 })
}
