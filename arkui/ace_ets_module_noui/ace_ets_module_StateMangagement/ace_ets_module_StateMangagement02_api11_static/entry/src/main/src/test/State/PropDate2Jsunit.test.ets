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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function PropDate2Jsunit() {
  describe('PropDate2Jsunit', () => {
    beforeAll(() => {
      console.info("PropDate2Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("PropDate2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropDate2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PropDate2Jsunit state pages:" + JSON.stringify(pages));
        if (!("PropDate2" == pages.name)) {
          console.info("get PropDate2Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PropDate2Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropDate2Jsunit page error:" + err);
      }
      console.info("PropDate2Jsunit beforeEach end");
    });

  

    /**
     * @tc.number   PropDate2Jsunit_static_0010
     * @tc.name     PropDate2Jsunit_static_0010
     * @tc.desc     PropDate2Jsunit_static_0010
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropDate2Jsunit_static_0010 START');
      let strJson = inspector.getInspectorByKey('setTime1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0010] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0010] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the Time by 11628380800000");
      console.info('[PropDate2Jsunit_static_0010] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0020
     * @tc.name     PropDate2Jsunit_static_0020
     * @tc.desc     PropDate2Jsunit_static_0020
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropDate2Jsunit_static_0020 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setTime1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PropDate2Jsunit_static_0020 START');
      let strJson = inspector.getInspectorByKey('setTime1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0020] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0020] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the Time by 11628380800001");
      console.info('[PropDate2Jsunit_static_0020] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0030
     * @tc.name     PropDate2Jsunit_static_0030
     * @tc.desc     PropDate2Jsunit_static_0030
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let strJson = inspector.getInspectorByKey('setUTCFullYear1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0030] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0030] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCFullYear by 12021");
      console.info('[PropDate2Jsunit_static_0030] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0040
     * @tc.name     PropDate2Jsunit_static_0040
     * @tc.desc     PropDate2Jsunit_static_0040
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0040 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCFullYear1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCFullYear1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0040] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0040] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCFullYear by 12022");
      console.info('[PropDate2Jsunit_static_0040] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0050
     * @tc.name     PropDate2Jsunit_static_0050
     * @tc.desc     PropDate2Jsunit_static_0050
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0050 START');
      let strJson = inspector.getInspectorByKey('setUTCMonth1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0050] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0050] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMonth by 17");
      console.info('[PropDate2Jsunit_static_0050] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0060
     * @tc.name     PropDate2Jsunit_static_0060
     * @tc.desc     PropDate2Jsunit_static_0060
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0060 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMonth1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMonth1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0060] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0060] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMonth by 18");
      console.info('[PropDate2Jsunit_static_0060] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0070
     * @tc.name     PropDate2Jsunit_static_0070
     * @tc.desc     PropDate2Jsunit_static_0070
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0070 START');
      let strJson = inspector.getInspectorByKey('getUTCDate1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0070] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0070] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCDate by 18");
      console.info('[PropDate2Jsunit_static_0070] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0080
     * @tc.name     PropDate2Jsunit_static_0080
     * @tc.desc     PropDate2Jsunit_static_0080
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0080 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('getUTCDate1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('getUTCDate1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0080] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0080] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCDate by 19");
      console.info('[PropDate2Jsunit_static_0080] END');
      done();
    });
    /**
     * @tc.number   PropDate2Jsunit_static_0090
     * @tc.name     PropDate2Jsunit_static_0090
     * @tc.desc     PropDate2Jsunit_static_0090
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0090 START');
      let strJson = inspector.getInspectorByKey('setUTCHours1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0090] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0090] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCHour by 10");
      console.info('[PropDate2Jsunit_static_0090] END');
      done();
    });
    /**
     * @tc.number   PropDate2Jsunit_static_0100
     * @tc.name     PropDate2Jsunit_static_0100
     * @tc.desc     PropDate2Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0100 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCHours1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCHours1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCHour by 11");
      console.info('[PropDate2Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0110
     * @tc.name     PropDate2Jsunit_static_0110
     * @tc.desc     PropDate2Jsunit_static_0110
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0110 START');
      let strJson = inspector.getInspectorByKey('setUTCMinutes1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0110] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0110] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMinute by 10");
      console.info('[PropDate2Jsunit_static_0110] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0120
     * @tc.name     PropDate2Jsunit_static_0120
     * @tc.desc     PropDate2Jsunit_static_0120
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0120 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMinutes1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMinutes1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0120] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0120] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMinute by 11");
      console.info('[PropDate2Jsunit_static_0120] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0130
     * @tc.name     PropDate2Jsunit_static_0130
     * @tc.desc     PropDate2Jsunit_static_0130
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_01430 START');
      let strJson = inspector.getInspectorByKey('setUTCSeconds1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0130] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0130] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCSecond by 10");
      console.info('[PropDate2Jsunit_static_0130] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0140
     * @tc.name     PropDate2Jsunit_static_0140
     * @tc.desc     PropDate2Jsunit_static_0140
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0140', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0140 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCSeconds1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCSeconds1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0140] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0140] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCSecond by 11");
      console.info('[PropDate2Jsunit_static_0140] END');
      done();
    });
    /**
     * @tc.number   PropDate2Jsunit_static_0150
     * @tc.name     PropDate2Jsunit_static_0150
     * @tc.desc     PropDate2Jsunit_static_0150
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0150 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('ChildDate2_reset'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMilliseconds1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0150] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0150] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMillisecond by 10");
      console.info('[PropDate2Jsunit_static_0150] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0160
     * @tc.name     PropDate2Jsunit_static_0160
     * @tc.desc     PropDate2Jsunit_static_0160
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0160 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMilliseconds1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMilliseconds1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0160] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0160] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMillisecond by 11");
      console.info('[PropDate2Jsunit_static_0160] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0170
     * @tc.name     PropDate2Jsunit_static_0170
     * @tc.desc     PropDate2Jsunit_static_0170
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0170 START');
      let strJson = inspector.getInspectorByKey('setTime002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0170] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0170] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the Time by 11662685261001");
      console.info('[PropDate2Jsunit_static_0170] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0180
     * @tc.name     PropDate2Jsunit_static_0180
     * @tc.desc     PropDate2Jsunit_static_0180
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0180 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setTime002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setTime002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0180] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0180] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the Time by 11662685261002");
      console.info('[PropDate2Jsunit_static_0180] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0190
     * @tc.name     PropDate2Jsunit_static_0190
     * @tc.desc     PropDate2Jsunit_static_0190
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0190 START');
      let strJson = inspector.getInspectorByKey('setUTCFullYear');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0190] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0190] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCFullYear by 12022");
      console.info('[PropDate2Jsunit_static_0190] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0200
     * @tc.name     PropDate2Jsunit_static_0200
     * @tc.desc     PropDate2Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0200 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCFullYear'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCFullYear');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCFullYear by 12023");
      console.info('[PropDate2Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0210
     * @tc.name     PropDate2Jsunit_static_0210
     * @tc.desc     PropDate2Jsunit_static_0210
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0210 START');
      let strJson = inspector.getInspectorByKey('setUTCMonth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0210] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0210] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMonth by 18");
      console.info('[PropDate2Jsunit_static_0210] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0220
     * @tc.name     PropDate2Jsunit_static_0220
     * @tc.desc     PropDate2Jsunit_static_0220
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0220 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMonth'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMonth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0220] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0220] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMonth by 19");
      console.info('[PropDate2Jsunit_static_0220] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0230
     * @tc.name     PropDate2Jsunit_static_0230
     * @tc.desc     PropDate2Jsunit_static_0230
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0230 START');
      let strJson = inspector.getInspectorByKey('setUTCDate');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0230] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0230] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCDate by 19");
      console.info('[PropDate2Jsunit_static_0230] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0240
     * @tc.name     PropDate2Jsunit_static_0240
     * @tc.desc     PropDate2Jsunit_static_0240
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0240 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCDate'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCDate');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0240] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0240] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCDate by 110");
      console.info('[PropDate2Jsunit_static_0240] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0250
     * @tc.name     PropDate2Jsunit_static_0250
     * @tc.desc     PropDate2Jsunit_static_0250
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0250', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0250 START');
      let strJson = inspector.getInspectorByKey('setUTCHours');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0250] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0250] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCHour by 11");
      console.info('[PropDate2Jsunit_static_0250] END');
      done();
    });
    /**
     * @tc.number   PropDate2Jsunit_static_0260
     * @tc.name     PropDate2Jsunit_static_0260
     * @tc.desc     PropDate2Jsunit_static_0260
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0260', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0260 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCHours'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCHours');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0260] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0260] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCHour by 12");
      console.info('[PropDate2Jsunit_static_0260] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0270
     * @tc.name     PropDate2Jsunit_static_0270
     * @tc.desc     PropDate2Jsunit_static_0270
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0270', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0270 START');
      let strJson = inspector.getInspectorByKey('setUTCMinutes');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0270] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0270] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMinute by 11");
      console.info('[PropDate2Jsunit_static_0270] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0280
     * @tc.name     PropDate2Jsunit_static_0280
     * @tc.desc     PropDate2Jsunit_static_0280
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0280 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMinutes'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMinutes');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0280] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0280] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMinute by 12");
      console.info('[PropDate2Jsunit_static_0280] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0290
     * @tc.name     PropDate2Jsunit_static_0290
     * @tc.desc     PropDate2Jsunit_static_0290
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0290', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0290 START');
      let strJson = inspector.getInspectorByKey('setUTCSeconds');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0290] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0290] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCSecond by 11");
      console.info('[PropDate2Jsunit_static_0290] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0300
     * @tc.name     PropDate2Jsunit_static_0300
     * @tc.desc     PropDate2Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0300 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCSeconds'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCSeconds');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCSecond by 12");
      console.info('[PropDate2Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0310
     * @tc.name     PropDate2Jsunit_static_0310
     * @tc.desc     PropDate2Jsunit_static_0310
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0310 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('PropDate2_reset'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMilliseconds');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0310] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0310] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMillisecond by 10");
      console.info('[PropDate2Jsunit_static_0310] END');
      done();
    });

    /**
     * @tc.number   PropDate2Jsunit_static_0320
     * @tc.name     PropDate2Jsunit_static_0320
     * @tc.desc     PropDate2Jsunit_static_0320
     * @tc.level    Level.LEVEL0
     */
it('PropDate2Jsunit_static_0320', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropDate2Jsunit_static_0320 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setUTCMilliseconds'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setUTCMilliseconds');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropDate2Jsunit_static_0320] component obj is: " + JSON.stringify(obj));
      console.info("[PropDate2Jsunit_static_0320] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("increase the UTCMillisecond by 11");
      console.info('[PropDate2Jsunit_static_0320] END');
      done();
    });
  })
}

