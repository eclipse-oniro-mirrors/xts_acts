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
import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function updateMenuAnchorPositionTest() {
    describe('updateMenuAnchorPositionTest', () => {
      beforeAll(() => {
        console.info("openMenuTest beforeAll start");
        await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
      });

      beforeEach(async () => {
        console.info("updateMenuAnchorPositionTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/promptAction/updateMenuAnchorPosition',
        }
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.clear();
          let pages = routerInstance.getState();
          console.info("get updateMenuAnchorPositionTest state pages: " + JSON.stringify(pages));
          if (!("updateMenuAnchorPositionTest" == pages.name)) {
            console.info("get updateMenuAnchorPositionTest state pages.name: " + JSON.stringify(pages.name));
            routerInstance.pushUrl(options);
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push updateMenuAnchorPositionTest page error: " + err);
          expect().assertFail();
        }
      });

    
      


/**
     * @tc.number   updateMenuAnchorPositionTest_static_0100
     * @tc.name     updateMenuAnchorPositionTest_static_0100
     * @tc.desc     updateMenuAnchorPositionTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('updateMenuAnchorPositionTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'updateMenuAnchorPositionTest_static_0100';
        console.info('[' + tagName + '] START============================');

        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn1'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        await driver.click(20, 20);
        await CommonFunc.sleep(1000);
        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1!.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2!.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX1'));
        let textPositionX = Number.parseFloat(await text3!.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY1'));
        let textPositionY = Number.parseFloat(await text4!.getText());
        expect(textPositionX).assertLess(menuPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(1000);
        await driver.click(200, 200);
        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
      


/**
     * @tc.number   updateMenuAnchorPositionTest_static_0200
     * @tc.name     updateMenuAnchorPositionTest_static_0200
     * @tc.desc     updateMenuAnchorPositionTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('updateMenuAnchorPositionTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'updateMenuAnchorPositionTest_static_0200';
        console.info('[' + tagName + '] START============================');

        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn2'));
        await (button?.longClick() as Promise<void>);
        await CommonFunc.sleep(3000);

        await driver.click(20, 20);
        await CommonFunc.sleep(2000);

        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1!.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2!.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX2'));
        let textPositionX = Number.parseFloat(await text3!.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY2'));
        let textPositionY = Number.parseFloat(await text4!.getText());
        expect(textPositionX).assertLess(menuPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(1000);
        await driver.click(200, 200);
        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
      


/**
     * @tc.number   updateMenuAnchorPositionTest_static_0300
     * @tc.name     updateMenuAnchorPositionTest_static_0300
     * @tc.desc     updateMenuAnchorPositionTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('updateMenuAnchorPositionTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'updateMenuAnchorPositionTest_static_0300';
        console.info('[' + tagName + '] START============================');

        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('btn3'));
        await (button?.longClick() as Promise<void>);
        await CommonFunc.sleep(3000);

        await driver.click(20, 20);
        await CommonFunc.sleep(2000);
        let text1 = await driver.findComponent(ON.id('menuPositionX'));
        let menuPositionX = Number.parseFloat(await text1!.getText());

        let text2 = await driver.findComponent(ON.id('menuPositionY'));
        let menuPositionY = Number.parseFloat(await text2!.getText());

        let text3 = await driver.findComponent(ON.id('textPositionX3'));
        let textPositionX = Number.parseFloat(await text3!.getText());

        let text4 = await driver.findComponent(ON.id('textPositionY3'));
        let textPositionY = Number.parseFloat(await text4!.getText());
        expect(menuPositionX).assertLess(textPositionX)
        expect(textPositionY).assertLess(menuPositionY)

        await CommonFunc.sleep(1000);
        await driver.click(200, 200);
        await CommonFunc.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
    })
}