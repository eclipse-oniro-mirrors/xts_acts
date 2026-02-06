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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function PanGestureExampleTemplateTest() {
  describe('PanGestureExampleTemplateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PanGestureExampleTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGestureExampleTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureExampleTemplateTest state pages:" + JSON.stringify(pages));
        if (!("PanGestureExampleTemplate" == pages.name)) {
          console.info("get PanGestureExampleTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGestureExampleTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGestureExampleTemplateTest page error:" + err);
      }
      console.info("PanGestureExampleTemplateTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PanGestureExampleTemplateTest after each called");
    });

    /**
     * @tc.number
     * @tc.name      PanGestureExampleTemplateTest_0010
     * @tc.desc      api test TapGesture and test GetHistoricalPoints notNull
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('PanGestureExampleTemplateTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('PanGestureExampleTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PanGestureExampleTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PanGestureExampleTemplateTest_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PanGestureExampleTemplateTest_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.5),Math.round(areaObj1.top + areaHeight1/2))
      console.log('PanGestureExampleTemplateTest_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.5),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      await CommonFunc.sleep(4000);
      let button = await driver.findComponent(ON.id('PanGestureExampleTemplate_template'));
      await button.click();
      await CommonFunc.sleep(3000);

      let text1 = getInspectorByKey('PanGestureExampleTemplate_Text');
      let obj1: ESObject = JSON.parse(text1);
      console.log('PanGestureExampleTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(AppStorage.get('notNullGetHistoricalPoints')).assertLarger(0);
      expect(obj1.$attrs.content).assertEqual('templateFlag:true');
      console.info('PanGestureExampleTemplateTest_0010 END');
      done();
    });

    /**
     * @tc.number
     * @tc.name      PanGestureExampleTemplateTest_0020
     * @tc.desc      api test getHistoricalPoints null
     * @tc.level:    Level0
     * @tc.type :
     * @tc.size :
     */
    it('PanGestureExampleTemplateTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('PanGestureExampleTemplateTest_0020 START');
      let driver = await Driver.create()
      let text: Component = await driver.findComponent(ON.id('PanGestureExampleTemplate_Click'));
      await text.click();
      expect(AppStorage.get('nullGetHistoricalPoints')).assertEqual(0);
      console.info('PanGestureExampleTemplateTest_0020 END');
      done();
    });
  })
}