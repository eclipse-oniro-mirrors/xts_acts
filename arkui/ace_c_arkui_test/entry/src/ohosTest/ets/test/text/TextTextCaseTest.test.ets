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

export default function textTextCaseTest() {

  describe('TextTextCaseTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTCASE_0100
     * @tc.name       : testTextTextCase001
     * @tc.desc       : testing textCase for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextCase001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextCase001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTCASE_0200
     * @tc.name       : testTextTextCase002
     * @tc.desc       : testing textCase for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextCase002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextCase002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTCASE_0300
     * @tc.name       : testTextTextCase003
     * @tc.desc       : testing textCase for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextCase003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextCase003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTCASE_0400
     * @tc.name       : testTextTextCase004
     * @tc.desc       : testing textCase for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextTextCase004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextCase004()).assertEqual(0)
      done()
    })
  })
}
