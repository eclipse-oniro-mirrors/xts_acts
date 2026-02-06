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

export default function textAreaOnInsertTest() {

  describe('TextAreaOnInsertTest', () => {

    let PAGE_TAG = 'TextAreaOnInsertTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextAreaOnInsert001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ONINSERT_0100
     * @tc.desc   test onInsert event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaOnInsert001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnInsertTestTextArea')
      await Utils.sleep(1000)
      await Utils.triggerKey(2040)
      await Utils.sleep(1000)
      await Utils.triggerKey(2047)
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextAreaInsertData();
      console.log('testTextAreaOnInsert001', JSON.stringify(dataArray))
      let textAreaInsertData: number[] = dataArray[0];
      expect(textAreaInsertData[0] == 8 && textAreaInsertData[1] == 9).assertEqual(true)
      done()
    })

  })
}
