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

export default function DragRecognizerTest() {
  describe('DragRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DragRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/DragRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DragRecognizer state pages:' + JSON.stringify(pages));
        if (!('DragRecognizer' == pages.name)) {
          console.info('get DragRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push DragRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DragRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DragRecognizer after each called');
    });

    /**
     * @tc.name   DragRecognizer_0100
     * @tc.number DragRecognizer_0100
     * @tc.desc   To test whether DragRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DragRecognizer_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(200);
      let Column1 = await driver.findComponent(ON.id('Drag'));
      let Column2 = await driver.findComponent(ON.id('column2'));
      await Column1.dragTo(Column2);
      expect(AppStorage.get('DRAG')).assertEqual(6);
      console.info('[DragRecognizer_0100] END');
      done();
    });
  })
}