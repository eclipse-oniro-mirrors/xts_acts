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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const SUITE = 'keyboardShortcut'
const baseEvent1 = 35872
const baseEvent2 = 35873

export default function KeyboardShortcutJsunit() {


  describe('KeyboardShortcutJsunit', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/KeyboardShortcut",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get KeyboardShortcut state pages:" + JSON.stringify(pages));
        if (!("KeyboardShortcut" == pages.name)) {
          console.info("get KeyboardShortcut pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }

    });


    /**
     * @tc.number   ArkUI_KeyboardShortcut_static_0158
     * @tc.name     ArkUI_KeyboardShortcut_static_0158
     * @tc.desc     ArkUI_KeyboardShortcut_static_0158
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_KeyboardShortcut_static_0158', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_KeyboardShortcut_static_0158'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(((event.data) as Record<String,RecordData>)?.['msg']).assertEqual('Ctrl_TAB');
        console.info(`${SUITE} ${CASE} event.data.msg:` + ((event.data) as Record<String,RecordData>)?.['msg']);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent1,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_TAB);
      done();
    });


    /**
     * @tc.number   ArkUI_KeyboardShortcut_static_0159
     * @tc.name     ArkUI_KeyboardShortcut_static_0159
     * @tc.desc     ArkUI_KeyboardShortcut_static_0159
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_KeyboardShortcut_static_0159', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_KeyboardShortcut_static_0159'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect(((event.data) as Record<String,RecordData>)?.['msg']).assertEqual('Shift_left');
        console.info(`${SUITE} ${CASE} ((eventData.data) as  Record<String,RecordData>).msg:` +
          ((event.data) as Record<String,RecordData>)?.['msg']);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent2,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
      done();
    });
  })
}
