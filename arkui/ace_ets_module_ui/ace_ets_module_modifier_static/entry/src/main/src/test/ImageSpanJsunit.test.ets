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

export default function imageSpanJsunit() {
  describe('imageSpanTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageSpan',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageSpan state success " + JSON.stringify(pages));
        if (!("imageSpan" == pages.name)) {
          console.info("get imageSpan state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push imageSpan page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   imageSpanTest_static_0001
     * @tc.name     imageSpanTest_static_0001
     * @tc.desc     imageSpanTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('imageSpanTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('imageSpan');

      console.info("imageSpanTest_static_0001 component is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('verticalAlign')).assertEqual('VerticalAlign.BASELINE');
      console.info('imageSpanTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   imageSpanTest_static_0002
     * @tc.name     imageSpanTest_static_0002
     * @tc.desc     imageSpanTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('imageSpanTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('imageSpanTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('imageSpan');

      console.info("imageSpanTest_static_0002 component is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Cover');
      console.info('imageSpanTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   imageSpanTest_static_0003
     * @tc.name     imageSpanTest_static_0003
     * @tc.desc     imageSpanTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('imageSpanTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('imageSpanTest_static_0003 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('imageSpan');

      console.info("imageSpanTest_static_0003 component is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Contain');
      console.info('imageSpanTest_static_0003 END');
      done();
    });
  })
}