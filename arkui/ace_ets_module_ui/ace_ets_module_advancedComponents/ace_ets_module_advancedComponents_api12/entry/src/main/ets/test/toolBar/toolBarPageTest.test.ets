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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function toolBarPageTest() {
  describe('toolBarPageTest', () => {
    beforeEach(async (done: Function) => {
      console.info("toolBarPageTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBar/toolBarPageTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get toolBarPageTest state pages: " + JSON.stringify(pages));
        if (!('toolBarPageTest' == pages.name)) {
          console.info("get toolBarPageTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push toolBarPageTest page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('toolBarPageTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('toolBarPageTest after each called');
    })

    /**
     * @tc.number toolBarPageTest
     * @tc.name toolBarPageTest_0100
     * @tc.desc Test toolBarPage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('toolBarPageTest_0100', 0, async (done: Function) => {
      console.info('[toolBarPageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看ToolBarPage是否存在以下入口。
      let toolBarItem1 = await driver.findComponent(ON.text('更多'));
      let toolBarItem2 = await driver.findComponent(ON.text('拷贝'));
      let toolBarItem3 = await driver.findComponent(ON.text('粘贴'));
      let toolBarItem4 = await driver.findComponent(ON.text('全选'));
      expect(toolBarItem1 !== null).assertTrue();
      expect(toolBarItem2 !== null).assertTrue();
      expect(toolBarItem3 !== null).assertTrue();
      expect(toolBarItem4 !== null).assertTrue();
      console.info('[toolBarPageTest_0100] END');
      done();
    });

    /**
     * @tc.number toolBarPageTest_0200
     * @tc.name Test the properties of components
     * @tc.desc Click toolBar item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('toolBarPageTest_0200', 0, async (done: Function) => {
      console.info('[toolBarPageTest_0200] START');
      let driver = await Driver.create();
      await Utils.sleep(2000);
      // 点击更多
      let button = await driver.findComponent(ON.text('更多'));
      await button.click();
      await Utils.sleep(1000);
      // 断言更多栏中隐藏菜单存在‘分享1’。
      let menu = await driver.findComponent(ON.text('分享1'));
      expect(menu !== null).assertTrue();
      console.info('[toolBarPageTest_0200] END');
      done();
    });
  })
}