/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import hitracendk from 'libhitracendk.so'

export default function hitraceNdkTest() {
  describe('HiviewdfxHitraceTest', () => {
    /**
     * @tc.number     : SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_COUNTTRACE_0100
     * @tc.name       : testOHHiTraceCountTrace001
     * @tc.desc       : test OH_HiTrace_CountTrace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiTraceCountTrace001', 0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceCountTrace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_STARTTRACE_0100
     * @tc.name       : testOHHiTraceStartTrace001
     * @tc.desc       : test OH_HiTrace_StartTrace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiTraceStartTrace001', 0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceStartTrace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_STARTASYNCTRACE_0100
     * @tc.name       : testOHHiTraceStartAsyncTrace001
     * @tc.desc       : test OH_HiTrace_StartAsyncTrace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiTraceStartAsyncTrace001', 0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceStartAsyncTrace();
      expect(result).assertEqual(0);
      done();
    });
  })
}