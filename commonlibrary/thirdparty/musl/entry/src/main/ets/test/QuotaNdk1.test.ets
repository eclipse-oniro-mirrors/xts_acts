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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import quota from 'libquotandk1.so'
export default function muslQuotaNdk1Test() {
  describe('MuslQuota1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**quotactl
     * @tc.number     : SUB_THIRDPARTY_MUSL_QUOTA_QUOTACTL_0200
     * @tc.name       : testMuslQuotaQuotactl002
     * @tc.desc       : quotactl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslQuotaQuotactl002', 0, async (done: Function) => {
      let result:number = quota.quotactl();
      expect(result).assertEqual(-1);
      done()
    });
  })
}