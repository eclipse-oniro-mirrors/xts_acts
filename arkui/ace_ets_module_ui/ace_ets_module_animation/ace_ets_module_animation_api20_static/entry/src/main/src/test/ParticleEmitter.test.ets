'use static';
/**
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ParticleEmitter() {
  describe('ParticleEmitter', () => {
    beforeAll(() => {
      console.info("ParticleEmitter beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info('ParticleEmitter beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParticleEmitter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ParticleEmitter state pages:' + JSON.stringify(pages));
        if (!('ParticleEmitter' == pages.name)) {
          console.info('get ParticleEmitter pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ParticleEmitter page error:' + err);
      }
      console.info('ParticleEmitter beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ParticleEmitter after each called');
    });

    
    /**
     * @tc.number   ParticleEmitter_static_001
     * @tc.name     ParticleEmitter_static_001
     * @tc.desc     ParticleEmitter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('ParticleEmitter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[ParticleEmitter_001] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await driver.delayMs(1000);
        console.log('test 1156')
        let getInspectorBtn = await driver.findComponent(ON.id('getInspectorId'));
        await CommonFunc.sleep(1000);
        console.log('test 1156  ' + getInspectorBtn)
        await (getInspectorBtn?.click() as Promise<void>);
        console.info('[ParticleEmitter_001] getInspectorBtn click');
        await driver.delayMs(1000);

        let xValue: string = AppStorage.get<string>('xValue') as string;
        expect(xValue).assertEqual('"50.00%"');
        AppStorage.delete('xValue');

        let yValue: string = AppStorage.get<string>('yValue') as string;
        expect(yValue).assertEqual('"50.00%"');
        AppStorage.delete('yValue');

        let innerRadius: string = AppStorage.get<string>('innerRadius') as string;
        expect(innerRadius).assertEqual('"100.000000"');
        AppStorage.delete('innerRadius');

        let outerRadius: string = AppStorage.get<string>('outerRadius') as string;
        expect(outerRadius).assertEqual('"150.000000"');
        AppStorage.delete('outerRadius');

        let startAngle: string = AppStorage.get<string>('startAngle') as string;
        expect(startAngle).assertEqual('"0.000000"');
        AppStorage.delete('startAngle');

        let endAngle: string = AppStorage.get<string>('endAngle') as string;
        expect(endAngle).assertEqual('"360.000000"');
        AppStorage.delete('endAngle');
        console.info('ParticleEmitter_001 END');
        done();
      });
  })
}