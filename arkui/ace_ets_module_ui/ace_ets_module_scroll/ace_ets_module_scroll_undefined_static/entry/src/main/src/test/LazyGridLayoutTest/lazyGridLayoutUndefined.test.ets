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

export default function LazyGridLayoutUndefinedTest() {
  describe('LazyGridLayoutUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("LazyGridLayoutUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyGridLayoutUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyGridLayout/lazyGridLayoutUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get LazyGridLayoutUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("lazyGridLayoutUndefined" == pages.name)) {
          console.info("get LazyGridLayoutUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push LazyGridLayoutEventPage page error:" + err);
      }
      console.info("LazyGridLayoutUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   LazyGridLayoutUndefinedTest_static_0100
     * @tc.name     LazyGridLayoutUndefinedTest_static_0100
     * @tc.desc     LazyGridLayoutUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('LazyGridLayoutUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyGridLayoutUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);

      console.info("[LazyGridLayoutUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[LazyGridLayoutUndefinedTest_static_0100] rowsGap: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('LazyVGridLayout_rowsGap'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[LazyGridLayoutUndefinedTest_static_0100] click LazyVGridLayout_rowsGap");
      strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rowsGap')))
        .assertEqual('\"0.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[LazyGridLayoutUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   LazyGridLayoutUndefinedTest_static_0200
     * @tc.name     LazyGridLayoutUndefinedTest_static_0200
     * @tc.desc     LazyGridLayoutUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('LazyGridLayoutUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyGridLayoutUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);

      console.info("[LazyGridLayoutUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[LazyGridLayoutUndefinedTest_static_0200] columnsGap: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('ColumnsGap')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('ColumnsGap')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('LazyVGridLayout_columnsGap'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[LazyGridLayoutUndefinedTest_static_0200] click LazyVGridLayout_columnsGap");
      strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('ColumnsGap')))
        .assertEqual('\"0.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[LazyGridLayoutUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   LazyGridLayoutUndefinedTest_static_0300
     * @tc.name     LazyGridLayoutUndefinedTest_static_0300
     * @tc.desc     LazyGridLayoutUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('LazyGridLayoutUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyGridLayoutUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);

      console.info("[LazyGridLayoutUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[LazyGridLayoutUndefinedTest_static_0300] columnsTemplate: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')))
        .assertEqual('\"1fr 1fr 1fr\"');

      let changeBtn = await driver.findComponent(ON.id('LazyVGridLayout_columnsTemplate'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[LazyGridLayoutUndefinedTest_static_0300] click LazyVGridLayout_columnsTemplate");
      strJson = inspector.getInspectorByKey('LazyVGridLayout');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('columnsTemplate')))
        .assertEqual('\"1fr\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[LazyGridLayoutUndefinedTest_static_0300] END');
      done();
    });

  })
}