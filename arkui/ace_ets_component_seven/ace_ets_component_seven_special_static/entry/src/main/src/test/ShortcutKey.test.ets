'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../hypium/index'
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import { RecordData } from '@ohos.base';

export default function shortcutKeyJsunit() {

  const SUITE = 'ShortcutKey'
  const baseEvent = 62000

  describe('shortcutKeyJsunit', () => {
    beforeAll(() => {
      console.info("shortcutKeyJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shortcutKey",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages = routerInstance.getState();
        if (pages == null || !("shortcutKey" == pages.name)) {
          routerInstance.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: Error) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   ArkUI_Shortcut_Key_0100
     * @tc.name     ArkUI_Shortcut_Key_0100
     * @tc.desc     ArkUI_Shortcut_Key_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Shortcut_Key_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUI_Shortcut_Key_0100'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event: events_emitter.EventData) => {
        expect((event.data as Record<String,RecordData>)['msg']).assertEqual('Ctrl_B');
        console.info(`${SUITE} ${CASE} event.data.msg:` + (event.data as Record<String,RecordData>)['msg']);
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: baseEvent,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create();
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_B);
      done();
    });
  })
}
