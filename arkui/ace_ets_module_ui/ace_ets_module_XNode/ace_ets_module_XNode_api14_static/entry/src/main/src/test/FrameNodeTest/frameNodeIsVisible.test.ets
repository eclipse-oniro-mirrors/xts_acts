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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function frameNodeIsVisibleTest() {
  describe('frameNodeIsVisibleTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.XNode.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("frameNodeIsVisibleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeIsVisibleTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeIsVisibleTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get frameNodeIsVisibleTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push frameNodeIsVisibleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeIsVisibleTest page error:" + err);
      }
      console.info("frameNodeIsVisibleTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeIsVisibleTest after each called");
    });


    
    
/**
     * @tc.number   frameNodeIsVisibleTest_static_0100
     * @tc.name     frameNodeIsVisibleTest_static_0100
     * @tc.desc     frameNodeIsVisibleTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('frameNodeIsVisibleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('frameNodeIsVisibleTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('print_id')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('columnNodeIsVisible');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[frameNodeIsVisibleTest_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[frameNodeIsVisibleTest_static_0100] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[frameNodeIsVisibleTest_static_0100] END');
      done();
    });
  })
}