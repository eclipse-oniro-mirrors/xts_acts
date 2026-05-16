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
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
const  driver = Driver.create();
export default function ActsAceWebViewWebResourceTypeProps() {
  describe('ActsAceWebViewWebResourceTypeProps', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewWebResourceTypeProps',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages));
            if (!("webViewGetFrameUrlResourceType" == pages.name)) {
                console.info("get webViewGetFrameUrlResourceType state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
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
        done();
    })

    /**
     * @tc.name   testWebView_webResourceType_MAIN_FRAME
     * @tc.number SUB_ACE_WEB_webResourceType_MAIN_FRAME_0001
     * @tc.desc   test webResourceType MAIN_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_MAIN_FRAME"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_MAIN_FRAME", true, 124500, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_SUB_FRAME
     * @tc.number SUB_ACE_WEB_webResourceType_SUB_FRAME_0001
     * @tc.desc   test webResourceType SUB_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SUB_FRAME"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_SUB_FRAME", true, 124510, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_STYLE_SHEET
     * @tc.number SUB_ACE_WEB_webResourceType_STYLE_SHEET_0001
     * @tc.desc   test webResourceType STYLE_SHEET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_STYLE_SHEET"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_STYLE_SHEET", true, 124520, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_SCRIPT
     * @tc.number SUB_ACE_WEB_webResourceType_SCRIPT_0001
     * @tc.desc   test webResourceType SCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SCRIPT"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_SCRIPT", true, 124530, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_IMAGE
     * @tc.number SUB_ACE_WEB_webResourceType_IMAGE_0001
     * @tc.desc   test webResourceType IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_IMAGE"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_IMAGE", true, 124540, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_FONT_RESOURCE
     * @tc.number SUB_ACE_WEB_webResourceType_FONT_RESOURCE_0001
     * @tc.desc   test webResourceType FONT_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_FONT_RESOURCE"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_FONT_RESOURCE", true, 124550, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_OBJECT
     * @tc.number SUB_ACE_WEB_webResourceType_OBJECT_0001
     * @tc.desc   test webResourceType OBJECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_OBJECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_OBJECT"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_OBJECT", true, 124560, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_MEDIA
     * @tc.number SUB_ACE_WEB_webResourceType_MEDIA_0001
     * @tc.desc   test webResourceType MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_MEDIA"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_MEDIA", true, 124570, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_WORKER
     * @tc.number SUB_ACE_WEB_webResourceType_WORKER_0001
     * @tc.desc   test webResourceType WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_WORKER"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_WORKER", true, 124580, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_SHARED_WORKER
     * @tc.number SUB_ACE_WEB_webResourceType_SHARED_WORKER_0001
     * @tc.desc   test webResourceType SHARED_WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_SHARED_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_SHARED_WORKER"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_SHARED_WORKER", true, 124590, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_PREFETCH
     * @tc.number SUB_ACE_WEB_webResourceType_PREFETCH_0001
     * @tc.desc   test webResourceType PREFETCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_PREFETCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_PREFETCH"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_PREFETCH", true, 124600, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_FAVICON
     * @tc.number SUB_ACE_WEB_webResourceType_FAVICON_0001
     * @tc.desc   test webResourceType FAVICON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_FAVICON"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_FAVICON", true, 124610, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebView_webResourceType_XHR
     * @tc.number SUB_ACE_WEB_webResourceType_XHR_0001
     * @tc.desc   test webResourceType XHR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_XHR"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_XHR", true, 124620, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   testWebView_webResourceType_PING
     * @tc.number SUB_ACE_WEB_webResourceType_PING_0001
     * @tc.desc   test webResourceType PING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_PING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_PING"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_PING", true, 124630, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_CSP_REPORT
     * @tc.number SUB_ACE_WEB_webResourceType_CSP_REPORT_0001
     * @tc.desc   test webResourceType CSP_REPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_CSP_REPORT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_CSP_REPORT"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_CSP_REPORT", true, 124640, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })

    /**
     * @tc.name   testWebView_webResourceType_Other_Props
     * @tc.number SUB_ACE_WEB_webResourceType_Other_Props_0001
     * @tc.desc   test webResourceType Other_Props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_Other_Props', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_Other_Props"
      Utils.emitEvent(emitKey, 124511);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_Other_Props", true, 124650, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps",driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
  })
}
