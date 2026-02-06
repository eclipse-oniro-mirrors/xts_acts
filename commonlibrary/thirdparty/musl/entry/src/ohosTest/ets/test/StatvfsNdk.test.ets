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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import statvfs from 'libstatvfsndk.so'

export default function statvfsNdkTest() {
  describe('MuslStatvfsTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStatvfsStatvfs001
     * @tc.number SUB_THIRDPARTY_MUSL_STATVFS_STATVFS_0100
     * @tc.desc   test statvfs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatvfsStatvfs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1
      let c: number = statvfs.statvfs(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStatvfsStatvfs002
     * @tc.number SUB_THIRDPARTY_MUSL_STATVFS_STATVFS_0200
     * @tc.desc   test statvfs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatvfsStatvfs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2
      let c: number = statvfs.statvfs(a);
      expect(c).assertEqual(-1);
      done()
    });


    /**
     * @tc.name   testMuslStatvfsStatvfs64001
     * @tc.number SUB_THIRDPARTY_MUSL_STATVFS_STATVFS64_0100
     * @tc.desc   test statvfs64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatvfsStatvfs64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1
      let c: number = statvfs.statvfs64(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStatvfsStatvfs64002
     * @tc.number SUB_THIRDPARTY_MUSL_STATVFS_STATVFS64_0200
     * @tc.desc   test statvfs64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatvfsStatvfs64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2
      let c: number = statvfs.statvfs64(a);
      expect(c).assertEqual(-1);
      done()
    });
  })
}