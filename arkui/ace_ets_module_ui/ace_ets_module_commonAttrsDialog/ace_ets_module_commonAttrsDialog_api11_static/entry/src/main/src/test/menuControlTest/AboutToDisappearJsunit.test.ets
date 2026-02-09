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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeEach, afterEach,  it, expect,beforeAll, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
import { RecordData } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function aboutToDisappearJsunit() {
  describe('aboutToDisappearTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("aboutToDisappearTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menuControl/aboutToDisappear',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get aboutToDisappearTest state pages:" + JSON.stringify(pages));
        if (!("aboutToDisappear" == pages.name)) {
          console.info("get aboutToDisappearTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push aboutToDisappearTest page error:" + err);
      }
      console.info("aboutToDisappearTest beforeEach end");
    });

       afterEach(async () => {
      await Utils.sleep(1000);
      console.info("aboutToDisappear after each called");
    });

    
    /**
     * @tc.number   aboutToDisappearTest_static_0100
     * @tc.name     aboutToDisappearTest_static_0100
     * @tc.desc     aboutToDisappearTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('aboutToDisappearTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('aboutToDisappearTest_static_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("aboutToDisappearTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        const data = indexEvent.data as Record<String,RecordData>
        const event = data['ACTION'] as Record<String,RecordData>
        expect(event).assertEqual(false);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 49,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("aboutToDisappearTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("aboutToDisappearTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await Utils.sleep(1000);
      console.info('aboutToDisappearTest_static_0100 END');
      done();
    });
  })
}
