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

export default function lineNeJsunit() {
  describe('lineTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testLineNeStatic00071
     * @tc.name     testLineNeStatic00071
     * @tc.desc     testLineNeStatic00071
     * @tc.level    Level.LEVEL0
     */
it('testLineNeStatic00071', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineNe testLineNeStatic00071 START');
      let strJson = inspector.getInspectorByKey('LineKey1');
      console.info("[testLineNeStatic00071] obj value :" + JSON.parseJsonElement(strJson).getElement('$attrs'));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[0])).assertEqual('0');
      console.info('lineNe testLineNeStatic00071 END');
      done();
    });

    
    
    /**
     * @tc.number   testLineNeStatic00072
     * @tc.name     testLineNeStatic00072
     * @tc.desc     testLineNeStatic00072
     * @tc.level    Level.LEVEL0
     */
it('testLineNeStatic00072', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineNe testLineNeStatic00072 START');
      let strJson = inspector.getInspectorByKey('LineKey1');
      console.info("[testLineNeStatic00072] obj value :" + JSON.parseJsonElement(strJson).getElement('$attrs'));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[0])).assertEqual('200');
      console.info('lineNe testLineNeStatic00072 END');
      done();
    });

    
    
    /**
     * @tc.number   testLineNeStatic00073
     * @tc.name     testLineNeStatic00073
     * @tc.desc     testLineNeStatic00073
     * @tc.level    Level.LEVEL0
     */
it('testLineNeStatic00073', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testLineNeStatic00073 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('LineKey1'); //测试组件的key名称
      console.info("testLineNeStatic00073 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getArray('startPoint')[0])).assertEqual('1'); //
      console.info('testLineNeStatic00073 END');
      done();
    });
  })
}
