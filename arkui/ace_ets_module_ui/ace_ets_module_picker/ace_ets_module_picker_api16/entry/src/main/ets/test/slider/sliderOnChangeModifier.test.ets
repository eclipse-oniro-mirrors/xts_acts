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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { router } from '@kit.ArkUI';

export default function sliderOnChangeModifierTest() {
  describe('sliderOnChangeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('sliderOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/sliderOnChangeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get sliderOnChangeModifier state pages: ' + JSON.stringify(pages));
        if (!('sliderOnChangeModifier' == pages.name)) {
          console.info('get sliderOnChangeModifier pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push sliderOnChangeModifier page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('sliderOnChangeModifier beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('sliderOnChangeModifier after each called');
    })
   
   /**
    * @tc.name   ArkUX_Modifier_Slider_OnChange_1001
    * @tc.number ArkUX_Modifier_Slider_OnChange_1001
    * @tc.desc   OnChange callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('ArkUX_Modifier_Slider_OnChange_1001', Level.LEVEL1, async (done: Function) => {
    console.info('ArkUX_Modifier_Slider_OnChange_1001 START');
    let driver = Driver.create();
    let button = await driver.findComponent(ON.id('sliderButtonOne'));
    await button.click();
    await CommonFunc.sleep(2000)

    let strJsonNew:string = getInspectorByKey('mOutSetValueOneKey');
    console.info("ArkUX_Modifier_Slider_OnChange_1001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
      .$attrs));
    expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('66');
    console.info('ArkUX_Modifier_Slider_OnChange_1001 END');
    done();
  });

  /**
   * @tc.name   ArkUX_Modifier_Slider_OnChange_1002
   * @tc.number ArkUX_Modifier_Slider_OnChange_1002
   * @tc.desc   OnChange callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('ArkUX_Modifier_Slider_OnChange_1002', Level.LEVEL1, async (done: Function) => {
    console.info('ArkUX_Modifier_Slider_OnChange_1002 START');
    let driver = Driver.create();
    let button = await driver.findComponent(ON.id('sliderButtonTwo'));
    await button.click();
    await CommonFunc.sleep(2000)

    let strJsonNew:string = getInspectorByKey('mOutSetValueTwoKey');
    console.info("ArkUX_Modifier_Slider_OnChange_1002 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
      .$attrs));
    expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('80');
    console.info('ArkUX_Modifier_Slider_OnChange_1002 END');
    done();
  });

  })
}
