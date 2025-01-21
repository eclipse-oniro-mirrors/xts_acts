/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';

export default function imagePixelMapTest(context, windowStage, abilityStorage) {
  describe('imagePixelMapTest', function () {
    beforeAll(async function (done) {
      console.info("Component3DTest beforeEach start");
      done();
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapTest_0100", 0, async function (done) {
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.requestPermissionsFromUser(getContext(), [
        'ohos.permission.CAMERA',
        'ohos.permission.MICROPHONE'
      ]).then((): void => {
        AppStorage.setOrCreate<boolean>('isShow', true)
      }).catch((error: BusinessError): void => {
      })

      let driver: Driver = Driver.create();
      await driver.delayMs(3000);
      let button1 = await driver.findComponent(ON.text('允许'));
      await driver.delayMs(1000);
      await button1.click();
      let button2 = await driver.findComponent(ON.text('允许'));
      await driver.delayMs(1000);
      await button2.click();

      let options = {
        uri: 'MainAbility/pages/index/indexPixel',
      }
      let result = await router.replace(options);
      await driver.delayMs(5000);
      let button3 = await driver.findComponent(ON.id('createPixelMapFromSurfaceSync'));
      await button3.click();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('createPixelMapFromSurfaceSync');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('pass');
      done();
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapTest_0200", 0, async function (done) {
      let options = {
        uri: 'MainAbility/pages/index/indexPixel',
      }
      let result = await router.replace(options);
      let driver: Driver = Driver.create();
      await driver.delayMs(2000);
      let button3 = await driver.findComponent(ON.id('createPixelMapFromSurfaceSync'));
      await button3.click();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('createPixelMapFromSurfaceSync');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('pass');
      await driver.delayMs(2000);
      done();
    });

  })
}