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
 
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function richEditorSupportSvg2Test() {
  describe('richEditorSupportSvg2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorSupportSvg2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi22/richEditorSupportSvg2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorSupportSvg2Test state pages: " + JSON.stringify(pages));
        if (!("richEditorSupportSvg2" == pages.name)) {
          console.info("get richEditorSupportSvg2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorSupportSvg2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorSupportSvg2Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   richEditorSupportSvg2Test_0010
     * @tc.number SUB_ACE_richEditorSupportSvg2Test_0010
     * @tc.desc   set resource SupportSvg2: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorSupportSvg2Test_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorSupportSvg2Test_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('richEditor1'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
	    let colorFilterContent = await driver.findComponent(ON.id('ColorFilter_content'));
      let actualSupportSvg2 = await colorFilterContent.getText(); 
      console.info("[richEditorSupportSvg2Test_0010] actualSupportSvg2: " + actualSupportSvg2);
      expect(actualSupportSvg2).assertEqual('true');
      console.info('[richEditorSupportSvg2Test_0010] END');
      done();
    });

    /**
     * @tc.name   richEditorSupportSvg2Test_0020
     * @tc.number SUB_ACE_richEditorSupportSvg2Test_0020
     * @tc.desc   set string ColorFilter: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorSupportSvg2Test_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorSupportSvg2Test_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('richEditor2'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
	    let colorFilterContent = await driver.findComponent(ON.id('ColorFilter_content'));
      let actualSupportSvg2 = await colorFilterContent.getText(); 
      console.info("[richEditorSupportSvg2Test_0020] actualSupportSvg2: " + actualSupportSvg2);
      expect(actualSupportSvg2).assertEqual('false');
      console.info('[richEditorSupportSvg2Test_0020] END');
      done();
    });
	
    /**
     * @tc.name   richEditorSupportSvg2Test_0030
     * @tc.number SUB_ACE_richEditorSupportSvg2Test_0030
     * @tc.desc   set string ColorFilter: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorSupportSvg2Test_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorSupportSvg2Test_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('richEditor3'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
	    let colorFilterContent = await driver.findComponent(ON.id('ColorFilter_content'));
      let actualSupportSvg2 = await colorFilterContent.getText(); 
      console.info("[richEditorSupportSvg2Test_0030] actualSupportSvg2: " + actualSupportSvg2);
      expect(actualSupportSvg2).assertEqual('false');
      console.info('[richEditorSupportSvg2Test_0030] END');
      done();
    });
	
    /**
     * @tc.name   richEditorSupportSvg2Test_0040
     * @tc.number SUB_ACE_richEditorSupportSvg2Test_0040
     * @tc.desc   set string ColorFilter: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorSupportSvg2Test_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorSupportSvg2Test_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('richEditor4'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
	    let colorFilterContent = await driver.findComponent(ON.id('ColorFilter_content'));
      let actualSupportSvg2 = await colorFilterContent.getText(); 
      console.info("[richEditorSupportSvg2Test_0040] actualSupportSvg2: " + actualSupportSvg2);
      expect(actualSupportSvg2).assertEqual('false');
      console.info('[richEditorSupportSvg2Test_0040] END');
      done();
    });
  })
}