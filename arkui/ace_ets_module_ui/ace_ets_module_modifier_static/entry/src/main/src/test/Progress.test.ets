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

export default function progressStyleJsunit() {
  describe('progressTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testProgressStyleStatic0001
     * @tc.name     testProgressStyleStatic0001
     * @tc.desc     testProgressStyleStatic0001
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyleStatic0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyleStatic0001 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyleStatic0001] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF123456");

      console.info('testProgressStyleStatic0001 END');
      done();
    });

    
    
    /**
     * @tc.number   testProgressStyleStatic0002
     * @tc.name     testProgressStyleStatic0002
     * @tc.desc     testProgressStyleStatic0002
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyleStatic0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyleStatic0002 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyleStatic0002] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('value')).assertEqual("12.000000");

      console.info('testProgressStyleStatic0002 END');
      done();
    });

    
    
    /**
     * @tc.number   testProgressStyleStatic0003
     * @tc.name     testProgressStyleStatic0003
     * @tc.desc     testProgressStyleStatic0003
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyleStatic0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyleStatic0003 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyleStatic0003] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('style')).assertEqual('{"strokeWidth":"20.00vp","scaleCount":"30","scaleWidth":"20.00vp"}');
      console.info('testProgressStyleStatic0003 END');
      done();
    });
    
    
    /**
     * @tc.number   testProgressStyleStatic0004
     * @tc.name     testProgressStyleStatic0004
     * @tc.desc     testProgressStyleStatic0004
     * @tc.level    Level.LEVEL0
     */
it('testProgressStyleStatic0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyleStatic0004 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
      await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ProgressKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testProgressStyleStatic0004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('value')).assertEqual('5.000000'); //
      console.info('testProgressStyleStatic0004 END');
      done();
    });
  })
}
