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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function webGetTitleJsunit() {
  describe('webGetTitleTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/web',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get web state success " + JSON.stringify(pages));
        if (!("web" == pages.name)) {
          console.info("get web state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push web page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push web page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("webGetTitle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testwebGetTitle0002
     * @tc.desic         acewebGetTitleEtsTest0002
     */
    it('testwebGetTitle0001', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0001] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.height).assertEqual("500.00vp");
      console.info("[testwebGetTitle0001] height value :" + obj.$attrs.height);
      done();
    });

    it('testwebGetTitle0002', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0002] component fileAccess strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.fileAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0002] fileAccess value :" + obj.$attrs.fileAccess);
      done();
    });

    it('testwebGetTitle0003', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0003] component javaScriptAccess strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.javaScriptAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0003] javaScriptAccess value :" + obj.$attrs.javaScriptAccess);
      done();
    });

    it('testwebGetTitle0004', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0004] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.padding).assertEqual("20.00vp");
      console.info("[testwebGetTitle0004] padding value :" + obj.$attrs.padding);
      done();
    });

    it('testwebGetTitle0005', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0005] component blur strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.blur).assertEqual(2);
      console.info("[testwebGetTitle0005] blur value :" + obj.$attrs.blur);
      done();
    });

    it('testwebGetTitle0006', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0006] component userAgent strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.userAgent).assertEqual(undefined);
      console.info("[testwebGetTitle0006] userAgent value :" + obj.$attrs.userAgent);
      done();
    });

    it('testwebGetTitle0007', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0007] component fileFromUrlAccess strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.fileFromUrlAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0007] fileFromUrlAccess value :" + obj.$attrs.fileFromUrlAccess);
      done();
    });

    it('testwebGetTitle0008', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0008 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0008] component initialScale strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(obj.$attrs.initialScale).assertEqual(undefined);
      console.info("[testwebGetTitle0008] initialScale value :" + obj.$attrs.initialScale);
      done();
    });

    it('testwebGetTitle0009', 0, async function (done) {
      console.info('webGetTitle testwebGetTitle0009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0009] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      console.info("[testwebGetTitle0009] type value :" + obj.$type);
      done();
    });
  })
}
