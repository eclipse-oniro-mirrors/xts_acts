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

import Utils from '../Utils';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";



export default function splitLayoutTest() {
  describe('splitLayoutTest', () => {
    beforeEach(async (done: Function) => {
      console.info('splitLayoutTest beforeEach start');
      let opt: router.RouterOptions = {
        url: 'MainAbility/pages/splitLayout/splitLayoutTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get splitLayoutTest state pages: ${JSON.stringify(pages)}`);
        if ('splitLayoutTest'!== pages.name) {
          console.info(`get splitLayoutTest pages.name: ${JSON.stringify(pages.name)}`);
          await router.pushUrl(opt);
          await Utils.sleep(2000);
          console.info(`push splitLayoutTest page result successfully`);
        }
      } catch (err) {
        console.error(`push splitLayoutTest page error: ${err}`);
      }
      
      await Utils.sleep(1000);
      console.info('splitLayoutTest beforeEach end');
      done();
    });
    
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('splitLayoutTest after each called');
    })
    
    /**
    * @tc.number splitLayoutTest
    * @tc.name   testSplitLayout_0100
    * @tc.desc   Test splitLayout page
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  0
    */
    it('testSplitLayout_0100', 0, async (done: Function) => {
      console.info('[testSplitLayout_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      //查询SplitLayout是否存在 以下信息的文本文字
      let  SplitLayoutItem1 = await driver.findComponent(ON.text('primaryText'));
      let  SplitLayoutItem2 = await driver.findComponent(ON.text('secondaryText'));
      let  SplitLayoutItem3 = await driver.findComponent(ON.text('tertiaryText'));
      
      expect(SplitLayoutItem1!== null).assertTrue();
      expect(SplitLayoutItem2!== null).assertTrue();
      expect(SplitLayoutItem3!== null).assertTrue();
      console.info('[testSplitLayout_0100] END');
      done();
    });
    
    /**
    * @tc.number splitLayoutTest
    * @tc.name   testSplitLayout_0200
    * @tc.desc   Test splitLayout page
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  0
    */
    it('testSplitLayout_0200', 0, async (done: Function) => {
      console.info('[testSplitLayout_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let SplitLayoutItem = await driver.findComponent(ON.text('示例：空白区域容器内可添加组件'));
      expect(SplitLayoutItem!== null).assertTrue();
      console.info('[testSplitLayout_0200] END');
      done();
    });
  })
}
