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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function OnCompleteTest() {
  describe('OnCompleteTest', () => {
    beforeEach(async (done: Function) => {
      console.info("OnCompleteTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/OnCompleteTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnCompleteTest state pages:" + JSON.stringify(pages));
        if (!("OnCompleteTest" == pages.name)) {
          console.info("get OnCompleteTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnCompleteTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnCompleteTest page error:" + err);
      }
      console.info("OnCompleteTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnCompleteTest after each called");
    });
    /**
     * @tc.name   onComplete_0100
     * @tc.number onComplete_0100
     * @tc.desc   onComplete:event.loadingStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onComplete_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[onComplete_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('DloadingStatus');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('1');
      console.info('[onSelectionChange1_0100] END');
      done();
    });



    /**
     * @tc.name   onComplete_0200
     * @tc.number onComplete_0200
     * @tc.desc   onComplete:event.contentWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onComplete_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[onComplete_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('DcontentWidth');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Math.abs(Math.round(Number(Obj1.$attrs.content) - vp2px(100))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0200] END');
      done();
    });



    /**
     * @tc.name   onComplete_0300
     * @tc.number onComplete_0300
     * @tc.desc   onComplete:event.contentHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onComplete_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[onComplete_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('DcontentHeight');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Math.abs(Math.round(Number(Obj1.$attrs.content) - vp2px(100))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0300] END');
      done();
    });


    /**
     * @tc.name   onComplete_0400
     * @tc.number onComplete_0400
     * @tc.desc   onComplete:event.contentOffsetX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onComplete_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[onComplete_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('DcontentOffsetX');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('0');
      console.info('[onSelectionChange1_0400] END');
      done();
    });


    /**
     * @tc.name   onComplete_0500
     * @tc.number onComplete_0500
     * @tc.desc   onComplete:event.contentOffsetY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onComplete_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[onComplete_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('DcontentOffsetY');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('0');
      console.info('[onSelectionChange1_0500] END');
      done();
    });



  })
}
