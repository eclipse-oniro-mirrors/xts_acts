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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TabBarComponentContent() {
  describe('TabBarComponentContent', () => {
    beforeEach(async (done: Function) => {
      console.info('TabBarComponentContent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabBarComponentContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TabBarComponentContent state pages: ' + JSON.stringify(pages));
        if (!('TabBarComponentContent' == pages.name)) {
          console.info('get TabBarComponentContent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push TabBarComponentContent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TabBarComponentContent page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    TabBarComponentContent_0100
     * @tc.name      Test tabbar supports ComponentContent
     * @tc.desc      Test whether ComponentContent is effective on tabbar
     * @tc.level     Level 2
     */
    it('TabBarComponentContent_0100', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await button1.click();
      console.info('[TabBarComponentContent_0100] Button1 Onclick');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TabContent1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TabBarComponentContent_0100] component obj is: ' + JSON.stringify(obj));
      let text = await driver.findComponent(ON.id('TabContent1'));
      let textContent: string = await text.getText();
      expect(textContent).assertEqual('tabBar1');
      console.info('[TabBarComponentContent_0100] END');
      done();
    });

    /**
     * @tc.number    TabBarComponentContent_0200
     * @tc.name      Test tabbar supports undefined
     * @tc.desc      Test whether undefined is effective on tabbar
     * @tc.level     Level 2
     */
    it('TabBarComponentContent_0200', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('button2'));
      await button2.click();
      console.info('[TabBarComponentContent_0200] Button2 Onclick');
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('TabContent1'));
      expect(text01).assertEqual(null);
      console.info('[TabBarComponentContent_0200] END');
      done();
    });

    /**
     * @tc.number    TabBarComponentContent_0300
     * @tc.name      Test tabbar supports null
     * @tc.desc      Test whether null is effective on tabbar
     * @tc.level     Level 2
     */
    it('TabBarComponentContent_0300', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button3 = await driver.findComponent(ON.id('button3'));
      await button3.click();
      console.info('[TabBarComponentContent_0300] Button3 Onclick');
      await CommonFunc.sleep(1000);
      let text02 = await driver.findComponent(ON.id('TabContent1'));
      expect(text02).assertEqual(null);
      console.info('[TabBarComponentContent_0300] END');
      done();
    });
  })
}