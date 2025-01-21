/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use thisw file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * diswtributed under the License isw diswtributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permiswsions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium'
import wctype from 'libwctypendk.so'

export default function wctypeNdkTest() {
  describe('MuslWctypeTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_0100
     * @tc.name       : testMuslWctypeIswalnum001
     * @tc.desc       : test iswalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnum001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswalnum(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_0200
     * @tc.name       : testMuslWctypeIswalnum002
     * @tc.desc       : test iswalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnum002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswalnum(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_0300
     * @tc.name       : testMuslWctypeIswalnum003
     * @tc.desc       : test iswalnum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnum003', 0, async (done: Function) => {
      let b = '?'
      let a: number = wctype.iswalnum(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_L_0100
     * @tc.name       : testMuslWctypeIswalnumL001
     * @tc.desc       : test iswalnumL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnumL001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswalnumL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_L_0200
     * @tc.name       : testMuslWctypeIswalnumL002
     * @tc.desc       : test iswalnumL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnumL002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswalnumL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALNUM_L_0300
     * @tc.name       : testMuslWctypeIswalnumL003
     * @tc.desc       : test iswalnumL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalnumL003', 0, async (done: Function) => {
      let b = '?'
      let a: number = wctype.iswalnumL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_0100
     * @tc.name       : testMuslWctypeIswalpha001
     * @tc.desc       : test iswalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalpha001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswalpha(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_0200
     * @tc.name       : testMuslWctypeIswalpha002
     * @tc.desc       : test iswalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalpha002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswalpha(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_0300
     * @tc.name       : testMuslWctypeIswalpha003
     * @tc.desc       : test iswalpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalpha003', 0, async (done: Function) => {
      let b = '?'
      let a: number = wctype.iswalpha(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_L_0100
     * @tc.name       : testMuslWctypeIswalphaL001
     * @tc.desc       : test iswalphal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalphaL001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswalphaL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_L_0200
     * @tc.name       : testMuslWctypeIswalphaL002
     * @tc.desc       : test iswalphal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalphaL002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswalphaL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWALPHA_L_0300
     * @tc.name       : testMuslWctypeIswalphaL003
     * @tc.desc       : test iswalphal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswalphaL003', 0, async (done: Function) => {
      let b = '?'
      let a: number = wctype.iswalphaL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWBLANK_0100
     * @tc.name       : testMuslWctypeIswblank001
     * @tc.desc       : test iswblank
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswblank001', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswblank(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWBLANK_0200
     * @tc.name       : testMuslWctypeIswblank002
     * @tc.desc       : test iswblank
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswblank002', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswblank(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWBLANK_L_0100
     * @tc.name       : testMuslWctypeIswblankL001
     * @tc.desc       : test iswblankl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswblankL001', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswblankL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWBLANK_L_0200
     * @tc.name       : testMuslWctypeIswblankL002
     * @tc.desc       : test iswblankl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswblankL002', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswblankL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_0100
     * @tc.name       : testMuslWctypeIswcntrl001
     * @tc.desc       : test iswcntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrl001', 0, async (done: Function) => {
      let b = 0
      let a: number = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_0200
     * @tc.name       : testMuslWctypeIswcntrl002
     * @tc.desc       : test iswcntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrl002', 0, async (done: Function) => {
      let b = 31
      let a: number = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_0300
     * @tc.name       : testMuslWctypeIswcntrl003
     * @tc.desc       : test iswcntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrl003', 0, async (done: Function) => {
      let b = 127
      let a: number = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_0400
     * @tc.name       : testMuslWctypeIswcntrl004
     * @tc.desc       : test iswcntrl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrl004', 0, async (done: Function) => {
      let b = 32
      let a: number = wctype.iswcntrl(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_L_0100
     * @tc.name       : testMuslWctypeIswcntrlL001
     * @tc.desc       : test iswcntrll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrlL001', 0, async (done: Function) => {
      let b = 0
      let a: number = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_L_0200
     * @tc.name       : testMuslWctypeIswcntrlL002
     * @tc.desc       : test iswcntrll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrlL002', 0, async (done: Function) => {
      let b = 31
      let a: number = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_L_0300
     * @tc.name       : testMuslWctypeIswcntrlL003
     * @tc.desc       : test iswcntrll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrlL003', 0, async (done: Function) => {
      let b = 127
      let a: number = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCNTRL_L_0400
     * @tc.name       : testMuslWctypeIswcntrlL004
     * @tc.desc       : test iswcntrll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswcntrlL004', 0, async (done: Function) => {
      let b = 32
      let a: number = wctype.iswcntrlL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWDIGIT_0100
     * @tc.name       : testMuslWctypeIswdigit001
     * @tc.desc       : test iswdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswdigit001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWDIGIT_0200
     * @tc.name       : testMuslWctypeIswdigit002
     * @tc.desc       : test iswdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswdigit002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWDIGIT_L_0100
     * @tc.name       : testMuslWctypeIswdigitL001
     * @tc.desc       : test iswdigitl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswdigitL001', 0, async (done: Function) => {
      let b = '1'
      let a: number = wctype.iswdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWDIGIT_L_0200
     * @tc.name       : testMuslWctypeIswdigitL002
     * @tc.desc       : test iswdigitl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswdigitL002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswdigitL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_L_0100
     * @tc.name       : testMuslWctypeIswgraphL001
     * @tc.desc       : test iswgraphl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraphL001', 0, async (done: Function) => {
      let b = '2'
      let a: number = wctype.iswgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_L_0200
     * @tc.name       : testMuslWctypeIswgraphL002
     * @tc.desc       : test iswgraphl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraphL002', 0, async (done: Function) => {
      let b = 'b'
      let a: number = wctype.iswgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_L_0300
     * @tc.name       : testMuslWctypeIswgraphL003
     * @tc.desc       : test iswgraphl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraphL003', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswgraphL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_0100
     * @tc.name       : testMuslWctypeIswgraph001
     * @tc.desc       : test iswgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraph001', 0, async (done: Function) => {
      let b = '2'
      let a: number = wctype.iswgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_0200
     * @tc.name       : testMuslWctypeIswgraph002
     * @tc.desc       : test iswgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraph002', 0, async (done: Function) => {
      let b = 'b'
      let a: number = wctype.iswgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWGRAPH_0300
     * @tc.name       : testMuslWctypeIswgraph003
     * @tc.desc       : test iswgraph
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswgraph003', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswgraph(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWLOWER_0100
     * @tc.name       : testMuslWctypeIswlower001
     * @tc.desc       : test iswlower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswlower001', 0, async (done: Function) => {
      let b = 'b'
      let a: number = wctype.iswlower(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWLOWER_0200
     * @tc.name       : testMuslWctypeIswlower002
     * @tc.desc       : test iswlower
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswlower002', 0, async (done: Function) => {
      let b = 'B'
      let a: number = wctype.iswlower(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWLOWER_L_0100
     * @tc.name       : testMuslWctypeIswlowerL001
     * @tc.desc       : test iswlowerl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswlowerL001', 0, async (done: Function) => {
      let b = 'b'
      let a: number = wctype.iswlowerL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWLOWER_L_0200
     * @tc.name       : testMuslWctypeIswlowerL002
     * @tc.desc       : test iswlowerl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswlowerL002', 0, async (done: Function) => {
      let b = 'B'
      let a: number = wctype.iswlowerL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_0100
     * @tc.name       : testMuslWctypeIswprint001
     * @tc.desc       : test iswprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprint001', 0, async (done: Function) => {
      let b = '3'
      let a: number = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_0200
     * @tc.name       : testMuslWctypeIswprint002
     * @tc.desc       : test iswprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprint002', 0, async (done: Function) => {
      let b = 'c'
      let a: number = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_0300
     * @tc.name       : testMuslWctypeIswprint003
     * @tc.desc       : test iswprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprint003', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_0400
     * @tc.name       : testMuslWctypeIswprint004
     * @tc.desc       : test iswprint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprint004', 0, async (done: Function) => {
      let b = '\t'
      let a: number = wctype.iswprint(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_L_0100
     * @tc.name       : testMuslWctypeIswprintL001
     * @tc.desc       : test iswprintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprintL001', 0, async (done: Function) => {
      let b = '3'
      let a: number = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_L_0200
     * @tc.name       : testMuslWctypeIswprintL002
     * @tc.desc       : test iswprintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprintL002', 0, async (done: Function) => {
      let b = 'c'
      let a: number = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_L_0300
     * @tc.name       : testMuslWctypeIswprintL003
     * @tc.desc       : test iswprintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprintL003', 0, async (done: Function) => {
      let b = ' '
      let a: number = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPRINT_L_0400
     * @tc.name       : testMuslWctypeIswprintL004
     * @tc.desc       : test iswprintl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswprintL004', 0, async (done: Function) => {
      let b = '\t'
      let a: number = wctype.iswprintL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPUNCT_0100
     * @tc.name       : testMuslWctypeIswpunct001
     * @tc.desc       : test iswpunct
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswpunct001', 0, async (done: Function) => {
      let b = '/'
      let a: number = wctype.iswpunct(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPUNCT_0200
     * @tc.name       : testMuslWctypeIswpunct002
     * @tc.desc       : test iswpunct
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswpunct002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswpunct(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPUNCT_L_0100
     * @tc.name       : testMuslWctypeIswpunctL001
     * @tc.desc       : test iswpunctl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswpunctL001', 0, async (done: Function) => {
      let b = '/'
      let a: number = wctype.iswpunctL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWPUNCT_L_0200
     * @tc.name       : testMuslWctypeIswpunctL002
     * @tc.desc       : test iswpunctl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswpunctL002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswpunctL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWSPACE_0100
     * @tc.name       : testMuslWctypeIswspace001
     * @tc.desc       : test iswspace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswspace001', 0, async (done: Function) => {
      let b = '\v'
      let a: number = wctype.iswspace(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWSPACE_0200
     * @tc.name       : testMuslWctypeIswspace002
     * @tc.desc       : test iswspace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswspace002', 0, async (done: Function) => {
      let b = 'v'
      let a: number = wctype.iswspace(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWSPACE_L_0100
     * @tc.name       : testMuslWctypeIswspaceL001
     * @tc.desc       : test iswspacel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswspaceL001', 0, async (done: Function) => {
      let b = '\v'
      let a: number = wctype.iswspaceL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWSPACE_L_0200
     * @tc.name       : testMuslWctypeIswspaceL002
     * @tc.desc       : test iswspacel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswspaceL002', 0, async (done: Function) => {
      let b = 'v'
      let a: number = wctype.iswspaceL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWUPPER_L_0100
     * @tc.name       : testMuslWctypeIswupperL001
     * @tc.desc       : test iswupperl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswupperL001', 0, async (done: Function) => {
      let b = 'A'
      let a: number = wctype.iswupperL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWUPPER_L_0200
     * @tc.name       : testMuslWctypeIswupperL002
     * @tc.desc       : test iswupperl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswupperL002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswupperL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWUPPER_0100
     * @tc.name       : testMuslWctypeIswupper001
     * @tc.desc       : test iswupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswupper001', 0, async (done: Function) => {
      let b = 'A'
      let a: number = wctype.iswupper(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWUPPER_0200
     * @tc.name       : testMuslWctypeIswupper002
     * @tc.desc       : test iswupper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswupper002', 0, async (done: Function) => {
      let b = 'a'
      let a: number = wctype.iswupper(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCTYPE_0100
     * @tc.name       : testMuslWctypeIswctype001
     * @tc.desc       : test iswctype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswctype001', 0, async (done: Function) => {
      let b = 'A'
      let c = "upper"
      let a: number = wctype.iswctype(b, c);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCTYPE_0200
     * @tc.name       : testMuslWctypeIswctype002
     * @tc.desc       : test iswctype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswctype002', 0, async (done: Function) => {
      let b = 'a'
      let c = "upper"
      let a: number = wctype.iswctype(b, c);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCTYPE_L_0100
     * @tc.name       : testMuslWctypeIswctypeL001
     * @tc.desc       : test iswctype_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswctypeL001', 0, async (done: Function) => {
      let b = 'A'
      let c = "upper"
      let a: number = wctype.iswctypeL(b, c);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWCTYPE_L_0200
     * @tc.name       : testMuslWctypeIswctypeL002
     * @tc.desc       : test iswctype_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswctypeL002', 0, async (done: Function) => {
      let b = 'a'
      let c = "upper"
      let a: number = wctype.iswctypeL(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWXDIGIT_0100
     * @tc.name       : testMuslWctypeIswxdigit001
     * @tc.desc       : test iswxdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswxdigit001', 0, async (done: Function) => {
      let b = '6'
      let a: number = wctype.iswxdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWXDIGIT_0200
     * @tc.name       : testMuslWctypeIswxdigit002
     * @tc.desc       : test iswxdigit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswxdigit002', 0, async (done: Function) => {
      let b = 'L'
      let a: number = wctype.iswxdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWXDIGIT_L_0100
     * @tc.name       : testMuslWctypeIswxdigitL001
     * @tc.desc       : test iswxdigitl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswxdigitL001', 0, async (done: Function) => {
      let b = '6'
      let a: number = wctype.iswxdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_ISWXDIGIT_L_0200
     * @tc.name       : testMuslWctypeIswxdigitL002
     * @tc.desc       : test iswxdigitl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeIswxdigitL002', 0, async (done: Function) => {
      let b = 'L'
      let a: number = wctype.iswxdigitL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANS_0100
     * @tc.name       : testMuslWctypeTowctrans001
     * @tc.desc       : test towctrans
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctrans001', 0, async (done: Function) => {
      let param = 0;
      let towctransResult: number = wctype.towctrans(param);
      console.info("Test towctransResult= " + towctransResult);
      expect(towctransResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANS_0200
     * @tc.name       : testMuslWctypeTowctrans002
     * @tc.desc       : test towctrans
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctrans002', 0, async (done: Function) => {
      let param = 1;
      let towctransResult: number = wctype.towctrans(param);
      console.info("Test towctransResult= " + towctransResult);
      expect(towctransResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANS_0300
     * @tc.name       : testMuslWctypeTowctrans003
     * @tc.desc       : test towctrans
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctrans003', 0, async (done: Function) => {
      let param = -1;
      let towctransResult: number = wctype.towctrans(param);
      console.info("Test towctransResult= " + towctransResult);
      expect(towctransResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANSL_0100
     * @tc.name       : testMuslWctypeTowctransL001
     * @tc.desc       : test towctrans_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctransL001', 0, async (done: Function) => {
      let param = 0;
      let towctransLResult: number = wctype.towctransL(param);
      console.info("Test towctransLResult= " + towctransLResult);
      expect(towctransLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANSL_0200
     * @tc.name       : testMuslWctypeTowctransL002
     * @tc.desc       : test towctrans_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctransL002', 0, async (done: Function) => {
      let param = 1;
      let towctransLResult: number = wctype.towctransL(param);
      console.info("Test towctransLResult= " + towctransLResult);
      expect(towctransLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWCTRANSL_0300
     * @tc.name       : testMuslWctypeTowctransL003
     * @tc.desc       : test towctrans_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowctransL003', 0, async (done: Function) => {
      let param = -1;
      let towctransLResult: number = wctype.towctransL(param);
      console.info("Test towctransLResult= " + towctransLResult);
      expect(towctransLResult).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWLOWERL_0100
     * @tc.name       : testMuslWctypeTowlowerL001
     * @tc.desc       : test towlower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowlowerL001', 0, async (done: Function) => {
      let param = 0;
      let towlowerLResult: number = wctype.towlowerL(param);
      console.info("Test towlowerLResult= " + towlowerLResult);
      expect(towlowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWLOWERL_0200
     * @tc.name       : testMuslWctypeTowlowerL002
     * @tc.desc       : test towlower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowlowerL002', 0, async (done: Function) => {
      let param = 1;
      let towlowerLResult: number = wctype.towlowerL(param);
      console.info("Test towlowerLResult= " + towlowerLResult);
      expect(towlowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWLOWERL_0300
     * @tc.name       : testMuslWctypeTowlowerL003
     * @tc.desc       : test towlower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowlowerL003', 0, async (done: Function) => {
      let param = 2;
      let towlowerLResult: number = wctype.towlowerL(param);
      console.info("Test towlowerLResult= " + towlowerLResult);
      expect(towlowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWLOWERL_0400
     * @tc.name       : testMuslWctypeTowlowerL004
     * @tc.desc       : test towlower_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowlowerL004', 0, async (done: Function) => {
      let param = -1;
      let towlowerLResult: number = wctype.towlowerL(param);
      console.info("Test towlowerLResult= " + towlowerLResult);
      expect(towlowerLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWUPPERL_0100
     * @tc.name       : testMuslWctypeTowupperL001
     * @tc.desc       : test towupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowupperL001', 0, async (done: Function) => {
      let param = 0;
      let towupperLResult: number = wctype.towupperL(param);
      console.info("Test towupperLResult= " + towupperLResult);
      expect(towupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWUPPERL_0200
     * @tc.name       : testMuslWctypeTowupperL002
     * @tc.desc       : test towupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowupperL002', 0, async (done: Function) => {
      let param = 1;
      let towupperLResult: number = wctype.towupperL(param);
      console.info("Test towupperLResult= " + towupperLResult);
      expect(towupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWUPPERL_0300
     * @tc.name       : testMuslWctypeTowupperL003
     * @tc.desc       : test towupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowupperL003', 0, async (done: Function) => {
      let param = 2;
      let towupperLResult: number = wctype.towupperL(param);
      console.info("Test towupperLResult= " + towupperLResult);
      expect(towupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_TOWUPPERL_0400
     * @tc.name       : testMuslWctypeTowupperL004
     * @tc.desc       : test towupper_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeTowupperL004', 0, async (done: Function) => {
      let param = -1;
      let towupperLResult: number = wctype.towupperL(param);
      console.info("Test towupperLResult= " + towupperLResult);
      expect(towupperLResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTRANS_0100
     * @tc.name       : testMuslWctypeWctrans001
     * @tc.desc       : test wctrans
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeWctrans001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wctype.wctrans(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTRANS_0200
     * @tc.name       : testMuslWctypeWctrans002
     * @tc.desc       : test wctrans
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeWctrans002', 0, async (done: Function) => {
      let param = -1;
      let result: number = wctype.wctrans(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTRANSL_0100
     * @tc.name       : testMuslWctypeWctransL001
     * @tc.desc       : test wctrans_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeWctransL001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wctype.wctransL(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTRANSL_0200
     * @tc.name       : testMuslWctypeWctransL002
     * @tc.desc       : test wctrans_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWctypeWctransL002', 0, async (done: Function) => {
      let param = -1;
      let result: number = wctype.wctransL(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTYPE_0100
     * @tc.name       : testMuslWctypeWctype001
     * @tc.desc       : test wctype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeWctype001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wctype.wctype(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCTYPE_WCTYPEL_0100
     * @tc.name       : testMuslWctypeWctypeL001
     * @tc.desc       : test wctype_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWctypeWctypeL001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wctype.wctypeL(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

  })
}