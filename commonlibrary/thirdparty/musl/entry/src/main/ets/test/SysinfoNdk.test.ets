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
import sysInfo from 'libsysinfondk.so'

export default function SysInfoNdkTest() {
  describe('MuslSysInfoTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSINFO_GET_PHYS_PAGES_0100
     * @tc.name       : testMuslSysInfoGetPhysPages001
     * @tc.desc       : test get_phys_pages
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSysInfoGetPhysPages001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: boolean = sysInfo.getPhysPages();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSINFO_GET_NPROCS_CONF_0100
     * @tc.name       : testMuslSysInfoGetNprocsConf001
     * @tc.desc       : test get_nprocs_conf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSysInfoGetNprocsConf001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: boolean = sysInfo.getNprocsConf();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSINFO_GET_NPROCS_0100
     * @tc.name       : testMuslSysInfoGetNprocs001
     * @tc.desc       : test get_nprocs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSysInfoGetNprocs001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: boolean = sysInfo.getNprocs();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSINFO_GET_AVPHYS_PAGES_0100
     * @tc.name       : testMuslSysInfoGetAvphysPages001
     * @tc.desc       : test get_avphys_pages
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSysInfoGetAvphysPages001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: boolean = sysInfo.getAvphysPages();
      expect(result).assertEqual(resultTrue);
      done()
    });
  })
}