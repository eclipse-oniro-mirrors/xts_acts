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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ParticleShapePage() {
  describe('ParticleShapePage', () => {
    beforeEach(async (done: Function) => {
      console.info('ParticleShapePage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParticleShapePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ParticleShapePage state pages:' + JSON.stringify(pages));
        if (!('ParticleShapePage' == pages.name)) {
          console.info('get ParticleShapePage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ParticleShapePage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ParticleShapePage page error:' + err);
      }
      console.info('ParticleShapePage beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ParticleShapePage after each called');
    });


    /**
     * @tc.name   ParticleShapePage_0100
     * @tc.number ParticleShapePage_0100
     * @tc.desc   Test DisturbanceFieldShape.CIRCLE and  DisturbanceFieldShape.ELLIPSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParticleShapePage_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ParticleShapePage_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let textObj =  getInspectorByKey('particleId');
      let shapeValue: string = JSON.parse(textObj)?.$attrs?.disturbanceFields[0]?.shape;
      console.log('ParticleShapePage_0100 shape is : ', shapeValue)
      expect(shapeValue).assertEqual('ELLIPSE');
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('changeShapeId'));
      await btn1.click();
      await driver.delayMs(2000);

      let textObj2 =  getInspectorByKey('particleId');
      let shapeValue2: string = JSON.parse(textObj2)?.$attrs?.disturbanceFields[0]?.shape;
      console.log('ParticleShapePage_0100 shape is : ', shapeValue2)
      expect(shapeValue2).assertEqual('CIRCLE');

      console.info('ParticleShapePage_0100 END');
      done();
    });

  })
}