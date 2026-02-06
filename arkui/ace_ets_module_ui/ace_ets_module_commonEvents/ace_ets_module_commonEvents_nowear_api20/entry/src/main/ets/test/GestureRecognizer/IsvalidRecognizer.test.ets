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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
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

export default function IsvalidRecognizerTest() {
  describe('IsvalidRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('IsvalidRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/IsvalidRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get IsvalidRecognizer state pages:' + JSON.stringify(pages));
        if (!('IsvalidRecognizer' == pages.name)) {
          console.info('get IsvalidRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IsvalidRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IsvalidRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('IsvalidRecognizer after each called');
    });

    /**
     * @tc.number : IsvalidRecognizer_0100
     * @tc.name  : IsvalidRecognizer_0100
     * @tc.desc  : To test whether IsvalidRecognizer is effective.
     * @tc.level : Level 0
     */
    it('IsvalidRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IsvalidRecognizer_0100 START');
      let driver = await Driver.create()
      let scrollBar: Component = await driver.findComponent(ON.id('outer'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(200);
      expect(AppStorage.get('isValid')).assertEqual(true);
      expect(AppStorage.get('isBuiltIn')).assertEqual(true);
      expect(AppStorage.get('getState4')).assertEqual(4);

      let Column = await driver.findComponent(ON.id('button'));
      await Column.click();
      await CommonFunc.sleep(200);
      await scrollBar.scrollToTop()
      expect(AppStorage.get('isValid')).assertEqual(false);
      expect(AppStorage.get('getState4')).assertEqual(5);
      console.info('[IsvalidRecognizer_0100] END');
      done();
    });
  })
}