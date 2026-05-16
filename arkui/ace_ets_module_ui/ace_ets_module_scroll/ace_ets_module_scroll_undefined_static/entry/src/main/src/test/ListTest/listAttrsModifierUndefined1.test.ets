'use static'
/**
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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function ListAttrsModifierUndefinedTest1() {
  describe('ListAttrsModifierUndefinedTest1', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ListAttrsModifierUndefinedTest1 beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ListAttrsModifierUndefinedTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listAttrsModifierUndefined1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ListAttrsModifierUndefinedTest1 state pages:" + JSON.stringify(pages));
        if (!("listAttrsModifierUndefined1" == pages.name)) {
          console.info("get ListAttrsModifierUndefinedTest1 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListAttrsModifierUndefinedTest1 page error:" + err);
      }
      console.info("ListAttrsModifierUndefinedTest1 beforeEach end");

    });
    afterEach(async () => {
    });

    /**
  * @tc.number   ListAttrsModifierUndefinedTest1_static_0100
  * @tc.name     ListAttrsModifierUndefinedTest1_static_0100
  * @tc.desc     ListAttrsModifierUndefinedTest1_static_0100
  * @tc.level    Level.LEVEL1
  */
    it('ListAttrsModifierUndefinedTest1_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest1_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest1_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest1_static_0100] cachedCount: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('cachedCount')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('cachedCount')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('ListModifier_CachedCount'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest1_static_0100] click ListModifier_CachedCount");
      strJson = inspector.getInspectorByKey('MyListModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('cachedCount')))
        .assertEqual('\"1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest1_static_0100] END');
      done();
    });


    /**
   * @tc.number   ListAttrsModifierUndefinedTest1_static_0200
   * @tc.name     ListAttrsModifierUndefinedTest1_static_0200
   * @tc.desc     ListAttrsModifierUndefinedTest1_static_0200
   * @tc.level    Level.LEVEL1
   */
    it('ListAttrsModifierUndefinedTest1_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ListAttrsModifierUndefinedTest1_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyListModifier');
      await CommonFunc.sleep(1000);

      console.info("[ListAttrsModifierUndefinedTest1_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ListAttrsModifierUndefinedTest1_static_0200] maintainVisibleContentPosition: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('maintainVisibleContentPosition')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('maintainVisibleContentPosition')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('List_maintainVisibleContentPosition'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ListAttrsModifierUndefinedTest1_static_0200] click List_maintainVisibleContentPosition");
      strJson = inspector.getInspectorByKey('MyListModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('maintainVisibleContentPosition')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ListAttrsModifierUndefinedTest1_static_0200] END');
      done();
    });


  })
}