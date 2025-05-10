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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import router from '@ohos.router';
import Utils from './Utils';

export default function hyperLinkJsunit() {
  describe('hyperLinkTest', () => {
    beforeEach(async (done: Function) => {
      console.info("hyperLinkJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/hyperlink',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get hyperLink state pages: " + JSON.stringify(pages));
        if (!("hyperlink" == pages.name)) {
          console.info("get hyperLink state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push hyperLink page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUX_Stage_hyperLink_attrs_0100
     * @tc.name Test the properties of components
     * @tc.desc Set color values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_hyperLink_attrs_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_hyperLink_attrs_0100 START');

      let strJson = getInspectorByKey('HyperlinkKey1');
      console.info('ArkUX_Stage_hyperLink_attrs_0100 START  :' + JSON.stringify(strJson));
      console.info("ArkUX_Stage_hyperLink_attrs_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.color).assertEqual("#FF123456");
      console.info('ArkUX_Stage_hyperLink_attrs_0100 END ');

      done();
    });

    /**
     * @tc.number ArkUX_Stage_hyperLink_attrs_0101
     * @tc.name Test the properties of components
     * @tc.desc Change color values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_hyperLink_attrs_0101', 0, async (done: Function) => {

      console.info('ArkUX_Stage_hyperLink_attrs_0101 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('HyperlinkKey1');
      console.info("ArkUX_Stage_hyperLink_attrs_0101 component  is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.color).assertEqual("#FF654321");
      console.info('ArkUX_Stage_hyperLink_attrs_0101 END ');
      done();
    });

  })
}
