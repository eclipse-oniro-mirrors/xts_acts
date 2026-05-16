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

export default function nodeContentTest() {

  describe('NodeContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testNodeContent001
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0100
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent002
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0200
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent003
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0300
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent004
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0400
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent005
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0500
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent006
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0600
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeContent007
     * @tc.number SUB_ARKUI_CAPI_NODE_CONTENT_0700
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeContent007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeContent007()).assertEqual(0)
      done()
    })

  })
}
