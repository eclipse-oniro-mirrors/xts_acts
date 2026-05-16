/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function navDestinationFullScreenOverlay() {
  describe('navDestinationFullScreenOverlay', () => {
    beforeEach(async (done: Function) => {
      console.info('navDestinationFullScreenOverlay beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination/navDestinationFullScreenOverlay',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get navDestinationFullScreenOverlay state pages:' + JSON.stringify(pages));
        if (!('navDestinationFullScreenOverlay' == pages.name)) {
          console.info('get navDestinationFullScreenOverlay pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push navDestinationFullScreenOverlay page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push navDestinationFullScreenOverlay page error:' + err);
      }
      console.info('navDestinationFullScreenOverlay beforeEach end');
      done();
    });

    /**
     * @tc.name   navDestinationFullScreenOverlay_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_PARAM_0100
     * @tc.desc   Test NavDestination fullScreenOverlay property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navDestinationFullScreenOverlay_0100', Level.LEVEL0, async () => {
      console.info('[navDestinationFullScreenOverlay_0100] START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('fullOverTrue_1'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('navDestination_full_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navDestinationFullScreenOverlay_0100] obj.$attrs: " + JSON.stringify(obj.$attrs));
      console.info("[navDestinationFullScreenOverlay_0100] fullScreenOverlay: " + obj.$attrs.fullScreenOverlay);
      expect(obj.$attrs.fullScreenOverlay).assertEqual(true);

      let navigation1 = CommonFunc.getComponentRect('navigation_full_width');
      let navDestination2 = CommonFunc.getComponentRect('navDestination_full_true');
      await CommonFunc.sleep(2000);
      console.info("[navDestinationFullScreenOverlay_0100] navigation1 left is: " + navigation1.left);
      console.info("[navDestinationFullScreenOverlay_0100] navDestination2 left is: " + navDestination2.left);
      expect(Math.floor(Math.abs(navDestination2.left - navigation1.left)) <= 1).assertTrue();

      console.info('[navDestinationFullScreenOverlay_0100] END');
    })

    /**
     * @tc.name   navDestinationFullScreenOverlay_0200
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_PARAM_0200
     * @tc.desc   Test NavDestination fullScreenOverlay property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navDestinationFullScreenOverlay_0200', Level.LEVEL0, async () => {
      console.info('[navDestinationFullScreenOverlay_0200] START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('fullOverFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('navDestination_full_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navDestinationFullScreenOverlay_0200] obj.$attrs: " + JSON.stringify(obj.$attrs));
      console.info("[navDestinationFullScreenOverlay_0200] fullScreenOverlay: " + obj.$attrs.fullScreenOverlay);
      expect(obj.$attrs.fullScreenOverlay).assertEqual(false);

      let navigation1 = CommonFunc.getComponentRect('navigation_full_width');
      let navDestination2 = CommonFunc.getComponentRect('navDestination_full_false');
      await CommonFunc.sleep(2000);
      console.info("[navDestinationFullScreenOverlay_0200] navigation1 left is: " + navigation1.left);
      console.info("[navDestinationFullScreenOverlay_0200] navDestination2 left is: " + navDestination2.left);
      expect(navDestination2.left > navigation1.left).assertTrue();
      console.info('[navDestinationFullScreenOverlay_0200] END');
    })

    /**
     * @tc.name   navDestinationFullScreenOverlay_0300
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_PARAM_0300
     * @tc.desc   Test NavDestination fullScreenOverlay property with undefined, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navDestinationFullScreenOverlay_0300', Level.LEVEL0, async () => {
      console.info('[navDestinationFullScreenOverlay_0300] START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('fullOverUndefined_1'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('navDestination_full_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navDestinationFullScreenOverlay_0300] obj.$attrs: " + JSON.stringify(obj.$attrs));
      console.info("[navDestinationFullScreenOverlay_0300] fullScreenOverlay: " + obj.$attrs.fullScreenOverlay);
      expect(obj.$attrs.fullScreenOverlay).assertEqual(false);

      let navigation1 = CommonFunc.getComponentRect('navigation_full_width');
      let navDestination2 = CommonFunc.getComponentRect('navDestination_full_undefined');
      await CommonFunc.sleep(2000);
      console.info("[navDestinationFullScreenOverlay_0300] navigation1 left is: " + navigation1.left);
      console.info("[navDestinationFullScreenOverlay_0300] navDestination2 left is: " + navDestination2.left);
      expect(navDestination2.left > navigation1.left).assertTrue();
      console.info('[navDestinationFullScreenOverlay_0300] END');
    })

    /**
     * @tc.name   navDestinationFullScreenOverlay_0400
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_PARAM_0400
     * @tc.desc   Test NavDestination fullScreenOverlay property with null, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navDestinationFullScreenOverlay_0400', Level.LEVEL0, async () => {
      console.info('[navDestinationFullScreenOverlay_0400] START');
      let driver: Driver = await Driver.create();
      let button = await driver.findComponent(ON.id('fullOverNull_1'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('navDestination_full_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navDestinationFullScreenOverlay_0400] obj.$attrs: " + JSON.stringify(obj.$attrs));
      console.info("[navDestinationFullScreenOverlay_0400] fullScreenOverlay: " + obj.$attrs.fullScreenOverlay);
      expect(obj.$attrs.fullScreenOverlay).assertEqual(false);

      let navigation1 = CommonFunc.getComponentRect('navigation_full_width');
      let navDestination2 = CommonFunc.getComponentRect('navDestination_full_null');
      await CommonFunc.sleep(2000);
      console.info("[navDestinationFullScreenOverlay_0400] navigation1 left is: " + navigation1.left);
      console.info("[navDestinationFullScreenOverlay_0400] navDestination2 left is: " + navDestination2.left);
      expect(navDestination2.left > navigation1.left).assertTrue();
      console.info('[navDestinationFullScreenOverlay_0400] END');
    })
  })
}
