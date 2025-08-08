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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function dragAdaptationTest() {
  describe('dragAdaptationTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
done();
});
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/dragAdaptation'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragAdaptationTest state success " + JSON.stringify(pages));
        if (!("dragAdaptation" == pages.name)) {
          console.info("get dragAdaptationTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragAdaptationTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragAdaptationTest page error: " + err);
      }
    });

    afterEach(async () => {
      console.info("dragAdaptationTest after each called");
    });

    /*
     * @tc.number       dragAdaptationTest
     * @tc.name         dragAdaptationTest_001
     * @tc.desic        dragAdaptationTest_001
     */
    it('dragAdaptationTest_001', Level.LEVEL0, async () => {
      if (globalThis.winLeft == 0) {
        let driver = Driver.create();
        console.info('dragAdaptationTest dragAdaptationTest_001 START');
        await CommonFunc.sleep(1000);
        let textArea1 = await driver.findComponent(ON.id('textArea1'));
        await CommonFunc.sleep(500);
        let textArea2 = await driver.findComponent(ON.id('textArea2'));
        await CommonFunc.sleep(500);
        await textArea2.click()
        await CommonFunc.sleep(500);
        await driver.triggerKey(2070);
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.text('下一步'));
        await CommonFunc.sleep(500);
        await button1?.click();
        await CommonFunc.sleep(500);

        await textArea1.longClick();
        await CommonFunc.sleep(500);
        let button3 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await button3?.click();
        console.info('dragAdaptationTest_001 全选 success');
        await CommonFunc.sleep(500);

        await textArea1.dragTo(textArea2);
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_001 dragTo success');
        let button4 = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(500);
        await button4?.click();
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_001 取消 success');

        await textArea1.longClick();
        await CommonFunc.sleep(500);
        let button5 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await button5?.click();
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_001 2 全选 success');
        let button6 = await driver.findComponent(ON.text('复制'));
        await CommonFunc.sleep(500);
        await button6?.click();
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_001 2 复制 success');
        await textArea1.dragTo(textArea2);
        await CommonFunc.sleep(500);
        let button7 = await driver.findComponent(ON.type('Button'));
        await CommonFunc.sleep(500);
        await button7?.click();
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_001 2 Button success');
      }
      
      expect("").assertEqual("");
      console.info("[dragAdaptationTest_001] end");
    });
  })
}
