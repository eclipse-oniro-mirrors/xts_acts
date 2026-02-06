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

export default function APIPreDragStatusTest() {
  describe('APIPreDragStatusTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIPreDragStatusTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/APIPreDragStatus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIPreDragStatusTest state pages:" + JSON.stringify(pages));
        if (!("APIPreDragStatus" == pages.name)) {
          console.info("get APIPreDragStatusTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APIPreDragStatusTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIPreDragStatusTest page error:" + err);
      }
      console.info("APIPreDragStatusTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("APIPreDragStatusTest after each called");
    });

    /**
     * @tc.name   APIPreDragStatusTest_0010
     * @tc.number SUB_APIPreDragStatusTest_0010
     * @tc.desc   api test ACTION_DETECTING_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0010 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj1 = await driver.findComponent(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('APIPreDragStatusText01');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0010 obj2',obj2)
      console.log('APIPreDragStatusTest_0010 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('ACTION_DETECTING_STATUS');
      console.info('APIPreDragStatusTest_0010 END');
      done();
    });

    /**
     * @tc.name   APIPreDragStatusTest_0020
     * @tc.number SUB_APIPreDragStatusTest_0020
     * @tc.desc   api test READY_TO_TRIGGER_DRAG_ACTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0020 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await scrollBar.scrollSearch(ON.id('APIPreDragStatusButton'));
      await obj.click();
      await CommonFunc.sleep(2000);
      let obj1 = await scrollBar.scrollSearch(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('APIPreDragStatusText02');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0020 obj2',obj2)
      console.log('APIPreDragStatusTest_0020 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('READY_TO_TRIGGER_DRAG_ACTION');
      console.info('APIPreDragStatusTest_0020 END');
      done();
    });

    /**
     * @tc.name   APIPreDragStatusTest_0030
     * @tc.number SUB_APIPreDragStatusTest_0030
     * @tc.desc   api test PREVIEW_LIFT_STARTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0030 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await scrollBar.scrollSearch(ON.id('APIPreDragStatusButton'));
      await obj.click();
      await CommonFunc.sleep(2000);
      let obj1 = await scrollBar.scrollSearch(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('APIPreDragStatusText03');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0030 obj2',obj2)
      console.log('APIPreDragStatusTest_0030 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('PREVIEW_LIFT_STARTED');
      console.info('APIPreDragStatusTest_0030 END');
      done();
    });
    /**
     * @tc.name   APIPreDragStatusTest_0040
     * @tc.number SUB_APIPreDragStatusTest_0040
     * @tc.desc   api test PREVIEW_LIFT_FINISHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0040 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await scrollBar.scrollSearch(ON.id('APIPreDragStatusButton'));
      await obj.click();
      await CommonFunc.sleep(2000);
      let obj1 = await scrollBar.scrollSearch(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);

      let text2 = getInspectorByKey('APIPreDragStatusText04');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0040 obj2',obj2)
      console.log('APIPreDragStatusTest_0040 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('PREVIEW_LIFT_FINISHED');
      console.info('APIPreDragStatusTest_0040 END');
      done();
    });
    /**
     * @tc.name   APIPreDragStatusTest_0050
     * @tc.number SUB_APIPreDragStatusTest_0050
     * @tc.desc   api test PREVIEW_LANDING_STARTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0050 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await scrollBar.scrollSearch(ON.id('APIPreDragStatusButton'));
      await obj.click();
      await CommonFunc.sleep(2000);
      let obj1 = await scrollBar.scrollSearch(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('APIPreDragStatusText05');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0050 obj2',obj2)
      console.log('APIPreDragStatusTest_0050 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('PREVIEW_LANDING_STARTED');
      console.info('APIPreDragStatusTest_0050 END');
      done();
    });

    /**
     * @tc.name   APIPreDragStatusTest_0060
     * @tc.number SUB_APIPreDragStatusTest_0060
     * @tc.desc   api test PREVIEW_LANDING_FINISHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIPreDragStatusTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('APIPreDragStatusTest_0060 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await scrollBar.scrollSearch(ON.id('APIPreDragStatusButton'));
      await obj.click();
      await CommonFunc.sleep(2000);
      let obj1 = await scrollBar.scrollSearch(ON.id('APIPreDragStatusColumn'));
      await obj1.longClick();
      await CommonFunc.sleep(2000);
      let text2 = getInspectorByKey('APIPreDragStatusText06');
      let obj2: ESObject = JSON.parse(text2);
      console.log('APIPreDragStatusTest_0060 obj2',obj2)
      console.log('APIPreDragStatusTest_0060 obj2 $attrs content',obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('PREVIEW_LANDING_FINISHED');
      console.info('APIPreDragStatusTest_0060 END');
      done();
    });


  })
}
