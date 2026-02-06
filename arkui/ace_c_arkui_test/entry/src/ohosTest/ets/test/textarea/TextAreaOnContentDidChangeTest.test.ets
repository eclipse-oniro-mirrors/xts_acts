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

export default function textAreaOnContentDidChangeTest() {

  describe('TextAreaOnContentDidChangeTest', () => {

    let PAGE_TAG = 'TextAreaOnContentDidChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextAreaOnContentDidChange001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ON_CONTENT_DID_CHANGE_0001
     * @tc.desc   test onContentDidChange event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaOnContentDidChange001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('TextAreaOnContentDidChange_buttonId1')
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextAreaContentDidData();
      let textAreaContentDidData: number[] = dataArray[0];
      console.log('testTextAreaOnContentDidChange001', JSON.stringify(dataArray))
      expect(textAreaContentDidData[2] == 119 && textAreaContentDidData[3] == 35).assertEqual(true)
      done()
    })

  })
}
