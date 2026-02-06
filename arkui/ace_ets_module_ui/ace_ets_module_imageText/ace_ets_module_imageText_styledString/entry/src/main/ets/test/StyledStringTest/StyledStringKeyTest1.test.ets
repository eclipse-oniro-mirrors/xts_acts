/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StyledStringKeyTest1() {
  describe('StyledStringKeyTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringKeyTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringKeyTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringKeyTest1 state pages:" + JSON.stringify(pages));
        if (!("StyledStringKeyTest1" == pages.name)) {
          console.info("get StyledStringKeyTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StyledStringKeyTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringKeyTest1 page error:" + err);
      }
      console.info("StyledStringKeyTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StyledStringKeyTest1 after each called");
    });


    /**
     * @tc.name   StyledStringKeyTest1_0100
     * @tc.number StyledStringKeyTest1_0100
     * @tc.desc   Test StyledStringKey.USER_DATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StyledStringKeyTest1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('StyledStringKeyTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('StyledStringKeyTest1_btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info("[StyledStringKeyTest1_text] btn click");

      let strJson = getInspectorByKey('StyledStringKeyTest1_text');
      console.info("[StyledStringKeyTest1_text] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('hello');
      let stylesList1:SpanStyle[]|undefined = AppStorage.get('stylesList1')
      expect(stylesList1 && stylesList1.length>0).assertTrue()
      AppStorage.delete('stylesList1')

      console.info('StyledStringKeyTest1_0100 END');
      done();
    });

    /**
     * @tc.name   StyledStringKeyTest1_0200
     * @tc.number StyledStringKeyTest1_0200
     * @tc.desc   Test StyledStringKey.USER_DATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StyledStringKeyTest1_0200',  Level.LEVEL3, async (done: Function) => {
      console.info('StyledStringKeyTest1_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('StyledStringKeyTest2_btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info("[StyledStringKeyTest2_btn] btn click");
      let stylesList2:SpanStyle[]|undefined = AppStorage.get('stylesList2')
      expect(stylesList2 && stylesList2.length==0).assertTrue()
      AppStorage.delete('stylesList2')
      console.info('StyledStringKeyTest1_0200 END');
      done();
    });


  })
}