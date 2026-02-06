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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ParticleModifierTest() {
  describe('ParticleModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ParticleModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParticleModifierTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ParticleModifierTest state pages:' + JSON.stringify(pages));
        if (!('ParticleModifierTest' == pages.name)) {
          console.info('get ParticleModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ParticleModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ParticleModifierTest page error:' + err);
      }
      console.info('ParticleModifierTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ParticleModifierTest after each called');
    });


    /**
     * @tc.name   ParticleModifierTest_0100
     * @tc.number ParticleModifierTest_0100
     * @tc.desc   Test onSkip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParticleModifierTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ParticleModifierTest_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let obj1: ESObject = getInspectorTree();
      console.log('ParticleModifierTest_0100', obj1?.$children[0]?.$children[1]?.$attrs.backgroundColor)

      expect(obj1?.$children[0]?.$children[1]?.$attrs.backgroundColor).assertEqual('#EEEEA500');
      console.info('ParticleModifierTest_0100 END');
      done();
    });

  })
}