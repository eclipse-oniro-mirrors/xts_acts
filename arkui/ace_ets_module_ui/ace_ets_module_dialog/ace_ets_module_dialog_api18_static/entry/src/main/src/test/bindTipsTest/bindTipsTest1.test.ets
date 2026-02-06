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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,Point, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function bindTips1Test() {
  describe('ActsbindTips', () => {

    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindTips/bindTips1',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        // DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info('get bindTips state success ' + JSON.stringify(pages));
        if (!('bindTips1' == pages.name)) {
          console.info('get bindTips state success ' + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push bindTips page success ');
        }
      } catch (err) {
        console.error('push bindTips page error ' + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   bindTips1_static_0100
     * @tc.name     bindTips1_static_0100
     * @tc.desc     bindTips1_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('bindTips1_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindTips_0100 start');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('bindTips'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      console.info('[bindTips_0100] component obj is: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await UtilsTest.msSleep(2000);
      let tip = await (driver.findComponent(ON.text('test bind tips')) as Promise<Component>);
      console.log('-----tip: ' + JSON.stringify(tip))
      expect(tip !== null).assertTrue();
      // await driver.mouseMoveTo({
      //   x: 0, y: 0
      // });
      await UtilsTest.msSleep(5000);

      done();
    });
  })
}
