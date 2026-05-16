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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
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
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function naviDestinationUndefined() {
  describe('naviDestinationUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("naviDestinationUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("naviDestinationUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/naviDestinationUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get naviDestinationUndefined state pages:" + JSON.stringify(pages));
        if (!("naviDestinationUndefined" == pages.name)) {
          console.info("get naviDestinationUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push naviDestinationUndefined page error:" + err);
      }
      console.info("naviDestinationUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   naviDestinationUndefined_static_0001
     * @tc.name     naviDestinationUndefined_static_0001
     * @tc.desc     test menus
     * @tc.level    Level.LEVEL1
     */
    it('naviDestinationUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[naviDestinationUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let pageOne = await driver.findComponent(ON.id('pageOne'));
      await (pageOne?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let textNode = await driver.findComponent(ON.id('NaviDestination_menus'));
      expect(textNode).assertNull();

      let changeBtn = await driver.findComponent(ON.id('NaviDestination_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.id('NaviDestination_menus'));
      expect(await (textNode?.getText() as Promise<string>)).assertEqual('menus');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.id('NaviDestination_menus'));
      expect(textNode).assertNull();
      done();
    });

    /**
     * @tc.number   naviDestinationUndefined_static_0002
     * @tc.name     naviDestinationUndefined_static_0002
     * @tc.desc     test title
     * @tc.level    Level.LEVEL1
     */
    it('naviDestinationUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[naviDestinationUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('NaviDestination_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('title');
      console.info("[naviDestinationUndefined_static_0001] title: " + res);
      expect(res).assertEqual('');

      let changeBtn = await driver.findComponent(ON.id('NaviDestination_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('NaviDestination_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('title');
      console.info("[naviDestinationUndefined_static_0001] title: " + res);
      expect(res).assertEqual('title');


      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('NaviDestination_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('title');
      expect(res).assertEqual('');
      console.info('[naviDestinationUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   naviDestinationUndefined_static_0003
     * @tc.name     naviDestinationUndefined_static_0003
     * @tc.desc     test toolbarConfiguration
     * @tc.level    Level.LEVEL1
     */
    it('naviDestinationUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[naviDestinationUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();

      let changeBtn = await driver.findComponent(ON.id('NaviDestination_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(await (textNode?.getText() as Promise<string>)).assertEqual('toolbar');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      textNode = await driver.findComponent(ON.text('toolbar'));
      expect(textNode).assertNull();
      console.info('[naviDestinationUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   naviDestinationUndefined_static_0004
     * @tc.name     naviDestinationUndefined_static_0004
     * @tc.desc     test onWillShow onWillHide
     * @tc.level    Level.LEVEL1
     */
    it('naviDestinationUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[naviDestinationUndefined_static_0003] START');
      let driver: Driver = Driver.create();;

      let back = await driver.findComponent(ON.id('NaviDestination_back1'));
      await (back?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let pageTwo = await driver.findComponent(ON.id('pageTwo'));
      await (pageTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      back = await driver.findComponent(ON.id('NaviDestination_back2'));
      await (back?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let textNode = await driver.findComponent(ON.id('NaviDestination_text'));
      expect(await (textNode?.getText() as Promise<string>)).assertEqual('show:0,hide:0');

      let changeBtn = await driver.findComponent(ON.id('NaviDestination_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await (pageTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      back = await driver.findComponent(ON.id('NaviDestination_back2'));
      await (back?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(await (textNode?.getText() as Promise<string>)).assertEqual('show:1,hide:1');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (pageTwo?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      back = await driver.findComponent(ON.id('NaviDestination_back2'));
      await (back?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(await (textNode?.getText() as Promise<string>)).assertEqual('show:1,hide:1');
      console.info('[naviDestinationUndefined_static_0004] END');
      done();
    });
  })
}