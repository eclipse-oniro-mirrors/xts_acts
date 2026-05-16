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

export default function AllowableMovementTest() {
  describe('AllowableMovementTest', () => {
    beforeEach(async (done: Function) => {
      console.info('AllowableMovement beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPress/allowableMovement',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AllowableMovement state pages:' + JSON.stringify(pages));
        if (!('AllowableMovement' == pages.name)) {
          console.info('get AllowableMovement state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push AllowableMovement page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AllowableMovement page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('AllowableMovement after each called');
    });

    /**
     * @tc.name  AllowableMovement_0100
     * @tc.number  SUB_AllowableMovement_0100
     * @tc.desc   test AllowableMovement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllowableMovement_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(500);
      console.info('AllowableMovement_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let column1 = await driver.findComponent(ON.id('column1'));
      await column1.longClick();
      await CommonFunc.sleep(200);
      expect(AppStorage.get('allowableMovement')).assertEqual(15);
      expect(AppStorage.get('getAllowableMovement')).assertEqual(15);
      console.info('[AllowableMovement_0100] END');
      done();
    });
  })
}