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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import Utils from './Utils'


export default function navRouterJsunit() {
  describe('navRouterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NavRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavRouter state pages: " + JSON.stringify(pages));
        if (!("NavRouterPage" == pages.name)) {
          console.info("get NavRouter state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error("push NavRouter page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   NavRouterJsunit_0100
     * @tc.number NavRouterJsunit_0100
     * @tc.desc   Set mode values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavRouterJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[NavRouterJsunit_0100] START');
      let strJson = getInspectorByKey('NavRouter1');
      console.info("[NavRouterJsunit_0100] strJson mode is: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[NavRouterJsunit_0100] obj mode is: " + JSON.stringify(obj.$attrs.mode));
      expect(obj.$attrs.mode).assertEqual(undefined);
      console.info('[NavRouterJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   NavRouterJsunit_0101
     * @tc.number NavRouterJsunit_0101
     * @tc.desc   Change mode values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavRouterJsunit_0101', Level.LEVEL0, async (done: Function) => {
      console.info('NavRouterJsunit_0101 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('NavRouter1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("NavRouterJsunit_0101 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.mode).assertEqual(undefined);
      console.info('NavRouterJsunit_0101 END');
      done();
    });
  })
}
