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
import ffrtndk from 'libffrtndktest.so'

export default function ffrtNdkTest() {
  describe('FfrtNdkTest', () => {
    /**
     * @tc.number     : SUB_RESOURCESCHEDULE_FFRT_TASK_FFRT_THIS_TASK_UPDATE_QOS_0100
     * @tc.name       : testFfrtThisTaskUpdateQos001
     * @tc.desc       : test ffrt_this_task_update_qos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFfrtThisTaskUpdateQos001', 0, async (done: Function) => {
      let result: number = ffrtndk.ffrtThisTaskUpdateQos();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_RESOURCESCHEDULE_FFRT_TASK_FFRT_THIS_TASK_GET_ID_0100
     * @tc.name       : testFfrtThisTaskGetId001
     * @tc.desc       : test ffrt_this_task_get_id
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFfrtThisTaskGetId001', 0, async (done: Function) => {
      let result: number = ffrtndk.ffrtThisTaskGetId();
      expect(result).assertEqual(0);
      done();
    });
  })
}
