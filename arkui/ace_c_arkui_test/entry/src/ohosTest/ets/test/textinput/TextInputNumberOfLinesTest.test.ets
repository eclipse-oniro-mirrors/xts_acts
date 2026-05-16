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

export default function textInputNumberOfLinesTest() {

  describe('textInputNumberOfLinesTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputNumberOfLines001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_NUMBER_OF_LINES_0001
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputNumberOfLines001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputNumberOfLines001()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputNumberOfLines002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_NUMBER_OF_LINES_0002
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputNumberOfLines002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputNumberOfLines002()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputNumberOfLines003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_NUMBER_OF_LINES_0003
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputNumberOfLines003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputNumberOfLines003()).assertEqual(0)
      done();
    }); 
    /**
     * @tc.name   testTextInputNumberOfLines004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_NUMBER_OF_LINES_0004
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputNumberOfLines004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputNumberOfLines004()).assertEqual(0)
      done();
    });   
  })
}
