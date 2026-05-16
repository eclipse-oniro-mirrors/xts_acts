'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';


export default function MonitorWildcards() {
  describe('MonitorWildcards', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("MonitorWildcards beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/MonitorWildcards",
      }
      try {
        const MonitorWildcards = AppStorage.get<Router>("router") as Router
        MonitorWildcards.clear();
        let pages:router.RouterState = MonitorWildcards.getState();
        console.info("get MonitorWildcards state pages: " + JSON.stringify(pages));
        if (!("MonitorWildcards" == pages.name)) {
          console.info("get MonitorWildcards state pages.name: " + JSON.stringify(pages.name));
          // let result = await MonitorWildcards.pushUrl(options);
          MonitorWildcards.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MonitorWildcards success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MonitorWildcards page error:" + err);
      }
      console.info("MonitorWildcards beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MonitorWildcards after each called");
    });


    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0100
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0100
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("componentV2Button_001"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('componentV2Button_001');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#1 Change propA:101-1');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0200
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0200
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("componentV2Button_002"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('componentV2Button_002');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#2 Change propB:101-2');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0300
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0300
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("componentV2Button_003"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('componentV2Button_003');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#3 Assign class object:-200-3');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0400
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0400
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_001"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_001');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#1 arrayOfPerson.push:1');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0500
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0500
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0500] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_002"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_002');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#2 arrayOfPerson.splice(0,1,P):2');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0600
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0600
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0600] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_003"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_003');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#3 arrayOfPerson.assign new [1]:3');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0700
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0700
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0700] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_004"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_004');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#4 arrayOfPerson shift:4');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0700] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0800
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0800
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0800] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_005"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_005');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#5 arrayOfPerson length change:5');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0800] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_0900
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_0900
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0900] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_006"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_006');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#6 arrayOfPerson = new Array:6');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_0900] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_1000
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_1000
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1000] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("arrButtonWildcards_007"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('arrButtonWildcards_007');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('#7 arrayOfPerson [1] last name:6');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1000] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_1100
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_1100
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("observedV2Button_001"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('observedV2Button_001');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('change name:Jack:1');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_MonitorWildcardsTest_static_1200
     * @tc.name     SUB_ARKUI_API_MonitorWildcardsTest_static_1200
     * @tc.desc     SUB_ARKUI_API_MonitorWildcardsTest_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_MonitorWildcardsTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("observedV2Button_002"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('observedV2Button_002');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('change age:30:2');
      console.info('[SUB_ARKUI_API_MonitorWildcardsTest_static_1200] END');
      done();
    });
  })
}
