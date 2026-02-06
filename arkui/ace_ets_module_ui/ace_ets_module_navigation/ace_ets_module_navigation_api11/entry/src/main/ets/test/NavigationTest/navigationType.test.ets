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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function navigationTypeTest() {
  describe('navigationTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationType state success " + JSON.stringify(pages));
        if (!("navigationType" == pages.name)) {
          console.info("get navigationType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push navigationType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationType page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   ArkUX_Navigation_1600
     * @tc.number ArkUX_Navigation_1600
     * @tc.desc   ArkUX_Navigation_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_1600',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_1600 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_1600');
          console.info('ArkUX_Navigation_1600 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_1600 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.AUTO");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("50.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("100.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("50.00vp, 300.00vp");
          console.info('ArkUX_Navigation_1600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Navigation_1700
     * @tc.number ArkUX_Navigation_1700
     * @tc.desc   ArkUX_Navigation_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_1700',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_1700 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_1700');
          console.info('ArkUX_Navigation_1700 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_1700 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.STACK");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("20000.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("15000.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("10000.00vp, 30000.00vp");
          console.info('ArkUX_Navigation_1700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Navigation_1800
     * @tc.number ArkUX_Navigation_1800
     * @tc.desc   ArkUX_Navigation_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_1800',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_1800 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_1800');
          console.info('ArkUX_Navigation_1800 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_1800 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("30.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("100.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("10.00vp, 20.00vp");
          console.info('ArkUX_Navigation_1800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Navigation_1900
     * @tc.number ArkUX_Navigation_1900
     * @tc.desc   ArkUX_Navigation_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_1900',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_1900 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_1900');
          console.info('ArkUX_Navigation_1900 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_1900 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.AUTO");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("360.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("100.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("240.00vp, 432.00vp");
          console.info('ArkUX_Navigation_1900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_1900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Navigation_2000
     * @tc.number ArkUX_Navigation_2000
     * @tc.desc   ArkUX_Navigation_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_2000',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_2000 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_2000');
          console.info('ArkUX_Navigation_2000 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_2000 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("100.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("100.00vp");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("100.00vp, 100.00vp");
          console.info('ArkUX_Navigation_2000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_2000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Navigation_2100
     * @tc.number ArkUX_Navigation_2100
     * @tc.desc   ArkUX_Navigation_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Navigation_2100',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Navigation_2100 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Navigation_2100');
          console.info('ArkUX_Navigation_2100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Navigation_2100 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.mode).assertEqual("NavigationMode.SPLIT");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("40.00%");
          expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual("30.00%");
          expect(JSON.parse(strJson).$attrs.navBarWidthRange).assertEqual("20.00%, 50.00%");
          console.info('ArkUX_Navigation_2100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Navigation_2100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  });
};