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

export default function textTextShadowTest() {

  describe('TextTextShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTSHADOW_0100
     * @tc.name       : testTextTextShadow001
     * @tc.desc       : testing textShadow for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextShadow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTSHADOW_0200
     * @tc.name       : testTextTextShadow002
     * @tc.desc       : testing textShadow for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextShadow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTSHADOW_0300
     * @tc.name       : testTextTextShadow003
     * @tc.desc       : testing textShadow for text with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextShadow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextShadow003()).assertEqual(0)
      done()
    })
  })
}
