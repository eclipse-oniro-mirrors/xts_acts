/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function AnimateToNullTest() {
  describe('AnimateToNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('AnimateToNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/AnimateToNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AnimateToNullTest state pages:' + JSON.stringify(pages));
        if (!('AnimateToNullTest' == pages.name)) {
          console.info('get AnimateToNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push AnimateToNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AnimateToNullTest page error:' + err);
      }
      console.info('AnimateToNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   AnimateToNullTest_0100
     * @tc.number AnimateToNullTest_0100
     * @tc.desc   animateTo null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AnimateToNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('AnimateToNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_animateTo_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_animateTo_undefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('animateToNull')).assertEqual('success');
      expect(AppStorage.get('animateToUndefined')).assertEqual('success');
      AppStorage.delete('animateToNull');
      AppStorage.delete('animateToUndefined');
      console.info('[AnimateToNullTest_0100] END');
      done();
    });
  })
}