/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function InputPresetTest() {
  describe('InputPresetTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Preset/InputPreset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get InputPresetTest state success " + JSON.stringify(pages));
        if (!("InputPresetTest" == pages.name)) {
          console.info("get InputPresetTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push InputPresetTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push InputPresetTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("InputPresetTest after each called");
    });

    /**
     * @tc.name   InputPresetTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   Adapt to Xiaoyi input method pop-up window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputPresetTest0001', Level.LEVEL0, async () => {
      let driver = Driver.create();
      if (globalThis.winLeft == 0) {
        console.info('InputPresetTest InputPresetTest0001 START');
        await CommonFunc.sleep(1000);
        let textArea1 = await driver.findComponent(ON.id('InputPresetTextArea1'));
        await CommonFunc.sleep(500);
        let textArea2 = await driver.findComponent(ON.id('InputPresetTextArea2'));
        await CommonFunc.sleep(500);
        await textArea2.click()
        await CommonFunc.sleep(500);
        await driver.triggerKey(2070);
        await CommonFunc.sleep(500);
        let button1 = await driver.findComponent(ON.text('下一步'));
        await CommonFunc.sleep(500);
        await button1?.click();
        await CommonFunc.sleep(500);

        let button2 = await driver.findComponent(ON.text('完成'));
        await CommonFunc.sleep(500);
        await button2?.click();
        await CommonFunc.sleep(500);

        await textArea1.longClick();
        await CommonFunc.sleep(500);
        let button3 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await button3?.click();
        console.info('InputPresetTest0001 全选 success');
        await CommonFunc.sleep(500);

        await textArea1.dragTo(textArea2);
        await CommonFunc.sleep(500);
        console.info('InputPresetTest0001 dragTo success');
        let button4 = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(500);
        await button4?.click();
        await CommonFunc.sleep(500);
        console.info('InputPresetTest0001 取消 success');

        await textArea1.longClick();
        await CommonFunc.sleep(500);
        let button5 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await button5?.click();
        await CommonFunc.sleep(500);
        console.info('InputPresetTest0001 2 全选 success');
        let button6 = await driver.findComponent(ON.text('复制'));
        await CommonFunc.sleep(500);
        await button6?.click();
        await CommonFunc.sleep(500);
        console.info('InputPresetTest0001 2 复制 success');
        await textArea1.dragTo(textArea2);
        await CommonFunc.sleep(500);
        let Text7 = await driver.findComponent(ON.text('长按内容至浮起，可拖拽到底部小艺'));
        if(Text7){
          let button7 = await driver.findComponent(ON.type('Button'));
          await CommonFunc.sleep(500);
          await button7?.click();
        }
        await CommonFunc.sleep(500);
        console.info('InputPresetTest0001 2 Button success');
      }else {
        //切换HAD 输入法
        let textArea2 = await driver.findComponent(ON.id('InputPresetTextArea2'));
        await CommonFunc.sleep(500);
        await textArea2.inputText('aaa');
        await CommonFunc.sleep(500);
        let areaText = await textArea2.getText();
        await CommonFunc.sleep(500);
        if(areaText != 'aaa'){
          await driver.triggerKey(2047)
        }
      }      
      let strJson = getInspectorByKey('InputPresetTextArea2');
      expect(JSON.parse(strJson).$type).assertEqual('TextArea');
      console.info("[InputPresetTest0001] end");
    });
  })
}
