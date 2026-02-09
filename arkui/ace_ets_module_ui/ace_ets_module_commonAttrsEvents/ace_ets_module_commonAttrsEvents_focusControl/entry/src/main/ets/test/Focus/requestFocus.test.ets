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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
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

export default function RequestFocusTest() {
  describe('RequestFocusTest', () => {
    beforeEach(async (done: Function) => {
      console.info('RequestFocus beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get RequestFocus state pages:' + JSON.stringify(pages));
        if (!('RequestFocus' == pages.name)) {
          console.info('get RequestFocus state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push RequestFocus page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RequestFocus page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RequestFocus after each called');
    });

    /**
     * @tc.name   RequestFocus_0100
     * @tc.number RequestFocus_0100
     * @tc.desc   To test whether RequestFocus is TRUE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RequestFocus_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RequestFocus_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(200);
      let button: Component = await driver.findComponent(ON.id('RequestFocus'));
      let rect = await button.click();
      await CommonFunc.sleep(200);
      expect(AppStorage.get('RequestTrue')).assertEqual(true);
      console.info('[RequestFocus_0100] END');
      done();
    });

    /**
     * @tc.name   RequestFocus_0200
     * @tc.number RequestFocus_0200
     * @tc.desc   To test whether RequestFocus is False.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RequestFocus_0200', Level.LEVEL0, async (done: Function) => {
      console.info('RequestFocus_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(200);
      let button: Component = await driver.findComponent(ON.id('RequestFocusFalse'));
      let rect = await button.click();
      await CommonFunc.sleep(200);
      expect(AppStorage.get('RequestFalse')).assertEqual(false);
      console.info('[RequestFocus_0200] END');
      done();
    });
  })
}