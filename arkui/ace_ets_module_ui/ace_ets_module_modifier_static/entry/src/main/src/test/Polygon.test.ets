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

export default function polygonJsunit() {
  describe('polygonTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polygon',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Polygon state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get Polygon state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push Polygon page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testpolygon_static_001
     * @tc.name     testpolygon_static_001
     * @tc.desc     testpolygon_static_001
     * @tc.level    Level.LEVEL0
     */
it('testpolygon_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testpolygon_static_001 START');

      let strJsonNew = inspector.getInspectorByKey('polygon1');
      let objNew = JSON.parseJsonElement(strJsonNew);

      console.info("testpolygon_static_001 objNew component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getBoolean('points')).assertEqual(true);
      console.info('testpolygon_static_001 END');
      done();
    });

    
    
    /**
     * @tc.number   testpolygon_static_002
     * @tc.name     testpolygon_static_002
     * @tc.desc     testpolygon_static_002
     * @tc.level    Level.LEVEL0
     */
it('testpolygon_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testpolygon_static_002 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('polygon1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      expect(objNew.getElement('$attrs').getBoolean('points')).assertEqual(true);
      console.info('testpolygon_static_002 END');
      done();
    });
  })
}
