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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaLineHeightTest() {

  describe('TextAreaLineHeightTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaLineHeight001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_LINEHEIGHT_0100
     * @tc.desc   testing lineHeight for textArea with value of 40vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaLineHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaLineHeight001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaLineHeight002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_LINEHEIGHT_0200
     * @tc.desc   testing lineHeight for textArea with value of 0vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaLineHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaLineHeight002()).assertEqual(0)
      done();
    });
  })
}
