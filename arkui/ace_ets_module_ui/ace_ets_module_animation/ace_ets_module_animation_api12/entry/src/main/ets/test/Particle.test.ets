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

import CommonFunc from '../MainAbility/utils/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ParticlePage() {
  describe('ParticlePage', () => {
    beforeEach(async (done: Function) => {
      console.info("ParticlePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Particle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParticlePage state pages:" + JSON.stringify(pages));
        if (!("ParticlePage" == pages.name)) {
          console.info("get ParticlePage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParticlePage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParticlePage page error:" + err);
      }
      console.info("ParticlePage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParticlePage after each called");
    });


    /**
     * @tc.name   ParticlePage_0100
     * @tc.number ParticlePage_0100
     * @tc.desc   Test ParticleColorOptions b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParticlePage_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ParticlePage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('particleId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ParticlePage_0100] component obj is: ' + JSON.stringify(obj.$attrs.particles));
      console.info('[ParticlePage_0100] content obj is: ' + JSON.stringify(obj.$attrs.particles[0].color.updater.config));
            console.info('[ParticlePage_0100] content obj b is: ' + JSON.stringify(obj.$attrs.particles[0].color.updater.config.b));
      expect(obj.$attrs.particles[0].color.updater.config.b).assertEqual('[1.000000,20.000000]');
    
      console.info('ParticlePage_0100 END');
      done();
    });


  })
}