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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import camera from '@ohos.multimedia.camera';

export default function imagePixelMapTest() {
  describe('imagePixelMapTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
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
    it("ImagePixelMapTest_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let curSceneMode: camera.SceneMode = camera?.SceneMode?.NORMAL_PHOTO
      if(curSceneMode == undefined) {
        expect(true).assertTrue();
        done();
      } else {
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.requestPermissionsFromUser(getContext(), [
          'ohos.permission.CAMERA',
          'ohos.permission.MICROPHONE'
        ]).then((): void => {
          AppStorage.setOrCreate<boolean>('isShow', true)
        }).catch((error: BusinessError): void => {
        })

        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button1 = await driver.findComponent(ON.text('允许'));
        await driver.delayMs(1000);
        await button1.click();
        await driver.delayMs(1000);
        let button2 = await driver.findComponent(ON.text('允许'));
        await driver.delayMs(1000);
        await button2.click();
        await driver.delayMs(1000);
        let options :router.RouterOptions= {
          url: 'MainAbility/pages/index/indexPixel',
        }
        let result = await router.replace(options);
        await driver.delayMs(1000);
        let button3 = await driver.findComponent(ON.id('createPixelMapFromSurfaceSync'));
        await button3.click();
        await driver.delayMs(1000);
        let strJson = getInspectorByKey('createPixelMapFromSurfaceSync');
        let obj :ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('pass');
        done();
      }
    });
  })
}