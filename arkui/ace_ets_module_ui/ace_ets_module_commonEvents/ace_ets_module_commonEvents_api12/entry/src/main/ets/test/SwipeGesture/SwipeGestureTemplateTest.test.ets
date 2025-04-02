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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SwipeGestureTemplateTest() {
  describe('SwipeGestureTemplateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SwipeGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwipeGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("SwipeGestureTemplate" == pages.name)) {
          console.info("get SwipeGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwipeGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureTemplateTest page error:" + err);
      }
      console.info("SwipeGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SwipeGestureTemplateTest after each called");
    });

    /**
     * @tc.number
    * @tc.name      SwipeGestureTemplateTest_0010
     * @tc.desc      api test TapGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('SwipeGestureTemplateTest_0010', 0, async (done: Function) => {
      console.info('SwipeGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGestureTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGestureTemplateTest_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGestureTemplateTest_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
      console.log('SwipeGestureTemplateTest_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      let timeSpace:number = 3000
      let driver = Driver.create();
      let speed = Math.floor(areaWidth1 * 0.6 / 0.016 / 1000) * 1000
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2),speed)
      await CommonFunc.sleep(timeSpace);
      let timeBefore:number = Date.now();
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2),speed)
      let timeAfter:number = Date.now();
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('SwipeGestureTemplate_Text01');
      let obj1: ESObject = JSON.parse(text1);
      let time1:number = Number(obj1.$attrs.content)
      console.log('SwipeGestureTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,time1)
      let text2 = getInspectorByKey('SwipeGestureTemplate_Text02');
      let obj2: ESObject = JSON.parse(text2);
      let time2:number = Number(obj2.$attrs.content)
      console.log('SwipeGestureTemplateTest_0010 obj2 $attrs content',obj2.$attrs.content,time2)
      console.log('SwipeGestureTemplateTest_0010 obj2 time $attrs content',time1,time2);
      console.log('SwipeGestureTemplateTest_0010 obj2 time time2-time1',time2 - time1);
      console.log('TapGestureTemplateTest_0010 obj2 time timeBefore timeAfter', timeBefore, timeAfter);
      console.log('SwipeGestureTemplateTest_0010 obj2 time timeSpace',timeSpace);
      let flag:number = time2 - time1 - timeSpace * 1000000 -  (timeAfter - timeBefore)*1000000
      console.log('SwipeGestureTemplateTest_0010 flag',flag)
      console.log('TapGestureTemplateTest_0010 timeAfter - timeBefore:',timeAfter - timeBefore)
      expect( flag <= (16 * 1000000)).assertTrue();
      console.info('SwipeGestureTemplateTest_0010 END');
      done();
    });
  })
}
