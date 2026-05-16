/*
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

import { describe, it, expect, beforeAll, afterEach, beforeEach, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;

async function getResourceString(resource: Resource): Promise<string> {
  let manage = abilityDelegator.getAppContext().resourceManager;
  let textString: string = await manage.getStringValue(resource);
  return textString;
}

export default function ButtonTextTest() {
  describe('ButtonTextTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/ButtonIndex1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Select state success " + JSON.stringify(pages));
        if (!("ButtonIndex" == pages.name)) {
          console.info("get Select state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("select beforeEach start");
      done();
    })

    /**
     * @tc.number UiTest_001
     * @tc.name shortText
     * @tc.desc 测试短文本在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('shortText', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: shortText begin');
      let driver = Driver.create();
      expect(JSON.parse(JSON.parse(getInspectorByKey('short1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Start');
      expect(JSON.parse(JSON.parse(getInspectorByKey('short2')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Center');
      expect(JSON.parse(JSON.parse(getInspectorByKey('short3')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('short4')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('short5')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('short6')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('left')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('left1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('right')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      expect(JSON.parse(JSON.parse(getInspectorByKey('right1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      done();
    })

    /**
     * @tc.number UiTest_002
     * @tc.name longText
     * @tc.desc 测试设置高度自适应方式为以maxLines优先的长文本在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('longText', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: longText begin');
      let driver = Driver.create();
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Start');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline2')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Center');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline3')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline4')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline5')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longline6')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longlineleft')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longlineleft1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longlineright')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longlineright1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      done();
    })

    /**
     * @tc.number UiTest_003
     * @tc.name longText1
     * @tc.desc 测试长文本在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('longText1', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: longText1 begin');
      let driver = Driver.create();
      expect(JSON.parse(JSON.parse(getInspectorByKey('long1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Start');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long2')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Start');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long3')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Center');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long4')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Center');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long5')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long6')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.End');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long7')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('long8')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Justify');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longleft')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longleft1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Left');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longright')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      expect(JSON.parse(JSON.parse(getInspectorByKey('longright1')).$attrs.labelStyle).textAlign)
        .assertEqual('TextAlign.Right');
      done();
    })

    /**
     * @tc.number UiTest_004
     * @tc.name modifier
     * @tc.desc 测试有modifier的长文本在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modifier', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: modifier begin');
      let driver = Driver.create();
      let buttonComponent = await driver.findComponent(ON.text('modifier', MatchPattern.CONTAINS));
      expect(buttonComponent === null).assertFalse();
      await buttonComponent.click();
      setTimeout(()=>{
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier1')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Start');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier2')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Center');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier3')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.End');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier4')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Justify');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier5')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Left');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier6')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Right');
        done();
      },500)
    })

    /**
     * @tc.number UiTest_005
     * @tc.name modifier1
     * @tc.desc 测试有modifier的设置高度自适应方式为以maxLines优先的长文本在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modifier1', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: modifier1 begin');
      let driver = Driver.create();
      let buttonComponent = await driver.findComponent(ON.text('modifier', MatchPattern.CONTAINS));
      expect(buttonComponent === null).assertFalse();
      await buttonComponent.click();
      setTimeout(()=>{
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier11')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Start');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier22')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Center');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier33')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.End');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier44')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Justify');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier55')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Left');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifier66')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Right');
        done();
      },500)
    })

    /**
     * @tc.number UiTest_006
     * @tc.name modifierDiff
     * @tc.desc 测试有modifier的设置长文本不同对齐方式在按钮中的显示情况示例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modifierDiff', Level.LEVEL1, async (done: Function) => {
      console.info('uitest: modifierDiff begin');
      let driver = Driver.create();
      let buttonComponent = await driver.findComponent(ON.text('modifier', MatchPattern.CONTAINS));
      expect(buttonComponent === null).assertFalse();
      await buttonComponent.click();
      setTimeout(()=>{
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff1')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Center');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff2')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Start');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff3')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.End');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff4')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Justify');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff5')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Left');
        expect(JSON.parse(JSON.parse(getInspectorByKey('modifierDiff6')).$attrs.labelStyle).textAlign)
          .assertEqual('TextAlign.Right');
        done();
      },500)
    })
  })
}

