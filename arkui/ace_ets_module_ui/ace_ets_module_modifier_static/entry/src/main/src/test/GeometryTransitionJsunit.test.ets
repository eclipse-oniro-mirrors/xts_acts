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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
interface Btn {
  btn1: boolean
}
export default function geometryTransitionJsunit() {
  describe('common_geometryTransitionTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/geometryTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get geometryTransition state success " + JSON.stringify(pages));
        if (!("geometryTransition" == pages.name)) {
          console.info("get geometryTransition state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push geometryTransition page error: " + err);
      }
    });

    afterEach(async () => {
     await UtilsTest.msSleep(1000);
      console.info("geometryTransition after each called");
    });

    
    
    /**
     * @tc.number   geometryTransitionTest_static_0100
     * @tc.name     geometryTransitionTest_static_0100
     * @tc.desc     geometryTransitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('geometryTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('geometryTransitionTest_static_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 104,
        priority: events_emitter.EventPriority.LOW
      }
     await UtilsTest.msSleep(1000);
      let callback: (indexEvent: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("geometryTransitionTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as Btn)?.btn1).assertEqual(false);
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("geometryTransitionTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("geometryTransitionTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
     await UtilsTest.msSleep(1000);
      console.info('geometryTransitionTest_static_0100 END');
      done();
    });
  })
}