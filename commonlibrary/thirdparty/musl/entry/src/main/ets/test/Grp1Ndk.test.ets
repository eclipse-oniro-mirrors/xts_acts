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
import grp from 'libgrp1ndk.so'

export default function grp1NdkTest() {
  describe('MuslGrp1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRNAMR_0200
     * @tc.name       : testMuslGrpGetGrNamR002
     * @tc.desc       : test getgrnam_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpGetGrNamR002', 0, async (done: Function) => {
      let data: number = grp.getGrNamR();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGROUPLIST_0200
     * @tc.name       : testMuslGrpGetGroupList002
     * @tc.desc       : test getgrouplist
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslGrpGetGroupList002', 0, async (done: Function) => {
      let data: number = grp.getGroupList();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRGID_0200
     * @tc.name       : testMuslGrpGetgrgid002
     * @tc.desc       : test getgrgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrgid002', 0, async (done: Function) => {
      let result: number = grp.getgrgid();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRGIDR_0200
     * @tc.name       : testMuslGrpGetgrgidR002
     * @tc.desc       : test getgrgid_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrgidR002', 0, async (done: Function) => {
      let result: number = grp.getgrgidR();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_GRP_GETGRNAM_0200
     * @tc.name       : testMuslGrpGetgrnam002
     * @tc.desc       : test getgrnam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslGrpGetgrnam002', 0, async (done: Function) => {
      let result: number = grp.getgrnam();
      expect(result).assertEqual(-1);
      done()
    });
  })
}