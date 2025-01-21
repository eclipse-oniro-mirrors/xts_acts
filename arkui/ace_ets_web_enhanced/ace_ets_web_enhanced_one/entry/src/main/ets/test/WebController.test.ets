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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0100
    * @tc.name       : testAccessBackward001
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward001", false, 31011, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0100
    * @tc.name       : testAccessStep001
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep001", false, 31015, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0200
    * @tc.name       : testAccessStep002
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep002", true, 100089, done);
      sendEventByKey('WebControllerButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0300
    * @tc.name       : testAccessStep003
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep003", false, 100090, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0400
    * @tc.name       : testAccessStep004
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep004", true, 100091, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0500
    * @tc.name       : testAccessStep005
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep005', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep005", false, 100092, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0600
    * @tc.name       : testAccessStep006
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep006', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep006", true, 100093, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0700
    * @tc.name       : testAccessStep007
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep007', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep007", false, 100094, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSSTEP_0800
    * @tc.name       : testAccessStep008
    * @tc.desc       : test accessStep
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep008', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep008", true, 100095, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_REFRESH_0100
    * @tc.name       : testRefresh001
    * @tc.desc       : test refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh001', 0, async (done: Function) => {
      Utils.emitEvent("testRefresh001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefresh001", "\"index\"", 31006, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_REGISTERJAVASCRIPTPROXY_0100
    * @tc.name       : testRegisterJavaScriptProxy001
    * @tc.desc       : test registerJavaScriptProxy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRegisterJavaScriptProxy001', 0, async (done: Function) => {
      Utils.emitEvent("testRegisterJavaScriptProxy001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRegisterJavaScriptProxy001", "backToEts", 31008, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0200
    * @tc.name       : testAccessBackward002
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward002", true, 31012, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0300
    * @tc.name       : testAccessBackward003
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward003", false, 200006, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSBACKWARD_0400
    * @tc.name       : testAccessBackward004
    * @tc.desc       : test accessBackward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward004", true, 200007, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETEJAVASCRIPTREGISTER_0100
    * @tc.name       : testDeleteJavaScriptRegister001
    * @tc.desc       : test deleteJavaScriptRegister
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteJavaScriptRegister001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteJavaScriptRegister001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteJavaScriptRegister001", true, 31009, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINACTIVE_0100
    * @tc.name       : testOnInactive001
    * @tc.desc       : test onInactive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnInactive001', 0, async (done: Function) => {
      Utils.emitEvent("testOnInactive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInactive001", true, 31000, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONACTIVE_0100
    * @tc.name       : testOnActive001
    * @tc.desc       : test onActive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnActive001', 0, async (done: Function) => {
      Utils.emitEvent("testOnActive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnActive001", "resource://rawfile/webPart1index.html", 31001, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CLEARHISTORY_0100
    * @tc.name       : testClearHistory001
    * @tc.desc       : test clearHistory
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearHistory001', 0, async (done: Function) => {
      Utils.emitEvent("testClearHistory001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearHistory001", false, 31003, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_RUNJAVASCRIPT_0100
     * @tc.name       : testRunJavaScript001
     * @tc.desc       : test runJavaScript
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRunJavaScript001', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript001", "\"testRunJavaScript\"", 31004, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_LOADDATA_0100
     * @tc.name       : testLoadData001
     * @tc.desc       : test loadData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadData001', 0, async (done: Function) => {
      Utils.emitEvent("testLoadData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadData001", "\"LoadData\"", 31005, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0100
    * @tc.name       : testLoadUrl001
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl001", true, 31018, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0200
    * @tc.name       : testLoadUrl002
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl002', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl002", 'OpenAtom OpenHarmony', 76000, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0300
    * @tc.name       : testLoadUrl003
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl003', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl003", 'second', 76002, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0400
    * @tc.name       : testLoadUrl004
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl004', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl004", 'second', 76004, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_STOP_0100
    * @tc.name       : testStop001
    * @tc.desc       : test stop
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStop001', 0, async (done: Function) => {
      Utils.emitEvent("testStop001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStop001", true, 31007, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0100
    * @tc.name       : testAccessForward001
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward001", false, 31013, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0200
    * @tc.name       : testAccessForward002
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward002", true, 31014, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0300
    * @tc.name       : testAccessForward003
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward003", false, 200008, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ACCESSFORWARD_0400
    * @tc.name       : testAccessForward004
    * @tc.desc       : test accessForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward004", true, 200009, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0100
    * @tc.name       : testBackward001
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward001", "\"index\"", 31016, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0200
    * @tc.name       : testBackward002
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward001", "\"index\"", 200010, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKWARD_0300
    * @tc.name       : testBackward003
    * @tc.desc       : test backward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackward003', 0, async (done: Function) => {
      Utils.emitEvent("testBackward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackward003", "\"second\"", 200011, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0100
    * @tc.name       : testForward001
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward001', 0, async (done: Function) => {
      Utils.emitEvent("testForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward001", true, 31017, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0200
    * @tc.name       : testForward002
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward002', 0, async (done: Function) => {
      Utils.emitEvent("testForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward002", '"LoadData"', 100087, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORWARD_0300
    * @tc.name       : testForward003
    * @tc.desc       : test forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForward003', 0, async (done: Function) => {
      Utils.emitEvent("testForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForward003", '"index"', 100088, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0100
    * @tc.name       : testImageAccess001
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testImageAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess001", "null", 33023, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0200
    * @tc.name       : testImageAccess002
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testImageAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess002", "\"load complete\"", 33024, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DOMSTORAGEACCESS_0100
    * @tc.name       : testDomStorageAccess001
    * @tc.desc       : test domStorageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDomStorageAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testDomStorageAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDomStorageAccess001", "\"sorry\"", 33025, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DOMSTORAGEACCESS_0200
    * @tc.name       : testDomStorageAccess002
    * @tc.desc       : test domStorageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDomStorageAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testDomStorageAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDomStorageAccess002", "\"domapi\"", 33026, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0100
    * @tc.name       : testOnlineImageAccess001
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnlineImageAccess001", "null", 33027, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0200
    * @tc.name       : testOnlineImageAccess002
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess002", "\"load image complete\"", 33028, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0100
    * @tc.name       : testFileAccess001
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testFileAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileAccess001", "\"second\"", 33029, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0200
    * @tc.name       : testFileAccess002
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testFileAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileAccess002", "\"second\"", 100070, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_REQUESTFOCUS_0100
    * @tc.name       : testRequestFocus001
    * @tc.desc       : test requestFocus
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRequestFocus001', 0, async (done: Function) => {
      Utils.emitEvent("testRequestFocus001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRequestFocus001", true, 33030, done);
      sendEventByKey('WebControllerButton', 10, '');
    })
  })
}
