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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function UIPresentCustomDialogBlurStyleOptionsTest() {
  describe('UIPresentCustomDialogBlurStyleOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIPresentCustomDialogBlurStyleOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/presentCustomDialogBlurStyleOptions',
      }
      router.clear();
      let pages = router.getState();
      console.info("get UIPresentCustomDialogBlurStyleOptionsTest state pages: " + JSON.stringify(pages));
      if (!("presentCustomDialogBlurStyleOptions" == pages.name)) {
        console.info("get UIPresentCustomDialogBlurStyleOptionsTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push UIPresentCustomDialogBlurStyleOptionsTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.name   UIPresentCustomDialogBlurStyleOptions_0100
     * @tc.number UIPresentCustomDialogBlurStyleOptions_0100
     * @tc.desc   createPresentCustomDialogToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIPresentCustomDialogBlurStyleOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tagName = 'UIPresentCustomDialogBlurStyleOptions';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Options001'));
      await btn.click();
      await Utils.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let dialog: ESObject = obj1.$children[1]
      let date1 = JSON.stringify(obj1.$children[1].$children[0])
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if(uniRenderFlag == 'false' ){
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.scale).assertEqual(1.0);
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.colorMode).assertEqual('ThemeColorMode.System');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.inactiveColor).assertEqual('#00000000');
      }else{
        console.info("[UIPresentCustomDialogBlurStyleOptions_0100] $attrs.options is: " + JSON.stringify(JSON.parse(date1).$attrs.backgroundBlurStyle.options));
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.policy).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.adaptiveColor).assertEqual('AdaptiveColor.Average');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.scale).assertEqual(0);
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.colorMode).assertEqual('ThemeColorMode.Light');
        expect(JSON.parse(date1).$attrs.backgroundBlurStyle.options.inactiveColor).assertEqual('#FFFFC0CB');
      }
      let btn1: Component = await driver.findComponent(ON.text('通过DialogId关闭'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   UIPresentCustomDialogBlurStyleOptions_0200
     * @tc.number UIPresentCustomDialogBlurStyleOptions_0200
     * @tc.desc   createPresentCustomDialogToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIPresentCustomDialogBlurStyleOptions_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tagName = 'UIPresentCustomDialogBlurStyleOptions_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Options002'));
      await btn.click();
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info("[UIPresentCustomDialogBlurStyleOptions_0200] $attrs.options is: " + JSON.stringify(JSON.parse(date).$attrs.backgroundBlurStyle.options));
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.scale).assertEqual(1.0);
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.colorMode).assertEqual('ThemeColorMode.System');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.inactiveColor).assertEqual('#00000000');
      let btn1: Component = await driver.findComponent(ON.text('通过DialogId关闭'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   UIPresentCustomDialogBlurStyleOptions_0300
     * @tc.number UIPresentCustomDialogBlurStyleOptions_0300
     * @tc.desc   createPresentCustomDialogToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIPresentCustomDialogBlurStyleOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tagName = 'UIPresentCustomDialogBlurStyleOptions_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Options003'));
      await btn.click();
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info("[UIPresentCustomDialogBlurStyleOptions_0300] $attrs.options is: " + JSON.stringify(JSON.parse(date).$attrs.backgroundBlurStyle.options));
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.scale).assertEqual(1.0);
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.colorMode).assertEqual('ThemeColorMode.System');
      expect(JSON.parse(date).$attrs.backgroundBlurStyle.options.inactiveColor).assertEqual('#00000000');
      let btn1: Component = await driver.findComponent(ON.text('通过DialogId关闭'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}