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
import wchar1 from 'libwcharndk1.so'

export default function wcharNdk1Test() {
  describe('MuslWchar1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslWcharBtowc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_BTOWC_0100
     * @tc.desc   test the normal condition of Btowc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharBtowc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Btowc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharBtowc002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_BTOWC_0200
     * @tc.desc   test the abnormal condition of Btowc_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharBtowc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Btowc_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbtowc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBTOWC_0100
     * @tc.desc   test the normal condition of Mbtowc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbtowc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbtowc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbtowc002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBTOWC_0200
     * @tc.desc   test the abnormal condition of Mbtowc_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbtowc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbtowc_Two()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslWcharFputwc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FPUTWC_0100
     * @tc.desc   test the normal condition of Fputwc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFputwc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fputwc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFputws001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FPUTWS_0100
     * @tc.desc   test the normal condition of Fputws_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFputws001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fputws_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwide001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWIDE_0100
     * @tc.desc   test the normal condition of Fwide_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwide001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwide_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwide002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWIDE_0200
     * @tc.desc   test the abnormal condition of Fwide_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwide002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwide_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWPRINTF_0100
     * @tc.desc   test the normal condition of Fwprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwprintf002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWPRINTF_0200
     * @tc.desc   test the abnormal condition of Fwprintf_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwprintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwprintf_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WPRINTF_0100
     * @tc.desc   test the normal condition of Wprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWprintf002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WPRINTF_0200
     * @tc.desc   test the abnormal condition of Wprintf_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWprintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wprintf_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWSCANF_0100
     * @tc.desc   test the normal condition of Fwscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharFwscanf002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_FWSCANF_0200
     * @tc.desc   test the abnormal condition of Fwscanf_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharFwscanf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Fwscanf_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharSwprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_SWPRINTF_0100
     * @tc.desc   test the normal condition of Swprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharSwprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Swprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharSwprintf002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_SWPRINTF_0200
     * @tc.desc   test the abnormal condition of Swprintf_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharSwprintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Swprintf_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharSwscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_SWSCANF_0100
     * @tc.desc   test the normal condition of Swscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharSwscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Swscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharSwscanf002
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_SWSCANF_0200
     * @tc.desc   test the abnormal condition of Swscanf_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharSwscanf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Swscanf_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbrtowc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBRTOWC_0100
     * @tc.desc   test the normal condition of Mbrtowc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbrtowc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbrtowc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbsinit001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBSINIT_0100
     * @tc.desc   test the normal condition of Mbsinit_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbsinit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbsinit_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbstowcs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBSTOWCS_0100
     * @tc.desc   test the normal condition of Mbstowcs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbstowcs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbstowcs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbsrtowcs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBSRTOWCS_0100
     * @tc.desc   test the normal condition of Mbsrtowcs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbsrtowcs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbsrtowcs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharMbsnrtowcs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_MBSNRTOWCS_0100
     * @tc.desc   test the normal condition of Mbsnrtowcs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharMbsnrtowcs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Mbsnrtowcs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharOpenWmemstream001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_OPEN_WMEMSTREAM_0100
     * @tc.desc   test the normal condition of OpenWmemstream_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharOpenWmemstream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.OpenWmemstream_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharTowlower001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_TOWLOWER_0100
     * @tc.desc   test the normal condition of Towlower_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharTowlower001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Towlower_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharTowupper001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_TOWUPPER_0100
     * @tc.desc   test the normal condition of Towupper_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharTowupper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Towupper_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcpcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCPCPY_0100
     * @tc.desc   test the normal condition of Wcpcpy_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcpcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcpcpy_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcpncpy001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCPNCPY_0100
     * @tc.desc   test the normal condition of Wcpncpy_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcpncpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcpncpy_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcrtomb001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCRTOMB_0100
     * @tc.desc   test the normal condition of Wcrtomb_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcrtomb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcrtomb_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscasecmp001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMP_0100
     * @tc.desc   test the normal condition of Wcscasecmp_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscasecmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscasecmp_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscasecmpL001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMPL_0100
     * @tc.desc   test the normal condition of Wcscasecmpl_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscasecmpL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscasecmpl_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscat001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCAT_0100
     * @tc.desc   test the normal condition of Wcscat_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscat_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcschr001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCHR_0100
     * @tc.desc   test the normal condition of Wcschr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcschr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcschr_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscmp001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCMP_0100
     * @tc.desc   test the normal condition of Wcscmp_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscmp_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscoll001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLL_0100
     * @tc.desc   test the normal condition of Wcscoll_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscoll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscoll_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscollL001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLLL_0100
     * @tc.desc   test the normal condition of Wcscolll_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscollL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscolll_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscpy001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCPY_0100
     * @tc.desc   test the normal condition of Wcscpy_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscpy_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcscspn001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSCSPN_0100
     * @tc.desc   test the normal condition of Wcscspn_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcscspn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcscspn_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsdup001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSDUP_0100
     * @tc.desc   test the normal condition of Wcsdup_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsdup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsdup_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsftime001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSFTIME_0100
     * @tc.desc   test the normal condition of Wcsftime_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsftime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsftime_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsftimeL001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSFTIMEL_0100
     * @tc.desc   test the normal condition of Wcsftimel_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsftimeL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsftimel_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcslen001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSLEN_0100
     * @tc.desc   test the normal condition of Wcslen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcslen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcslen_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsncasecmp001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMP_0100
     * @tc.desc   test the normal condition of Wcsncasecmp_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsncasecmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsncasecmp_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsncasecmpL001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMPL_0100
     * @tc.desc   test the normal condition of Wcsncasecmpl_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsncasecmpL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsncasecmpl_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsncat001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNCAT_0100
     * @tc.desc   test the normal condition of Wcsncat_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsncat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsncat_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsncmp001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNCMP_0100
     * @tc.desc   test the normal condition of Wcsncmp_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsncmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsncmp_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsncpy001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNCPY_0100
     * @tc.desc   test the normal condition of Wcsncpy_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsncpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsncpy_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsnlen001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNLEN_0100
     * @tc.desc   test the normal condition of Wcsnlen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsnlen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsnlen_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsnrtombs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSNRTOMBS_0100
     * @tc.desc   test the normal condition of Wcsnrtombs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsnrtombs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsnrtombs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcspbrk001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSPBRK_0100
     * @tc.desc   test the normal condition of Wcspbrk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcspbrk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcspbrk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsrchr001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSRCHR_0100
     * @tc.desc   test the normal condition of Wcsrchr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsrchr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsrchr_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsrtombs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSRTOMBS_0100
     * @tc.desc   test the normal condition of Wcsrtombs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsrtombs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsrtombs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsspn001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSSPN_0100
     * @tc.desc   test the normal condition of Wcsspn_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsspn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsspn_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsstr001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSSTR_0100
     * @tc.desc   test the normal condition of Wcsstr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsstr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsstr_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstod001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOD_0100
     * @tc.desc   test the normal condition of Wcstod_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstod_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstof001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOF_0100
     * @tc.desc   test the normal condition of Wcstof_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstof001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstof_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstok001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOK_0100
     * @tc.desc   test the normal condition of Wcstok_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstok001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstok_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstol001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOL_0100
     * @tc.desc   test the normal condition of Wcstol_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstol_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstold001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLD_0100
     * @tc.desc   test the normal condition of Wcstold_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstold001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstold_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstoll001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLL_0100
     * @tc.desc   test the normal condition of Wcstoll_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstoll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstoll_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstombs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOMBS_0100
     * @tc.desc   test the normal condition of Wcstombs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstombs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstombs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstoul001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOUL_0100
     * @tc.desc   test the normal condition of Wcstoul_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstoul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstoul_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcstoull001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSTOULL_0100
     * @tc.desc   test the normal condition of Wcstoull_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcstoull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcstoull_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcswcs001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSWCS_0100
     * @tc.desc   test the normal condition of Wcswcs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcswcs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcswcs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcswidth001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSWIDTH_0100
     * @tc.desc   test the normal condition of Wcswidth_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcswidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcswidth_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsxfrm001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRM_0100
     * @tc.desc   test the normal condition of Wcsxfrm_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsxfrm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsxfrm_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcsxfrmL001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRML_0100
     * @tc.desc   test the normal condition of Wcsxfrml_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcsxfrmL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcsxfrml_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWctob001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCTOB_0100
     * @tc.desc   test the normal condition of Wctob_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWctob001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wctob_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWctomb001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCTOMB_0100
     * @tc.desc   test the normal condition of Wctomb_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWctomb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wctomb_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWcwidth001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WCWIDTH_0100
     * @tc.desc   test the normal condition of Wcwidth_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWcwidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wcwidth_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWmemchr001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WMEMCHR_0100
     * @tc.desc   test the normal condition of Wmemchr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWmemchr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wmemchr_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWmemcmp001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WMEMCMP_0100
     * @tc.desc   test the normal condition of Wmemcmp_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWmemcmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wmemcmp_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWmemcpy001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WMEMCPY_0100
     * @tc.desc   test the normal condition of Wmemcpy_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWmemcpy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wmemcpy_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWmemmove001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WMEMMOVE_0100
     * @tc.desc   test the normal condition of Wmemmove_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWmemmove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wmemmove_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWmemset001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WMEMSET_0100
     * @tc.desc   test the normal condition of Wmemset_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWmemset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wmemset_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharWscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_WSCANF_0100
     * @tc.desc   test the normal condition of Wscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharWscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Wscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharVfwprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WHAR_VFWPRINTF_0100
     * @tc.desc   test the normal condition of Vfwprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharVfwprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Vfwprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharVswprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WHAR_VSWPRINTF_0100
     * @tc.desc   test the normal condition of Vswprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharVswprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Vswprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharVwscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_VWSCANF_0100
     * @tc.desc   test the normal condition of Vwscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharVwscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Vwscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharVwprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_WHAR_VWPRINTF_0100
     * @tc.desc   test the normal condition of Vwprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharVwprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Vwprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharGetwchar001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_GETWCHAR_0100
     * @tc.desc   test the normal condition of Getwchar_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharGetwchar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Getwchar_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharPutwc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_PUTWC_0100
     * @tc.desc   test the normal condition of Putwc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharPutwc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Putwc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharPutWChar001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_PUTWCHAR_0100
     * @tc.desc   test the normal condition of PutWChar_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharPutWChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.PutWChar_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharUngetwc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCHAR_UNGETWC_0100
     * @tc.desc   test the normal condition of Ungetwc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharUngetwc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Ungetwc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslWcharVfwscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_WHAR_VFWSCANF_0100
     * @tc.desc   test the normal condition of Vfwscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslWcharVfwscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(wchar1.Vfwscanf_One()).assertEqual(1);
      done();
    });


  })
}