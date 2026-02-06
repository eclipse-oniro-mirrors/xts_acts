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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function openMenuTest() {
    describe('openMenuTest', () => {
      beforeEach(async (done: Function) => {
        console.info("openMenuTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/promptAction/openMenu',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get openMenuTest state pages: " + JSON.stringify(pages));
          if (!("openMenuTest" == pages.name)) {
            console.info("get openMenuTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push openMenuTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push openMenuTest page error: " + err);
          expect().assertFail();
        }
        done();
      });
      /**
     * @tc.number    openMenu
     * @tc.name      openMenuTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
      it('openMenuTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let tagName = 'openMenuTest_0100';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn'));
        await btn.click();
        await CommonFunc.sleep(3500);
        let openMenu = getInspectorByKey('openMenu');
        console.info("[openMenuTest_0100] attrs is: " + JSON.stringify(JSON.parse(openMenu).$attrs));
        expect(JSON.parse(openMenu).$attrs.content).assertEqual('openMenu');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
}