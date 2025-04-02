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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';

export default function ActsGridTest() {
  describe('ActsGridTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/GridJC',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("GridJC" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    it('ArkUX_Grid_List_Swiper_0200', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0200');
          console.info('ArkUX_Grid_List_Swiper_0200 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0200 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fill, 88px)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fill, 88px)");
          console.info('ArkUX_Grid_List_Swiper_0200 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0210', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0210 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0210');
          console.info('ArkUX_Grid_List_Swiper_0210 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0210 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fill, 300vp)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fill, 50vp)");
          console.info('ArkUX_Grid_List_Swiper_0210 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0210 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0220', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0220 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0220');
          console.info('ArkUX_Grid_List_Swiper_0220 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0220 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("null");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("null");
          console.info('ArkUX_Grid_List_Swiper_0220 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0220 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0230', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0230 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0230');
          console.info('ArkUX_Grid_List_Swiper_0230 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0230 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fill, 0)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fill, 0)");
          console.info('ArkUX_Grid_List_Swiper_0230 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0230 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0240', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0240 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0240');
          console.info('ArkUX_Grid_List_Swiper_0240 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0240 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fill, 20px)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fill, 600vp)");
          console.info('ArkUX_Grid_List_Swiper_0240 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0240 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0350', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0350 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0350');
          console.info('ArkUX_Grid_List_Swiper_0350 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0350 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fit, 88px)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fit, 88px)");
          console.info('ArkUX_Grid_List_Swiper_0350 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0350 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Grid_List_Swiper_0360', 0, async (done: Function) => {
      console.info('ArkUX_Grid_List_Swiper_0360 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0360');
          console.info('ArkUX_Grid_List_Swiper_0360 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0360 obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("repeat(auto-fit, 300vp)");
          expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual("repeat(auto-fit, 50vp)");
          console.info('ArkUX_Grid_List_Swiper_0360 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0360 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}