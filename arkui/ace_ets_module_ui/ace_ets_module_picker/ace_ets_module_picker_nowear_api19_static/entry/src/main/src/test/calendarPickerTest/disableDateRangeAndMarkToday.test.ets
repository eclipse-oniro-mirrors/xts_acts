'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function disableDateRangeAndMarkTodayTest() {
  describe('DisableDateRangeAndMarkToday', () => {
    beforeAll(() => {
      console.info("DisableDateRangeAndMarkToday beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api19.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('DisableDateRangeAndMarkToday beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/disableDateRangeAndMarkToday',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DisableDateRangeAndMarkToday state pages:' + JSON.stringify(pages));
        if (!('disableDateRangeAndMarkToday' == pages.name)) {
          console.info('get DisableDateRangeAndMarkToday pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push DisableDateRangeAndMarkToday page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DisableDateRangeAndMarkToday page error:' + err);
      }
      console.info('DisableDateRangeAndMarkToday beforeEach end');
    });


    /**
     * @tc.number   DisableDateRangeAndMarkToday_static_001
     * @tc.name     DisableDateRangeAndMarkToday_static_001
     * @tc.desc     DisableDateRangeAndMarkToday_static_001
     * @tc.level    Level.LEVEL1
     */
    it('DisableDateRangeAndMarkToday_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DisableDateRangeAndMarkToday_001] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('normal-2025-01-09-2025-01-10'));
      console.info('[DisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-true'));
      console.info('[DisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('calendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DisableDateRangeAndMarkToday_001] attrs:' +
      JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      expect(obj.getElement('$attrs').getString('disabledDateRange'))
        .assertEqual('2025年1月9日星期四,2025年1月10日星期五');
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_001] markTodayAttrs2:' +
      JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('true');
      console.info('[DisableDateRangeAndMarkToday_001] END');
      done();
    });


    /**
     * @tc.number   DisableDateRangeAndMarkToday_static_002
     * @tc.name     DisableDateRangeAndMarkToday_static_002
     * @tc.desc     DisableDateRangeAndMarkToday_static_002
     * @tc.level    Level.LEVEL1
     */
    it('DisableDateRangeAndMarkToday_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DisableDateRangeAndMarkToday_002] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-start'));
      console.info('[DisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-false'));
      console.info('[DisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('calendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DisableDateRangeAndMarkToday_002] attrs:' +
      JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_002] markTodayAttrs2:' +
      JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_002] END');
      done();
    });


    /**
     * @tc.number   DisableDateRangeAndMarkToday_static_003
     * @tc.name     DisableDateRangeAndMarkToday_static_003
     * @tc.desc     DisableDateRangeAndMarkToday_static_003
     * @tc.level    Level.LEVEL1
     */
    it('DisableDateRangeAndMarkToday_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DisableDateRangeAndMarkToday_003] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-undefined'));
      console.info('[DisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-null'));
      console.info('[DisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('calendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DisableDateRangeAndMarkToday_003] attrs:' +
      JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_003] markTodayAttrs2:' +
      JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_003] END');
      done();
    });


    /**
     * @tc.number   DisableDateRangeAndMarkToday_static_004
     * @tc.name     DisableDateRangeAndMarkToday_static_004
     * @tc.desc     DisableDateRangeAndMarkToday_static_004
     * @tc.level    Level.LEVEL1
     */
    it('DisableDateRangeAndMarkToday_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DisableDateRangeAndMarkToday_004] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-null'));
      console.info('[DisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-undefined'));
      console.info('[DisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('calendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DisableDateRangeAndMarkToday_004] attrs:' +
      JSON.stringify(obj.getElement('$attrs').getString('disabledDateRange')));
      expect(obj.getElement('$attrs').getString('disabledDateRange')).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_004] markTodayAttrs2:' +
      JSON.stringify(obj.getElement('$attrs').getString('markToday')));
      expect(obj.getElement('$attrs').getString('markToday')).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_004] END');
      done();
    });
  })
}
