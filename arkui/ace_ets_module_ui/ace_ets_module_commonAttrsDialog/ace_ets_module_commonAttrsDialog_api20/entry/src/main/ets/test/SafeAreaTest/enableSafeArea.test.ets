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
 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function SafeAreaTest() {
  describe('SafeAreaTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SafeArea/enableSafeArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SafeAreaTest state pages: ' + JSON.stringify(pages));
        if (!('SafeAreaTest' == pages.name)) {
          console.info('get SafeAreaTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SafeAreaTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SafeAreaTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SafeAreaTest after each called');
    });
    /**
     * @tc.number    safeArea_0010
     * @tc.name      safeArea_0010
     * @tc.desc      test assertTrue is SafeArea.top > 0
     * @tc.level:    Level 1
     */
    it('safeArea_0010', Level.LEVEL1, async (done: Function) => {
      console.info(' safeArea_0010 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Button'));
      await CommonFunc.sleep(500);
      Button.click();
      await CommonFunc.sleep(1000);
      let SafeArea = CommonFunc.getComponentRect('SafeArea');
      console.log(" safeArea_0010 enableSafeArea : " + SafeArea);
      console.log(" safeArea_0010 START: " + SafeArea.top);
      expect(Math.round(SafeArea.top) > 0).assertTrue();
      console.info('[safeArea_0010] END');
      done();
      });
    /**
     * @tc.number    safeArea_0020
     * @tc.name      safeArea_0020
     * @tc.desc      test assertTrue is SafeArea.top = 0
     * @tc.level:    Level 1
     */
     it('safeArea_0020', Level.LEVEL1, async (done: Function) => {
      console.info(' safeArea_0020 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Button'));
      await CommonFunc.sleep(500);
      Button.click();
      await CommonFunc.sleep(500);
      let Button1 = await driver.findComponent(ON.id('Button1'));
      console.info(' safeArea_0020 START');
      await CommonFunc.sleep(500);
      Button1.click();
      await CommonFunc.sleep(1000);
      let SafeArea1 = CommonFunc.getComponentRect('SafeArea');
      console.log(" [safeArea_0020] enableSafeArea: " + SafeArea1);
      console.log(" [safeArea_0020] enableSafeArea top is: " + SafeArea1.top);
      expect(Math.round(SafeArea1.top) == 0).assertTrue();
      console.info('[safeArea_0020] END');
      done();
      });
  })
}