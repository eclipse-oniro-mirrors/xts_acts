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
import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ohosPromptJsunit() {
  describe('appInfoTest_four_3', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("OhosPrompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/ohosPrompt',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OhosPrompt state pages:" + JSON.stringify(pages));
        if (!("ohosPrompt " == pages.name)) {
          console.info("get OhosPrompt  state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push OhosPrompt  page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("OhosPrompt each called");
    });

    
    
    /**
     * @tc.number   test_OhosPrompt_static_001
     * @tc.name     test_OhosPrompt_static_001
     * @tc.desc     test_OhosPrompt_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_OhosPrompt_static_001', Level.LEVEL0, async () => {
      await Utils.sleep(1000)
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("[test_OhosPrompt_001] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as ESObject)?.getProperty('matrix1').toString()).assertEqual("[100, 10]")
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err: Error) {
        console.info("[test_OhosPrompt_001] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosPrompt_001] inspector.sendEventByKey ' + JSON.stringify(inspector.sendEventByKey('rotate5', 10, "")));
      await Utils.sleep(1000)
      console.info('[test_OhosPrompt_001] testSendTouchEvent END');

    });
  })
}
