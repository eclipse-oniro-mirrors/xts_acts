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

export default function SelectedDragPreviewStyleTextAreaTest() {

  describe('SelectedDragPreviewStyleTextAreaTest', () => {

    let PAGE_TAG = 'SelectedDragPreviewStyleTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`SelectedDragPreviewStyleTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   SelectedDragPreviewStyleTextAreaTest0737
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_METHOD_0100
     * @tc.desc   test OH_ArkUI_SelectedDragPreviewStyle_SetColor on TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SelectedDragPreviewStyleTextAreaTest0737', Level.LEVEL1, async (done: Function) => {
      let driver = await Driver.create();
      let DragTextArea = await driver.findComponent(ON.id('textArea_test_capi'));
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textArea_test_capi');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SelectedDragPreviewStyleTextAreaTest0737] strJson is: ' + strJson);
      console.info('[SelectedDragPreviewStyleTextAreaTest0737] MinLines obj is: ' + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual('#00000005');
      console.info('[SelectedDragPreviewStyleTextAreaTest0737] END')
      done();
    })
  })
}