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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ''
const  driver = Driver.create();
export default function ActsAceWebViewWebResourceTypeProps2() {
  describe('ActsAceWebViewWebResourceTypeProps2', () => {

      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/webViewWebResourceTypeProps2',
        }

        try {
          router.clear();
          let pages = router.getState();
          console.info("get webViewGetFrameUrlResourceType2 state success " + JSON.stringify(pages));
          if (!("webViewGetFrameUrlResourceType2" == pages.name)) {
            console.info("get webViewGetFrameUrlResourceType2 state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            console.info("push webViewGetFrameUrlResourceType2 state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webViewGetFrameUrlResourceType2 page error:" + err);
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
       * @tc.name   testWebView_webResourceType_SUB_RESOURCE
       * @tc.number SUB_ACE_WEB_NET_RESOURCETYPE_0700
       * @tc.desc   test webResourceType SUB_RESOURCE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testWebView_webResourceType_SUB_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_SUB_RESOURCE"
        Utils.emitEvent(emitKey, 142021);
        let isReturn = false;
        Utils.registerEvent("testWebView_webResourceType_SUB_RESOURCE", true, 142060, ()=>{isReturn = true});
        Utils.waitAndClickComponent("webViewWebResourceTypeProps2",driver);
        await waitForExist(()=>isReturn, "emitWebView_webResourceType_SUB_RESOURCE", true,1000);
        done();
      })
      /**
       * @tc.name   testWebView_webResourceType_SERVICE_WORKER
       * @tc.number SUB_ACE_WEB_NET_RESOURCETYPE_1600
       * @tc.desc   test webResourceType SERVICE_WORKER
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testWebView_webResourceType_SERVICE_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_SERVICE_WORKER"
        Utils.emitEvent(emitKey, 142021);
        let isReturn = false;
        Utils.registerEvent("testWebView_webResourceType_SERVICE_WORKER", true, 142070, ()=>{isReturn = true});
        Utils.waitAndClickComponent("webViewWebResourceTypeProps2",driver);
        await waitForExist(()=>isReturn, "emitWebView_webResourceType_SERVICE_WORKER", true,1000);
        done();
      })

      /**
       * @tc.name   testWebView_webResourceType_PLUGIN_RESOURCE
       * @tc.number SUB_ACE_WEB_NET_RESOURCETYPE_1800
       * @tc.desc   test webResourceType PLUGIN_RESOURCE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testWebView_webResourceType_PLUGIN_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_PLUGIN_RESOURCE"
        Utils.emitEvent(emitKey, 142021);
        let isReturn = false;
        Utils.registerEvent("testWebView_webResourceType_PLUGIN_RESOURCE", true, 142080, ()=>{isReturn = true});
        Utils.waitAndClickComponent("webViewWebResourceTypeProps2",driver);
        await waitForExist(()=>isReturn, "emitWebView_webResourceType_PLUGIN_RESOURCE", true,1000);
        done();
      })

      /**
       * @tc.name   testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME
       * @tc.number SUB_ACE_WEB_NET_RESOURCETYPE_1900
       * @tc.desc   test webResourceType NAVIGATION_PRELOAD_MAIN_FRAME
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME"
        Utils.emitEvent(emitKey, 142021);
        let isReturn = false;
        Utils.registerEvent("testWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME", true, 142090, ()=>{isReturn = true});
        Utils.waitAndClickComponent("webViewWebResourceTypeProps2",driver);
        await waitForExist(()=>isReturn, "emitWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME", true,1000);
        done();
      })


    /**
     * @tc.name   testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME
     * @tc.number SUB_ACE_WEB_NET_RESOURCETYPE_2000
     * @tc.desc   test webResourceType NAVIGATION_PRELOAD_SUB_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME"
      Utils.emitEvent(emitKey, 142021);
      let isReturn = false;
      Utils.registerEvent("testWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME", true, 142100, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webViewWebResourceTypeProps2",driver);
      await waitForExist(()=>isReturn, "emitWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME", true,1000);
      done();
    })
 })
}
