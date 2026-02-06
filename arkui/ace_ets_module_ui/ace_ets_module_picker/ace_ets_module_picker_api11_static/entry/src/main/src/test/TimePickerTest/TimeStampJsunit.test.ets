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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
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
import events_emitter from '@ohos.events.emitter';

export default function timeStampJsunit() {
  describe('timeStampTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/timeStamp',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = router.getState();
        console.info("timeStamp current page is: " + JSON.stringify(pages.name));
        if (!('timeStamp' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push timeStamp page error: " + err);
      }
    });


    
    /**
     * @tc.number   timeStampTest_static_0100
     * @tc.name     timeStampTest_static_0100
     * @tc.desc     timeStampTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('timeStampTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('timeStampTest_0100 START');
      await Utils.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("timeStampTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(isNaN((indexEvent.data as ESObject).getProperty('Text').toNumber())).assertFalse();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 230,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("timeStampTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("timeStampTest_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await Utils.sleep(1500);
      console.info('timeStampTest_0100 END');
      done();
    });
  })
}