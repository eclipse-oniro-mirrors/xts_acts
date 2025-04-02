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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaTextAlignTest() {

  describe('TextAreaTextAlignTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0100
     * @tc.name: testTextAreaTextAlign001
     * @tc.desc: testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_START
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaTextAlign001', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0200
     * @tc.name: testTextAreaTextAlign002
     * @tc.desc: testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_CENTER
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaTextAlign002', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0300
     * @tc.name: testTextAreaTextAlign003
     * @tc.desc: testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_END
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaTextAlign003', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0400
     * @tc.name: testTextAreaTextAlign004
     * @tc.desc: testing textAlign for textArea with enum value ARKUI_TEXT_ALIGNMENT_JUSTIFY
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaTextAlign004', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TEXTALIGN_0500
     * @tc.name: testTextAreaTextAlign005
     * @tc.desc: testing textAlign for textArea with enum value abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaTextAlign005', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaTextAlign005()).assertEqual(0)
      done();
    });
  })
}
