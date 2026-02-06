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
import ctype from 'libctypendk.so'

export default function ctypeNdkTest() {
  describe('testMuslCtypeTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0100
     * @tc.name       : testMuslCtypeIsalnum001
     * @tc.desc       : test isalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isalnum(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0200
     * @tc.name       : testMuslCtypeIsalnum002
     * @tc.desc       : test isalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isalnum(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0300
     * @tc.name       : testMuslCtypeIsalnum003
     * @tc.desc       : test isalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '?'
      let a: number = ctype.isalnum(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0100
     * @tc.name       : testMuslCtypeIsalnumL001
     * @tc.desc       : test isalnum_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnumL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isalnumL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0200
     * @tc.name       : testMuslCtypeIsalnumL002
     * @tc.desc       : test isalnum_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnumL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isalnumL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0300
     * @tc.name       : testMuslCtypeIsalnumL003
     * @tc.desc       : test isalnum_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalnumL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '?'
      let a: number = ctype.isalnumL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0100
     * @tc.name       : testMuslCtypeIsalpha001
     * @tc.desc       : test isalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalpha001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isalpha(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0200
     * @tc.name       : testMuslCtypeIsalpha002
     * @tc.desc       : test isalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalpha002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isalpha(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0300
     * @tc.name       : testMuslCtypeIsalpha003
     * @tc.desc       : test isalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalpha003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '?'
      let a: number = ctype.isalpha(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0100
     * @tc.name       : testMuslCtypeIsalphaL001
     * @tc.desc       : test isalpha_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalphaL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isalphaL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0200
     * @tc.name       : testMuslCtypeIsalphaL002
     * @tc.desc       : test isalpha_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalphaL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isalphaL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0300
     * @tc.name       : testMuslCtypeIsalphaL003
     * @tc.desc       : test isalpha_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsalphaL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '!'
      let a: number = ctype.isalphaL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISASCII_0100
     * @tc.name       : testMuslCtypeIsascii001
     * @tc.desc       : test isascii
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsascii001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let a: number = ctype.isascii(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISASCII_0200
     * @tc.name       : testMuslCtypeIsascii002
     * @tc.desc       : test isascii
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsascii002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 127
      let a: number = ctype.isascii(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISASCII_0300
     * @tc.name       : testMuslCtypeIsascii003
     * @tc.desc       : test isascii
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsascii003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 128
      let a: number = ctype.isascii(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_0100
     * @tc.name       : testMuslCtypeIsblank001
     * @tc.desc       : test isblank
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsblank001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isblank(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_0200
     * @tc.name       : testMuslCtypeIsblank002
     * @tc.desc       : test isblank
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsblank002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isblank(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_L_0100
     * @tc.name       : testMuslCtypeIsblankL001
     * @tc.desc       : test isblank_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsblankL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isblankL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_L_0200
     * @tc.name       : testMuslCtypeIsblankL002
     * @tc.desc       : test isblank_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsblankL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isblankL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0100
     * @tc.name       : testMuslCtypeIscntrl001
     * @tc.desc       : test iscntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let a: number = ctype.iscntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0200
     * @tc.name       : testMuslCtypeIscntrl002
     * @tc.desc       : test iscntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 31
      let a: number = ctype.iscntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0300
     * @tc.name       : testMuslCtypeIscntrl003
     * @tc.desc       : test iscntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 127
      let a: number = ctype.iscntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0400
     * @tc.name       : testMuslCtypeIscntrl004
     * @tc.desc       : test iscntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 32
      let a: number = ctype.iscntrl(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0100
     * @tc.name       : testMuslCtypeIscntrlL001
     * @tc.desc       : test iscntrl_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrlL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let a: number = ctype.iscntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0200
     * @tc.name       : testMuslCtypeIscntrlL002
     * @tc.desc       : test iscntrl_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrlL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 31
      let a: number = ctype.iscntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0300
     * @tc.name       : testMuslCtypeIscntrlL003
     * @tc.desc       : test iscntrl_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrlL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 127
      let a: number = ctype.iscntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0400
     * @tc.name       : testMuslCtypeIscntrlL004
     * @tc.desc       : test iscntrl_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIscntrlL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 32
      let a: number = ctype.iscntrlL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_0100
     * @tc.name       : testMuslCtypeIsdigit001
     * @tc.desc       : test isdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsdigit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_0200
     * @tc.name       : testMuslCtypeIsdigit002
     * @tc.desc       : test isdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsdigit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_L_0100
     * @tc.name       : testMuslCtypeIsdigitL001
     * @tc.desc       : test isdigit_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsdigitL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '1'
      let a: number = ctype.isdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_L_0200
     * @tc.name       : testMuslCtypeIsdigitL002
     * @tc.desc       : test isdigit_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsdigitL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isdigitL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0100
     * @tc.name       : testMuslCtypeIsgraphL001
     * @tc.desc       : test isgraph_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraphL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '2'
      let a: number = ctype.isgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0200
     * @tc.name       : testMuslCtypeIsgraphL002
     * @tc.desc       : test isgraph_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraphL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'b'
      let a: number = ctype.isgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0300
     * @tc.name       : testMuslCtypeIsgraphL003
     * @tc.desc       : test isgraph_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraphL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isgraphL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0100
     * @tc.name       : testMuslCtypeIsgraph001
     * @tc.desc       : test isgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraph001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '2'
      let a: number = ctype.isgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0200
     * @tc.name       : testMuslCtypeIsgraph002
     * @tc.desc       : test isgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraph002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'b'
      let a: number = ctype.isgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0300
     * @tc.name       : testMuslCtypeIsgraph003
     * @tc.desc       : test isgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsgraph003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isgraph(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_0100
     * @tc.name       : testMuslCtypeIslower001
     * @tc.desc       : test islower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIslower001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'b'
      let a: number = ctype.islower(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_0200
     * @tc.name       : testMuslCtypeIslower002
     * @tc.desc       : test islower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIslower002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'B'
      let a: number = ctype.islower(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_L_0100
     * @tc.name       : testMuslCtypeIslowerL001
     * @tc.desc       : test islower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIslowerL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'b'
      let a: number = ctype.islowerL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_L_0200
     * @tc.name       : testMuslCtypeIslowerL002
     * @tc.desc       : test islower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIslowerL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'B'
      let a: number = ctype.islowerL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0100
     * @tc.name       : testMuslCtypeIsprint001
     * @tc.desc       : test isprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '3'
      let a: number = ctype.isprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0200
     * @tc.name       : testMuslCtypeIsprint002
     * @tc.desc       : test isprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'c'
      let a: number = ctype.isprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0300
     * @tc.name       : testMuslCtypeIsprint003
     * @tc.desc       : test isprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0400
     * @tc.name       : testMuslCtypeIsprint004
     * @tc.desc       : test isprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprint004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '\t'
      let a: number = ctype.isprint(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0100
     * @tc.name       : testMuslCtypeIsprintL001
     * @tc.desc       : test isprint_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprintL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '3'
      let a: number = ctype.isprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0200
     * @tc.name       : testMuslCtypeIsprintL002
     * @tc.desc       : test isprint_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprintL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'c'
      let a: number = ctype.isprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0300
     * @tc.name       : testMuslCtypeIsprintL003
     * @tc.desc       : test isprint_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprintL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = ' '
      let a: number = ctype.isprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0400
     * @tc.name       : testMuslCtypeIsprintL004
     * @tc.desc       : test isprint_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsprintL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '\t'
      let a: number = ctype.isprintL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_0100
     * @tc.name       : testMuslCtypeIspunct001
     * @tc.desc       : test ispunct
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIspunct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '/'
      let a: number = ctype.ispunct(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_0200
     * @tc.name       : testMuslCtypeIspunct002
     * @tc.desc       : test ispunct
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIspunct002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.ispunct(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_L_0100
     * @tc.name       : testMuslCtypeIspunctL001
     * @tc.desc       : test ispunct_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIspunctL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '/'
      let a: number = ctype.ispunctL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_L_0200
     * @tc.name       : testMuslCtypeIspunctL002
     * @tc.desc       : test ispunct_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIspunctL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.ispunctL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_0100
     * @tc.name       : testMuslCtypeIsspace001
     * @tc.desc       : test isspace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsspace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '\v'
      let a: number = ctype.isspace(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_0200
     * @tc.name       : testMuslCtypeIsspace002
     * @tc.desc       : test isspace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsspace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'v'
      let a: number = ctype.isspace(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_L_0100
     * @tc.name       : testMuslCtypeIsspaceL001
     * @tc.desc       : isspace_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsspaceL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '\v'
      let a: number = ctype.isspaceL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_L_0200
     * @tc.name       : testMuslCtypeIsspaceL002
     * @tc.desc       : test isspace_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsspaceL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'v'
      let a: number = ctype.isspaceL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_L_0100
     * @tc.name       : testMuslCtypeIsupperL001
     * @tc.desc       : test isupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsupperL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'A'
      let a: number = ctype.isupperL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_L_0200
     * @tc.name       : testMuslCtypeIsupperL002
     * @tc.desc       : test isupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsupperL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isupperL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_0100
     * @tc.name       : testMuslCtypeIsupper001
     * @tc.desc       : test isupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsupper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'A'
      let a: number = ctype.isupper(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_0200
     * @tc.name       : testMuslCtypeIsupper002
     * @tc.desc       : test isupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsupper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'a'
      let a: number = ctype.isupper(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISXDIGIT_0100
     * @tc.name       : testMuslCtypeIsxdigit001
     * @tc.desc       : test isxdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     *
     */
    it('testMuslCtypeIsxdigit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '6'
      let a: number = ctype.isxdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISXDIGIT_0200
     * @tc.name       : testMuslCtypeIsxdigit002
     * @tc.desc       : test isxdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsxdigit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'L'
      let a: number = ctype.isxdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISXDIGIT_L_0100
     * @tc.name       : testMuslCtypeIsxdigitL001
     * @tc.desc       : test isxdigit_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsxdigitL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = '6'
      let a: number = ctype.isxdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISXDIGIT_L_0200
     * @tc.name       : testMuslCtypeIsxdigitL002
     * @tc.desc       : test isxdigit_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCtypeIsxdigitL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 'L'
      let a: number = ctype.isxdigitL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOASCII_0100
     * @tc.name       : testMuslCtypeToascii001
     * @tc.desc       : test toascii
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToascii001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = ctype.toascii();
      expect(a).assertContain("a");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWER_0100
     * @tc.name       : testMuslCtypeTolower001
     * @tc.desc       : test tolower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolower001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 0;
      let tolowerResult: number = ctype.tolower(a);
      console.info("Test tolowerResult= " + tolowerResult);
      expect(tolowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWER_0200
     * @tc.name       : testMuslCtypeTolower002
     * @tc.desc       : test tolower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolower002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let tolowerResult: number = ctype.tolower(a);
      console.info("Test tolowerResult= " + tolowerResult);
      expect(tolowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWER_0300
     * @tc.name       : testMuslCtypeTolower003
     * @tc.desc       : test tolower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolower003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2;
      let tolowerResult: number = ctype.tolower(a);
      console.info("Test tolowerResult= " + tolowerResult);
      expect(tolowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWER_0400
     * @tc.name       : testMuslCtypeTolower004
     * @tc.desc       : test tolower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolower004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = -1;
      let tolowerResult: number = ctype.tolower(a);
      console.info("Test tolowerResult= " + tolowerResult);
      expect(tolowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWERL_0100
     * @tc.name       : testMuslCtypeTolowerL001
     * @tc.desc       : test tolower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolowerL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 0;
      let tolowerLResult: number = ctype.tolowerL(a);
      console.info("Test tolowerLResult= " + tolowerLResult);
      expect(tolowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWERL_0200
     * @tc.name       : testMuslCtypeTolowerL002
     * @tc.desc       : test tolower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolowerL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let tolowerLResult: number = ctype.tolowerL(a);
      console.info("Test tolowerLResult= " + tolowerLResult);
      expect(tolowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWERL_0300
     * @tc.name       : testMuslCtypeTolowerL003
     * @tc.desc       : test tolower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolowerL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2;
      let tolowerLResult: number = ctype.tolowerL(a);
      console.info("Test tolowerLResult= " + tolowerLResult);
      expect(tolowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOLOWERL_0400
     * @tc.name       : testMuslCtypeTolowerL004
     * @tc.desc       : test tolower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeTolowerL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = -1;
      let tolowerLResult: number = ctype.tolowerL(a);
      console.info("Test tolowerLResult= " + tolowerLResult);
      expect(tolowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPER_0100
     * @tc.name       : testMuslCtypeToupper001
     * @tc.desc       : test toupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 0;
      let toupperResult: number = ctype.toupper(a);
      console.info("Test toupperResult= " + toupperResult);
      expect(toupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPER_0200
     * @tc.name       : testMuslCtypeToupper002
     * @tc.desc       : test toupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let toupperResult: number = ctype.toupper(a);
      console.info("Test toupperResult= " + toupperResult);
      expect(toupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPER_0300
     * @tc.name       : testMuslCtypeToupper003
     * @tc.desc       : test toupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2;
      let toupperResult: number = ctype.toupper(a);
      console.info("Test toupperResult= " + toupperResult);
      expect(toupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPER_0400
     * @tc.name       : testMuslCtypeToupper004
     * @tc.desc       : test toupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = -1;
      let toupperResult: number = ctype.toupper(a);
      console.info("Test toupperResult= " + toupperResult);
      expect(toupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPERL_0100
     * @tc.name       : testMuslCtypeToupperL001
     * @tc.desc       : test toupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupperL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 0;
      let toupperLResult: number = ctype.toupperL(a);
      console.info("Test toupperLResult= " + toupperLResult);
      expect(toupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPERL_0200
     * @tc.name       : testMuslCtypeToupperL002
     * @tc.desc       : test tolower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupperL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let toupperLResult: number = ctype.tolowerL(a);
      console.info("Test toupperLResult= " + toupperLResult);
      expect(toupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPERL_0300
     * @tc.name       : testMuslCtypeToupperL003
     * @tc.desc       : test toupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupperL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2;
      let toupperLResult: number = ctype.tolowerL(a);
      console.info("Test toupperLResult= " + toupperLResult);
      expect(toupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_TOUPPERL_0400
     * @tc.name       : testMuslCtypeToupperL004
     * @tc.desc       : test toupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslCtypeToupperL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = -1;
      let toupperLResult: number = ctype.tolowerL(a);
      console.info("Test toupperLResult= " + toupperLResult);
      expect(toupperLResult).assertEqual(0);
      done();
    });
  })
}