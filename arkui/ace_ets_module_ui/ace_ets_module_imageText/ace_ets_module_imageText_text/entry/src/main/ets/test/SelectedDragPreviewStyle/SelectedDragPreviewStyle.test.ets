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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SelectedDragPreviewStyle() {
  describe('selectedDragPreviewStyle', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SelectedDragPreviewStyle/SelectedDragPreviewStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectedDragPreviewStyle state pages: ' + JSON.stringify(pages));
        if (!('selectedDragPreviewStyle' == pages.name)) {
          console.info('get selectedDragPreviewStyle state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push selectedDragPreviewStyle success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push selectedDragPreviewStyle page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('selectedDragPreviewStyle after each called');
    });


    /**
     * @tc.name   selectedDragPreviewStyle_0010
     * @tc.number selectedDragPreviewStyle_0010
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectedDragPreviewStyle_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[selectedDragPreviewStyle_0010] START');
      let driver: Driver = Driver.create();

      let DragText = await driver.findComponent(ON.id('text_test'));
      let DragButton = await driver.findComponent(ON.id('drag_button'));
      await DragText.dragTo(DragButton);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_test');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[selectedDragPreviewStyle_0010] strJson is: ' + strJson);
      console.info('[selectedDragPreviewStyle_0010] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual('#FF008000');
      console.info('[selectedDragPreviewStyle_0010] END')
      done();
    });

    /**
     * @tc.name   selectedDragPreviewStyle_0020
     * @tc.number selectedDragPreviewStyle_0020
     * @tc.desc   Component is TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectedDragPreviewStyle_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[selectedDragPreviewStyle_0020] START');
      let driver: Driver = Driver.create();

      let DragTextArea = await driver.findComponent(ON.id('textArea_test'));
      let DragButton = await driver.findComponent(ON.id('drag_button'));
      await DragTextArea.dragTo(DragButton);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textArea_test');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[selectedDragPreviewStyle_0020] strJson is: ' + strJson);
      console.info('[selectedDragPreviewStyle_0020] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual('#00000000');
      console.info('[selectedDragPreviewStyle_0020] END')
      done();
    });

    /**
     * @tc.name   selectedDragPreviewStyle_0030
     * @tc.number selectedDragPreviewStyle_0030
     * @tc.desc   Component is TextInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectedDragPreviewStyle_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[selectedDragPreviewStyle_0030] START');
      let driver: Driver = Driver.create();

      let DragTextInput = await driver.findComponent(ON.id('textInput_test'));
      let DragButton = await driver.findComponent(ON.id('drag_button'));
      await DragTextInput.dragTo(DragButton);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textInput_test');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[selectedDragPreviewStyle_0030] strJson is: ' + strJson);
      console.info('[selectedDragPreviewStyle_0030] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect('#FFFFFFFF #FF000000').assertContain(obj.$attrs.selectedDragPreviewStyle);
      console.info('[selectedDragPreviewStyle_0030] END')
      done();
    });

    /**
     * @tc.name   selectedDragPreviewStyle_0040
     * @tc.number selectedDragPreviewStyle_0040
     * @tc.desc   Component is Search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectedDragPreviewStyle_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[selectedDragPreviewStyle_0040] START');
      let driver: Driver = Driver.create();

      let DragSearch = await driver.findComponent(ON.id('search_test'));
      let DragButton = await driver.findComponent(ON.id('drag_button'));
      await DragSearch.dragTo(DragButton);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('search_test');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[selectedDragPreviewStyle_0040] strJson is: ' + strJson);
      console.info('[selectedDragPreviewStyle_0040] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(undefined);
      console.info('[selectedDragPreviewStyle_0040] END')
      done();
    });
  })
}