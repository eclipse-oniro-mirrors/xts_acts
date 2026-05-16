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
import { describe, afterEach, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function TabsOnSelectedTest() {
  describe('TabsOnSelectedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TabsOnSelectedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsOnSelected',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TabsOnSelected state pages: ' + JSON.stringify(pages));
        if (!('TabsOnSelected' == pages.name)) {
          console.info('get TabsOnSelected pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
      console.error('push TabsOnSelected page error: ' + err);
      }
    
      await CommonFunc.sleep(1000)
      console.info('TabsOnSelected beforeEach end');
      done()
    });
    
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('bindSheetRadius after each called');
    })

    /**
     * @tc.name   TabsOnSelectedTest0010
     * @tc.number TabsOnSelectedTest0010
     * @tc.desc   onSelected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TabsOnSelectedTest0010', Level.LEVEL1, async (done: Function) => {
        let tagName = 'TabsOnSelectedTest0010';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let btn1 = await driver.findComponent(ON.text('blue'));
        await btn1.click();
        await CommonFunc.sleep(2000);
        let strJson: string = getInspectorByKey('onSelected_0100');
        console.info("[TabsOnSelectedTest0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
        expect(JSON.parse(strJson).$attrs.content).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.name   TabsOnSelectedTest0020
     * @tc.number TabsOnSelectedTest0020
     * @tc.desc   onSelected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TabsOnSelectedTest0020', Level.LEVEL1, async (done: Function) => {
        let tagName = 'TabsOnSelectedTest0020';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let btn1 = await driver.findComponent(ON.text('pink'));
        await btn1.click();
        await CommonFunc.sleep(2000);
        let strJson: string = getInspectorByKey('onSelected_0100');
        console.info("[TabsOnSelectedTest0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
        expect(JSON.parse(strJson).$attrs.content).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}