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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function LongPressRecognizerTest() {
  describe('LongPressRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('LongPressRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/LongPressRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get LongPressRecognizer state pages:' + JSON.stringify(pages));
        if (!('LongPressRecognizer' == pages.name)) {
          console.info('get LongPressRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push LongPressRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push LongPressRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('LongPressRecognizer after each called');
    });

    /**
     * @tc.name   LongPressRecognizer_0100
     * @tc.number LongPressRecognizer_0100
     * @tc.desc   To test whether LongPressRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LongPressRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('LongPressRecognizer_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let Column = await driver.findComponent(ON.id('LongPressRecognizer1'));
      await Column.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('LongPressRecognizer');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[LongPressRecognizer_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[LongPressRecognizer_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('LongPressGesture\nfingers:1\nisFingerCountLimited:false\nrepeat:false\nduration:500');
      console.info('[LongPressRecognizer_0100] END');
      done();
    });
  })
}
