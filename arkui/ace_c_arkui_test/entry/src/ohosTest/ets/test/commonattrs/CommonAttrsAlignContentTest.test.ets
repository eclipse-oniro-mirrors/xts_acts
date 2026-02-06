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

import { expect, describe, beforeEach, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAlignContentTest() {

  describe('CommonAttrsAlignContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsAlignContent001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0100
     * @tc.desc   testing alignContent for stack with top start value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0200
     * @tc.desc   testing alignContent for stack with top value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0300
     * @tc.desc   testing alignContent for stack with top end value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0400
     * @tc.desc   testing alignContent for stack with start value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0500
     * @tc.desc   testing alignContent for stack with center value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0600
     * @tc.desc   testing alignContent for stack with end value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent007
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0700
     * @tc.desc   testing alignContent for stack with bottom start value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent007()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent008
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0800
     * @tc.desc   testing alignContent for stack with bottom value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent008()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testCommonAttrsAlignContent009
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_ALIGNCONTENT_0900
     * @tc.desc   testing alignContent for stack with bottom end value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAlignContent009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignContent009()).assertEqual(0)
      done();
    })
  })
}
