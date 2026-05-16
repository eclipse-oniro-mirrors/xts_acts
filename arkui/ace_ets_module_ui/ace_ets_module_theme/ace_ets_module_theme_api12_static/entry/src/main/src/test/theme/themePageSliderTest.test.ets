'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';
export default function themePageSliderTest() {
  describe('themePageSliderTest', () => {
    beforeAll(() => {
      console.info("themePageSliderTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.theme.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("themePageSliderTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/theme/themePageSliderTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router" ) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get themePageSliderTest state pages:" + JSON.stringify(pages));
        if (!("themePageSliderTest" == pages.name)) {
          console.info("get themePageSliderTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push themePageSliderTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageSliderTest page error:" + err);
      }
      console.info("themePageSliderTest beforeEach end");
    }); 

    
    


/**
     * @tc.number   themeInterfaceSliderIsValidTest_static_0100
     * @tc.name     themeInterfaceSliderIsValidTest_static_0100
     * @tc.desc     themeInterfaceSliderIsValidTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('themeInterfaceSliderIsValidTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('themeInterfaceSliderIsValidTest_static_0100 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      // click to change the skin
      let button = await driver.findComponent(ON.id('themeSliderClick'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      // test the color whether change
      let strJson = inspector.getInspectorByKey('sliderBg');
      console.info("[themeInterfaceIsValidTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[themeInterfaceIsValidTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'));
      console.info("[themeInterfaceIsValidTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('blockBorderColor'));
      console.info("[themeInterfaceIsValidTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor'));
      console.info("[themeInterfaceIsValidTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('blockBorderColor')).assertEqual('#00000000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor')).assertEqual('#1111FF11');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual('#EEFF00FF');
      console.info('[themeInterfaceIsValidTest_static_0100] END');
      done();
    });
  })
}