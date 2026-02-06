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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RichEditorGetLayoutManagerTest1() {
  describe('RichEditorGetLayoutManagerTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorGetLayoutManagerTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorGetLayoutManagerTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorGetLayoutManagerTest1 state pages:" + JSON.stringify(pages));
        if (!("RichEditorGetLayoutManagerTest1" == pages.name)) {
          console.info("get RichEditorGetLayoutManagerTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorGetLayoutManagerTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorGetLayoutManagerTest1 page error:" + err);
      }
      console.info("RichEditorGetLayoutManagerTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorGetLayoutManagerTest1 after each called");
    });


    /**
     * @tc.number    RichEditorGetLayoutManagerTest1_0100
     * @tc.name      RichEditorGetLayoutManagerTest1_0100
     * @tc.desc      Test RichEditor getLayoutManager
     * @tc.level     Level 2
     */
    it('RichEditorGetLayoutManagerTest1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorGetLayoutManagerTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorGetLayoutManagerTest1_btn'));
      await btn1.click()
      console.info("[RichEditorGetLayoutManagerTest1_0100] btn1");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('RichEditorGetLayoutManagerTest1_text1');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RichEditorGetLayoutManagerTest1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      console.info('RichEditorGetLayoutManagerTest1_0100 END');
      done();
    });



  })
}