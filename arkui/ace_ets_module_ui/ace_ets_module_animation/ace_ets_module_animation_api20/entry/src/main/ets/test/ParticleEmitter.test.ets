/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function ParticleEmitter() {
  describe('ParticleEmitter', () => {
    beforeEach(async (done: Function) => {
      console.info('ParticleEmitter beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParticleEmitter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ParticleEmitter state pages:' + JSON.stringify(pages));
        if (!('ParticleEmitter' == pages.name)) {
          console.info('get ParticleEmitter pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ParticleEmitter page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ParticleEmitter page error:' + err);
      }
      console.info('ParticleEmitter beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ParticleEmitter after each called');
    });

    /**
     * @tc.number ParticleEmitter_001
     * @tc.name ParticleEmitter_001
     * @tc.desc test annulusRegion
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('ParticleEmitter_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ParticleEmitter_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let getInspectorBtn: Component = await driver.findComponent(ON.id('getInspectorId'));
      await getInspectorBtn.click();
      console.info('[ParticleEmitter_001] getInspectorBtn click');
      await driver.delayMs(1000);

      let xValue: string = AppStorage.get('xValue') as string;
      expect(xValue).assertEqual('"50.00%"');
      AppStorage.delete('xValue');

      let yValue: string = AppStorage.get('yValue') as string;
      expect(yValue).assertEqual('"50.00%"');
      AppStorage.delete('yValue');

      let innerRadius: string = AppStorage.get('innerRadius') as string;
      expect(innerRadius).assertEqual('"100.000000"');
      AppStorage.delete('innerRadius');

      let outerRadius: string = AppStorage.get('outerRadius') as string;
      expect(outerRadius).assertEqual('"150.000000"');
      AppStorage.delete('outerRadius');
      
      let startAngle: string = AppStorage.get('startAngle') as string;
      expect(startAngle).assertEqual('"0.000000"');
      AppStorage.delete('startAngle');

      let endAngle: string = AppStorage.get('endAngle') as string;
      expect(endAngle).assertEqual('"360.000000"');
      AppStorage.delete('endAngle');
      console.info('ParticleEmitter_001 END');
      done();
    });
  })
}