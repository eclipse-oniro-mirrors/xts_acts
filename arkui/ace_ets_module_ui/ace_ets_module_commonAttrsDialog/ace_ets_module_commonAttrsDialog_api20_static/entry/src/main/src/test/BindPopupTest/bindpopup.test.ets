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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function BindPopupTest() {
  describe('BindPopupTest', () => {
    beforeAll(() => {
      console.info("BindPopupTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("BindPopupTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindPopup/bindpopup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BindPopupTest state pages:" + JSON.stringify(pages));
        if (!("BindPopupTest" == pages.name)) {
          console.info("get BindPopupTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BindPopupTest page error:" + err);
      }
      console.info("BindPopupTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('BindPopupTest after each called');
    })

    
    
    /**
     * @tc.number   bindPopupTest_static_001
     * @tc.name     bindPopupTest_static_001
     * @tc.desc     bindPopupTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('bindPopupTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('bindPopup001'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(5000);
      expect(btn1 != null).assertTrue();
      done();
    });
  })
}