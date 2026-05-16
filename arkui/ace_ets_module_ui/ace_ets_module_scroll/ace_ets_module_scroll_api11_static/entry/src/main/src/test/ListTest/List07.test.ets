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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function List07Test() {
  describe('List07Test', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List07',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get list state success " + JSON.stringify(pages));
        if (!("List07" == pages.name)) {
          console.info("get list state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          
          // console.info("push list page success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push list page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0250
     * @tc.name     ArkUX_Grid_List_Swiper_static_0250
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0250
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Grid_List_Swiper_static_0250', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0250 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0250');
          console.info('ArkUX_Grid_List_Swiper_static_0250 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0250 JSON.parse(strJson) is: " +
          JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));

          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('laneGutter')).assertEqual("20.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0250 END ');

        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0250 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0260
     * @tc.name     ArkUX_Grid_List_Swiper_static_0260
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0260
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Grid_List_Swiper_static_0260', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0260 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0260');
          console.info('ArkUX_Grid_List_Swiper_static_0260 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0260 JSON.parse(strJson) is: " +
          JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('laneGutter')).assertEqual("100.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0260 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0260 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0270
     * @tc.name     ArkUX_Grid_List_Swiper_static_0270
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0270
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Grid_List_Swiper_static_0270', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0270 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0270');
          console.info('ArkUX_Grid_List_Swiper_static_0270 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0270 JSON.parse(strJson) is: " +
          JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('laneGutter')).assertEqual("0.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0270 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0270 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0280
     * @tc.name     ArkUX_Grid_List_Swiper_static_0280
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0280
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Grid_List_Swiper_static_0280', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0280 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0280');
          console.info('ArkUX_Grid_List_Swiper_static_0280 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0280 JSON.parse(strJson) is: " +
          JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('laneGutter')).assertEqual("500.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0280 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0280 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Grid_List_Swiper_static_0290
     * @tc.name     ArkUX_Grid_List_Swiper_static_0290
     * @tc.desc     ArkUX_Grid_List_Swiper_static_0290
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Grid_List_Swiper_static_0290', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Grid_List_Swiper_static_0290 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Grid_List_Swiper_0290');
          console.info('ArkUX_Grid_List_Swiper_static_0290 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_static_0290 JSON.parse(strJson) is: " +
          JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('laneGutter')).assertEqual("250.00vp");
          console.info('ArkUX_Grid_List_Swiper_static_0290 END ');
        } catch (err: Error) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_static_0290 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}