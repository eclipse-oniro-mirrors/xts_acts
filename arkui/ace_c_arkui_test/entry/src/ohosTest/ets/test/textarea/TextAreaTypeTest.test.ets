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

export default function textAreaTypeTest() {

  describe('TextAreaTypeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaType001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TYPE_0100
     * @tc.desc   testing Type for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaType001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaType002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TYPE_0200
     * @tc.desc   testing Type for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaType002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaType003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TYPE_0300
     * @tc.desc   testing Type for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaType003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaType004
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TYPE_0400
     * @tc.desc   testing Type for textArea with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaType004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaType005
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_TYPE_0500
     * @tc.desc   testing Type for textArea with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaType005()).assertEqual(0)
      done();
    });
  })
}
