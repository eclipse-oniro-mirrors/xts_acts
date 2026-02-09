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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SwipeRecognizerTest() {
  describe('SwipeRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwipeRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/SwipeRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwipeRecognizer state pages:' + JSON.stringify(pages));
        if (!('SwipeRecognizer' == pages.name)) {
          console.info('get SwipeRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SwipeRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SwipeRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SwipeRecognizer after each called');
    });

    /**
     * @tc.name   SwipeRecognizer_0100
     * @tc.number SwipeRecognizer_0100
     * @tc.desc   To test whether SwipeRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwipeRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeRecognizer_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeRecognizer');
      let top = colum.top
      let left = colum.left
      await driver.swipe(Math.round(globalThis.winLeft + 100), Math.round(top + 100), Math.round(globalThis.winLeft + 500), Math.round(top + 500), 1200)
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SwipeRecognizer_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeRecognizer_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('SwipeGesture\ndirection:3\nfingers:1\nisFingerCountLimited:false\nspeed:100');
      console.info('[SwipeRecognizer_0100] END');
      done();
    });

  })
}
