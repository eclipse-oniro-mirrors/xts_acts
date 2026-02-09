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
import string from 'libstringndk.so'

export default function stringNdkTest() {
  describe('MuslStringTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStringStrncmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCMP_0100
     * @tc.desc   test strncmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'a';
      let secondParam = 'a';
      let thirdParam = 1;
      let strncmpResult: number = string.strncmp(firstParam, secondParam, thirdParam);
      console.info("Test strncmpResult= " + strncmpResult);
      expect(strncmpResult).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslStringStrncpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0100
     * @tc.desc   test strncpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'GGcdefg';
      let secondParam = 'ab';
      let thirdParam = 2;
      let strncpyResult: number = string.strncpy(firstParam, secondParam, thirdParam);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('abcdefg');
      done();
    });

    /**
     * @tc.name   testMuslStringStrncpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0200
     * @tc.desc   test strncpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'GGGcdefg';
      let secondParam = 'ab';
      let thirdParam = 3;
      let strncpyResult: number = string.strncpy(firstParam, secondParam, thirdParam);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('ab');
      done();
    });

    /**
     * @tc.name   testMuslStringStrncpy003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0300
     * @tc.desc   test strncpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncpy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'GGGcdefg';
      let secondParam = 'ab';
      let thirdParam = 1;
      let strncpyResult: number = string.strncpy(firstParam, secondParam, thirdParam);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('aGGcdefg');
      done();
    });

    /**
     * @tc.name   testMuslStringStrndup001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNDUP_0100
     * @tc.desc   test strndup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrndup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'abcdefg';
      let secondParam = 3;
      let strndupResult: number = string.strndup(firstParam, secondParam);
      console.info("Test strndupResult= " + strndupResult);
      expect(strndupResult).assertEqual('abc');
      done();
    });

    /**
     * @tc.name   testMuslStringStrndup002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNDUP_0200
     * @tc.desc   test strndup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrndup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'abcdefg';
      let secondParam = 10;
      let strndupResult: number = string.strndup(firstParam, secondParam);
      console.info("Test strndupResult= " + strndupResult);
      expect(strndupResult).assertEqual('abcdefg');
      done();
    });

    /**
     * @tc.name   testMuslStringStrnlen002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNLEN_0200
     * @tc.desc   test strnlen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrnlen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'abcdefg';
      let secondParam = 10;
      let strnlenResult: number = string.strnlen(firstParam, secondParam);
      console.info("Test strnlenResult= " + strnlenResult);
      expect(strnlenResult).assertEqual(7);
      done();
    });

    /**
     * @tc.name   testMuslStringStrpbrk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRPBRK_0100
     * @tc.desc   test strpbrk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrpbrk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'abcdefg';
      let secondParam = 'ef';
      let strpbrkResult: number = string.strpbrk(firstParam, secondParam);
      console.info("Test strpbrkResult= " + strpbrkResult);
      expect(strpbrkResult).assertEqual('efg');
      done();
    });

    /**
     * @tc.name   testMuslStringStrpbrk002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRPBRK_0200
     * @tc.desc   test strpbrk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrpbrk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'abcdefg';
      let secondParam = 'hijk';
      let strpbrkResult: number = string.strpbrk(firstParam, secondParam);
      console.info("Test strpbrkResult= " + strpbrkResult);
      expect(strpbrkResult).assertUndefined();
      done();
    });

    /**
     * @tc.name   testMuslStringStrsep001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSEP_0100
     * @tc.desc   test strsep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrsep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '01234-56789';
      let secondParam = '-';
      let strsepResult: number = string.strsep(firstParam, secondParam);
      console.info("Test strsepResult= " + strsepResult);
      expect(strsepResult).assertEqual('01234');
      done();
    });

    /**
     * @tc.name   testMuslStringStrspn002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSPN_0200
     * @tc.desc   test strspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrspn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '0123456789';
      let secondParam = 'abcd';
      let strspnResult: number = string.strspn(firstParam, secondParam);
      console.info("Test strspnResult= " + strspnResult);
      expect(strspnResult).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslStringStrstr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSTR_0100
     * @tc.desc   test strstr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrstr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '0123456789';
      let secondParam = '0';
      let strstrResult: number = string.strstr(firstParam, secondParam);
      console.info("Test strstrResult= " + strstrResult);
      expect(strstrResult).assertEqual('0123456789');
      done();
    });

    /**
     * @tc.name   testMuslStringStrstr002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSTR_0200
     * @tc.desc   test strstr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrstr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '0123456789';
      let secondParam = 'a';
      let strstrResult: number = string.strstr(firstParam, secondParam);
      console.info("Test strstrResult= " + strstrResult);
      expect(strstrResult).assertUndefined();
      done();
    });

    /**
     * @tc.name   testMuslStringStrtok001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRTOK_0100
     * @tc.desc   test strtok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrtok001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '01234-56789';
      let secondParam = '-';
      let strtokResult: number = string.strtok(firstParam, secondParam);
      console.info("Test strtokResult= " + strtokResult);
      expect(strtokResult).assertEqual('01234');
      done();
    });

    /**
     * @tc.name   testMuslStringStrtok002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRTOK_0200
     * @tc.desc   test strtok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrtok002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '01234-56789';
      let secondParam = 'a';
      let strtokResult: number = string.strtok(firstParam, secondParam);
      console.info("Test strtokResult= " + strtokResult);
      expect(strtokResult).assertEqual('01234-56789');
      done();
    });

    /**
     * @tc.name   testMuslStringStrtokR001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRTOKR_0100
     * @tc.desc   test strtok_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrtokR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'ab,cd,ef';
      let secondParam = ',';
      let strtokRResult: number = string.strtokR(firstParam, secondParam);
      console.info("Test strtokRResult= " + strtokRResult);
      expect(strtokRResult).assertEqual('ab');
      done();
    });

    /**
     * @tc.name   testMuslStringStrtokR002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRTOKR_0200
     * @tc.desc   test strtok_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrtokR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'ab,cd,ef';
      let secondParam = '1';
      let strtokRResult: number = string.strtokR(firstParam, secondParam);
      console.info("Test strtokRResult= " + strtokRResult);
      expect(strtokRResult).assertEqual('ab,cd,ef');
      done();
    });

    /**
     * @tc.name   testMuslStringStrxfrm001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRXFRM_0100
     * @tc.desc   test strxfrm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrxfrm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 'abcdefg';
      let thirdParam = 10;
      let strxfrmResult: number = string.strxfrm(firstParam, secondParam, thirdParam);
      console.info("Test strxfrmResult= " + strxfrmResult);
      expect(strxfrmResult).assertEqual(7);
      done();
    });

    /**
     * @tc.name   testMuslStringStrxfrm002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRXFRM_0200
     * @tc.desc   test strxfrm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrxfrm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 'abcdefg';
      let thirdParam = 4;
      let strxfrmResult: number = string.strxfrm(firstParam, secondParam, thirdParam);
      console.info("Test strxfrmResult= " + strxfrmResult);
      expect(strxfrmResult).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testMuslStringStrerror001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_0100
     * @tc.desc   test strerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror(0);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerror002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_0200
     * @tc.desc   test strerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerror002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror(1);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerror003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_0300
     * @tc.desc   test strerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerror003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror(2);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0100
     * @tc.desc   test strerror_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror_l(0);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorL002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0200
     * @tc.desc   test strerror_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror_l(1);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorL003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0300
     * @tc.desc   test strerror_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: String = string.strerror_l(2);
      let result = (firstParam != null);
      expect(result).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorR001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_R_0100
     * @tc.desc   test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = string.strerror_r(0);
      expect(firstParam).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorR002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_R_0200
     * @tc.desc   test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = string.strerror_r(1);
      expect(firstParam).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorR003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_R_0300
     * @tc.desc   test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorR003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = string.strerror_r(2);
      expect(firstParam).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorR004
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_R_0400
     * @tc.desc   test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorR004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = string.strerror_r(3);
      expect(firstParam).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrerrorR005
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRERROR_R_0500
     * @tc.desc   test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrerrorR005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam: number = string.strerror_r(4);
      expect(firstParam).assertEqual(34);
      done()
    });
    /**
     * @tc.name   testMuslStringStrdup001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRDUP_0100
     * @tc.desc   test strdup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrdup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let result: String = string.strdup(firstParam);
      expect(result).assertEqual(firstParam);
      done()
    });
    /**
     * @tc.name   testMuslStringStrcat001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCAT_0100
     * @tc.desc   test strcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "CD"
      let result: String = string.strcat(firstParam, secondParam);
      let trueResult = "ABCD"
      expect(result).assertEqual(trueResult);
      done()
    });
    /**
     * @tc.name   testMuslStringStrchr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHR_0100
     * @tc.desc   test strchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrchr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "0009876"
      let result: String = string.strchr(firstParam);
      expect(result).assertEqual("9876");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCMP_0100
     * @tc.desc   test strcmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCD"
      let result: number = string.strcmp(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcmp002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCMP_0200
     * @tc.desc   test strcmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcmp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCDE"
      let result: number = string.strcmp(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcmp003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCMP_0300
     * @tc.desc   test strcmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcmp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "AB"
      let result: number = string.strcmp(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcoll001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0100
     * @tc.desc   test strcoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcoll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCD"
      let result: number = string.strcoll(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcoll002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0200
     * @tc.desc   test strcoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcoll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCDE"
      let result: number = string.strcoll(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcoll003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0300
     * @tc.desc   test strcoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcoll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "AB"
      let result: number = string.strcoll(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcollL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0100
     * @tc.desc   test strcoll_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcollL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCD"
      let result: number = string.strcoll_l(firstParam, secondParam);
      let trueResult = (result == 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcollL002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0200
     * @tc.desc   test strcoll_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcollL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCDE"
      let result: number = string.strcoll_l(firstParam, secondParam);
      let trueResult = (result < 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrcollL003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0300
     * @tc.desc   test strcoll_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcollL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "AB"
      let result: number = string.strcoll_l(firstParam, secondParam);
      let trueResult = (result > 0);
      expect(trueResult).assertTrue();
      done()
    });
    /**
     * @tc.name   testMuslStringStrlen001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLEN_0100
     * @tc.desc   test strlen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let result: number = string.strlen(firstParam);
      expect(result).assertEqual(4);
      done()
    });
    /**
     * @tc.name   testMuslStringStrncat001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCAT_0100
     * @tc.desc   test strncat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "ABCD"
      let result: String = string.strncat(firstParam, secondParam, 10);
      expect(result).assertEqual("ABCD");
      done()
    });

    /**
     * @tc.name   testMuslStringStrlcat001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCAT_0100
     * @tc.desc   test strlcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcd"
      let result: number = string.strlcat(firstParam);
      expect(result).assertEqual(4);
      done()
    });
    /**
     * @tc.name   testMuslStringStrlcat002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCAT_0200
     * @tc.desc   test strlcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = ""
      let result: number = string.strlcat(firstParam);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrlcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCPY_0100
     * @tc.desc   test strlcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcd"
      let result: number = string.strlcpy(firstParam);
      expect(result).assertEqual(4);
      done()
    });
    /**
     * @tc.name   testMuslStringStrlcpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCPY_0200
     * @tc.desc   test strlcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = ""
      let result: number = string.strlcpy(firstParam);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrchrnul001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHRNUL_0100
     * @tc.desc   test strchrnul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrchrnul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "Hello world"
      let secondParam = 1
      let result: String = string.strchrnul(firstParam, secondParam);
      expect(result).assertEqual("");
      done()
    });
    /**
     * @tc.name   testMuslStringStrchrnul002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHRNUL_0200
     * @tc.desc   test strchrnul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrchrnul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "Hello world"
      let secondParam = 2
      let result: String = string.strchrnul(firstParam, secondParam);
      expect(result).assertEqual("");
      done()
    });
    /**
     * @tc.name   testMuslStringStrchrnul003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHRNUL_0300
     * @tc.desc   test strchrnul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrchrnul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "Hello world"
      let secondParam = 3
      let result: String = string.strchrnul(firstParam, secondParam);
      expect(result).assertEqual("");
      done()
    });

    /**
     * @tc.name   testMuslStringStrcasestr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCASESTR_0100
     * @tc.desc   test strcasestr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcasestr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcdABCD"
      let secondParam = ""
      let result: String = string.strcasestr(firstParam, secondParam);
      expect(result).assertEqual("abcdABCD");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcasestr002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCASESTR_0200
     * @tc.desc   test strcasestr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcasestr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcdABCD"
      let secondParam = "B"
      let result: String = string.strcasestr(firstParam, secondParam);
      expect(result).assertEqual("bcdABCD");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcasestr003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCASESTR_0300
     * @tc.desc   test strcasestr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcasestr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcdABCD"
      let secondParam = "b"
      let result: String = string.strcasestr(firstParam, secondParam);
      expect(result).assertEqual("bcdABCD");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcasestr004
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCASESTR_0400
     * @tc.desc   test strcasestr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcasestr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "abcdABCD"
      let secondParam = "CD"
      let result: String = string.strcasestr(firstParam, secondParam);
      expect(result).assertEqual("cdABCD");
      done()
    });
    /**
     * @tc.name   testMuslStringStrsignal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSIGNAL_0100
     * @tc.desc   test strsignal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrsignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0
      let result: String = string.strsignal(firstParam);
      expect(result).assertEqual("Hangup");
      done()
    });
    /**
     * @tc.name   testMuslStringStrsignal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSIGNAL_0200
     * @tc.desc   test strsignal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrsignal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1
      let result: String = string.strsignal(firstParam);
      expect(result).assertEqual("Interrupt");
      done()
    });

    /**
     * @tc.name   testMuslStringStrrchr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRRCHR_0100
     * @tc.desc   test strrchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrrchr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 'aabbdcc';
      let strrchrResult: string = string.strrchr(firstParam);
      console.info("Test strrchrResult= " + strrchrResult);
      expect(strrchrResult).assertEqual("dcc");
      done();
    });

    /**
     * @tc.name   testMuslStringStrrchr002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRRCHR_0200
     * @tc.desc   test strrchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrrchr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '/aa/bb/cc';
      let strrchrResult: string = string.strrchr(firstParam);
      console.info("Test strrchrResult= " + strrchrResult);
      expect(strrchrResult).assertUndefined();
      done();
    });

    /**
     * @tc.name   testMuslStringStrspn001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSPN_0100
     * @tc.desc   test strspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrspn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = '0123456789';
      let secondParam = '190126abcde';
      let strspnResult: number = string.strspn(firstParam, secondParam);
      console.info("Test strspnResult= " + strspnResult);
      expect(strspnResult).assertEqual(3);
      done();
    });

    /**
     * @tc.name   testMuslStringStrxfrmL001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRXFRML_0100
     * @tc.desc   test strxfrm_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrxfrmL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 0;
      let secondParam = 'abcdefg';
      let thirdParam = 10;
      let result: number = string.strxfrmL(firstParam, secondParam, thirdParam);
      console.info("Test result= " + result);
      expect(result).assertEqual(7);
      done();
    });

    /**
     * @tc.name   testMuslStringStrxfrmL002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRXFRML_0200
     * @tc.desc   test strxfrm_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrxfrmL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 'abcdefg';
      let thirdParam = 4;
      let result: number = string.strxfrmL(firstParam, secondParam, thirdParam);
      console.info("Test result= " + result);
      expect(result).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testMuslStringStpcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPCPY_0100
     * @tc.desc   test stpcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let result: String = string.stpcpy(firstParam);
      expect(result).assertEqual(firstParam);
      done()
    });
    /**
     * @tc.name   testMuslStringStpcpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPCPY_0200
     * @tc.desc   test stpcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpcpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCDEFG"
      let result: String = string.stpcpy(firstParam);
      expect(result).assertEqual(firstParam);
      done()
    });
    /**
     * @tc.name   testMuslStringStpncpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPNCPY_0100
     * @tc.desc   test stpncpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpncpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let result: String = string.stpncpy(firstParam);
      expect(result).assertEqual("ABcd");
      done()
    });
    /**
     * @tc.name   testMuslStringStpncpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPNCPY_0200
     * @tc.desc   test stpncpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpncpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCDEFG"
      let result: String = string.stpncpy(firstParam);
      expect(result).assertEqual("ABcd");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCPY_0100
     * @tc.desc   test strcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let result: String = string.strcpy(firstParam);
      expect(firstParam).assertEqual(result);
      done()
    });
    /**
     * @tc.name   testMuslStringMemmoveChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMMOVECHK_0100
     * @tc.desc   test memmoveChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemmoveChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memmoveChk();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringMemsetChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMSETCHK_0100
     * @tc.desc   test memsetChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemsetChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memsetChk();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringStpncpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPNCPYCHK_0100
     * @tc.desc   test stpncpyChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpncpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: String = string.stpncpyChk();
      expect(result).assertEqual("cd");
      done()
    });

    /**
     * @tc.name   testMuslStringMempcpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMPCPYCHK_0100
     * @tc.desc   test mempcpyChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMempcpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.mempcpyChk();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringStrlenChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLENCHK_0100
     * @tc.desc   test strlenChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlenChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.strlenChk();
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.name   testMuslStringStrncpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCPYCHK_0100
     * @tc.desc   test strncpyChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: String = string.strncpyChk();
      expect(result).assertEqual("efcd");
      done()
    });
    /**
     * @tc.name   testMuslStringStrcpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCPY_0200
     * @tc.desc   test strcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCDEF"
      let result: String = string.strcpy(firstParam);
      expect(result).assertEqual(firstParam);
      done()
    });
    /**
     * @tc.name   testMuslStringStrcspn001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCSPN_0100
     * @tc.desc   test strcspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcspn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let secondParam = "AB"
      let result: number = string.strcspn(firstParam, secondParam);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringStrcspn002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCSPN_0200
     * @tc.desc   test strcspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcspn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCDEF"
      let secondParam = "G"
      let result: number = string.strcspn(firstParam, secondParam);
      expect(result).assertEqual(6);
      done()
    });
    /**
     * @tc.name   testMuslStringMemCpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCPY_0100
     * @tc.desc   test memcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemCpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABCD"
      let result: String = string.memCpy(firstParam);
      expect(result).assertEqual("ABCDEF");
      done()
    });
    /**
     * @tc.name   testMuslStringMemCpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCPY_0200
     * @tc.desc   test memcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemCpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABDC"
      let result: String = string.memCpy(firstParam);
      expect(result).assertEqual("ABDCEF");
      done()
    });
    /**
     * @tc.name   testMuslStringMemCpy003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCPY_0300
     * @tc.desc   test memcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemCpy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "ABDCEFGH"
      let result: String = string.memCpy(firstParam);
      expect(result).assertEqual("ABDCEFGH");
      done()
    });
    /**
     * @tc.name   testMuslStringMemMem001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMMEM_0100
     * @tc.desc   test memmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemMem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "BCD"
      let result: number = string.memMem(firstParam);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemMem002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMMEM_0200
     * @tc.desc   test memmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemMem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "BCAD"
      let result: number = string.memMem(firstParam);
      expect(result).assertEqual(-1);
      done()
    });
    /**
     * @tc.name   testMuslStringMemMove001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMMOVE_0100
     * @tc.desc   test memmove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemMove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "BCD"
      let result: String = string.memMove(firstParam);
      expect(result).assertEqual("BCD");
      done()
    });
    /**
     * @tc.name   testMuslStringMemPCpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMPCPY_0100
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemPCpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "1234"
      let result: String = string.memPCpy(firstParam);
      expect(result).assertEqual(firstParam);
      done()
    });
    /**
     * @tc.name   testMuslStringMemPCpy002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMPCPY_0200
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemPCpy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "12345678910"
      let result: String = string.memPCpy2(firstParam);
      expect(result).assertEqual("345678910");
      done()
    });
    /**
     * @tc.name   testMuslStringMemPCpy003
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMPCPY_0300
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemPCpy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "1234"
      let result: String = string.memPCpy3(firstParam);
      expect(result).assertEqual("3BCDEF");
      done()
    });
    /**
     * @tc.name   testMuslStringMemPCpy004
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMPCPY_0400
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemPCpy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "1234"
      let result: String = string.memPCpy4(firstParam);
      expect(result).assertEqual("ABCDEF");
      done()
    });
    /**
     * @tc.name   testMuslStringMemRChr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMRCHR_0100
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemRChr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: String = string.memrChr();
      expect(result).assertEqual("r_0100 test.");
      done()
    });
    /**
     * @tc.name   testMuslStringMemRChr002
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMRCHR_0200
     * @tc.desc   test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemRChr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memrChr2();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemSet001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMSET_0100
     * @tc.desc   test memset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memSet();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemCcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCCPY_0100
     * @tc.desc   test memccpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemCcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memCcpy();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemChr001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCHR_0100
     * @tc.desc   test memChr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemChr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memChr();
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslStringMemcmp001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCMP_0100
     * @tc.desc   test memChr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemcmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memCmp();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStringStrncatChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRNCATCHK_0100
     * @tc.desc   test strncat_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrncatChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: String = string.strncatChk();
      console.info("Test result= " + result);
      expect(result).assertEqual('ABCDABCD');
      done();
    });

    /**
     * @tc.name   testMuslStringStrcatChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCATCHK_0100
     * @tc.desc   test strcatChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcatChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "AB"
      let secondParam = "CD"
      let result: string = string.strcatChk(firstParam, secondParam);
      let trueResult = "ABCD"
      expect(result).assertEqual(trueResult);
      done()
    });

    /**
     * @tc.name   testMuslStdioMemcpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCPYCHK_0100
     * @tc.desc   test memcpyChk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioMemcpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = string.memcpyChk();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemrchrChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMRCHR_CHK_0100
     * @tc.desc   test __memrchr_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemrchrChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "this is __memrchr_chk test.";
      let secondParam = "c";
      let result: string = string.memrchrChk(firstParam, secondParam);
      expect(result).assertEqual("chk test.");
      done()
    });

    /**
     * @tc.name   testMuslStringStrcpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCPY_CHK_0100
     * @tc.desc   test __strcpy_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrcpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "this is __strcpy_chk test.";
      let result: string = string.strcpyChk(firstParam);
      expect(result).assertEqual("this is __strcpy_chk test.");
      done()
    });

    /**
     * @tc.name   testMuslStringStpcpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STPCPY_CHK_0100
     * @tc.desc   test __stpcpy_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStpcpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "this is __stpcpy_chk test.";
      let result: string = string.stpcpyChk(firstParam);
      expect(result).assertEqual("this is __stpcpy_chk test.");
      done()
    });

    /**
     * @tc.name   testMuslStringStrchrChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHR_CHK_0100
     * @tc.desc   test __strchr_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrchrChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = "this is __strchr_chk test.";
      let secondParam = 'h';
      let result: string = string.strchrChk(firstParam, secondParam);
      expect(result).assertEqual("his is __strchr_chk test.");
      done()
    });
    /**
     * @tc.name   testMuslStringStrrchrChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRRCHR_CHK_0100
     * @tc.desc   test __strrchr_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrrchrChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number =string.__strrchr_chk();
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslStringMemchrChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCHR_CHK_0100
     * @tc.desc   test __memchr_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringMemchrChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let data: number =string.__memchr_chk();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStringStrlcpyChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCPY_CHK_0100
     * @tc.desc   test __strlcpy_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcpyChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number =string.__strlcpy_chk();
      expect(data).assertEqual(6);
      done()
    });

    /**
     * @tc.name   testMuslStringStrlcatChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRLCAT_CHK_0100
     * @tc.desc   test __strlcat_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStringStrlcatChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number =string.__strlcat_chk();
      expect(data).assertEqual(6);
      done()
    });
  });
}