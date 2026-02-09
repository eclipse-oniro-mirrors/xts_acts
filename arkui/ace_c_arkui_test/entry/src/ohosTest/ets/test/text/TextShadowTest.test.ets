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

export default function textShadowTest() {

  describe('TextShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextShadow001
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0100
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow002
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0200
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow003
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0300
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow004
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0400
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow005
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0500
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow006
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0600
     * @tc.desc   testing shadow for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextShadow007
     * @tc.number SUB_ARKUI_CAPI_TEXT_SHADOW_0700
     * @tc.desc   testing shadow for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextShadow007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextShadow007()).assertEqual(0)
      done()
    })
  })
}
