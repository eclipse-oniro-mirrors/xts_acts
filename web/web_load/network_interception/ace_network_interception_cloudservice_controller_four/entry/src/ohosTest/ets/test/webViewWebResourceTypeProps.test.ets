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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewWebResourceTypeProps() {
  describe('ActsAceWebViewWebResourceTypeProps', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewWebResourceTypeProps',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages));
            if (!("webViewGetFrameUrlResourceType" == pages.name)) {
                console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewGetFrameUrlResourceType state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewGetFrameUrlResourceType page error:" + err);
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
     *@tc.number SUB_ACE_WEB_webResourceType_MAIN_FRAME_0001
     *@tc.name testWebView_webResourceType_MAIN_FRAME
     *@tc.desc test webResourceType MAIN_FRAME
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebView_webResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_MAIN_FRAME"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_webResourceType_MAIN_FRAME", true, 1343, done);
        sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_SUB_FRAME_0001
     *@tc.name testWebView_webResourceType_SUB_FRAME
     *@tc.desc test webResourceType SUB_FRAME
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SUB_FRAME"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_SUB_FRAME", true, 1344, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_STYLE_SHEET_0001
     *@tc.name testWebView_webResourceType_STYLE_SHEET
     *@tc.desc test webResourceType STYLE_SHEET
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_STYLE_SHEET"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_STYLE_SHEET", true, 1345, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_SCRIPT_0001
     *@tc.name testWebView_webResourceType_SCRIPT
     *@tc.desc test webResourceType SCRIPT
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SCRIPT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_SCRIPT", true, 1346, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_IMAGE_0001
     *@tc.name testWebView_webResourceType_IMAGE
     *@tc.desc test webResourceType IMAGE
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_IMAGE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_IMAGE", true, 1347, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_FONT_RESOURCE_0001
     *@tc.name testWebView_webResourceType_FONT_RESOURCE
     *@tc.desc test webResourceType FONT_RESOURCE
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_FONT_RESOURCE"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_FONT_RESOURCE", true, 1348, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_OBJECT_0001
     *@tc.name testWebView_webResourceType_OBJECT
     *@tc.desc test webResourceType OBJECT
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_OBJECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_OBJECT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_OBJECT", true, 1349, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_MEDIA_0001
     *@tc.name testWebView_webResourceType_MEDIA
     *@tc.desc test webResourceType MEDIA
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_MEDIA"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_MEDIA", true, 1350, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_WORKER_0001
     *@tc.name testWebView_webResourceType_WORKER
     *@tc.desc test webResourceType WORKER
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebView_webResourceType_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_WORKER"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_WORKER", true, 1351, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_SHARED_WORKER_0001
     *@tc.name testWebView_webResourceType_SHARED_WORKER
     *@tc.desc test webResourceType SHARED_WORKER
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebView_webResourceType_SHARED_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SHARED_WORKER"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_SHARED_WORKER", true, 1352, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_PREFETCH_0001
     *@tc.name testWebView_webResourceType_PREFETCH
     *@tc.desc test webResourceType PREFETCH
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_PREFETCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_PREFETCH"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_PREFETCH", true, 1353, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_FAVICON_0001
     *@tc.name testWebView_webResourceType_FAVICON
     *@tc.desc test webResourceType FAVICON
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_FAVICON"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_FAVICON", true, 1354, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_webResourceType_XHR_0001
     *@tc.name testWebView_webResourceType_XHR
     *@tc.desc test webResourceType XHR
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_XHR"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_XHR", true, 1355, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_webResourceType_PING_0001
     *@tc.name testWebView_webResourceType_PING
     *@tc.desc test webResourceType PING
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebView_webResourceType_PING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_PING"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_PING", true, 1356, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_CSP_REPORT_0001
     *@tc.name testWebView_webResourceType_CSP_REPORT
     *@tc.desc test webResourceType CSP_REPORT
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebView_webResourceType_CSP_REPORT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_CSP_REPORT"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_CSP_REPORT", true, 1357, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_webResourceType_Other_Props_0001
     *@tc.name testWebView_webResourceType_Other_Props
     *@tc.desc test webResourceType Other_Props
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebView_webResourceType_Other_Props', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_Other_Props"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebView_webResourceType_Other_Props", true, 1358, done);
      sendEventByKey('webViewWebResourceTypeProps', 10, '');
    })
  })
}
