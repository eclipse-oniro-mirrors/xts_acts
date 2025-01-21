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

export default function webViewStyleJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('webViewStyleTest1', function () {
    beforeEach(async function (done) {
     console.info("webViewStyleTest beforeEach start");
      let options = {
        uri: 'pages/webStyle',
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
     * @tc.name      testWebViewWidthPer
     * @tc.desc      aceEtsTest
     */
    it('testWebViewWidthPer', 0, async function (done) {
      console.info("testWebViewWidthPer START");
      let strJson = getInspectorByKey('webViewWidthPer');
      console.log("testWebViewWidthPer strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewWidthPer  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewWidthPer style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewWidthPer type" + JSON.stringify(obj.$type))
      console.info("testWebViewWidthPer type: " + JSON.stringify(obj.$type));
      expect(style.width).assertEqual('30%');
      console.info("testWebViewWidthPer width is: " + JSON.stringify(style.width));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewWidthPx
    * @tc.desc      aceEtsTest
    */
    it('testWebViewWidthPx', 0, async function (done) {
      console.info("testWebViewWidthPx START");
      let strJson = getInspectorByKey('webViewWidthPx');
      console.log("testWebViewWidthPx strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewWidthPx  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewWidthPx style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewWidthPx type" + JSON.stringify(obj.$type))
      console.info("testWebViewWidthPx type: " + JSON.stringify(obj.$type));
      expect(style.width).assertEqual("100");
      console.info("testWebViewWidthPx width is: " + JSON.stringify(style.width));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewHeightPer
    * @tc.desc      aceEtsTest
    */
    it('testWebViewHeightPer', 0, async function (done) {
      console.info("testWebViewHeightPer START");
      let strJson = getInspectorByKey('webViewHeightPer');
      console.log("testWebViewHeightPer strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewHeightPer  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewHeightPer style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewHeightPer type" + JSON.stringify(obj.$type))
      console.info("testWebViewHeightPer type: " + JSON.stringify(obj.$type));
      expect(style.height).assertEqual('80%');
      console.info("testWebViewHeightPer height is: " + JSON.stringify(style.height));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewHeightPx
    * @tc.desc      aceEtsTest
    */
    it('testWebViewHeightPx', 0, async function (done) {
      console.info("testWebViewHeightPx START");
      let strJson = getInspectorByKey('webViewHeightPx');
      console.log("testWebViewHeightPx strJson" + JSON.stringify(strJson))
      let obj = JSON.parse(strJson);
      console.log("testWebViewHeightPx  obj" + JSON.stringify(obj))
      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewHeightPx style" + JSON.stringify(style))
      expect(obj.$type).assertEqual('web');
      console.log("testWebViewHeightPx type" + JSON.stringify(obj.$type))
      console.info("testWebViewHeightPx type: " + JSON.stringify(obj.$type));
      expect(style.height).assertEqual("50");
      console.info("testWebViewHeightPx height is: " + JSON.stringify(style.height));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewPaddingAll
    * @tc.desc      aceEtsTest
    */
    it('testWebViewPaddingAll', 0, async function (done) {
      console.info("testWebViewPaddingAll START");

      let strJson = getInspectorByKey('webViewPaddingAll');
      console.log("testWebViewPaddingAll strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewPaddingAll  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewPaddingAll style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewPaddingAll type" + JSON.stringify(obj.$type))

      expect(style.padding).assertEqual("10");
      console.info("testWebViewPaddingAll padding is: " + JSON.stringify(style.padding));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewPadding
    * @tc.desc      aceEtsTest
    */
    it('testWebViewPadding', 0, async function (done) {
      console.info("testWebViewPadding START");

      let strJson = getInspectorByKey('webViewPadding');
      console.log("testWebViewPadding strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewPadding  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewPadding style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewPadding type" + JSON.stringify(obj.$type))

      expect(style.padding).assertEqual("{left:10,right:5,top:5,bottom:5}");
      console.info("testWebViewPadding padding is: " + JSON.stringify(style.padding));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewMarginAll
    * @tc.desc      aceEtsTest
    */
    it('testWebViewMarginAll', 0, async function (done) {
      console.info("testWebViewMarginAll START");

      let strJson = getInspectorByKey('webViewMarginAll');
      console.log("testWebViewMarginAll strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewMarginAll  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewMarginAll style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewMarginAll type" + JSON.stringify(obj.$type))

      expect(style.margin).assertEqual("10");
      console.info("testWebViewMarginAll margin is: " + JSON.stringify(style.margin));
      done();
    });

    /**
   * @tc.number    SUB_ACE_BASIC_ETS_API_0600
   * @tc.name      testWebViewMargin
   * @tc.desc      aceEtsTest
   */
    it('testWebViewMargin', 0, async function (done) {
      console.info("testWebViewMargin START");

      let strJson = getInspectorByKey('webViewMargin');
      console.log("testWebViewMargin strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewMargin  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewMargin style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewMargin type" + JSON.stringify(obj.$type))

      expect(style.margin).assertEqual("{left:10,right:5,top:5,bottom:5}");
      console.info("testWebViewMargin margin is: " + JSON.stringify(style.margin));
      done();
    });

    /**
  * @tc.number    SUB_ACE_BASIC_ETS_API_0600
  * @tc.name      testWebViewBorderAll
  * @tc.desc      aceEtsTest
  */
    it('testWebViewBorderAll', 0, async function (done) {
      console.info("testWebViewBorderAll START");

      let strJson = getInspectorByKey('webViewBorderAll');
      console.log("testWebViewBorderAll strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderAll  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderAll style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderAll type" + JSON.stringify(obj.$type))

      expect(style.border).assertEqual("{width:2,color:0x317AF7,radius:5,style:BorderStyle.Dashed}");
      console.info("testWebViewBorderAll border is: " + JSON.stringify(style.border));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderWidth
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderWidth', 0, async function (done) {
      console.info("testWebViewBorderWidth START");

      let strJson = getInspectorByKey('webViewBorderWidth');
      console.log("testWebViewBorderWidth strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderWidth  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderWidth style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderWidth type" + JSON.stringify(obj.$type))

      expect(style.borderWidth).assertEqual("3");
      console.info("testWebViewBorderWidth borderWidth is: " + JSON.stringify(style.borderWidth));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderColor
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderColor', 0, async function (done) {
      console.info("testWebViewBorderColor START");

      let strJson = getInspectorByKey('webViewBorderColor');
      console.log("testWebViewBorderColor strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderColor  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderColor style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderColor type" + JSON.stringify(obj.$type))

      expect(style.borderColor).assertEqual("0x317AF7");
      console.info("testWebViewBorderColor borderColor is: " + JSON.stringify(style.borderColor));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderRadius
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderRadius', 0, async function (done) {
      console.info("testWebViewBorderRadius START");

      let strJson = getInspectorByKey('webViewBorderRadius');
      console.log("testWebViewBorderRadius strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderRadius  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderRadius style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderRadius type" + JSON.stringify(obj.$type))

      expect(style.borderRadius).assertEqual("6");
      console.info("testWebViewBorderRadius borderRadius is: " + JSON.stringify(style.borderRadius));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderStyleDashed
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderStyleDashed', 0, async function (done) {
      console.info("testWebViewBorderStyleDashed START");

      let strJson = getInspectorByKey('webViewBorderStyleDashed');
      console.log("testWebViewBorderStyleDashed strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderStyleDashed  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderStyleDashed style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderStyleDashed type" + JSON.stringify(obj.$type))

      expect(style.borderStyle).assertEqual("BorderStyle.Dashed");
      console.info("testWebViewBorderStyleDashed borderStyle is: " + JSON.stringify(style.borderStyle));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderStyleSolid
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderStyleSolid', 0, async function (done) {
      console.info("testWebViewBorderStyleSolid START");

      let strJson = getInspectorByKey('webViewBorderStyleSolid');
      console.log("testWebViewBorderStyleSolid strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderStyleSolid  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderStyleSolid style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderStyleSolid type" + JSON.stringify(obj.$type))

      expect(style.borderStyle).assertEqual("BorderStyle.Solid");
      console.info("testWebViewBorderStyleSolid borderStyle is: " + JSON.stringify(style.borderStyle));
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0600
    * @tc.name      testWebViewBorderStyleDotted
    * @tc.desc      aceEtsTest
    */
    it('testWebViewBorderStyleDotted', 0, async function (done) {
      console.info("testWebViewBorderStyleDotted START");

      let strJson = getInspectorByKey('webViewBorderStyleDotted');
      console.log("testWebViewBorderStyleDotted strJson" + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.log("testWebViewBorderStyleDotted  obj" + JSON.stringify(obj))

      let style = JSON.parse(obj.$attrs)
      console.log("testWebViewBorderStyleDotted style" + JSON.stringify(style))

      expect(obj.$type).assertEqual('web');
      console.log("testWebViewBorderStyleDotted type" + JSON.stringify(obj.$type))

      expect(style.borderStyle).assertEqual("BorderStyle.Dotted");
      console.info("testWebViewBorderStyleDotted borderStyle is: " + JSON.stringify(style.borderStyle));
      done();
    });
  })
}
