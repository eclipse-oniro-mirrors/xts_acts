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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import hilog from '@ohos.hilog';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webviewApi() {

  describe('webResourceType', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0001
    * @tc.name       : testWeb_ResourceType_MAIN_FRAME
    * @tc.desc       : testWeb_ResourceType_MAIN_FRAME
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWeb_ResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_MAIN_FRAME PASS');

      Utils.emitEvent("emitWeb_ResourceType_MAIN_FRAME", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_MAIN_FRAME", true, 1001, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0002
    * @tc.name       : testWeb_ResourceType_SUB_FRAME
    * @tc.desc       : testWeb_ResourceType_SUB_FRAME
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_SUB_FRAME PASS');

      Utils.emitEvent("emitWeb_ResourceType_SUB_FRAME", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_SUB_FRAME", true, 1002, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0003
    * @tc.name       : testWeb_ResourceType_STYLE_SHEET
    * @tc.desc       : testWeb_ResourceType_STYLE_SHEET
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_STYLE_SHEET PASS');

      Utils.emitEvent("emitWeb_ResourceType_STYLE_SHEET", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_MAIN_FRAME", true, 1003, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0004
    * @tc.name       : testWeb_ResourceType_SCRIPT
    * @tc.desc       : testWeb_ResourceType_SCRIPT
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_SCRIPT PASS');

      Utils.emitEvent("emitWeb_ResourceType_SCRIPT", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_SCRIPT", true, 1004, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0005
    * @tc.name       : testWeb_ResourceType_IMAGE
    * @tc.desc       : testWeb_ResourceType_IMAGE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_IMAGE PASS');

      Utils.emitEvent("emitWeb_ResourceType_IMAGE", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_IMAGE", true, 1005, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0006
    * @tc.name       : testWeb_ResourceType_FONT_RESOURCE
    * @tc.desc       : testWeb_ResourceType_FONT_RESOURCE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_FONT_RESOURCE PASS');

      Utils.emitEvent("emitWeb_ResourceType_FONT_RESOURCE", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_FONT_RESOURCE", true, 1006, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0007
    * @tc.name       : testWeb_ResourceType_SUB_RESOURCE
    * @tc.desc       : testWeb_ResourceType_SUB_RESOURCE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_SUB_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_SUB_RESOURCE PASS');

      Utils.emitEvent("emitWeb_ResourceType_SUB_RESOURCE", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_SUB_RESOURCE", true, 1007, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0008
    * @tc.name       : testWeb_ResourceType_OBJECT
    * @tc.desc       : testWeb_ResourceType_OBJECT
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_OBJECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_OBJECT PASS');

      Utils.emitEvent("emitWeb_ResourceType_OBJECT", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_OBJECT", true, 1008, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0009
    * @tc.name       : testWeb_ResourceType_MEDIA
    * @tc.desc       : testWeb_ResourceType_MEDIA
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_MEDIA PASS');

      Utils.emitEvent("emitWeb_ResourceType_MEDIA", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_MEDIA", true, 1009, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0010
    * @tc.name       : testWeb_ResourceType_WORKER
    * @tc.desc       : testWeb_ResourceType_WORKER
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_WORKER PASS');

      Utils.emitEvent("emitWeb_ResourceType_WORKER", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_WORKER", true, 1010, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0011
    * @tc.name       : testWeb_ResourceType_SHARED_WORKER
    * @tc.desc       : testWeb_ResourceType_SHARED_WORKER
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_SHARED_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_SHARED_WORKER PASS');

      Utils.emitEvent("emitWeb_ResourceType_SHARED_WORKER", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_SHARED_WORKER", true, 1011, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0012
    * @tc.name       : testWeb_ResourceType_PREFETCH
    * @tc.desc       : testWeb_ResourceType_PREFETCH
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_PREFETCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_PREFETCH PASS');

      Utils.emitEvent("emitWeb_ResourceType_PREFETCH", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_PREFETCH", true, 1012, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0013
    * @tc.name       : testWeb_ResourceType_FAVICON
    * @tc.desc       : testWeb_ResourceType_FAVICON
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_FAVICON PASS');

      Utils.emitEvent("emitWeb_ResourceType_FAVICON", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_FAVICON", true, 1013, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0014
    * @tc.name       : testWeb_ResourceType_XHR
    * @tc.desc       : testWeb_ResourceType_XHR
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_XHR PASS');

      Utils.emitEvent("emitWeb_ResourceType_XHR", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_XHR", true, 1014, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0015
    * @tc.name       : testWeb_ResourceType_PING
    * @tc.desc       : testWeb_ResourceType_PING
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_PING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_PING PASS');

      Utils.emitEvent("emitWeb_ResourceType_PING", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_PING", true, 1015, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0016
    * @tc.name       : testWeb_ResourceType_SERVICE_WORKER
    * @tc.desc       : testWeb_ResourceType_SERVICE_WORKER
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_SERVICE_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_SERVICE_WORKER PASS');

      Utils.emitEvent("emitWeb_ResourceType_SERVICE_WORKER", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_SERVICE_WORKER", true, 1016, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0017
    * @tc.name       : testWeb_ResourceType_CSP_REPORT
    * @tc.desc       : testWeb_ResourceType_CSP_REPORT
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_CSP_REPORT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_CSP_REPORT PASS');

      Utils.emitEvent("emitWeb_ResourceType_CSP_REPORT", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_CSP_REPORT", true, 1017, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0018
    * @tc.name       : testWeb_ResourceType_PLUGIN_RESOURCE
    * @tc.desc       : testWeb_ResourceType_PLUGIN_RESOURCE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_PLUGIN_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_PLUGIN_RESOURCE PASS');

      Utils.emitEvent("emitWeb_ResourceType_PLUGIN_RESOURCE", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_PLUGIN_RESOURCE", true, 1018, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0019
    * @tc.name       : testWeb_ResourceType_PRELOAD_MAIN
    * @tc.desc       : testWeb_ResourceType_PRELOAD_MAIN
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_PRELOAD_MAIN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_PRELOAD_MAIN PASS');

      Utils.emitEvent("emitWeb_ResourceType_PRELOAD_MAIN", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_PRELOAD_MAIN", true, 1019, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0020
    * @tc.name       : testWeb_ResourceType_PRELOAD_SUB
    * @tc.desc       : testWeb_ResourceType_PRELOAD_SUB
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceType_PRELOAD_SUB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_PRELOAD_SUB PASS');

      Utils.emitEvent("emitWeb_ResourceType_PRELOAD_SUB", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceType_PRELOAD_SUB", true, 1020, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0021
    * @tc.name       : testWebViewFrameUrl
    * @tc.desc       : testWebViewFrameUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebViewFrameUrl PASS');

      Utils.emitEvent("emitWebViewFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebViewFrameUrl", true, 1021, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0022
    * @tc.name       : testWebViewServiceWorkerFrameUrl
    * @tc.desc       : testWebViewServiceWorkerFrameUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewServiceWorkerFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebViewServiceWorkerFrameUrl PASS');

      Utils.emitEvent("emitWebViewServiceWorkerFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebViewServiceWorkerFrameUrl", true, 1022, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0023
    * @tc.name       : testWebViewLoadUrlFrameUrl
    * @tc.desc       : testWebViewLoadUrlFrameUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewLoadUrlFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebViewLoadUrlFrameUrl PASS');

      Utils.emitEvent("emitWebViewLoadUrlFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebViewLoadUrlFrameUrl", true, 1023, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0024
    * @tc.name       : testWebViewSubFrameUrl
    * @tc.desc       : testWebViewSubFrameUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewSubFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebViewSubFrameUrl PASS');

      Utils.emitEvent("emitWebViewSubFrameUrl", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebViewSubFrameUrl", true, 1024, done);
      sendEventByKey('webHostingButton', 10, '');
    })


  })
}
