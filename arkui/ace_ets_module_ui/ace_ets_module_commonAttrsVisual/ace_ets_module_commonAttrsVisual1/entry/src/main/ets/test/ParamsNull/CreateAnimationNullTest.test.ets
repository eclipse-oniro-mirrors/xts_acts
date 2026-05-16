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

export default function CreateAnimationNullTest() {
  describe('CreateAnimationNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CreateAnimationNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/CreateAnimationNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CreateAnimationNullTest state pages:' + JSON.stringify(pages));
        if (!('CreateAnimationNullTest' == pages.name)) {
          console.info('get CreateAnimationNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CreateAnimationNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CreateAnimationNullTest page error:' + err);
      }
      console.info('CreateAnimationNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   CreateAnimationNullTest_0100
     * @tc.number CreateAnimationNullTest_0100
     * @tc.desc   createAnimation null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CreateAnimationNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CreateAnimationNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_cancelAnimation_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('createAnimation1Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation2Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation3Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation4Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation5Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation6Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation7Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation8Null')).assertEqual(false);
      expect(AppStorage.get('createAnimation9Null')).assertEqual(false);
      expect(AppStorage.get('cancelAnimations1Null')).assertEqual(false);
      expect(AppStorage.get('cancelAnimations2Null')).assertEqual(false);
      expect(AppStorage.get('cancelAnimations3Null')).assertEqual(true);
      AppStorage.delete('createAnimation1Null');
      AppStorage.delete('createAnimation2Null');
      AppStorage.delete('createAnimation3Null');
      AppStorage.delete('createAnimation4Null');
      AppStorage.delete('createAnimation5Null');
      AppStorage.delete('createAnimation6Null');
      AppStorage.delete('createAnimation7Null');
      AppStorage.delete('createAnimation8Null');
      AppStorage.delete('createAnimation9Null');
      AppStorage.delete('cancelAnimations1Null');
      AppStorage.delete('cancelAnimations2Null');
      AppStorage.delete('cancelAnimations3Null');
      console.info('[CreateAnimationNullTest_0100] END');
      done();
    });
  })
}