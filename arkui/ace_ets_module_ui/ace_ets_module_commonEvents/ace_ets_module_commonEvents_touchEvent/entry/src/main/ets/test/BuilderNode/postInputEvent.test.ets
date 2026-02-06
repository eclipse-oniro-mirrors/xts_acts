/*
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY, UiDirection, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function postInputEvent() {
  describe('postInputEventTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BuilderNode/postInputEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get postInputEventTest state pages: ' + JSON.stringify(pages));
        if (!('postInputEvent' == pages.name)) {
          console.info('get postInputEventTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push postInputEventTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push postInputEventTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreDragTest after each called');
    });

    /**
     * @tc.name   postInputEventTest_0010
     * @tc.number postInputEventTest_0010
     * @tc.desc   api axisPinch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('postInputEventTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('postInputEventTest_0010 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      await button.click()
      await CommonFunc.sleep(1000);
      console.info('[postInputEventTest_0010]' + JSON.stringify(AppStorage.get('lastPostInputEventResult')));
      expect(AppStorage.get('lastPostInputEventResult')).assertEqual(true);
      console.info('[postInputEventTest_0010] END');
      done();
    });

    /**
     * @tc.name   postInputEventTest_0020
     * @tc.number postInputEventTest_0020
     * @tc.desc   api postInputEvent test return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('postInputEventTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('postInputEventTest_0020 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBounds();
      let column1 = await driver.findComponent(ON.id('column1'));
      let center1 = await column1.getBounds();
      console.info('postInputEventTest_0020 click at: ' + Math.round(center1.left + (center1.right - center1.left)/2), Math.round(center.bottom + (center1.bottom - center.bottom)/2));
      await driver.click(Math.round(center1.left + (center1.right - center1.left)/2), Math.round(center.bottom + (center1.bottom - center.bottom)/2));
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('lastPostInputEventResult')).assertEqual(false);
      console.info('[postInputEventTest_0020] END');
      done();
    });
  })
}