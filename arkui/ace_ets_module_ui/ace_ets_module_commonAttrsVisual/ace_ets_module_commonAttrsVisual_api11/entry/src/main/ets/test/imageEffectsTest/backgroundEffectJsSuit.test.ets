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
import CommonFunc from '../../MainAbility/common/Common';

import events_emitter from '@ohos.events.emitter'

export default function backgroundEffectJsSuit() {
  describe('backgroundEffectJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info("backgroundEffectJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/backgroundEffect1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundEffectJsSuit state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get backgroundEffectJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundEffectJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundEffectJsSuit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.number SUB_ACE_TS_COMPONENT_dbackgroundEffect_01
     * @tc.name backgroundEffectJsSuit_0100
     * @tc.desc Confirm if there is a callback
     * @tc.level Level 2
     * @tc.type :
     * @tc.size :
     */

    it('backgroundEffectJsSuit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[backgroundEffectJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('texteffrct'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("texteffrct");
      console.info("[backgroundEffectJsSuit_0100] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content == 'content').assertTrue();
      console.info('[backgroundEffectJsSuit_0100] END');
      done();
    });
  })
}


