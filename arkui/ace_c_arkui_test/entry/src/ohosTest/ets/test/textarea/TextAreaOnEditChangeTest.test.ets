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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'

export default function textAreaOnEditChangeTest() {

  describe('TextAreaOnEditChangeTest', () => {

    let PAGE_TAG = 'TextAreaOnEditChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_ON_EDIT_CHANGE_0001
    * @tc.name       : testTextAreaOnEditChange001
    * @tc.desc       : test OnEditChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextAreaOnEditChange001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnEditChangeTestTextArea')
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextAreaEditChangeData();
      console.log('testTextAreaOnEditChange001', JSON.stringify(dataArray));
      let textAreaOnEditChangeData: number[] = dataArray[0];
      expect(textAreaOnEditChangeData[1] == 1 ).assertEqual(true)
      done()
    })

  })
}
