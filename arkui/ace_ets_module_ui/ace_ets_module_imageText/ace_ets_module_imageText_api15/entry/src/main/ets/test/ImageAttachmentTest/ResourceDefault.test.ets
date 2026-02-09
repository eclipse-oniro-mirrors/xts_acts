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


export default function ResourceDefaultTest() {
  describe('ResourceDefaultTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceDefaultTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/ResourceDefault',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceDefaultTest state pages: " + JSON.stringify(pages));
        if (!("ResourceDefault" == pages.name)) {
          console.info("get ResourceDefaultTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourceDefaultTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceDefaultTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   ResourceDefaultTest_0010
     * @tc.number SUB_ACE_Resource_DefaultTest_0010
     * @tc.desc   set ImageAttachment resourceValue: resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_resourceValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0010] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('resource');
      console.info('[ResourceDefaultTest_0010] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0020
     * @tc.number SUB_ACE_Resource_DefaultTest_0020
     * @tc.desc   set ImageAttachment resourceValue: string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_resourceValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0020] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('resource');
      console.info('[ResourceDefaultTest_0020] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0030
     * @tc.number SUB_ACE_Resource_DefaultTest_0030
     * @tc.desc   test ImageAttachment default: size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_size');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0030] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0030] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0040
     * @tc.number SUB_ACE_Resource_DefaultTest_0040
     * @tc.desc   test ImageAttachment default: verticalAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0040] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('3');
      console.info('[ResourceDefaultTest_0040] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0050
     * @tc.number SUB_ACE_Resource_DefaultTest_0050
     * @tc.desc   test ImageAttachment default: objectFit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_objectFit');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0050] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('2');
      console.info('[ResourceDefaultTest_0050] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0060
     * @tc.number SUB_ACE_Resource_DefaultTest_0060
     * @tc.desc   test ImageAttachment default: layoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_layoutStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0060] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{}');
      console.info('[ResourceDefaultTest_0060] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0070
     * @tc.number SUB_ACE_Resource_DefaultTest_0070
     * @tc.desc   test ImageAttachment default: colorFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_colorFilter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0070] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[ResourceDefaultTest_0070] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0080
     * @tc.number SUB_ACE_Resource_DefaultTest_0080
     * @tc.desc   test ImageAttachment size: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_size');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0080] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0080] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0090
     * @tc.number SUB_ACE_Resource_DefaultTest_0090
     * @tc.desc   test ImageAttachment verticalAlign: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0090', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0090] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_verticalAlign');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0090] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('3');
      console.info('[ResourceDefaultTest_0090] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0100
     * @tc.number SUB_ACE_Resource_DefaultTest_0100
     * @tc.desc   test ImageAttachment objectFit: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_objectFit');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0100] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('2');
      console.info('[ResourceDefaultTest_0100] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0110
     * @tc.number SUB_ACE_Resource_DefaultTest_0110
     * @tc.desc   test ImageAttachment layoutStyle: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0110', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_layoutStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0110] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{}');
      console.info('[ResourceDefaultTest_0110] END');
      done();
    });

    /**
     * @tc.name   ResourceDefaultTest_0120
     * @tc.number SUB_ACE_Resource_DefaultTest_0120
     * @tc.desc   test ImageAttachment colorFilter: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResourceDefaultTest_0120', Level.LEVEL2, async (done: Function) => {
      console.info('[ResourceDefaultTest_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('default_colorFilter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceDefaultTest_0120] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[ResourceDefaultTest_0120] END');
      done();
    });
  })
}