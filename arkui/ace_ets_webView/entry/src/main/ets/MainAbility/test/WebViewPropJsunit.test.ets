/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function webViewPropJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('webViewStyleTest', function () {
    beforeEach(async function (done) {
     console.info("webViewStyleTest beforeEach start");
      let options = {
        uri: 'pages/webProp',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webView state success " + JSON.stringify(pages));
        if (!("webView" == pages.name)) {
          console.info("get webView state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push webView page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webView page error " + JSON.stringify(result));
      }
      await sleep(4)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("webView after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0600
     * @tc.name      testWebViewDomStorageAccessTrue
     * @tc.desc      aceEtsTest
     */
    it('testWebViewDomStorageAccessTrue', 0, async function (done) {
      console.info("testWebViewDomStorageAccessTrue START");
      let strJson = getInspectorByKey('webViewDomStorageAccessTrue');
      console.log("testWebViewDomStorageAccessTrue strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewDomStorageAccessTrue  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewDomStorageAccessTrue style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewDomStorageAccessTrue type" + JSON.stringify(obj.$type))
      console.info("testWebViewDomStorageAccessTrue type: " + JSON.stringify(obj.$type));
      expect(style.domStorageAccess).assertEqual('true');
      console.info("testWebViewDomStorageAccessTrue domStorageAccess is: " + JSON.stringify(style.domStorageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewDomStorageAccessFalse
    * @tc.desc      aceEtsTest
    */
    it('testWebViewDomStorageAccessFalse', 0, async function (done) {
      console.info("testWebViewDomStorageAccessFalse START");
      let strJson = getInspectorByKey('webViewDomStorageAccessFalse');
      console.log("testWebViewDomStorageAccessFalse strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewDomStorageAccessFalse  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewDomStorageAccessFalse style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewDomStorageAccessFalse type" + JSON.stringify(obj.$type))
      console.info("testWebViewDomStorageAccessFalse type: " + JSON.stringify(obj.$type));
      expect(style.domStorageAccess).assertEqual('false');
      console.info("testWebViewDomStorageAccessFalse domStorageAccess is: " + JSON.stringify(style.domStorageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewFileAccessTrue
    * @tc.desc      aceEtsTest
    */
    it('testWebViewFileAccessTrue', 0, async function (done) {
      console.info("testWebViewFileAccessTrue START");
      let strJson = getInspectorByKey('webViewFileAccessTrue');
      console.log("testWebViewFileAccessTrue strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewFileAccessTrue  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewFileAccessTrue style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewFileAccessTrue type" + JSON.stringify(obj.$type))
      console.info("testWebViewFileAccessTrue type: " + JSON.stringify(obj.$type));
      expect(style.fileAccess).assertEqual('true');
      console.info("testWebViewFileAccessTrue fileAccess is: " + JSON.stringify(style.fileAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewFileAccessFalse
    * @tc.desc      aceEtsTest
    */
    it('testWebViewFileAccessFalse', 0, async function (done) {
      console.info("testWebViewFileAccessFalse START");
      let strJson = getInspectorByKey('webViewFileAccessFalse');
      console.log("testWebViewFileAccessFalse strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewFileAccessFalse  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewFileAccessFalse style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewFileAccessFalse type" + JSON.stringify(obj.$type))
      console.info("testWebViewFileAccessFalse type: " + JSON.stringify(obj.$type));
      expect(style.fileAccess).assertEqual("false");
      console.info("testWebViewFileAccessFalse fileAccess is: " + JSON.stringify(style.fileAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewImageAccessTrue
    * @tc.desc      aceEtsTest
    */
    it('testWebViewImageAccessTrue', 0, async function (done) {
      console.info("testWebViewImageAccessTrue START");

      let strJson = getInspectorByKey('webViewImageAccessTrue');
      console.log("testWebViewImageAccessTrue strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewImageAccessTrue  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewImageAccessTrue style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewImageAccessTrue type" + JSON.stringify(obj.$type))

      expect(style.imageAccess).assertEqual("true");
      console.info("testWebViewImageAccessTrue imageAccess is: " + JSON.stringify(style.imageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewImageAccessFalse
    * @tc.desc      aceEtsTest
    */
    it('testWebViewImageAccessFalse', 0, async function (done) {
      console.info("testWebViewImageAccessFalse START");

      let strJson = getInspectorByKey('webViewImageAccessFalse');
      console.log("testWebViewImageAccessFalse strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewImageAccessFalse  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewImageAccessFalse style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewImageAccessFalse type" + JSON.stringify(obj.$type))

      expect(style.imageAccess).assertEqual("false");
      console.info("testWebViewImageAccessFalse imageAccess is: " + JSON.stringify(style.imageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewJavaScriptAccessTrue
    * @tc.desc      aceEtsTest
    */
    it('testWebViewJavaScriptAccessTrue', 0, async function (done) {
      console.info("testWebViewJavaScriptAccessTrue START");

      let strJson = getInspectorByKey('webViewJavaScriptAccessTrue');
      console.log("testWebViewJavaScriptAccessTrue strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewJavaScriptAccessTrue  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewJavaScriptAccessTrue style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewJavaScriptAccessTrue type" + JSON.stringify(obj.$type))

      expect(style.javaScriptAccess).assertEqual("true");
      console.info("testWebViewJavaScriptAccessTrue javaScriptAccess is: " + JSON.stringify(style.javaScriptAccess));
      done();
    });

    /**
   * @tc.number    SUB_ACE_BASIC_ETS_API_0600
   * @tc.name      testWebViewJavaScriptAccessFalse
   * @tc.desc      aceEtsTest
   */
    it('testWebViewJavaScriptAccessFalse', 0, async function (done) {
      console.info("testWebViewJavaScriptAccessFalse START");

      let strJson = getInspectorByKey('webViewJavaScriptAccessFalse');
      console.log("testWebViewJavaScriptAccessFalse strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewJavaScriptAccessFalse  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewJavaScriptAccessFalse style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewJavaScriptAccessFalse type" + JSON.stringify(obj.$type))

      expect(style.javaScriptAccess).assertEqual("false");
      console.info("testWebViewJavaScriptAccessFalse javaScriptAccess is: " + JSON.stringify(style.javaScriptAccess));
      done();
    });

    /**
  * @tc.number    SUB_ACE_BASIC_ETS_API_0600
  * @tc.name      testWebViewOnlineImageAccessTrue
  * @tc.desc      aceEtsTest
  */
    it('testWebViewOnlineImageAccessTrue', 0, async function (done) {
      console.info("testWebViewOnlineImageAccessTrue START");

      let strJson = getInspectorByKey('webViewOnlineImageAccessTrue');
      console.log("testWebViewOnlineImageAccessTrue strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewOnlineImageAccessTrue  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewOnlineImageAccessTrue style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewOnlineImageAccessTrue type" + JSON.stringify(obj.$type))

      expect(style.onlineImageAccess).assertEqual("true");
      console.info("testWebViewOnlineImageAccessTrue onlineImageAccess is: " + JSON.stringify(style.onlineImageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewOnlineImageAccessFalse
    * @tc.desc      aceEtsTest
    */
    it('testWebViewOnlineImageAccessFalse', 0, async function (done) {
      console.info("testWebViewOnlineImageAccessFalse START");

      let strJson = getInspectorByKey('webViewOnlineImageAccessFalse');
      console.log("testWebViewOnlineImageAccessFalse strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewOnlineImageAccessFalse  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewOnlineImageAccessFalse style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewOnlineImageAccessFalse type" + JSON.stringify(obj.$type))

      expect(style.onlineImageAccess).assertEqual("false");
      console.info("testWebViewOnlineImageAccessFalse onlineImageAccess is: " + JSON.stringify(style.onlineImageAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewZoomAccessTrue
    * @tc.desc      aceEtsTest
    */
    it('testWebViewZoomAccessTrue', 0, async function (done) {
      console.info("testWebViewZoomAccessTrue START");

      let strJson = getInspectorByKey('webViewZoomAccessTrue');
      console.log("testWebViewZoomAccessTrue strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewZoomAccessTrue  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewZoomAccessTrue style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewZoomAccessTrue type" + JSON.stringify(obj.$type))

      expect(style.zoomAccess).assertEqual("true");
      console.info("testWebViewZoomAccessTrue zoomAccess is: " + JSON.stringify(style.zoomAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewZoomAccessFalse
    * @tc.desc      aceEtsTest
    */
    it('testWebViewZoomAccessFalse', 0, async function (done) {
      console.info("testWebViewZoomAccessFalse START");

      let strJson = getInspectorByKey('webViewZoomAccessFalse');
      console.log("testWebViewZoomAccessFalse strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewZoomAccessFalse  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewZoomAccessFalse style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewZoomAccessFalse type" + JSON.stringify(obj.$type))

      expect(style.zoomAccess).assertEqual("false");
      console.info("testWebViewZoomAccessFalse zoomAccess is: " + JSON.stringify(style.zoomAccess));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewMixedModeNone
    * @tc.desc      aceEtsTest
    */
    it('testWebViewMixedModeNone', 0, async function (done) {
      console.info("testWebViewMixedModeNone START");

      let strJson = getInspectorByKey('webViewMixedModeNone');
      console.log("testWebViewMixedModeNone strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewMixedModeNone  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewMixedModeNone style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewMixedModeNone type" + JSON.stringify(obj.$type))

      expect(style.mixedMode).assertEqual(MixedMode.None);
      console.info("testWebViewMixedModeNone mixedMode is: " + JSON.stringify(style.mixedMode));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewMixedModeAll
    * @tc.desc      aceEtsTest
    */
    it('testWebViewMixedModeAll', 0, async function (done) {
      console.info("testWebViewMixedModeAll START");

      let strJson = getInspectorByKey('webViewMixedModeAll');
      console.log("testWebViewMixedModeAll strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewMixedModeAll  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewMixedModeAll style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewMixedModeAll type" + JSON.stringify(obj.$type))

      expect(style.mixedMode).assertEqual(MixedMode.All);
      console.info("testWebViewMixedModeAll mixedMode is: " + JSON.stringify(style.mixedMode));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewMixedModeCompatible
    * @tc.desc      aceEtsTest
    */
    it('testWebViewMixedModeCompatible', 0, async function (done) {
      console.info("testWebViewMixedModeCompatible START");

      let strJson = getInspectorByKey('webViewMixedModeCompatible');
      console.log("testWebViewMixedModeCompatible strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewMixedModeCompatible  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewMixedModeCompatible style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewMixedModeCompatible type" + JSON.stringify(obj.$type))

      expect(style.mixedMode).assertEqual(MixedMode.Dotted);
      console.info("testWebViewMixedModeCompatible mixedMode is: " + JSON.stringify(style.mixedMode));
      done();
    });
  })
}
