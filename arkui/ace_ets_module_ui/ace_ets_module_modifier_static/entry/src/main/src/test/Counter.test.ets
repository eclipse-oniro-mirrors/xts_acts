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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';

export default function counterJsunit() {
  describe('counterTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");
    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Counter state success " + JSON.stringify(pages));
        if (!("counter" == pages.name)) {
          console.info("get Counter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push Counter page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testCounterStatic01
     * @tc.name     testCounterStatic01
     * @tc.desc     testCounterStatic01
     * @tc.level    Level.LEVEL0
     */
it('testCounterStatic01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testCounterStatic01] START');
      let strJson = inspector.getInspectorByKey('Counter');
      console.info("[testCounterStatic01] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableInc')).assertEqual("true");
      console.info('[testCounterStatic01] END');
      done();
    });

    
    
    /**
     * @tc.number   testCounterStatic02
     * @tc.name     testCounterStatic02
     * @tc.desc     testCounterStatic02
     * @tc.level    Level.LEVEL0
     */
it('testCounterStatic02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testCounterStatic02] START');
      let strJson = inspector.getInspectorByKey('Counter');
      console.info("[testCounterStatic02] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDec')).assertEqual("true");
      console.info('[testCounterStatic02] END');
      done();
    });

    
    
    /**
     * @tc.number   testCounterStatic03
     * @tc.name     testCounterStatic03
     * @tc.desc     testCounterStatic03
     * @tc.level    Level.LEVEL0
     */
it('testCounterStatic03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testCounterStatic03 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('Counter');
      console.info("testCounterStatic03 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('enableDec')).assertEqual("true");
      console.info('testCounterStatic03 END');
      done();
    });
  })
}
