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
import mount from 'libmountndk1.so'

export default function mountNdk1Test() {
  describe('MuslMount1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MOUNT_MOUNT_0100
     * @tc.name       : testMuslMountMount001
     * @tc.desc       : test mount
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MOUNT_UMOUNT_0100
     * @tc.name       : testMuslMountUmount001
     * @tc.desc       : test umount
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MOUNT_UMOUNT2_0100
     * @tc.name       : testMuslMountUmount2001
     * @tc.desc       : test umount2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
  })
}
