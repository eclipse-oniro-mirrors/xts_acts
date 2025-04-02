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

export default function textCopyOptionTest() {

  describe('TextCopyOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_COPYOPTION_0100
     * @tc.name       : testTextCopyOption001
     * @tc.desc       : testing copyOption for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextCopyOption001', 0, async (done: Function) => {
      expect(nativeFunc.testTextCopyOption001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_COPYOPTION_0200
     * @tc.name       : testTextCopyOption002
     * @tc.desc       : testing copyOption for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextCopyOption002', 0, async (done: Function) => {
      expect(nativeFunc.testTextCopyOption002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_COPYOPTION_0300
     * @tc.name       : testTextCopyOption003
     * @tc.desc       : testing copyOption for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextCopyOption003', 0, async (done: Function) => {
      expect(nativeFunc.testTextCopyOption003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_COPYOPTION_0400
     * @tc.name       : testTextCopyOption004
     * @tc.desc       : testing copyOption for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextCopyOption004', 0, async (done: Function) => {
      expect(nativeFunc.testTextCopyOption004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_COPYOPTION_0500
     * @tc.name       : testTextCopyOption005
     * @tc.desc       : testing copyOption for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextCopyOption005', 0, async (done: Function) => {
      expect(nativeFunc.testTextCopyOption005()).assertEqual(0)
      done()
    })
  })
}
