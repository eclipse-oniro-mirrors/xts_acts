/**
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function ListScrollTest1() {
  describe('ListScrollTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("ListScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ListScroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListScrollTest state pages: " + JSON.stringify(pages));
        if (!("ListScroll" == pages.name)) {
          console.info("get ListScrollTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListScrollTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListScrollTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    ListScroll
     * @tc.name      ListScrollTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ListScrollTest1_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ListScrollTest_0100 START');
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('listScroll_4');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("ListScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.5),Math.round(bottom - height/4),Math.round(left + width*0.5),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('listScroll_1');
      let strJson1 = getInspectorByKey('listScroll_2');
      let strJson2 = getInspectorByKey('listScroll_3');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ListScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ListScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ListScrollTest_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj.$attrs.content).assertEqual('onWillScroll');
      expect(obj1.$attrs.content).assertEqual('onDidScroll');
      expect(obj2.$attrs.content).assertEqual('onScrollVisibleContentChange');
      console.info('[ListScrollTest_0100] END');
      done();
    });
  })
}

