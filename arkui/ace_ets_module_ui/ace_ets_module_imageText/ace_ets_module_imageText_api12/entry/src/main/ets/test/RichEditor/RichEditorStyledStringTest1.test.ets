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

export default function RichEditorStyledStringTest1() {
  describe('RichEditorStyledStringTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorStyledStringTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorStyledStringTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStyledStringTest1 state pages:" + JSON.stringify(pages));
        if (!("RichEditorStyledStringTest1" == pages.name)) {
          console.info("get RichEditorStyledStringTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorStyledStringTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStyledStringTest1 page error:" + err);
      }
      console.info("RichEditorStyledStringTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorStyledStringTest1 after each called");
    });


    /**
     * @tc.number    RichEditorStyledStringTest1_0100
     * @tc.name      RichEditorStyledStringTest1_0100
     * @tc.desc      Test RichEditor getLayoutManager
     * @tc.level     Level 2
     */
    it('RichEditorStyledStringTest1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorStyledStringTest1_0100 START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorStyledStringTest1_get'));
      await btn1.click()
      console.info("[RichEditorStyledStringTest1_0100] btn1");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('RichEditorStyledStringTest1_content');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RichEditorStyledStringTest1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('contentstart');

      console.info('RichEditorStyledStringTest1_0100 END');
      done();
    });



  })
}