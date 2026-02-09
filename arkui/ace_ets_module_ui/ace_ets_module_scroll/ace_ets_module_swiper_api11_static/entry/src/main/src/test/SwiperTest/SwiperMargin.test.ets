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
import window from '@ohos.window';
import { $r, Resource, ArrowStyle } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';

import { UtilsTest, startAbility } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;
const uiContext = new UIContext();

export default function SwiperMarginTest() {

  const SUITE: string = 'SwiperMargin'
  const waitUiReadyMs: int = 500;
  describe('SwiperMarginTest', () => {
    beforeAll(() => {
      console.info("SwiperMarginTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/SwiperMargin",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        if (pages == null || !("SwiperMargin" == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((error: Error): void => {
            console.error(`${SUITE} router.pushUrl failed, code is ${error.code}, message is ${error.message}`);
          })
        }
      } catch (err: Error) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    
    /**
     * @tc.number   ArkUI_Swiper_static_0100
     * @tc.name     ArkUI_Swiper_static_0100
     * @tc.desc     ArkUI_Swiper_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Swiper_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Swiper_static_0100'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await (driver.delayMs(waitUiReadyMs) as Promise<void>)
      let baseKey = 'SwiperMargin_Swiper1'
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Swiper_0200
     *tc.name   Set Swiper's nextMargin and prevMargin with positive
     *tc.desc   Set Swiper's nextMargin and prevMargin with positive
     */
    
    /**
     * @tc.number   ArkUI_Swiper_static_0200
     * @tc.name     ArkUI_Swiper_static_0200
     * @tc.desc     ArkUI_Swiper_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Swiper_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Swiper_static_0200'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await (driver.delayMs(waitUiReadyMs) as Promise<void>)
      let baseKey = 'SwiperMargin_Swiper2'
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('prevMargin')).assertEqual('10.00vp')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nextMargin')).assertEqual('10.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Swiper_0300
     *tc.name   Set Swiper's nextMargin and prevMargin with string
     *tc.desc   Set Swiper's nextMargin and prevMargin with string
     */
    
    /**
     * @tc.number   ArkUI_Swiper_static_0300
     * @tc.name     ArkUI_Swiper_static_0300
     * @tc.desc     ArkUI_Swiper_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Swiper_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Swiper_static_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await (driver.delayMs(waitUiReadyMs) as  Promise<void>)
      let baseKey = 'SwiperMargin_Swiper3'
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('prevMargin')).assertEqual('11.00vp')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nextMargin')).assertEqual('11.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Swiper_static_0400
     * @tc.name     ArkUI_Swiper_static_0400
     * @tc.desc     ArkUI_Swiper_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Swiper_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Swiper_static_0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await (driver.delayMs(waitUiReadyMs) as  Promise<void>)
      let baseKey = 'SwiperMargin_Swiper4'
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('prevMargin')).assertEqual('12.00vp')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nextMargin')).assertEqual('12.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}
