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

export default function rowJsunit() {
  describe('rowTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/row',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get row state success " + JSON.stringify(pages));
        if (!("row" == pages.name)) {
          console.info("get row state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push row page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   rowTest_static_0001
     * @tc.name     rowTest_static_0001
     * @tc.desc     rowTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('rowTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('rowTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('row');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("rowTest_static_0001 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('alignItems')).assertEqual('VerticalAlign.Center');
      console.info('rowTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   rowTest_static_0002
     * @tc.name     rowTest_static_0002
     * @tc.desc     rowTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('rowTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('rowTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('row');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("rowTest_static_0002 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('justifyContent')).assertEqual('FlexAlign.Start');
      console.info('rowTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   rowTest_static_0003
     * @tc.name     rowTest_static_0003
     * @tc.desc     rowTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('rowTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('rowTest_static_0003 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('row');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("rowTest_static_0003 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('alignItems')).assertEqual('VerticalAlign.Top');
      console.info('rowTest_static_0003 END');
      done();
    });
  })
}