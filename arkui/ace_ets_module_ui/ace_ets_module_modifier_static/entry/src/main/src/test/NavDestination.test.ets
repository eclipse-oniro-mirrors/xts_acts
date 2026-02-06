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
import events_emitter from '@ohos.events.emitter';

export default function navDestinationJsunit() {
  describe('navDestinationTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("NavDestination beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavDestination state success " + JSON.stringify(pages));
        if (!("navDestination" == pages.name)) {
          console.info("get NavDestination state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push NavDestination page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testNavDestinationStatic
     * @tc.name     testNavDestinationStatic
     * @tc.desc     testNavDestinationStatic
     * @tc.level    Level.LEVEL0
     */
it('testNavDestinationStatic', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testNavDestinationStatic] START');
      let strJson = inspector.getInspectorByKey('NavDestination1');
      console.info("[testNavDestinationStatic] strJson is : " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testNavDestinationStatic] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').tryGetElement('hideTitleBar')).assertEqual(undefined);
      console.info('[testNavDestinationStatic] END');
      done();
    });

    
    
    /**
     * @tc.number   testNavDestinationStatic_01
     * @tc.name     testNavDestinationStatic_01
     * @tc.desc     testNavDestinationStatic_01
     * @tc.level    Level.LEVEL0
     */
it('testNavDestinationStatic_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testNavDestinationStatic_01 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('NavDestination1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testNavDestinationStatic_01 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').tryGetElement('hideTitleBar')).assertEqual(undefined);
      console.info('testNavDestinationStatic_01 END');
      done();
    });
  })
}
