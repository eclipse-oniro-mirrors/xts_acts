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


export default function VerticalAlignTest() {
  describe('VerticalAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VerticalAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/VerticalAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VerticalAlignTest state pages: " + JSON.stringify(pages));
        if (!("VerticalAlign" == pages.name)) {
          console.info("get VerticalAlignTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VerticalAlignTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VerticalAlignTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   VerticalAlignTest_0010
     * @tc.number SUB_ACE_VerticalAlignTest_0010
     * @tc.desc   set ImageAttachment VerticalAlign: ImageSpanAlignment.BASELINE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VerticalAlignTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[VerticalAlignTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_VerticalAlign_append'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_VerticalAlign_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('get_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[VerticalAlignTest_0010] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('4');
      console.info('[VerticalAlignTest_0010] END');
      done();
    });

    /**
     * @tc.name   VerticalAlignTest_0020
     * @tc.number SUB_ACE_VerticalAlignTest_0020
     * @tc.desc   set ImageAttachment VerticalAlign: ImageSpanAlignment.TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VerticalAlignTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[VerticalAlignTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_VerticalAlign_TOP'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_VerticalAlign_append'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_VerticalAlign_styles'));
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('get_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[VerticalAlignTest_0020] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[VerticalAlignTest_0020] END');
      done();
    });

    /**
     * @tc.name   VerticalAlignTest_0030
     * @tc.number SUB_ACE_VerticalAlignTest_0030
     * @tc.desc   test ImageAttachment VerticalAlign: ImageSpanAlignment.CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VerticalAlignTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[VerticalAlignTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_VerticalAlign_CENTER'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_VerticalAlign_append'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_VerticalAlign_styles'));
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('get_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[VerticalAlignTest_0030] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      console.info('[VerticalAlignTest_0030] END');
      done();
    });

    /**
     * @tc.name   VerticalAlignTest_0040
     * @tc.number SUB_ACE_VerticalAlignTest_0040
     * @tc.desc   test ImageAttachment verticalAlign: ImageSpanAlignment.BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VerticalAlignTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[VerticalAlignTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Set_VerticalAlign_BOTTOM'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('set_VerticalAlign_append'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('get_VerticalAlign_styles'));
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('get_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[VerticalAlignTest_0040] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('3');
      console.info('[VerticalAlignTest_0040] END');
      done();
    });
  })
}