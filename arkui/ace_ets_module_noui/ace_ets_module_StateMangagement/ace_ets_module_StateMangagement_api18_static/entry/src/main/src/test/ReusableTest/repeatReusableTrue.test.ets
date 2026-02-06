'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default function repeatReusableTrue() {
  describe('repeatReusableTrue', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("repeatReusableTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Reusable/repeatReusableTrue",
      }
      try {
        const repeatReusableTrue = AppStorage.get<Router>("router") as Router
        repeatReusableTrue.clear();
        let pages:router.RouterState = repeatReusableTrue.getState();
        console.info("get repeatReusableTrue state pages: " + JSON.stringify(pages));
        if (!("repeatReusableTrue" == pages.name)) {
          console.info("get repeatReusableTrue state pages.name: " + JSON.stringify(pages.name));
          // let result = await repeatReusableTrue.pushUrl(options);
          repeatReusableTrue.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push repeatReusableTrue success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatReusableTrue page error:" + err);
      }
      console.info("repeatReusableTrue beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatReusableTrue after each called");
    });

    
    /**
     * @tc.number   repeatreusabletrue_static_001
     * @tc.name     repeatreusabletrue_static_001
     * @tc.desc     repeatreusabletrue_static_001
     * @tc.level    Level.LEVEL0
     */
    it('repeatreusabletrue_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[repeatreusabletrue_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("reusabletrue"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('[a] index99: item_99'))
      expect(text != null).assertTrue()
      console.info('[repeatreusabletrue_001] END');
      done();
    });
  })
}

