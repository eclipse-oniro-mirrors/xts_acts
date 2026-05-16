/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function enableEdgeAutoScroll() {
  describe('enableEdgeAutoScroll', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragInteractionOptions/enableEdgeAutoScroll_false',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get enableEdgeAutoScroll state pages: ' + JSON.stringify(pages));
        if (!('enableEdgeAutoScroll' == pages.name)) {
          console.info('get enableEdgeAutoScroll state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push enableEdgeAutoScroll success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push enableEdgeAutoScroll page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('enableEdgeAutoScroll after each called');
    });

    /**
     * @tc.name   DenableEdgeAutoScroll_0010
     * @tc.number enableEdgeAutoScroll_false_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DenableEdgeAutoScroll_0010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: Function) => {
      console.info('enableEdgeAutoScroll_0010 START');
      let driver = await Driver.create()
      let image = await driver.findComponent(ON.id('image'));
      let Column = await driver.findComponent(ON.id('Text'));
      await image.dragTo(Column);
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('text_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[enableEdgeAutoScroll_0010] component obj is: ' + JSON.stringify(obj));
      console.info('[enableEdgeAutoScroll_0010] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).not().assertEqual('undefined');
      console.info('[enableEdgeAutoScroll_0010] END');
      done();
    });
  })
}