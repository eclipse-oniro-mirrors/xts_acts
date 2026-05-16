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
import { Driver, ON, Component} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function actionSheetBackgroundEffectTest() {
  describe('ActionSheetBackgroundEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ActionSheetBackgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/actionSheetBackgroundEffect',
      }
      router.clear();
      let pages = router.getState();
      console.info("get ActionSheetBackgroundEffectTest state pages: " + JSON.stringify(pages));
      if (!("actionSheetBackgroundEffect" == pages.name)) {
        console.info("get ActionSheetBackgroundEffectTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push ActionSheetBackgroundEffectTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.name   actionSheetBackgroundEffectTest_0100
     * @tc.number actionSheetBackgroundEffectTest_0100
     * @tc.desc   createActionSheetToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('actionSheetBackgroundEffectTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'actionSheetBackgroundEffectTest_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect001'));
      await btn.click();
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if(uniRenderFlag == 'false' ){
        expect(JSON.parse(date).$attrs.backgroundEffect.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.color).assertEqual('#00000000');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.radius).assertEqual(0);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.saturation).assertEqual(1);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.brightness).assertEqual(1);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.inactiveColor).assertEqual('#00000000');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.blurOption).assertEqual('[0,0]');
      }else{
        console.info("[actionSheetBackgroundEffectTest_0100] $attrs.options is: " + JSON.stringify(JSON.parse(date).$attrs.backgroundEffect.options));
        expect(JSON.parse(date).$attrs.backgroundEffect.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.color).assertEqual('#FFFFC0CB');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.radius).assertEqual(40);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.saturation).assertEqual(25);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.brightness).assertEqual(2);
        expect(JSON.parse(date).$attrs.backgroundEffect.options.inactiveColor).assertEqual('#FF0000FF');
        expect(JSON.parse(date).$attrs.backgroundEffect.options.blurOption).assertEqual('[20.000000,20.000000]');
      }
      let btn1: Component = await driver.findComponent(ON.text('Confirm button'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   actionSheetBackgroundEffectTest_0200
     * @tc.number actionSheetBackgroundEffectTest_0200
     * @tc.desc   createActionSheetToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('actionSheetBackgroundEffectTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'actionSheetBackgroundEffectTest_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect002'));
      await btn.click();
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info("[actionSheetBackgroundEffectTest_0200] $attrs.options is: " + JSON.stringify(JSON.parse(date).$attrs.backgroundEffect.options));
      expect(JSON.parse(date).$attrs.backgroundEffect.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.color).assertEqual('#00000000');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.radius).assertEqual(0);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.saturation).assertEqual(1);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.brightness).assertEqual(1);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.inactiveColor).assertEqual('#00000000');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.blurOption).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('Confirm button'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   actionSheetBackgroundEffectTest_0300
     * @tc.number actionSheetBackgroundEffectTest_0300
     * @tc.desc   createActionSheetToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('actionSheetBackgroundEffectTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'actionSheetBackgroundEffectTest_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect003'));
      await btn.click();
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(2000);
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info("[actionSheetBackgroundEffectTest_0300] $attrs.options is: " + JSON.stringify(JSON.parse(date).$attrs.backgroundEffect.options));
      expect(JSON.parse(date).$attrs.backgroundEffect.options.policy).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.adaptiveColor).assertEqual('AdaptiveColor.Default');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.color).assertEqual('#00000000');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.radius).assertEqual(0);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.saturation).assertEqual(1);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.brightness).assertEqual(1);
      expect(JSON.parse(date).$attrs.backgroundEffect.options.inactiveColor).assertEqual('#00000000');
      expect(JSON.parse(date).$attrs.backgroundEffect.options.blurOption).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('Confirm button'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}