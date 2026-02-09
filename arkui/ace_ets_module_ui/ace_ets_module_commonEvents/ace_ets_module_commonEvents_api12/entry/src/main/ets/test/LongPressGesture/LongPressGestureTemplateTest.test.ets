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

export default function LongPressGestureTemplateTest() {
  describe('LongPressGestureTemplateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LongPressGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/LongPressGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("LongPressGestureTemplate" == pages.name)) {
          console.info("get LongPressGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LongPressGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGestureTemplateTest page error:" + err);
      }
      console.info("LongPressGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureTemplateTest after each called");
    });

    /**
     * @tc.name   LongPressGestureTemplateTest_0010
     * @tc.number LongPressGestureTemplateTest_0010
     * @tc.desc   api test TapGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LongPressGestureTemplateTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('LongPressGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let FatherObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('LongPressGestureTemplateTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureTemplateTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('LongPressGestureTemplateTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))
      let timeSpace:number = 3000
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let quyu: Component = await driver.findComponent(ON.id('LongPressGestureTemplate_Click'));
      await CommonFunc.sleep(1000);
      let timeA:number = Date.now();
      await quyu.longClick();
      let timeB:number = Date.now();
      await CommonFunc.sleep(3000);
      let timeC:number = Date.now();
      await quyu.longClick();
      let timeD:number = Date.now();
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('LongPressGestureTemplate_Text01');
      let obj1: ESObject = JSON.parse(text1);
      let time1:number = Number(obj1.$attrs.content)
      console.log('LongPressGestureTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,time1)
      let text2 = getInspectorByKey('LongPressGestureTemplate_Text02');
      let obj2: ESObject = JSON.parse(text2);
      let time2:number = Number(obj2.$attrs.content)
      console.log('LongPressGestureTemplateTest_0010 obj2 $attrs content',obj2.$attrs.content,time2)
      console.log('LongPressGestureTemplateTest_0010 obj2 time $attrs content',time1,time2);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeA timeB',timeA,timeB);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeC timeD',timeC,timeD);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeD-timeC',timeD - timeC);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeB-timeA',timeB - timeA);
      console.log('LongPressGestureTemplateTest_0010 obj2 time time2-time1',time2 - time1);
      console.log('LongPressGestureTemplateTest_0010 obj2 time timeSpace',timeSpace);
      let flag:number = time2 - time1 - timeSpace * 1000000
      console.log('LongPressGestureTemplateTest_0010 flag',flag)
      expect( flag <= (16 * 1000000)).assertTrue();
      console.info('LongPressGestureTemplateTest_0010 END');
      done();
    });
  })
}
