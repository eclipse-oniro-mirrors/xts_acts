/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function richEditorJsunit() {
  describe('richEditorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/richEditor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditor state success " + JSON.stringify(pages));
        if (!("richEditor" == pages.name)) {
          console.info("get richEditor state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push richEditor page error: " + err);
      }
      done();
    });

    /**
     * @tc.number richEditorTest_002
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('richEditorTest_002', 0, async (done: Function) => {
      console.info('richEditorTest_002 START');
      let strJsonNew = getInspectorByKey('richEditor');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("richEditorTest_002 component  is: " + JSON.stringify(objNew.$attrs.copyOptions));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      console.info('richEditorTest_002 END');
      done();
    });

    /**
     * @tc.number richEditorTest_001
     * @tc.name Test the properties of components
     * @tc.desc Change copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('richEditorTest_001', 0, async (done: Function) => {
      console.info('richEditorTest_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('richEditor'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("richEditorTest_001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None"); //
      console.info('richEditorTest_001 END');
      done();
    });
  })
}