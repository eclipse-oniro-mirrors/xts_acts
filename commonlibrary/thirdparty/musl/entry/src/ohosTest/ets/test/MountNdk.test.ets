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
import mount from 'libmountndk.so'

export default function mountNdkTest() {
  describe('MuslMountTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslMountUmount001
     * @tc.number SUB_THIRDPARTY_MUSL_MOUNT_UMOUNT_0100
     * @tc.desc   test umount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMountUmount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = mount.umount();
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslMountUmount2001
     * @tc.number SUB_THIRDPARTY_MUSL_MOUNT_UMOUNT2_0100
     * @tc.desc   test umount2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMountUmount2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = mount.umount2();
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });
  })
}
