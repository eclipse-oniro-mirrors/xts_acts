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

export default function textAreaNumberOfLinesTest() {

  describe('textAreaNumberOfLinesTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_NUMBER_OF_LINES_0001
     * @tc.name: testTextAreaNumberOfLines001
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaNumberOfLines001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaNumberOfLines001()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_NUMBER_OF_LINES_0002
     * @tc.name: testTextAreaNumberOfLines002
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaNumberOfLines002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaNumberOfLines002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_NUMBER_OF_LINES_0003
     * @tc.name: testTextAreaNumberOfLines003
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaNumberOfLines003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaNumberOfLines003()).assertEqual(0)
      done();
    });  
  })
}
