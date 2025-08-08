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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function xComponentSourceIdTest() {

  describe('XComponentSourceIdTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_SOURCEID_0100
     * @tc.name       : testXComponentSourceId001
     * @tc.desc       : testing sourceId for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentSourceId001', 0, async (done: Function) => {
      expect(nativeFunc.testXComponentSourceId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_SOURCEID_0200
     * @tc.name       : testXComponentSourceId002
     * @tc.desc       : testing sourceId for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testXComponentSourceId002', 0, async (done: Function) => {
      expect(nativeFunc.testXComponentSourceId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_SOURCEID_0300
     * @tc.name       : testXComponentSourceId003
     * @tc.desc       : testing sourceId for XComponent with null value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testXComponentSourceId003', 0, async (done: Function) => {
      expect(nativeFunc.testXComponentSourceId003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_SOURCEID_0400
     * @tc.name       : testXComponentSourceId004
     * @tc.desc       : testing sourceId for XComponent with NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testXComponentSourceId004', 0, async (done: Function) => {
      expect(nativeFunc.testXComponentSourceId004()).assertEqual(0)
      done()
    })
    
  })
}
