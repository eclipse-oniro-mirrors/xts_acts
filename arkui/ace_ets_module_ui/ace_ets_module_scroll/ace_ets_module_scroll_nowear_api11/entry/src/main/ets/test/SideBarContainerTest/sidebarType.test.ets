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

export default function sidebarTypeTest() {
  describe('sidebarTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sidebarType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sidebarType state success " + JSON.stringify(pages));
        if (!("sidebarType" == pages.name)) {
          console.info("get sidebarType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push sidebarType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sidebarType page error: " + err);
      }
      done()
    });

    it('ArkUX_SideBarContainer_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_SideBarContainer_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_SideBarContainer_1000');
          console.info('ArkUX_SideBarContainer_1000 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_1000 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.type).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("300.000000");
          expect(JSON.parse(strJson).$attrs.minSideBarWidth).assertEqual("100.000000");
          console.info('ArkUX_SideBarContainer_1000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_SideBarContainer_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_SideBarContainer_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_SideBarContainer_1100');
          console.info('ArkUX_SideBarContainer_1100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_1100 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.type).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("30000.000000");
          expect(JSON.parse(strJson).$attrs.minSideBarWidth).assertEqual("10000.000000");
          console.info('ArkUX_SideBarContainer_1100 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_SideBarContainer_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_SideBarContainer_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_SideBarContainer_1200');
          console.info('ArkUX_SideBarContainer_1200 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_1200 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.type).assertEqual("SideBarContainerType.Embed");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("10.000000");
          expect(JSON.parse(strJson).$attrs.minSideBarWidth).assertEqual("10.000000");
          console.info('ArkUX_SideBarContainer_1200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_SideBarContainer_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_SideBarContainer_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_SideBarContainer_1300');
          console.info('ArkUX_SideBarContainer_1300 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_1300 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.type).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("200.000000");
          expect(JSON.parse(strJson).$attrs.minSideBarWidth).assertEqual("400.000000");
          console.info('ArkUX_SideBarContainer_1300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_SideBarContainer_1400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_SideBarContainer_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_SideBarContainer_1400');
          console.info('ArkUX_SideBarContainer_1400 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_1400 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.type).assertEqual("SideBarContainerType.Embed");
          expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual("360.000000");
          expect(JSON.parse(strJson).$attrs.minSideBarWidth).assertEqual("240.000000");
          console.info('ArkUX_SideBarContainer_1400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}