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

export default function ListReboundTest() {

  const SUITE: string = 'ListRebound'

  describe('ListReboundTest', () => {

    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListRebound",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListRebound" == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err: Error) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    /*
     *tc.number ArkUI_Rebound_static_0100
     *tc.name   Grid with EdgeEffect.Spring
     *tc.desc   Grid with EdgeEffect.Spring
     */

    
    /**
     * @tc.number   ArkUI_Rebound_static_0100
     * @tc.name     ArkUI_Rebound_static_0100
     * @tc.desc     ArkUI_Rebound_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Rebound_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Rebound_static_0100'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyGrid1'
      setTimeout(async () => {
        try {
          let strJson: string = inspector.getInspectorByKey(baseKey);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
            .assertEqual('EdgeEffect.Spring')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err: Error) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUI_Rebound_static_0200
     *tc.name   Grid with EdgeEffect.Fade
     *tc.desc   Grid with EdgeEffect.Fade
     */

    
    /**
     * @tc.number   ArkUI_Rebound_static_0200
     * @tc.name     ArkUI_Rebound_static_0200
     * @tc.desc     ArkUI_Rebound_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Rebound_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Rebound_static_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyGrid2'
      setTimeout(async () => {
        try {
          let strJson: string = inspector.getInspectorByKey(baseKey);

          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
            .assertEqual('EdgeEffect.Fade')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err: Error) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUI_Rebound_static_0300
     *tc.name   Grid with EdgeEffect.None
     *tc.desc   Grid with EdgeEffect.None
     */

    
    /**
     * @tc.number   ArkUI_Rebound_static_0300
     * @tc.name     ArkUI_Rebound_static_0300
     * @tc.desc     ArkUI_Rebound_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Rebound_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_Rebound_static_0300'
      console.info(`${SUITE} ${CASE} START`);
      let baseKey: string = 'MyGrid3'
      setTimeout(async () => {
        try {
          let strJson: string = inspector.getInspectorByKey(baseKey);
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
            .assertEqual('EdgeEffect.None')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err: Error) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}

function getRectCenter(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, ',').split(',')
  const uiContext = AppStorage.get<UIContext>('uiContext');
  return [
    uiContext!.px2vp(Number.parseFloat(rtn[0].trim()) +
      (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    uiContext!.px2vp(Number.parseFloat(rtn[1].trim()) +
      (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}