/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"

export default function navigationTypeTest() {
  describe('navigationTypeTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/navigationType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationType state success " + JSON.stringify(pages));
        if (!("navigationType" == pages.name)) {
          console.info("get navigationType state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push navigationType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationType page error: " + err);
      }
      done()
    });

    it('ArkUX_Navigation_1600', 0, async function (done) {
      console.info('ArkUX_Navigation_1600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_1600');
          console.info('ArkUX_Navigation_1600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_1600 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.AUTO");
          expect(minContentWidth).assertEqual("50.00vp");
          expect(navBarWidth).assertEqual("100.00vp");
          expect(navBarWidthRange).assertEqual("50.00vp, 300.00vp");
          console.info('ArkUX_Navigation_1600 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    })

    it('ArkUX_Navigation_1700', 0, async function (done) {
      console.info('ArkUX_Navigation_1700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_1700');
          console.info('ArkUX_Navigation_1700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_1700 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.STACK");
          expect(minContentWidth).assertEqual("20000.00vp");
          expect(navBarWidth).assertEqual("15000.00vp");
          expect(navBarWidthRange).assertEqual("10000.00vp, 30000.00vp");
          console.info('ArkUX_Navigation_1700 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    })

    it('ArkUX_Navigation_1800', 0, async function (done) {
      console.info('ArkUX_Navigation_1800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_1800');
          console.info('ArkUX_Navigation_1800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_1800 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.SPLIT");
          expect(minContentWidth).assertEqual("30.00vp");
          expect(navBarWidth).assertEqual("100.00vp");
          expect(navBarWidthRange).assertEqual("10.00vp, 20.00vp");
          console.info('ArkUX_Navigation_1800 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Navigation_1900', 0, async function (done) {
      console.info('ArkUX_Navigation_1900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_1900');
          console.info('ArkUX_Navigation_1900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_1900 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.AUTO");
          expect(minContentWidth).assertEqual("360.00vp");
          expect(navBarWidth).assertEqual("100.00vp");
          expect(navBarWidthRange).assertEqual("240.00vp, 432.00vp");
          console.info('ArkUX_Navigation_1900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Navigation_2000', 0, async function (done) {
      console.info('ArkUX_Navigation_2000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_2000');
          console.info('ArkUX_Navigation_2000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_2000 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.SPLIT");
          expect(minContentWidth).assertEqual("100.00vp");
          expect(navBarWidth).assertEqual("100.00vp");
          expect(navBarWidthRange).assertEqual("100.00vp, 100.00vp");
          console.info('ArkUX_Navigation_2000 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_2000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Navigation_2100', 0, async function (done) {
      console.info('ArkUX_Navigation_2100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Navigation_2100');
          console.info('ArkUX_Navigation_2100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Navigation_2100 obj is: " + JSON.stringify(obj));
          let mode = obj.$attrs.mode
          let minContentWidth = obj.$attrs.minContentWidth
          let navBarWidth = obj.$attrs.navBarWidth
          let navBarWidthRange = obj.$attrs.navBarWidthRange
          expect(mode).assertEqual("NavigationMode.SPLIT");
          expect(minContentWidth).assertEqual("40.00%");
          expect(navBarWidth).assertEqual("30.00%");
          expect(navBarWidthRange).assertEqual("20.00%, 50.00%");
          console.info('ArkUX_Navigation_2100 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_2100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
  });
};