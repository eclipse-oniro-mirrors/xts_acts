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
import { Driver, ON } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const  driver = Driver.create();
export default function webviewApi() {

  describe('webResourceType', () => {
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
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_ENHANCE_TWO_0001
    * @tc.name       : testWeb_ResourceType_MAIN_FRAME
    * @tc.desc       : testWeb_ResourceType_MAIN_FRAME
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWeb_ResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceType_MAIN_FRAME PASS');

      Utils.emitEvent("emitWeb_ResourceType_MAIN_FRAME", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_MAIN_FRAME", true, 147860, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitWeb_ResourceType_MAIN_FRAME', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_SUB_FRAME", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_SUB_FRAME", true, 147870, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_SUB_FRAME', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_STYLE_SHEET", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_MAIN_FRAME", true, 147880, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_MAIN_FRAME', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_SCRIPT", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_SCRIPT", true, 147890, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_SCRIPT', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_IMAGE", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_IMAGE", true, 147900, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_IMAGE', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_FONT_RESOURCE", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_FONT_RESOURCE", true, 147910, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_FONT_RESOURCE', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_SUB_RESOURCE", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_SUB_RESOURCE", true, 147920, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_SUB_RESOURCE', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_OBJECT", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_OBJECT", true, 147930, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_OBJECT', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_MEDIA", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_MEDIA", true, 147940, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_MEDIA', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_WORKER", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_WORKER", true, 147950, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_WORKER', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_SHARED_WORKER", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_SHARED_WORKER", true, 147960, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_SHARED_WORKER', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_PREFETCH", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_PREFETCH", true, 147970, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_PREFETCH', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_FAVICON", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_FAVICON", true, 147980, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_FAVICON', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_XHR", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_XHR", true, 147990, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_XHR', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_PING", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_PING", true, 148510, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_PING', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_SERVICE_WORKER", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_SERVICE_WORKER", true, 148520, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_SERVICE_WORKER', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_CSP_REPORT", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_CSP_REPORT", true, 148530, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_CSP_REPORT', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_PLUGIN_RESOURCE", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_PLUGIN_RESOURCE", true, 148540, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_PLUGIN_RESOURCE', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_PRELOAD_MAIN", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_PRELOAD_MAIN", true, 148550, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_PRELOAD_MAIN', true,1000);
      done();
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

      Utils.emitEvent("emitWeb_ResourceType_PRELOAD_SUB", 147811)
      let isReturn = false;
      Utils.registerEvent("testWeb_ResourceType_PRELOAD_SUB", true, 148560, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWeb_ResourceType_PRELOAD_SUB', true,1000);
      done();
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

      Utils.emitEvent("emitWebViewFrameUrl", 147811)
      let isReturn = false;
      Utils.registerEvent("testWebViewFrameUrl", true, 148570, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWebViewFrameUrl', true,1000);
      done();
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

      Utils.emitEvent("emitWebViewServiceWorkerFrameUrl", 147811)
      let isReturn = false;
      Utils.registerEvent("testWebViewServiceWorkerFrameUrl", true, 148580, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWebViewServiceWorkerFrameUrl', true,1000);
      done();
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

      Utils.emitEvent("emitWebViewLoadUrlFrameUrl", 147811)
      let isReturn = false;
      Utils.registerEvent("testWebViewLoadUrlFrameUrl", true, 148590, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'emitWebViewLoadUrlFrameUrl', true,1000);
      done();
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

      Utils.emitEvent("emitWebViewSubFrameUrl", 147811)
      let isReturn = false;
      Utils.registerEvent("testWebViewSubFrameUrl", true, 148600, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver)
      await waitForExist(()=>isReturn, 'testWebViewSubFrameUrl', true,1000);
      done();
    })
  })
}
