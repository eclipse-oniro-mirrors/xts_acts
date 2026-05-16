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

export default function GetStackSize() {
  describe('GetStackSize', () => {
    beforeEach(async (done: Function) => {
      console.info('GetStackSize beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/GetStackSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GetStackSize state pages:' + JSON.stringify(pages));
        if (!('GetStackSize' == pages.name)) {
          console.info('get GetStackSize pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push GetStackSize page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GetStackSize page error:' + err);
      }
      console.info('GetStackSize beforeEach end');
      done();
    });

    /**
     * @tc.name   GetStackSize_0010
     * @tc.number GetStackSize_0010
     * @tc.desc   test Navigation divider attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetStackSize_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[GetStackSize_0010] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('getSizeId'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0010] btn1 click');
      await CommonFunc.sleep(2000);
      let sizeValue: number = AppStorage.get('sizeValue') as number;
      expect(sizeValue >= 0).assertTrue();
      AppStorage.delete('sizeValue');
      console.info('[GetStackSize_0010] END');
      done();
    });
 })
}