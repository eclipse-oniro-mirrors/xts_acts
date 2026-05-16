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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RemoveAdoptedChildNullTest() {
  describe('RemoveAdoptedChildNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RemoveAdoptedChildNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/RemoveAdoptedChildNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RemoveAdoptedChildNullTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get RemoveAdoptedChildNullTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RemoveAdoptedChildNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RemoveAdoptedChildNullTest page error:" + err);
      }
      console.info("RemoveAdoptedChildNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RemoveAdoptedChildNullTest after each called");
    });

    /**
     * @tc.number    RemoveAdoptedChildNullTest_0100
     * @tc.name      RemoveAdoptedChildNullTest_0100
     * @tc.desc      adoptChild null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('RemoveAdoptedChildNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('RemoveAdoptedChildNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_adoptChild__null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('AdoptChildNull')).assertEqual(100025);
      AppStorage.delete('AdoptChildNull')
      expect(AppStorage.get('AdoptChildUndefined')).assertEqual(100025);
      AppStorage.delete('AdoptChildUndefined')
      console.info('[RemoveAdoptedChildNullTest_0100] END');
      done();
    });

    /**
     * @tc.number    RemoveAdoptedChildNullTest_0200
     * @tc.name      RemoveAdoptedChildNullTest_0200
     * @tc.desc      removeAdoptedChild null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('RemoveAdoptedChildNullTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('RemoveAdoptedChildNullTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_removeAdoptedChild_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('RemoveAdoptedChildNull')).assertEqual(100025);
      AppStorage.delete('RemoveAdoptedChildNull')
      expect(AppStorage.get('RemoveAdoptedChildUndefined')).assertEqual(100025);
      AppStorage.delete('RemoveAdoptedChildUndefined')
      console.info('[RemoveAdoptedChildNullTest_0200] END');
      done();
    });

  })
}