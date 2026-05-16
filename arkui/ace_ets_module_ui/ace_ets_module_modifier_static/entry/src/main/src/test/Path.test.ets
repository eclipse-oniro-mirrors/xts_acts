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

export default function pathNewTest() {
  describe('pathTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testPathNeStatic0004
     * @tc.name     testPathNeStatic0004
     * @tc.desc     testPathNeStatic0004
     * @tc.level    Level.LEVEL0
     */
it('testPathNeStatic0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pathNe testPathNeStatic0004 START');
      let strJson = inspector.getInspectorByKey('PathKey1');
      console.info("[testPathNeStatic0004] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPathNeStatic0004] commands value :" + obj.getElement('$attrs').getString('commands'));
      expect(obj.getElement('$attrs').getString('commands')).assertEqual("M100 0 L0 100 L50 200 L150 200 L200 100 Z");
      console.info('pathNe testPathNeStatic0004 END');
      done();
    });

    
    
    /**
     * @tc.number   testPathNeStatic0005
     * @tc.name     testPathNeStatic0005
     * @tc.desc     testPathNeStatic0005
     * @tc.level    Level.LEVEL0
     */
it('testPathNeStatic0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testPathNeStatic0005 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('PathKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testPathNeStatic0005 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('commands')).assertEqual("M100 0 L0 100 L50 200 L150 200 L200 200 Z"); //

      console.info('testPathNeStatic0005 END');
      done();
    });

  })
}
