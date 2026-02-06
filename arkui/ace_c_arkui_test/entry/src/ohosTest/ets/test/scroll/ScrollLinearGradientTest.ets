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

export default function scrollLinearGradientTest() {

  describe('ScrollLinearGradientTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0100
     * @tc.name       : testScrollLinearGradient001
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0200
     * @tc.name       : testScrollLinearGradient002
     * @tc.desc       : testing linearGradient for scroll with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0300
     * @tc.name       : testScrollLinearGradient003
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0400
     * @tc.name       : testScrollLinearGradient004
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0500
     * @tc.name       : testScrollLinearGradient005
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0600
     * @tc.name       : testScrollLinearGradient006
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient006()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0700
     * @tc.name       : testScrollLinearGradient007
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient007()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0800
     * @tc.name       : testScrollLinearGradient008
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient008()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_0900
     * @tc.name       : testScrollLinearGradient009
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient009()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_LINEARGRADIENT_1000
     * @tc.name       : testScrollLinearGradient010
     * @tc.desc       : testing linearGradient for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollLinearGradient010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollLinearGradient010()).assertEqual(0)
      done();
    });
  })
}
