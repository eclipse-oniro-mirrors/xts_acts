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

export default function testAnimationTest() {

  describe('testAnimationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Animation_0100
     * @tc.name       : testAnimationTest001
     * @tc.desc       : testing create for Animation with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimationTest001', 0, async (done: Function) => {
      expect(nativeFunc.testAnimation_001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_Animation_0200
     * @tc.name       : testAnimationTest002
     * @tc.desc       : testing create for Animation with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimationTest002', 0, async (done: Function) => {
      expect(nativeFunc.testAnimation_002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_Animation_0300
     * @tc.name       : testAnimationTest003
     * @tc.desc       : testing create for Animation with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimationTest003', 0, async (done: Function) => {
      expect(nativeFunc.testAnimation_003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_Animation_0400
     * @tc.name       : testAnimationTest004
     * @tc.desc       : testing create for Animation with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimationTest004', 0, async (done: Function) => {
      expect(nativeFunc.testAnimation_004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_Animation_0500
     * @tc.name       : testAnimationTest005
     * @tc.desc       : testing create for Animation with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimationTest005', 0, async (done: Function) => {
      expect(nativeFunc.testAnimation_005()).assertEqual(0)
      done()
    })

  })
}
