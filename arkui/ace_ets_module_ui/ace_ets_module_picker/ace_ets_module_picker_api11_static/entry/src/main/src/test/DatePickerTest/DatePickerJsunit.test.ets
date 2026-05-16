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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}
interface UseMilitaryTimes {
  useMilitaryTime: string
}
export default function datePickerJsunit() {
  describe('datePickerJsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePickerneww',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datePicker state pages:" + JSON.stringify(pages));
        if (!("datePickerneww" == pages.name)) {
          console.info("get datePicker pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("datePicker after each called");
    });


    
    
    /**
     * @tc.number   datePickerTest_0100
     * @tc.name     datePickerTest_0100
     * @tc.desc     datePickerTest_0100
     * @tc.level    Level.LEVEL1
     */
it('datePickerTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('datePickerText_0100 START');
      let strJson = inspector.getInspectorByKey('datePicker');
      console.info("datePickerText_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("datePickerText_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$type').asString()).assertEqual('DatePicker');
      console.info('datePickerTest_0200 END');
      done();
    });


    
    
    /**
     * @tc.number   datePickerTest_static_0300
     * @tc.name     datePickerTest_static_0300
     * @tc.desc     datePickerTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('datePickerTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('datePickerTest_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "useMilitaryTime": "false",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("datePickerTest_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("datePickerTest_0300 change component data error: " + (err as Error).message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        console.info("datePickerTest_0300 get state result is: " + JSON.stringify(indexEventOne));
        expect((indexEventOne.data as UseMilitaryTimes)?.useMilitaryTime).assertEqual('false');
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 80,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("datePickerTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("datePickerTest_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('datePicker',10,"")));
      await Utils.sleep(2000);
      console.info('datePickerTest_0300 END');
      done();
    });
  })
}
