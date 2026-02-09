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

export default function dialogDialogDisableDateRangeAndMarkTodayTest() {
  describe('DialogDisableDateRangeAndMarkToday', () => {
    beforeAll(() => {
      console.info("DialogDisableDateRangeAndMarkToday beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api19.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('DialogDisableDateRangeAndMarkToday beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/dialogDisableDateRangeAndMarkToday',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DialogDisableDateRangeAndMarkToday state pages:' + JSON.stringify(pages));
        if (!('dialogDisableDateRangeAndMarkToday' == pages.name)) {
          console.info('get DialogDisableDateRangeAndMarkToday pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push DialogDisableDateRangeAndMarkToday page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DialogDisableDateRangeAndMarkToday page error:' + err);
      }
      console.info('DialogDisableDateRangeAndMarkToday beforeEach end');
    });


    /**
     * @tc.number   DialogDisableDateRangeAndMarkToday_static_001
     * @tc.name     DialogDisableDateRangeAndMarkToday_static_001
     * @tc.desc     DialogDisableDateRangeAndMarkToday_static_001
     * @tc.level    Level.LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DialogDialogDisableDateRangeAndMarkToday_001] START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('normal-2025-01-09-2025-01-10'));
      console.info('[DialogDialogDisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let markTodybtn = await driver.findComponent(ON.id('Today-true'));
      console.info('[DialogDialogDisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      console.log('DialogDialogDisableDateRangeAndMarkToday_001afterclck=================')
      await Utils.sleep(1000);
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      await Utils.sleep(2000);
      console.log('-------getInspectorTree '+ inspector.getInspectorTree())
      let objjson = JSON.stringify(inspector.getInspectorTree())
      console.log('-------stringify '+ objjson)
      let obj = JSON.parseJsonElement(objjson);
      console.log('-------parseJsonElement ')


      await Utils.sleep(2000);
      console.log('DialogDialogDisableDateRangeAndMarkToday_001afterclck2=================' + JSON.stringify(obj))
      let calendarPickerDialog =

        JSON.stringify(obj.getArray("$children")[1].getArray("$children")[0].getArray("$children")[0])
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange'))
        .assertEqual('2025年1月9日星期四,2025年1月10日星期五');
      await Utils.sleep(1000);
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday'))
        .assertEqual('true');
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      await Utils.sleep(1000);
      console.info('[DialogDisableDateRangeAndMarkToday_001] END');
      done();
    });

    //异常参数场景 注释

    /**
     * @tc.number   DialogDisableDateRangeAndMarkToday_static_002
     * @tc.name     DialogDisableDateRangeAndMarkToday_static_002
     * @tc.desc     DialogDisableDateRangeAndMarkToday_static_002
     * @tc.level    Level.LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DialogDisableDateRangeAndMarkToday_002] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-start'));
      console.info('[DialogDisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-false'));
      console.info('[DialogDisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      // await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let calendarPickerDialog =
        JSON.stringify(obj.getArray("$children")[1].getArray("$children")[0].getArray("$children")[0])
      console.info('[DialogDisableDateRangeAndMarkToday_002] disabledDateRange:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange')));
      console.info('[DialogDisableDateRangeAndMarkToday_002] selectedDate:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday')));
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange'))
        .assertNull;
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday'))
        .assertEqual('false');
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      await Utils.sleep(2000);
      console.info('[DialogDisableDateRangeAndMarkToday_002] END');
      done();
    });


    //异常参数场景 注释

    /**
     * @tc.number   DialogDisableDateRangeAndMarkToday_static_003
     * @tc.name     DialogDisableDateRangeAndMarkToday_static_003
     * @tc.desc     DialogDisableDateRangeAndMarkToday_static_003
     * @tc.level    Level.LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DialogDisableDateRangeAndMarkToday_003] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-undefined'));
      console.info('[DialogDisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-null'));
      console.info('[DialogDisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      // await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));

      let calendarPickerDialog =
        JSON.stringify(obj.getArray("$children")[1].getArray("$children")[0].getArray("$children")[0])
      console.info('[DialogDisableDateRangeAndMarkToday_003] disabledDateRange:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange')));
      console.info('[DialogDisableDateRangeAndMarkToday_003] selectedDate:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday')));
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange'))
        .assertNull;
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday'))
        .assertEqual('false');
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      await Utils.sleep(2000);
      console.info('[DialogDisableDateRangeAndMarkToday_003] END');
      done();
    });


    //异常参数场景

    /**
     * @tc.number   DialogDisableDateRangeAndMarkToday_static_004
     * @tc.name     DialogDisableDateRangeAndMarkToday_static_004
     * @tc.desc     DialogDisableDateRangeAndMarkToday_static_004
     * @tc.level    Level.LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DialogDisableDateRangeAndMarkToday_004] START');
      await Utils.sleep(2000);
      let driver = Driver.create();
      let rangebtn = await driver.findComponent(ON.id('outlier-null'));
      console.info('[DialogDisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(rangebtn));
      await (rangebtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      let markTodybtn = await driver.findComponent(ON.id('Today-undefined'));
      console.info('[DialogDisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(markTodybtn));
      await (markTodybtn?.click() as Promise<void>);
      await Utils.sleep(2000);
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      // await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let calendarPickerDialog =
        JSON.stringify(obj.getArray("$children")[1].getArray("$children")[0].getArray("$children"))
      console.info('[DialogDisableDateRangeAndMarkToday_004] disabledDateRange:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange')));
      console.info('[DialogDisableDateRangeAndMarkToday_004] selectedDate:' +
      JSON.stringify(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday')));
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('disabledDateRange'))
        .assertNull;
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(calendarPickerDialog).getElement('$attrs').getString('markToday'))
        .assertEqual('false');
      inspector.sendEventByKey('calendarPickerDialog', 10, '')
      await Utils.sleep(2000);
      console.info('[DialogDisableDateRangeAndMarkToday_004] END');
      done();
    });
  })
}
