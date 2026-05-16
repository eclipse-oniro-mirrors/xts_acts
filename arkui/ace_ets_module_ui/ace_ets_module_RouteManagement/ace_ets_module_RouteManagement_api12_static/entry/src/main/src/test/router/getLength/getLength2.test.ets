'use static';
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test'


export default function getLength2() {
  describe('getLength2', () => {
    beforeEach(async () => {
      console.info("getLength2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/getLength/getLength2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getLength2 state success " + JSON.stringify(pages));
        if (!("getLength2" == pages.name)) {
          console.info("get getLength2 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getLength2 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getLength2 after each called");
    });

    
    
/**
     * @tc.number   getLength2_static_0100
     * @tc.name     getLength2_static_0100
     * @tc.desc     getLength2_static_0100
     * @tc.level    Level.LEVEL2
     */
it('getLength2_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[getLength2_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('getLength2_btn'));
      await btn!.click()
      await CommonFunc.sleep(8000);
      console.info('[getLength2_static_0100] btn click');

      let btn2 = await driver.findComponent(ON.id('getLength2_get'));
      await btn2!.click()
      await CommonFunc.sleep(1000);
      console.info('[getLength2_static_0100] btn2 click');

      let str = AppStorage.get<string>('getLength2_size') + '';
      expect(str).assertEqual('32');

      console.info('[getLength2_static_0100] END');
      done();
    });
  })
}

