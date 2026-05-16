/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebViewOverviewModeAccess() {

  describe('WebViewOverviewModeAccess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOverviewModeAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOverviewModeAccess state success "
          + JSON.stringify(pages));
        if (!("WebViewOverviewModeAccess" == pages.name)) {
          console.info("get WebViewOverviewModeAccess state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebViewOverviewModeAccess page success "
            + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOverviewModeAccess page error: " + err);
      }
      await waitForComponent("buttonOverviewModeAccessAndContextMenuMediaType");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testOverviewModeAccess002
     * @tc.number SUB_WEB_OVERVIEWMODEACCESS_0200
     * @tc.desc   test OverviewModeAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOverviewModeAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOverviewModeAccessFalse", 153300)
      Utils.registerEvent("testOverviewModeAccess002", '1', 153310, done);
     // sendEventByKey('buttonOverviewModeAccessAndContextMenuMediaType', 10, '');
      let component = await driver.findComponent(ON.id("buttonOverviewModeAccessAndContextMenuMediaType"));
      await component.click();
    })
  })
}
