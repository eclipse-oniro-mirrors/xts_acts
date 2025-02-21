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

export default function stackBackgroundImageSizeTest() {

  describe('StackBackgroundImageSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGESIZE_0100
     * @tc.name       : testStackBackgroundImageSize001
     * @tc.desc       : testing backgroundImageSize for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImageSize001', 0, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImageSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGESIZE_0200
     * @tc.name       : testStackBackgroundImageSize002
     * @tc.desc       : testing backgroundImageSize for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImageSize002', 0, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImageSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGESIZE_0300
     * @tc.name       : testStackBackgroundImageSize003
     * @tc.desc       : testing backgroundImageSize for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBackgroundImageSize003', 0, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImageSize003()).assertEqual(0)
      done()
    })

  })
}
