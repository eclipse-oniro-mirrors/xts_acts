/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function imageEnableAnalyzerTest() {

  describe('ImageEnableAnalyzerTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageEnableAnalyzer001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ENABLEANALYZER_0100
     * @tc.desc   testing imageEnableAnalyzer for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageEnableAnalyzer001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageEnableAnalyzer001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageEnableAnalyzer002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ENABLEANALYZER_0200
     * @tc.desc   testing imageEnableAnalyzer for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageEnableAnalyzer002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageEnableAnalyzer002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageEnableAnalyzer003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ENABLEANALYZER_0300
     * @tc.desc   testing imageEnableAnalyzer for image with illegal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageEnableAnalyzer003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageEnableAnalyzer003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageEnableAnalyzer004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ENABLEANALYZER_0400
     * @tc.desc   testing imageEnableAnalyzer for image with set/get attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageEnableAnalyzer004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageEnableAnalyzer004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageEnableAnalyzer005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ENABLEANALYZER_0500
     * @tc.desc   testing imageEnableAnalyzer for image with set/get/reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageEnableAnalyzer005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageEnableAnalyzer005()).assertEqual(0)
      done()
    })
  })
}
