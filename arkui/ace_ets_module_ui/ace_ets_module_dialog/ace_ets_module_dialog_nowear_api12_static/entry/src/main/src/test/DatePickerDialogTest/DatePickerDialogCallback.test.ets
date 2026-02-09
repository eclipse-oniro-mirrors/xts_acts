'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

export default function DatePickerDialogCallback() {
  describe('DatePickerDialogCallback', () => {

    beforeAll(() => {
      console.info("DatePickerDialog beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info("DatePickerDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerDialog/DatePickerDialogCallback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DatePickerDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("DatePickerDialogCallback" == pages.name)) {
          console.info("get DatePickerDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DatePickerDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialogAJsunit page error: " + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   DatePickerDialogCallback_static_0100
     * @tc.name     DatePickerDialogCallback_static_0100
     * @tc.desc     DatePickerDialogCallback_static_0100
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogCallback_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let driver1 = Driver.create();
        let callback = (event: events_emitter.EventData) => {
          const data = event.data as Record<String,RecordData>
          expect(data['action']).assertEqual('onWillAppear');
          console.info('DatePickerDialogCallback_static_0100 event01: ' + data['action']);
        }
        let event: events_emitter.InnerEvent = {
          eventId: 50001,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);
        console.info('DatePickerDialogCallback_static_0100 START');
        let button: Component | null = await driver1.findComponent(ON.id('DatePicker_dialog_B'));
        await button!.click();
        await CommonFunc.sleep(3000)

        let callback1 = (event: events_emitter.EventData) => {
          const data = event.data as Record<String,RecordData>
          expect(data['action']).assertEqual('onDidAppear');
          console.info('DatePickerDialogCallback_static_0100 event02: ' + data['action']);
        }
        let event1: events_emitter.InnerEvent = {
          eventId: 50002,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event1, callback1);

        let callback2 = (event: events_emitter.EventData) => {
          const data = event.data as Record<String,RecordData>
          expect(data['action']).assertEqual('onWillDisappear');
          console.info('DatePickerDialogCallback_static_0100 event03: ' + data['action']);
        }
        let event2: events_emitter.InnerEvent = {
          eventId: 50003,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event2, callback2);

        let callback3 = (event: events_emitter.EventData) => {
          const data = event.data as Record<String,RecordData>
          expect(data['action']).assertEqual('onDidDisappear');
          console.info('DatePickerDialogCallback_static_0100 event04: ' + data['action']);
          done();
        }
        let event3: events_emitter.InnerEvent = {
          eventId: 50004,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event3, callback3);
        await CommonFunc.sleep(3000)
        await driver1.pressBack();
      }catch(error){
        expect().assertFail();
      }

    });

  })
}
