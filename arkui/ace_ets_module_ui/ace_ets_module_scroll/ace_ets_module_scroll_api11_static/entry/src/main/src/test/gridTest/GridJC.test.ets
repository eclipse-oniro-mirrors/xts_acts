'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function ActsGridTest() {
  describe('ActsGridTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/GridJC',
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("GridJC" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          // console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0200
     * @tc.name     ArkUX_Grid_List_Swiper_static_0200
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0200 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0200');
      console.info('ArkUX_Grid_List_Swiper_static_0200 START  :' + JSON.stringify(strJson));
      console.info("ArkUX_Grid_List_Swiper_static_0200 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
        .assertEqual("repeat(auto-fill, 88px)");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
        .assertEqual("repeat(auto-fill, 88px)");
      console.info('ArkUX_Grid_List_Swiper_static_0200 END ');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0200');
          console.info('ArkUX_Grid_List_Swiper_static_0200 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0200 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fill, 88px)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fill, 88px)");
          console.info('ArkUX_Grid_List_Swiper_static_0200 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0210
     * @tc.name     ArkUX_Grid_List_Swiper_static_0210
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0210
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0210 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0210');
          console.info('ArkUX_Grid_List_Swiper_static_0210 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0210 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fill, 300vp)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fill, 50vp)");
          console.info('ArkUX_Grid_List_Swipe_staticr_0210 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0210 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0220
     * @tc.name     ArkUX_Grid_List_Swiper_static_0220
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0220
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0220 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0220');
          console.info('ArkUX_Grid_List_Swiper_static_0220 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0220 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')).assertEqual("");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate')).assertEqual("");
          console.info('ArkUX_Grid_List_Swiper_static_0220 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0220 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0230
     * @tc.name     ArkUX_Grid_List_Swiper_static_0230
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0230
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0230 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0230');
          console.info('ArkUX_Grid_List_Swiper_static_0230 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0230 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fill, 0)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fill, 0)");
          console.info('ArkUX_Grid_List_Swiper_static_0230 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0230 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0240
     * @tc.name     ArkUX_Grid_List_Swiper_static_0240
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0240
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0240 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0240');
          console.info('ArkUX_Grid_List_Swiper_static_0240 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0240 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fill, 20px)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fill, 600vp)");
          console.info('ArkUX_Grid_List_Swiper_static_0240 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0240 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_0350
     * @tc.name     ArkUX_Grid_List_Swiper_0350
     * @tc.desc     ArkUX_Grid_List_Swiper_0350
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_0350', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_0350 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0350');
          console.info('ArkUX_Grid_List_Swiper_0350 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0350 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fit, 88px)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fit, 88px)");
          console.info('ArkUX_Grid_List_Swiper_0350 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0350 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_0360
     * @tc.name     ArkUX_Grid_List_Swiper_0360
     * @tc.desc     ArkUX_Grid_List_Swiper_0360
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_0360', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_0360 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0360');
          console.info('ArkUX_Grid_List_Swiper_0360 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0360 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
            .assertEqual("repeat(auto-fit, 300vp)");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsTemplate'))
            .assertEqual("repeat(auto-fit, 50vp)");
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