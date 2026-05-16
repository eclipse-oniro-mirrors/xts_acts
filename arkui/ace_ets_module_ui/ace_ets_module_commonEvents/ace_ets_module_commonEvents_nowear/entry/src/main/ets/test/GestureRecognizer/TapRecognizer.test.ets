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

export default function TapRecognizerTest() {
  describe('TapRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TapRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/TapRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TapRecognizer state pages:' + JSON.stringify(pages));
        if (!('TapRecognizer' == pages.name)) {
          console.info('get TapRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TapRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TapRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TapRecognizer after each called');
    });

    /**
     * @tc.name   TapRecognizer_0100
     * @tc.number TapRecognizer_0100
     * @tc.desc   To test whether TapRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TapRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TapRecognizer_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapRecognizer'));
      await Column.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('TapRecognizer');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TapRecognizer_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[TapRecognizer_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(AppStorage.get('TAP_GESTURE')).assertEqual(0);
      expect(AppStorage.get('isEnabledTrue')).assertEqual(true);
      expect(AppStorage.get('isEnabledFalse')).assertEqual(false);
      expect(obj.$attrs.content).assertEqual('TapGesture\ncount:1\nfingers:1\nisFingerCountLimited:false');
      console.info('[TapRecognizer_0100] END');
      done();
    });
  })
}