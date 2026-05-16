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
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';


export default function toggleJsunit() {
  describe('toggleTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("Toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toggle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Toggle state pages: " + JSON.stringify(pages));
        if (!("toggle" == pages.name)) {
          console.info("get Toggle state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push Toggle page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   ToggleJsunitStatic001
     * @tc.name     ToggleJsunitStatic001
     * @tc.desc     ToggleJsunitStatic001
     * @tc.level    Level.LEVEL0
     */
it('ToggleJsunitStatic001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ToggleJsunitStatic001] START');
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunitStatic001] obj: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual('#FF0000FF');
      console.info('[ToggleJsunitStatic001] END');
      done();
    });

    
    
    /**
     * @tc.number   ToggleJsunitStatic002
     * @tc.name     ToggleJsunitStatic002
     * @tc.desc     ToggleJsunitStatic002
     * @tc.level    Level.LEVEL0
     */
it('ToggleJsunitStatic002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ToggleJsunitStatic002] START');
      let strJson = inspector.getInspectorByKey('toggleCheckbox');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToggleJsunitStatic002] obj: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('switchPointColor')).assertEqual('#FF008000');
      console.info('[ToggleJsunitStatic002] END');
      done();
    });

    
    
    /**
     * @tc.number   ToggleJsunitStatic003
     * @tc.name     ToggleJsunitStatic003
     * @tc.desc     ToggleJsunitStatic003
     * @tc.level    Level.LEVEL0
     */
it('ToggleJsunitStatic003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ToggleJsunitStatic003 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('toggleCheckbox'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ToggleJsunitStatic003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('selectedColor')).assertEqual("#FF0000FF"); //
      console.info('ToggleJsunitStatic003 END');
      done();
    });
  })
}