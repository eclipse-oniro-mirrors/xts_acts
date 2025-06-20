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

export default function xComponentTypeTest() {

  describe('XComponentTypeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_TYPE_0100
     * @tc.name       : testXComponentType001
     * @tc.desc       : testing type for XComponent with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testXComponentType001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_TYPE_0200
     * @tc.name       : testXComponentType002
     * @tc.desc       : testing type for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testXComponentType002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_TYPE_0300
     * @tc.name       : testXComponentType003
     * @tc.desc       : testing type for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testXComponentType003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_TYPE_0400
     * @tc.name       : testXComponentType004
     * @tc.desc       : testing type for XComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testXComponentType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testXComponentType004()).assertEqual(0)
      done()
    })

  })
}
