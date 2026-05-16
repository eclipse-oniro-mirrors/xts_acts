/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function createFrameNodesUIContextIntTest() {
  describe('createFrameNodesUIContextIntTest', () => {
    
    beforeEach(async (done: Function) => {
      console.info('createFrameNodesUIContextIntTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/createFrameNodesUIContextInt',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get createFrameNodesUIContextInt state pages:' + JSON.stringify(pages));
        if (!('createFrameNodesUIContextInt' == pages.name)) {
          console.info('get createFrameNodesUIContextInt pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push createFrameNodesUIContextInt page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push createFrameNodesUIContextInt page error:' + err);
      }
      console.info('createFrameNodesUIContextInt beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('createFrameNodesUIContextInt after each called');
    });

    /**
     * @tc.name   createFrameNodesUIContextIntTest_0100
     * @tc.number SUB_ArkUI_Ace_createFrameNodesUIContextIntTest_0100
     * @tc.desc   add createFrameNodes api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createFrameNodesUIContextIntTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('createFrameNodesUIContextIntTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

 	    let button1 = await driver.findComponent(ON.id('addFrameNodeById'));
 	    await button1.click();
 	    await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('createFrameNodesText');
      console.info('createFrameNodesUIContextIntTest_0100 textContent:'+JSON.parse(strJson1).$attrs.content);

      let button2 = await driver.findComponent(ON.id('getFrameNodeByUniqueId'));
 	    await button2.click();
 	    await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('createFrameNodesText');
      console.info('createFrameNodesUIContextIntTest_0100 textContent:'+JSON.parse(strJson2).$attrs.content);

      let button3 = await driver.findComponent(ON.id('createFrameNodes'));
 	    await button3.click();
 	    await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('createFrameNodesText');
      console.info('createFrameNodesUIContextIntTest_0100 textContent:'+JSON.parse(strJson3).$attrs.content);

      let button4 = await driver.findComponent(ON.id('createFrameNodes2'));
 	    await button4.click();
 	    await CommonFunc.sleep(2000);
      let strJson4 = getInspectorByKey('createFrameNodesText');
      console.info('createFrameNodesUIContextIntTest_0100 textContent:'+JSON.parse(strJson4).$attrs.content);
      
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('100');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('ms');

      console.info('[createFrameNodesUIContextIntTest_0100] END');
      done();
    });
  })
}