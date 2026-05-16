/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function gestureTest() {
  describe('gestureTest', () => {
    beforeEach(async (done: Function) => {
      console.info('gestureTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uIContext/GestureNullandundefined/UIContextGestureTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get gestureTest state pages: ' + JSON.stringify(pages));
        if (!('UIContextGestureTestPage' == pages.name)) {
          console.info('get gestureTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push gestureTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push gestureTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('gestureTest afterEach called');
    });

    /**
     * @tc.name   UIObserver_add_global_gesture_null_001
     * @tc.number UIObserver_add_global_gesture_null_001
     * @tc.desc   Test addGlobalGestureListener with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_add_global_gesture_null_001', Level.LEVEL2, async (done: Function) => {
      console.info('[UIObserver_add_global_gesture_null_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_add_global_gesture'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('add_global_gesture_null'));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_add_global_gesture_null_001] END');
      done();
    });

    /**
     * @tc.name   UIObserver_add_global_gesture_undefined_002
     * @tc.number UIObserver_add_global_gesture_undefined_002
     * @tc.desc   Test addGlobalGestureListener with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_add_global_gesture_undefined_002', Level.LEVEL2, async (done: Function) => {
      console.info('[UIObserver_add_global_gesture_undefined_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_add_global_gesture'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('add_global_gesture_undefined'));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_add_global_gesture_undefined_002] END');
      done();
    });

    /**
     * @tc.name   UIObserver_add_global_gesture_empty_array_003
     * @tc.number UIObserver_add_global_gesture_empty_array_003
     * @tc.desc   Test addGlobalGestureListener with empty actionPhases array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIObserver_add_global_gesture_empty_array_003', Level.LEVEL2, async (done: Function) => {
      console.info('[UIObserver_add_global_gesture_empty_array_003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_add_global_gesture'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('add_global_gesture_empty_array'));
      expect(result).assertEqual('"success"');
      console.info('[UIObserver_add_global_gesture_empty_array_003] END');
      done();
    });
  });
}
