/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function TransitionEffectOpacity() {

  describe('TransitionEffectOpacity', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TransitionEffectOpacity',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TransitionEffectOpacity state pages: ' + JSON.stringify(pages));
        if (!('TransitionEffectOpacity' == pages.name)) {
          console.info('get TransitionEffectOpacity state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TransitionEffectOpacity success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TransitionEffectOpacity page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TransitionEffectOpacity after each called');
    });

    /**
     * @tc.number TransitionEffectOpacity_0100
     * @tc.name TransitionEffectOpacity_0100
     * @tc.desc test Opacity
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TransitionEffectOpacity_0100', Level.LEVEL2, async (done: Function) => {
      console.info('TransitionEffectOpacity_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let column1 = await driver.findComponent(ON.id('column1'));
      expect(column1 !== null).assertTrue();
      let button = await driver.findComponent(ON.id('showId'));
      await button.click();
      await CommonFunc.sleep(2000);
      let column2 = await driver.findComponent(ON.id('column1'));
      expect(column2 == null).assertTrue();
      console.info('[TransitionEffectOpacity_0100] END');
      done();
    });

  })
}
