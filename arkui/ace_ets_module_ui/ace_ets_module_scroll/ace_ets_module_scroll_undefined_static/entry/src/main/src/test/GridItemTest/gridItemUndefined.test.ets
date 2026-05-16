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

export default function GridItemUndefinedTest() {
  describe('GridItemUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("GridItemUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridItemUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridItem/gridItemUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GridItemUndefined state pages:" + JSON.stringify(pages));
        if (!("gridItemUndefined" == pages.name)) {
          console.info("get gridItemUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridItemEventPage page error:" + err);
      }
      console.info("GridItemUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0100
     * @tc.name     GridItemUndefinedTest_static_0100
     * @tc.desc     GridItemUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0100] rowEnd: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowEnd')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowEnd')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_rowEnd'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0100] click GridItem_rowEnd");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowEnd')))
        .assertEqual('\"-1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridItemUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0200
     * @tc.name     GridItemUndefinedTest_static_0200
     * @tc.desc     GridItemUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0200] rowStart: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowStart')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowStart')))
        .assertEqual('\"1\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_rowStart'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0200] click GridItem_rowStart");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowStart')))
        .assertEqual('\"-1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridItemUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0300
     * @tc.name     GridItemUndefinedTest_static_0300
     * @tc.desc     GridItemUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0300] columnEnd: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnEnd')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnEnd')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_columnEnd'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0300] click GridItem_columnEnd");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnEnd')))
        .assertEqual('\"-1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridItemUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0400
     * @tc.name     GridItemUndefinedTest_static_0400
     * @tc.desc     GridItemUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0400] columnStart: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnStart')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnStart')))
        .assertEqual('\"1\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_columnStart'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0400] click GridItem_columnStart");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnStart')))
        .assertEqual('\"-1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridItemUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0500
     * @tc.name     GridItemUndefinedTest_static_0500
     * @tc.desc     GridItemUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0500] selected: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selected')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selected')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_selected'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0500] click GridItem_selected");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selected')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridItemUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0600
     * @tc.name     GridItemUndefinedTest_static_0600
     * @tc.desc     GridItemUndefinedTest_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);

      console.info("[GridItemUndefinedTest_static_0600] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GridItemUndefinedTest_static_0600] selectable: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable')))
        .assertEqual('\"false\"');

      let changeBtn = await driver.findComponent(ON.id('GridItem_selectable'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0600] click GridItem_selectable");
      strJson = inspector.getInspectorByKey('GridItem');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable')))
        .assertEqual('\"true\"');
      await CommonFunc.sleep(1000);
      console.info('[GridItemUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   GridItemUndefinedTest_static_0700
     * @tc.name     GridItemUndefinedTest_static_0700
     * @tc.desc     GridItemUndefinedTest_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('GridItemUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridItemUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('GridItem_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let gridItem = await driver.findComponent(ON.type('GridItem'));
      await CommonFunc.sleep(1000);

      let changeBtn_selectable = await driver.findComponent(ON.id('GridItem_selectable'));
      await (changeBtn_selectable?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('GridItem_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onSelect');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('GridItem_onSelect'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_selectable?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GridItemUndefinedTest_static_0700] click GridItem_onSelect");
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridItemUndefinedTest_static_0700] END');
      done();
    });

  })
}