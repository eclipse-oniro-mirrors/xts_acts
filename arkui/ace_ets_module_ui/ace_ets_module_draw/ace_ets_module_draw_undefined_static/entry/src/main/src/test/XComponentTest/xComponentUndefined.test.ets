'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function XComponentUndefinedTest() {
  describe('XComponentUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("XComponentUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("XComponentUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/xComponentUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get XComponentUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("xComponentUndefined" == pages.name)) {
          console.info("get xComponentUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push xComponentUndefined page error:" + err);
      }
      console.info("XComponentUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    XComponentUndefinedTest_static_0100
     * @tc.name      XComponentUndefinedTest_static_0100
     * @tc.desc      XComponentUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('XComponentUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[XComponentUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('XComponent');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('XComponent_enableSecure'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('XComponent');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure'))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[XComponentUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    XComponentUndefinedTest_static_0200
     * @tc.name      XComponentUndefinedTest_static_0200
     * @tc.desc      XComponentUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('XComponentUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[XComponentUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('XComponent');
      let resetTextBtn = await driver.findComponent(ON.id('XComponent_resetText'));

      let text = await driver.findComponent(ON.id('XComponent_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('onLoad');

      let changeBtn_show = await driver.findComponent(ON.id('XComponent_show'));
      await (changeBtn_show?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('XComponent');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDestroy');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);

      let changeBtn_onLoad = await driver.findComponent(ON.id('XComponent_onLoad'));
      await (changeBtn_onLoad?.click() as Promise<void>);
      let changeBtn_onDestroy = await driver.findComponent(ON.id('XComponent_onDestroy'));
      await (changeBtn_onDestroy?.click() as Promise<void>);
      await (changeBtn_show?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      await (changeBtn_show?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[XComponentUndefinedTest_static_0200] END');
      done();
    });

  })
}