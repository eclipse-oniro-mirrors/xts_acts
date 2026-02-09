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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { UtilsTest, startAbility } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Swiper07Test() {
  describe('Swiper07Test', () => {
    beforeAll(() => {
      console.info("Swiper07Test beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper07',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("Swiper07" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          console.info("push swiper page success ");
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
    });

    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0300
     * @tc.name     ArkUX_Grid_List_Swiper_static_0300
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0300');
          console.info('ArkUX_Grid_List_Swiper_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Grid_List_Swiper_static_0300 JSON.parse(strJson) is: " +
          JSON.stringify(JSON.parseJsonElement(strJson)));

          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSize')).assertEqual("200.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0300 END ');

        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0310
     * @tc.name     ArkUX_Grid_List_Swiper_static_0310
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0310
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0310 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0310');
          console.info('ArkUX_Grid_List_Swiper_static_0310 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Grid_List_Swiper_static_0310 JSON.parse(strJson) is: " +
          JSON.stringify(JSON.parseJsonElement(strJson)));

          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSize')).assertEqual("100.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0310 END ');

        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0310 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0320
     * @tc.name     ArkUX_Grid_List_Swiper_static_0320
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0320
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0320', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0320 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0320');
          console.info('ArkUX_Grid_List_Swiper_static_0320 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0320 JSON.parse(strJson) is: " +
          JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSize')).assertEqual("0.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0320 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0320 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0330
     * @tc.name     ArkUX_Grid_List_Swiper_static_0330
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0330
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0330', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0330 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0330');
          console.info('ArkUX_Grid_List_Swiper_static_0330 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0330 JSON.parse(strJson) is: " +
          JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSize')).assertEqual("500.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0330 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0330 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0340
     * @tc.name     ArkUX_Grid_List_Swiper_static_0340
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0340
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_List_Swiper_static_0340', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0340 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0340');
          console.info('ArkUX_Grid_List_Swiper_static_0340 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0340 JSON.parse(strJson) is: " +
          JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSize')).assertEqual("0.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0340 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0340 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}