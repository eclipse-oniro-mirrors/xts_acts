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

export default function SelectionMenuOptions() {
  describe('SelectionMenuOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectionMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/SelectionMenuOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectionMenuOptions state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("SelectionMenuOptions" == pages.name)) {
          console.info("get SelectionMenuOptions state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SelectionMenuOptions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectionMenuOptions page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SelectionMenuOptions after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         SelectionMenuOptions0003
    * @tc.desic        Test  Text by select
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions0003', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0003 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'))
        await CommonFunc.sleep(500);
        let point = await richEditor.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x-vp2px(20)), y:Math.round(point.y)},{x:Math.round(point.x+vp2px(20)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0003] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0006
    * @tc.name         SelectionMenuOptions0006
    * @tc.desic        Test image Text by select
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions0006', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0006 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('image'))
        await CommonFunc.sleep(500);
        let point = await image.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x+vp2px(24)), y:Math.round(point.y)},{x:Math.round(point.x-vp2px(26)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0006] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0009
    * @tc.name         SelectionMenuOptions0009
    * @tc.desic        Test mixed Text by select
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions0009', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0009 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await update.click();
        await CommonFunc.sleep(500);
        let mixed = await driver.findComponent(ON.id('mixed'))
        await CommonFunc.sleep(500);
        let point = await mixed.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x-vp2px(20)), y:Math.round(point.y)},{x:Math.round(point.x+vp2px(50)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0009] end");
        done();
    });
  })
}