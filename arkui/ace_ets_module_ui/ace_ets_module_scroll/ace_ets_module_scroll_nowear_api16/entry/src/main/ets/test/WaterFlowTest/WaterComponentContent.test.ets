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


export default function WaterComponentContent() {
  describe('WaterComponentContent', () => {
    beforeEach(async (done: Function) => {
      console.info('WaterComponentContent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterComponentContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WaterComponentContent state pages: ' + JSON.stringify(pages));
        if (!('WaterComponentContent' == pages.name)) {
          console.info('get WaterComponentContent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push WaterComponentContent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WaterComponentContent page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   WaterComponentContent_0100
     * @tc.number WaterComponentContent_0100
     * @tc.desc   Test whether ComponentContent is effective on footerContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterComponentContent_0100', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await button1.click();
      console.info('[WaterComponentContent_0100] Button1 Onclick');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('WaterFlow1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[WaterComponentContent_0100] component obj is: ' + JSON.stringify(obj));
      let text = await driver.findComponent(ON.id('footerContent1'));
      let textContent: string = await text.getText();
      expect(textContent).assertEqual('footer');
      console.info('[WaterComponentContent_0100] END');
      done();
    });

    /**
     * @tc.name   WaterComponentContent_0200
     * @tc.number WaterComponentContent_0200
     * @tc.desc   Test whether undefined is effective on footerContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterComponentContent_0200', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('button2'));
      await button2.click();
      console.info('[WaterComponentContent_0200] Button2 Onclick');
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('footerContent1'));
      expect(text01).assertEqual(null);
      console.info('[WaterComponentContent_0200] END');
      done();
    });

    /**
     * @tc.name   WaterComponentContent_0300
     * @tc.number WaterComponentContent_0300
     * @tc.desc   Test whether null is effective on footerContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterComponentContent_0300', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let button3 = await driver.findComponent(ON.id('button3'));
      await button3.click();
      console.info('[WaterComponentContent_0300] Button3 Onclick');
      await CommonFunc.sleep(1000);
      let text02 = await driver.findComponent(ON.id('footerContent1'));
      expect(text02).assertEqual(null);
      console.info('[WaterComponentContent_0300] END');
      done();
    });
  })
}