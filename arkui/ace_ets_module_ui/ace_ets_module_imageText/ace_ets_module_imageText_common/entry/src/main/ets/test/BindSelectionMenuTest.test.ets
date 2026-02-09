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
import CommonFunc from '../MainAbility/common/Common'

export default function BindSelectionMenuTest() {
  describe('BindSelectionMenuTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BindSelectionMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSelectionMenuTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BindSelectionMenuTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("BindSelectionMenuTest" == pages.name)) {
          console.info("get BindSelectionMenuTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push BindSelectionMenuTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BindSelectionMenuTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("bindSelectionMenuTest after each called");
    });

    /**
     * @tc.name   bindSelectionMenuTest0001
     * @tc.number bindSelectionMenuTest0001
     * @tc.desc   Test Text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0001', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0001 START');
        await CommonFunc.sleep(1000);
        let Text = await driver.findComponent(ON.id('textBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await Text.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0001] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0002
     * @tc.number bindSelectionMenuTest0002
     * @tc.desc   Test Text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0002', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0002 START');
        await CommonFunc.sleep(1000);
        let Text = await driver.findComponent(ON.id('textBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        await Text.longClick();
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0002] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0003
     * @tc.number bindSelectionMenuTest0003
     * @tc.desc   Test  Text by select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0003', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0003 START');
        await CommonFunc.sleep(1000);
        let Text = await driver.findComponent(ON.id('textBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await Text.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x-vp2px(20)), y:Math.round(point.y)},{x:Math.round(point.x+vp2px(20)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0003] end");
        done();
    });


    /**
     * @tc.name   bindSelectionMenuTest0004
     * @tc.number bindSelectionMenuTest0004
     * @tc.desc   Test image text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0004', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0004 START');
        await CommonFunc.sleep(1000);
        let image = await driver.findComponent(ON.id('imageBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await image.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0004] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0005
     * @tc.number bindSelectionMenuTest0005
     * @tc.desc   Test image text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0005', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0005 START');
        await CommonFunc.sleep(1000);
        let image = await driver.findComponent(ON.id('imageBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        await image.longClick();
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0005] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0006
     * @tc.number bindSelectionMenuTest0006
     * @tc.desc   Test image Text by select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0006', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0006 START');
        await CommonFunc.sleep(1000);
        let image = await driver.findComponent(ON.id('imageBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await image.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x-vp2px(24)), y:Math.round(point.y)},{x:Math.round(point.x+vp2px(24)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0006] end");
        done();
    });



    /**
     * @tc.name   bindSelectionMenuTest0007
     * @tc.number bindSelectionMenuTest0007
     * @tc.desc   Test mixed Text by mouseClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0007', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0007 START');
        await CommonFunc.sleep(1000);
        let mixed = await driver.findComponent(ON.id('mixedBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await mixed.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0007] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0008
     * @tc.number bindSelectionMenuTest0008
     * @tc.desc   Test mixed Text by longClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0008', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0008 START');
        await CommonFunc.sleep(1000);
        let mixed = await driver.findComponent(ON.id('mixedBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        await mixed.longClick();
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0008] end");
        done();
    });

    /**
     * @tc.name   bindSelectionMenuTest0009
     * @tc.number bindSelectionMenuTest0009
     * @tc.desc   Test mixed Text by select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSelectionMenuTest0009', Level.LEVEL1, async (done: Function) => {
        let driver = Driver.create();
        console.info('bindSelectionMenuTest bindSelectionMenuTest0009 START');
        await CommonFunc.sleep(1000);
        let mixed = await driver.findComponent(ON.id('mixedBindSelectionMenuTest'))
        await CommonFunc.sleep(500);
        let point = await mixed.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseDrag({x:Math.round(point.x-vp2px(20)), y:Math.round(point.y)},{x:Math.round(point.x+vp2px(50)), y:Math.round(point.y)},600);
        await CommonFunc.sleep(500);
        let  CustomMenu = await driver.findComponent(ON.text('自定义菜单'))
        expect(CustomMenu != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[bindSelectionMenuTest0009] end");
        done();
    });
  })
}