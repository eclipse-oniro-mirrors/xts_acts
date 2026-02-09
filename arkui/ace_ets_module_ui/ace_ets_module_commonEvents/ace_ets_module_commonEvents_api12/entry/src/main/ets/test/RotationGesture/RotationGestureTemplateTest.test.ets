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
import {PointerMatrix, UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode} from '@ohos.UiTest';

export default function RotationGestureTemplateTest() {
  describe('RotationGestureTemplateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RotationGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RotationGesture/RotationGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RotationGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("RotationGestureTemplate" == pages.name)) {
          console.info("get RotationGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RotationGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RotationGestureTemplateTest page error:" + err);
      }
      console.info("RotationGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RotationGestureTemplateTest after each called");
    });

    /**
     * @tc.name   RotationGestureTemplateTest_0010
     * @tc.number RotationGestureTemplateTest_0010
     * @tc.desc   api test RotationGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RotationGestureTemplateTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('RotationGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('RotationGestureTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('RotationGestureTemplateTest_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointersSize = 120;
      let pointers = PointerMatrix.create(2, pointersSize);
      for (let step = 0; step < pointersSize; step++) {
        pointers.setPoint(0, step, {x: Math.round(areaObj1.left * (pointersSize - step)/pointersSize+ areaObj1.right * (0 + step)/pointersSize),y: Math.round(areaObj1.top)})
      }
      for (let step = 0; step < pointersSize; step++) {
        pointers.setPoint(1, step, {x: Math.round(areaObj1.left * (0 + step)/pointersSize+ areaObj1.right * (pointersSize - step)/pointersSize),y: Math.round(areaObj1.bottom)})
      }
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let button = await driver.findComponent(ON.id('RotationGestureTemplate_template'));
      await button.click();
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('RotationGestureTemplate_Text');
      let obj1: ESObject = JSON.parse(text1);
      console.log('RotationGestureTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('templateFlag:true');
      console.info('RotationGestureTemplateTest_0010 END');
      done();
    });
  })
}
