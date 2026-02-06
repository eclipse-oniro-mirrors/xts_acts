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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function DragPreviewOptions() {
  describe('DragPreviewOptions', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragPreviewOptions/DragPreviewOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DragPreviewOptions state pages: ' + JSON.stringify(pages));
        if (!('DragPreviewOptions' == pages.name)) {
          console.info('get DragPreviewOptions state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push DragPreviewOptions success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DragPreviewOptions page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DragPreviewOptions after each called');
    });

    /**
     * @tc.number DragPreviewOptions_0010
     * @tc.name DragPreviewOptions
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DDragPreviewOptions_0010', Level.LEVEL0, async (done: Function) => {
      console.info('DragPreviewOptions_0010 START');
      let driver = await Driver.create()
      let text = await driver.findComponent(ON.id('Text2'));
      let button = await driver.findComponent(ON.id('TestButton'));
      await text.dragTo(button);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[DragPreviewOptions_0010] component obj is: ' + JSON.stringify(obj));
      console.info('[DragPreviewOptions_0010] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('suc');
      console.info('[DragPreviewOptions_0010] END');
      done();
    });
  })
}