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

export default function navigatorJsunit() {
  describe('navigatorTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("NavigatorClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigator',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigatorTest state pages:" + JSON.stringify(pages));
        if (!("navigator" == pages.name)) {
          console.info("get NavigatorTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push NavigatorTest page error:" + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   test_Navigator_static_0021
     * @tc.name     test_Navigator_static_0021
     * @tc.desc     test_Navigator_static_0021
     * @tc.level    Level.LEVEL0
     */
it('test_Navigator_static_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_Navigator_static_0021] START');
      let strJson = inspector.getInspectorByKey('Navigator1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_Navigator_static_0021] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('params').getString('text')).assertEqual('news');
      console.info('[test_Navigator_static_0021] END');
      done();
    });

    
    
    /**
     * @tc.number   test_Navigator_static_0022
     * @tc.name     test_Navigator_static_0022
     * @tc.desc     test_Navigator_static_0022
     * @tc.level    Level.LEVEL0
     */
it('test_Navigator_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_Navigator_static_0022] START');
      let strJson = inspector.getInspectorByKey('Navigator1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_Navigator_static_0022] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('active')).assertEqual('true');
      console.info('[test_Navigator_static_0022] END');
      done();
    });

    
    
    /**
     * @tc.number   test_Navigator_static_0023
     * @tc.name     test_Navigator_static_0023
     * @tc.desc     test_Navigator_static_0023
     * @tc.level    Level.LEVEL0
     */
it('test_Navigator_static_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_Navigator_static_0023] START');
      let strJson = inspector.getInspectorByKey('Navigator1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_Navigator_static_0023] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('target')).assertEqual('');
      console.info('[test_Navigator_static_0023] END');
      done();
    });

    
    
    /**
     * @tc.number   test_Navigator_static_0024
     * @tc.name     test_Navigator_static_0024
     * @tc.desc     test_Navigator_static_0024
     * @tc.level    Level.LEVEL0
     */
it('test_Navigator_static_0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_Navigator_static_0024] START');
      let strJson = inspector.getInspectorByKey('Navigator1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_Navigator_static_0024] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('NavigationType.Push');
      console.info('[test_Navigator_static_0024] END');
      done();
    });

    
    
    /**
     * @tc.number   test_Navigator_static_0025
     * @tc.name     test_Navigator_static_0025
     * @tc.desc     test_Navigator_static_0025
     * @tc.level    Level.LEVEL0
     */
it('test_Navigator_static_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('test_Navigator_static_0025 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('Navigator1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("test_Navigator_static_0025 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('type')).assertEqual('NavigationType.Replace');
      console.info('test_Navigator_static_0025 END');
      done();
    });
  })
}