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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textBackgroundColorTest() {

  describe('TextBackgroundColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0100
     * @tc.name       : testTextBackgroundColor001
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDCOLOR_0200
     * @tc.name       : testTextBackgroundColor002
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0300
     * @tc.name       : testTextBackgroundColor003
     * @tc.desc       : testing backgroundcolor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundColor003()).assertEqual(0)
      done()
    })

  })
}
