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
import aeabi from 'libaeabindk.so'

export default function aeabiNdkTest() {
  describe('MuslAeabiTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCLR_0100
     * @tc.name       : testMuslAeabiMemclr001
     * @tc.desc       : test __aeabi_memclr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemclr001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemclr();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCLR4_0100
     * @tc.name       : testMuslAeabiMemclr4001
     * @tc.desc       : test __aeabi_memclr4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemclr4001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemclr4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCLR8_0100
     * @tc.name       : testMuslAeabiMemclr8001
     * @tc.desc       : test __aeabi_memclr8
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemclr8001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemclr4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCPY_0100
     * @tc.name       : testMuslAeabiMemcpy001
     * @tc.desc       : test __aeabi_memcpy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemcpy001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemcpy();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCPY4_0100
     * @tc.name       : testMuslAeabiMemcpy4001
     * @tc.desc       : test __aeabi_memcpy4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemcpy4001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemcpy4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMCPY8_0100
     * @tc.name       : testMuslAeabiMemcpy8001
     * @tc.desc       : test __aeabi_memcpy8
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemcpy8001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemcpy4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMMOVE_0100
     * @tc.name       : testMuslAeabiMemmove001
     * @tc.desc       : test __aeabi_memmove
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemmove001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemmove();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMMOVE4_0100
     * @tc.name       : testMuslAeabiMemmove4001
     * @tc.desc       : test __aeabi_memmove4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemmove4001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemmove4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMMOVE8_0100
     * @tc.name       : testMuslAeabiMemmove8001
     * @tc.desc       : test __aeabi_memmove8
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemmove8001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemmove8();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMSET_0100
     * @tc.name       : testMuslAeabiMemset001
     * @tc.desc       : test __aeabi_memset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemset001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemset();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMSET4_0100
     * @tc.name       : testMuslAeabiMemset4001
     * @tc.desc       : test __aeabi_memset4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemset4001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemset4();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_MEMSET8_0100
     * @tc.name       : testMuslAeabiMemset8001
     * @tc.desc       : test __aeabi_memset8
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiMemset8001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiMemset8();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AEABI_READ_TP_0100
     * @tc.name       : testMuslAeabiReadTp001
     * @tc.desc       : test __aeabi_read_tp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAeabiReadTp001', 0, async (done: Function) => {
      let result: number = aeabi.aeabiReadTp();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PROGNAME_0100
     * @tc.name       : testMuslProgname001
     * @tc.desc       : test __progname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslProgname001', 0, async (done: Function) => {
      let result: number = aeabi.progname();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STACK_CHK_GUARD_0100
     * @tc.name       : testMuslStackChkGuard001
     * @tc.desc       : test __stack_chk_guard
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStackChkGuard001', 0, async (done: Function) => {
      let result: number = aeabi.stackChkGuard();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

  })
}