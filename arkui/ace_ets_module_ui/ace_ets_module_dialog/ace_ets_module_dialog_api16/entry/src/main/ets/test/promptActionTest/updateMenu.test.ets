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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function updateMenuTest() {
    describe('updateMenuTest', () => {
      beforeEach(async (done: Function) => {
        console.info("updateMenuTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/promptAction/updateMenu',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get updateMenuTest state pages: " + JSON.stringify(pages));
          if (!("updateMenuTest" == pages.name)) {
            console.info("get updateMenuTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push updateMenuTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push updateMenuTest page error: " + err);
          expect().assertFail();
        }
        done();
      });
      /**
     * @tc.number    updateMenu
     * @tc.name      updateMenuTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
      it('updateMenuTest_0100', 0, async (done: Function) => {
        let tagName = 'updateMenuTest_0100';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn'));
        await btn.click();
        await CommonFunc.sleep(3500);
        let updateMenu = getInspectorByKey('updateMenu');
        console.info("[updateMenuTest_0100] attrs is: " + JSON.stringify(JSON.parse(updateMenu).$attrs));
        expect(JSON.parse(updateMenu).$attrs.content).assertEqual('updateMenu');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
}