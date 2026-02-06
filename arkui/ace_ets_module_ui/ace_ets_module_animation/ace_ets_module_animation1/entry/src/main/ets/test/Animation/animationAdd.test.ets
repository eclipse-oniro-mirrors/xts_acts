/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils'
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
export default function animationAdd() {
  describe('animationAdd', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/animationAdd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get animationAdd state success ' + JSON.stringify(pages));
        if (!('animationAdd' == pages.name)) {
          console.info('get animationAdd state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push animationAdd page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push animationAdd page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('animationAdd after each called');
    });

    /**
     * @tc.name   animationAdd_0100
     * @tc.number animationAdd_0100
     * @tc.desc   test AnimatableArithmetic equals return boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animationAdd_0100', Level.LEVEL0, async (done: Function) => {
      console.info('animationAdd_0100 START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let button = await driver.findComponent(ON.text('Play'));
      await button.click();
      await Utils.sleep(1000);

      expect(AppStorage.get('trueFlag')).assertTrue();
      AppStorage.delete('trueFlag')

      expect(AppStorage.get('falseFlag')).assertFalse();
      AppStorage.delete('falseFlag')
      console.info('animationAdd_0100 END');
      done();
    });
 })
}