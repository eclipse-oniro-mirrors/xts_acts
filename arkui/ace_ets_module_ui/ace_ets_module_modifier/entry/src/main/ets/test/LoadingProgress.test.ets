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
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function loadingProgressJsunit() {
  describe('loadingProgressTest', () => {
    beforeEach(async (done: Function) => {
      console.info("loadingProgress beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/loadingProgress',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get loadingProgress state pages: " + JSON.stringify(pages));
        if (!("loadingProgress" == pages.name)) {
          console.info("get loadingProgress state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push loadingProgress page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0100
     * @tc.name Test the properties of components
     * @tc.desc Set color values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_loadingProgress_attrs_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0100');
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_0100 component obj is: " + JSON.stringify(obj));
          expect(obj.$attrs.color).assertEqual("#FF0000FF");
          console.info('ArkUX_Stage_loadingProgress_attrs_0100 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0101
     * @tc.name Test the properties of components
     * @tc.desc Set enableLoading values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_0101', 0, async (done: Function) => {
      console.info('ArkUX_Stage_loadingProgress_attrs_0101 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0101');
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_0101 component obj is: " + JSON.stringify(obj));
          expect(obj.$attrs.enableLoading).assertEqual("true");
          console.info('ArkUX_Stage_loadingProgress_attrs_0101 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_0101 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0102
     * @tc.name Test the properties of components
     * @tc.desc Change enableLoading values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_0102', 0, async (done: Function) => {
      console.info('ArkUX_Stage_loadingProgress_attrs_0102 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0100'); //测试组件的key名称
      let objNew = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_loadingProgress_attrs_0102 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.enableLoading).assertEqual("true"); //
      console.info('ArkUX_Stage_loadingProgress_attrs_0102 END');
      done();
    });
  })
}
