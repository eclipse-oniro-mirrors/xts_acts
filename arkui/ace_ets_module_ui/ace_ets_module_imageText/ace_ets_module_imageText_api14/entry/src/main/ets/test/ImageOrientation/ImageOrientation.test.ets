/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@system.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
const waitUiReadyMs = 1000;
interface optionsObj {
  uri: string
}
export default function ImageOrientationTest() {
  describe('ImageOrientationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageOrientationTest beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ImageOrientation/ImageOrientation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageOrientationTest state pages: " + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get ImageOrientationTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageOrientationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageOrientationTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ImageOrientationTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('changeOrientation'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0100 component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('1');
      done();
    });
  })
}