'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ListScrollTest() {

  const SUITE: string = 'ListScroll'
  const waitUiReadyMs: int = 500;
  describe('ListScrollTest', () => {

    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListScroll",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListScroll" == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: Error) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    /*
     *tc.number ArkUI_List_Scroll_static_0100
     *tc.name   Scroller.scrollToIndex(List) support animation
     *tc.desc   Scroller.scrollToIndex(List) support animation
     */

    
    /**
     * @tc.number   ArkUI_List_Scroll_static_0100
     * @tc.name     ArkUI_List_Scroll_static_0100
     * @tc.desc     ArkUI_List_Scroll_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Scroll_static_0100'
      console.info(`${SUITE} ${CASE} START`)
      let callback: (event: events_emitter.EventData) => void = (event: events_emitter.EventData) => {
        if (event.data != null) {
          expect((event.data as Record<String,RecordData>)['start']).assertEqual(14);
        }
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('ListScroll_Button_To_14', 10, "")
      console.info(`${SUITE} ${CASE} END`)
    });

    /*
     *tc.number ArkUI_List_Scroll_static_0200
     *tc.name   Scroller.scrollToIndex(List) support animation
     *tc.desc   Scroller.scrollToIndex(List) support animation
     */

    
    /**
     * @tc.number   ArkUI_List_Scroll_static_0200
     * @tc.name     ArkUI_List_Scroll_static_0200
     * @tc.desc     ArkUI_List_Scroll_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Scroll_static_0200'
      console.info(`${SUITE} ${CASE} START`)
      let callback: (event: events_emitter.EventData) => void = (event: events_emitter.EventData) => {
        if (event.data != null) {
          expect((event.data as Record<String,RecordData>)['start']).assertEqual(15);
        }
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60001,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('ListScroll_Button_To_15', 10, "")
      console.info(`${SUITE} ${CASE} END`)
    });

    /*
     *tc.number ArkUI_List_Scroll_static_0300
     *tc.name   Scroller.scrollToIndex(List) support animation
     *tc.desc   Scroller.scrollToIndex(List) support animation
     */

    
    /**
     * @tc.number   ArkUI_List_Scroll_static_0300
     * @tc.name     ArkUI_List_Scroll_static_0300
     * @tc.desc     ArkUI_List_Scroll_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Scroll_static_0300'
      console.info(`${SUITE} ${CASE} START`)
      let callback: (event: events_emitter.EventData) => void = (event: events_emitter.EventData) => {
        if (event.data != null) {
          expect((event.data as Record<String,RecordData>)['start']).assertEqual(0);
        }
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('ListScroll_Button_To_0', 10, "")
      console.info(`${SUITE} ${CASE} END`)
    });

    /*
     *tc.number ArkUI_List_Scroll_static_0400
     *tc.name   Scroller.scrollToIndex(List) support animation
     *tc.desc   Scroller.scrollToIndex(List) support animation
     */

    
    /**
     * @tc.number   ArkUI_List_Scroll_static_0400
     * @tc.name     ArkUI_List_Scroll_static_0400
     * @tc.desc     ArkUI_List_Scroll_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_List_Scroll_static_0400'
      console.info(`${SUITE} ${CASE} START`)
      let callback: (event: events_emitter.EventData) => void = (event: events_emitter.EventData) => {
        if (event.data != null) {
          expect((event.data as Record<String,RecordData>)['end']).assertEqual(59);
        }
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60003,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('ListScroll_Button_To_max', 10, "")
      console.info(`${SUITE} ${CASE} END`)
    });
  })
}