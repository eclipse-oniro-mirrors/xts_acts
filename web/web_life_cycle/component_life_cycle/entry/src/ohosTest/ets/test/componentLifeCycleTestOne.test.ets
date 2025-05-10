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
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function componentLifeCycleTestOne() {

  describe('componentLifeCycleTestOne', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/componentLifeCycleTestOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get componentLifeCycleTestOne state success " + JSON.stringify(pages));
        if (!("componentLifeCycleTestOne" == pages.name)) {
          console.info("get componentLifeCycleTestOne state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push componentLifeCycleTestOne page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push componentLifeCycleTestOne page error: " + err);
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
      console.info("componentLifeCycleTestOne beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_004
     *tc.name onRenderExited
     *tc.desic Triggered when the render process exits
    */
    it('onRenderExited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnRenderExited", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onRenderExited", 2, 106, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_007                                                                                                                                                                 
     *tc.name onInactive                                                                                                                                                                                                               
     *tc.desic make web component inactive
     */
    it('onInactive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitonInactive", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInactive", "baidu", 7, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_008                                                                                                                                                              
     *tc.name make web component active                                                                                                                                                                                                               
     *tc.desic return whether the third party cookie is allowed
     */
    it('onActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitonActive", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onActive", "index", 8, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2000
     *tc.name testOnActiveInitErr
     *tc.desc test interface of onActive with not been associated with specific Web Components
     */
    it('testOnActiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnActiveInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActiveInitErr", "17100001", 638, done);
      Utils.registerEvent("testOnActiveInitErr", "Init error. The WebviewController must be associated with a Web component", 639, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2100
     *tc.name testOnInactiveInitErr
     *tc.desc test interface of onInactive with not been associated with specific Web Components
     */
    it('testOnInactiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnInactiveInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactiveInitErr", "17100001", 640, done);
      Utils.registerEvent("testOnInactiveInitErr", "Init error. The WebviewController must be associated with a Web component", 641, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINACTIVE_0100
    * @tc.name       : testOnInactive001
    * @tc.desc       : test onInactive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnInactive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnInactive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactive001", true, 31000, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONACTIVE_0100
    * @tc.name       : testOnActive001
    * @tc.desc       : test onActive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnActive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnActive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActive001", "resource://rawfile/webPart1index.html", 31001, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ONINACTIVE_0100
    * @tc.name       : testOnInactive002
    * @tc.desc       : test onInactive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnInactive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnInactive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactive002", "second", 100077, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ONACTIVE_0100
    * @tc.name       : testOnActive002
    * @tc.desc       : test onActive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnActive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnActive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActive002", "second", 100078, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONCONTROLLERATTACHED_0100
    * @tc.name       : testOnControllerAttached001
    * @tc.desc       : test onControllerAttached
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnControllerAttached001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnControllerAttached", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnControllerAttached001", true, 1221, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETRENDERPROCESSMODE_API_0500
    * @tc.name       : testWebViewSetRenderProcessMode
    * @tc.desc       : test setRenderProcessMode
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebViewSetRenderProcessMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetRenderProcessMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitSetRenderProcessMode", true, 10005, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0001
     *@tc.name testWebViewGetAndSetRenderProcessMode01
     *@tc.desc test getRenderProcessMode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewGetAndSetRenderProcessMode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await Utils.emitEvent("emitWebViewGetAndSetRenderProcessMode01", 10);
      Utils.registerEvent("testWebViewGetAndSetRenderProcessMode01", 'success', 8006, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0002
     *@tc.name testWebViewGetAndSetRenderProcessMode02
     *@tc.desc test setRenderProcessMode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewGetAndSetRenderProcessMode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await Utils.emitEvent("emitWebViewGetAndSetRenderProcessMode02", 10);
      Utils.registerEvent("testWebViewGetAndSetRenderProcessMode02", 'success', 8007, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_OnRenderProcessResponding_API_0001
     *@tc.name testWebViewOnRenderProcessResponding
     *@tc.desc OnRenderProcessResponding
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewOnRenderProcessResponding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await Utils.emitEvent("emitWebViewOnRenderProcessResponding", 10);
      Utils.registerEvent("testWebViewOnRenderProcessResponding", true, 1336, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT_API_0002
     *@tc.name testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     *@tc.desc NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await Utils.emitEvent("emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT", 10);
      Utils.registerEvent("testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT", true, 1338, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })
  })
}
