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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON} from '@ohos.UiTest';

export default function SelectedDragPreviewStyleTextInputTest() {

  describe('SelectedDragPreviewStyleTextInputTest', () => {

    let PAGE_TAG = 'SelectedDragPreviewStyleTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`SelectedDragPreviewStyleTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   SelectedDragPreviewStyleTextInputTest0737
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_METHOD_0100
     * @tc.desc   test OH_ArkUI_SelectedDragPreviewStyle_SetColor on TextInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectedDragPreviewStyleTextInputTest0737', Level.LEVEL1, async (done: Function) => {
      let driver = await Driver.create();
      let DragTextInput = await driver.findComponent(ON.id('textInput_test_capi'));
      let DragCAPIText_1 = await driver.findComponent(ON.id('Drag'));
      await DragTextInput.dragTo(DragCAPIText_1);
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textInput_test_capi');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SelectedDragPreviewStyleTextInputTest0737] strJson is: ' + strJson);
      console.info('[SelectedDragPreviewStyleTextInputTest0737] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual('#FFFFFF00');
      console.info('[SelectedDragPreviewStyleTextInputTest0737] END')
      done();
    })

    /**
     * @tc.name   SelectedDragPreviewStyleTextInputTest0738
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_METHOD_0200
     * @tc.desc   test OH_ArkUI_SelectedDragPreviewStyle_GetColor on TextInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectedDragPreviewStyleTextInputTest0738', Level.LEVEL1, async (done: Function) => {
      let driver = await Driver.create();
      let strJson = getInspectorByKey('Drag');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[SelectedDragPreviewStyleTextInputTest0738] strJson is: ' + strJson);
      console.info('[SelectedDragPreviewStyleTextInputTest0738] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('429490176042949670405');
      console.info('[SelectedDragPreviewStyleTextInputTest0738] END')
      done();
    })
  })
}