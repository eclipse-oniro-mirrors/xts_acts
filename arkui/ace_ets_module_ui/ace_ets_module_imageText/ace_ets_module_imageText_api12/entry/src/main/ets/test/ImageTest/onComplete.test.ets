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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onComplete() {
  describe('onComplete', () => {
    beforeEach(async (done: Function) => {
      console.info("onComplete beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/onComplete',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onComplete state pages:" + JSON.stringify(pages));
        if (!("onComplete" == pages.name)) {
          console.info("get onComplete pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onComplete page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onComplete page error:" + err);
      }
      console.info("onComplete beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onComplete after each called");
    });
    /**
     * @tc.number    onComplete_0100
     * @tc.name      onComplete_0100
     * @tc.desc      onComplete:event.loadingStatus
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onComplete_0100', 0, async (done: Function) => {
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
     * @tc.number    onComplete_0200
     * @tc.name      onComplete_0200
     * @tc.desc      onComplete:event.contentWidth
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onComplete_0200', 0, async (done: Function) => {
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
     * @tc.number    onComplete_0300
     * @tc.name      onComplete_0300
     * @tc.desc      onComplete:event.contentHeight
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onComplete_0300', 0, async (done: Function) => {
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
     * @tc.number    onComplete_0400
     * @tc.name      onComplete_0400
     * @tc.desc      onComplete:event.contentOffsetX
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onComplete_0400', 0, async (done: Function) => {
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
     * @tc.number    onComplete_0500
     * @tc.name      onComplete_0500
     * @tc.desc      onComplete:event.contentOffsetY
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onComplete_0500', 0, async (done: Function) => {
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
