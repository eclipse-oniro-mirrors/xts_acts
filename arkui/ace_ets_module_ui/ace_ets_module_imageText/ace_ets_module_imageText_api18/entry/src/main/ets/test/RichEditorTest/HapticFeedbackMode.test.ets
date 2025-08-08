/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function HapticFeedbackModeTest() {
  describe('HapticFeedbackModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("HapticFeedbackModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/HapticFeedbackMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HapticFeedbackModeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("HapticFeedbackMode" == pages.name)) {
          console.info("get HapticFeedbackModeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push HapticFeedbackModeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HapticFeedbackModeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("HapticFeedbackModeTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         HapticFeedbackModeTest0001
    * @tc.desic        Test HapticFeedbackMode: ENABLED
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest0001', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0001] START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('HapticFeedbackMode.ENABLED'))
        await CommonFunc.sleep(500);
        let point = await richEditor.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0001] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         HapticFeedbackModeTest0002
    * @tc.desic        Test HapticFeedbackMode: DISABLED
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest0002', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('HapticFeedbackModeTest HapticFeedbackModeTest0002 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('HapticFeedbackMode.DISABLED'))
        await CommonFunc.sleep(500);
        await richEditor.longClick();
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0002] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         HapticFeedbackModeTest0003
    * @tc.desic        Test HapticFeedbackMode: AUTO
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest0003', Level.LEVEL0, async (done: Function) => {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0003] START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('HapticFeedbackMode.AUTO'))
        await CommonFunc.sleep(500);
        let point = await image.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0003] end");
        done();
    });
  })
}