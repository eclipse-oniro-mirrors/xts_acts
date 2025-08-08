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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function openPopupTest() {
    describe('openPopupTest', () => {
      beforeEach(async (done: Function) => {
        console.info("openPopupTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/promptAction/openPopup',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get openPopupTest state pages: " + JSON.stringify(pages));
          if (!("openPopupTest" == pages.name)) {
            console.info("get openPopupTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push openPopupTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push openPopupTest page error: " + err);
          expect().assertFail();
        }
        done();
      });
      /**
     * @tc.number    openPopup
     * @tc.name      openPopupTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
      it('openPopupTest_0100', Level.LEVEL2, async (done: Function) => {
        let tagName = 'openPopupTest_0100';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn'));
        await btn.click();
        await CommonFunc.sleep(3500);
        let openPopup = getInspectorByKey('openPopup');
        console.info("[openPopupTest_0100] attrs is: " + JSON.stringify(JSON.parse(openPopup).$attrs));
        expect(JSON.parse(openPopup).$attrs.content).assertEqual('openPopup');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
}