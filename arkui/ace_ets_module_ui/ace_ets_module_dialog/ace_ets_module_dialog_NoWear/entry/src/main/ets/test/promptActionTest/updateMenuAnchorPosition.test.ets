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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function updateMenuAnchorPositionTest() {
    describe('updateMenuAnchorPositionTest', () => {
      beforeEach(async (done: Function) => {
        console.info("updateMenuAnchorPositionTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/promptAction/updateMenuAnchorPosition',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get updateMenuAnchorPositionTest state pages: " + JSON.stringify(pages));
          if (!("updateMenuAnchorPositionTest" == pages.name)) {
            console.info("get updateMenuAnchorPositionTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push updateMenuAnchorPositionTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push updateMenuAnchorPositionTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number updateMenuAnchorPositionTest_0100
     * @tc.name updateMenuAnchorPositionTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     */
      it('updateMenuAnchorPositionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let tagName = 'updateMenuAnchorPositionTest_0100';
        console.info('[' + tagName + '] START============================');

        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn1'));
        await button.click();
        await CommonFunc.sleep(5000);

        let menu = await driver.findComponent(ON.id('menuItem'));
        await menu.click();
        await CommonFunc.sleep(1000);
        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX1'));
        let textPositionX = Number.parseFloat(await text3.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY1'));
        let textPositionY = Number.parseFloat(await text4.getText());
        expect(textPositionX).assertLess(menuPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number updateMenuAnchorPositionTest_0200
     * @tc.name updateMenuAnchorPositionTest_0200
     * @tc.desc api
     * @tc.level: Level 2
     */
      it('updateMenuAnchorPositionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let tagName = 'updateMenuAnchorPositionTest_0200';
        console.info('[' + tagName + '] START============================');

        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn2'));
        await button.longClick();
        await CommonFunc.sleep(5000);

        let menu = await driver.findComponent(ON.id('menuItem'));
        await menu.click();
        await CommonFunc.sleep(2000);

        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX2'));
        let textPositionX = Number.parseFloat(await text3.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY2'));
        let textPositionY = Number.parseFloat(await text4.getText());
        expect(textPositionX).assertLess(menuPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number updateMenuAnchorPositionTest_0300
     * @tc.name updateMenuAnchorPositionTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     */
      it('updateMenuAnchorPositionTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let tagName = 'updateMenuAnchorPositionTest_0300';
        console.info('[' + tagName + '] START============================');

        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn3'));
        await button.longClick();
        await CommonFunc.sleep(5000);

        let menu = await driver.findComponent(ON.id('menuItem'));
        await menu.click();
        await CommonFunc.sleep(2000);
        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX3'));
        let textPositionX = Number.parseFloat(await text3.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY3'));
        let textPositionY = Number.parseFloat(await text4.getText());
        expect(menuPositionX).assertLess(textPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
}