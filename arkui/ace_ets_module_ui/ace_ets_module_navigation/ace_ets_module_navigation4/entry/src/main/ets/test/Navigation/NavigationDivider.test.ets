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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function NavigationDivider() {
  describe('NavigationDivider', () => {
    beforeEach(async (done: Function) => {
      console.info('NavigationDivider beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationDivider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavigationDivider state pages:' + JSON.stringify(pages));
        if (!('NavigationDivider' == pages.name)) {
          console.info('get NavigationDivider pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavigationDivider page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavigationDivider page error:' + err);
      }
      console.info('NavigationDivider beforeEach end');
      done();
    });

    /**
     * @tc.name   NavigationDivider_0010
     * @tc.number NavigationDivider_0010
     * @tc.desc   test Navigation divider attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('NavigationDivider_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[NavigationDivider_0010] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('getDivider'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0010] btn1 click');
      await CommonFunc.sleep(2000);
      let colorValue: ResourceColor | undefined = AppStorage.get('colorValue');
      let endMarginValue: Length | undefined = AppStorage.get('endMarginValue');
      let startMarginValue: Length | undefined = AppStorage.get('startMarginValue');
      expect(colorValue).assertEqual('#FFFF0000');
      expect(endMarginValue).assertEqual('20.00vp');
      expect(startMarginValue).assertEqual('20.00vp');
      AppStorage.delete('colorValue');
      AppStorage.delete('endMarginValue');
      AppStorage.delete('startMarginValue');
      console.info('[NavigationDivider_0010] END');
      done();
    });
 })
}