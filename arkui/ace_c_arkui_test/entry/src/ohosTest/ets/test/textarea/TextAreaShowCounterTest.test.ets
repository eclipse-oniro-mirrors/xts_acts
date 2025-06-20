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

export default function textAreaShowCounterTest() {

  describe('TextAreaShowCounterTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0100
     * @tc.name: testTextAreaShowCounter001
     * @tc.desc: testing ShowCounter for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0200
     * @tc.name: testTextAreaShowCounter002
     * @tc.desc: testing ShowCounter for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0300
     * @tc.name: testTextAreaShowCounter003
     * @tc.desc: testing ShowCounter for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0400
     * @tc.name: testTextAreaShowCounter004
     * @tc.desc: testing ShowCounter for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0500
     * @tc.name: testTextAreaShowCounter005
     * @tc.desc: testing ShowCounter for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0600
     * @tc.name: testTextAreaShowCounter006
     * @tc.desc: testing ShowCounter for textArea with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter006()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SHOWCOUNTER_0700
     * @tc.name: testTextAreaShowCounter007
     * @tc.desc: testing ShowCounter for textArea with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaShowCounter007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaShowCounter007()).assertEqual(0)
      done();
    });

  })
}
