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
import image from '@ohos.multimedia.image';

export default function imagePixelMapTest() {
  describe('imagePixelMapTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.name   ImagePixelMapTest_0100
     * @tc.number ImagePixelMapTest
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ImagePixelMapTest_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let options :router.RouterOptions= {
        url: 'MainAbility/pages/second/second',
      }
      let result = await router.push(options);
      await driver.delayMs(4000);
      let button3 = await driver.findComponent(ON.id('getSurfaceId'));
      await button3.click();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('getSurfaceId');
      console.info('www data strJson surfaceId 111 ', strJson);
      let obj :ESObject = JSON.parse(strJson);
      console.info('www data strJson surfaceId 222 ', JSON.stringify(obj));
      console.info('www data strJson surfaceId 333 ', obj.$attrs.content);
      let surfaceId: string = obj.$attrs.content;
      console.info('www data strJson surfaceId 444 ', surfaceId);
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } }
      try {
        await image.createPixelMapFromSurfaceSync(surfaceId, region);
        console.info('www data ImagePixelMapTest_0100 PixelMap 111 created successfully.');
      } catch(err) {
        const error = err as BusinessError;
        console.error(`www data ImagePixelMapTest_0100 Failed to 111 create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImagePixelMapTest_0200
     * @tc.number ImagePixelMapTest
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ImagePixelMapTest_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let options :router.RouterOptions= {
        url: 'MainAbility/pages/second/second',
      }
      let result = await router.push(options);
      await driver.delayMs(4000);
      let button3 = await driver.findComponent(ON.id('getSurfaceId'));
      await button3.click();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('getSurfaceId');
      console.info('www data strJson surfaceId 111 ', strJson);
      let obj :ESObject = JSON.parse(strJson);
      console.info('www data strJson surfaceId 222 ', JSON.stringify(obj));
      console.info('www data strJson surfaceId 333 ', obj.$attrs.content);
      let surfaceId: string = obj.$attrs.content;
      console.info('www data strJson surfaceId 444 ', surfaceId);
      try {
        const pixelMap: image.PixelMap = 
        image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, true);
        console.info('www data strJson PixelMap 111 created successfully.');
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data strJson Failed to 111 create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      try {
        const pixelMap: image.PixelMap = 
        image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, false);
        console.info('www data strJson PixelMap 222 created successfully.');
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data strJson Failed to 222 create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }

      await image.createPixelMapFromSurfaceWithTransformation(surfaceId, true).then((pixelMap: image.PixelMap) => {
        console.info('www data strJson PixelMap 333 created successfully.');
      }).catch((e: Error) => {
        console.error(`www data Failed to 333 create PixelMap. Code: ${e}`);
        expect().assertFail();
      });

      await image.createPixelMapFromSurfaceWithTransformation(surfaceId, false).then((pixelMap: image.PixelMap) => {
        console.info('www data strJson PixelMap 444 created successfully.');
      }).catch((e: Error) => {
        console.error(`www data Failed to 444 create PixelMap. Code: ${e}`);
        expect().assertFail();
      });
      done();
    });
    
  })
}