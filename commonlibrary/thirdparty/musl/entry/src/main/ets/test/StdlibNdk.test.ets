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
import stdlib from 'libstdlibndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function stdlibNdkTest() {
  describe('MuslStdlibTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LDIV_0100
     * @tc.name       : testMuslStdlibLdiv001
     * @tc.desc       : test ldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLdiv001', 0, async (done: Function) => {
      let result: number = stdlib.ldiv(89, 23);
      expect(result['quot']).assertEqual(3);
      expect(result['rem']).assertEqual(20);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LDIV_0200
     * @tc.name       : testMuslStdlibLdiv002
     * @tc.desc       : test ldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLdiv002', 0, async (done: Function) => {
      let result: number = stdlib.ldiv(0, 1);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LDIV_0300
     * @tc.name       : testMuslStdlibLdiv003
     * @tc.desc       : test ldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLdiv003', 0, async (done: Function) => {
      let result: number = stdlib.ldiv(1, 0);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LDIV_0400
     * @tc.name       : testMuslStdlibLdiv004
     * @tc.desc       : test ldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLdiv004', 0, async (done: Function) => {
      let result: number = stdlib.ldiv(0, 0);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLDIV_0100
     * @tc.name       : testMuslStdlibLLdiv001
     * @tc.desc       : test lldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLdiv001', 0, async (done: Function) => {
      let result: number = stdlib.lldiv(89, 23);
      expect(result['quot']).assertEqual(3);
      expect(result['rem']).assertEqual(20);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLDIV_0200
     * @tc.name       : testMuslStdlibLLdiv002
     * @tc.desc       : test lldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLdiv002', 0, async (done: Function) => {
      let result: number = stdlib.lldiv(0, 1);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLDIV_0300
     * @tc.name       : testMuslStdlibLLdiv003
     * @tc.desc       : test lldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLdiv003', 0, async (done: Function) => {
      let result: number = stdlib.lldiv(1, 0);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLDIV_0400
     * @tc.name       : testMuslStdlibLLdiv004
     * @tc.desc       : test lldiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLdiv004', 0, async (done: Function) => {
      let result: number = stdlib.lldiv(0, 0);
      expect(result['quot']).assertEqual(0);
      expect(result['rem']).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LCONG48_0100
     * @tc.name       : testMuslStdlibLcong48001
     * @tc.desc       : test lcong48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLcong48001', 0, async (done: Function) => {
      let oldData: number = stdlib.lcong48(1, 2, 3, 4, 5, 6, 7);
      let newData: number = stdlib.lcong48(6, 6, 6, 6, 6, 6, 6);
      console.info("Test rand oldData = " + JSON.stringify(oldData));
      console.info("Test rand newData = " + JSON.stringify(newData));
      let result = (oldData != newData)
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LCONG48_0200
     * @tc.name       : testMuslStdlibLcong48002
     * @tc.desc       : test lcong48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLcong48002', 0, async (done: Function) => {
      let newData: number = stdlib.lcong48(1, 2, 3, 4, 5, 6, 7);
      console.info("Test rand newData = " + JSON.stringify(newData));
      let result = (null != newData)
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LABS_0100
     * @tc.name       : testMuslStdlibLabs001
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLabs001', 0, async (done: Function) => {
      let result: number = stdlib.labs(1)
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LABS_0200
     * @tc.name       : testMuslStdlibLabs002
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLabs002', 0, async (done: Function) => {
      let result: number = stdlib.labs(0)
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LABS_0300
     * @tc.name       : testMuslStdlibLabs003
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLabs003', 0, async (done: Function) => {
      let result: number = stdlib.labs(-1)
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLABS_0100
     * @tc.name       : testMuslStdlibLLabs001
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLabs001', 0, async (done: Function) => {
      let result: number = stdlib.llabs(1)
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLABS_0200
     * @tc.name       : testMuslStdlibLLabs002
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLabs002', 0, async (done: Function) => {
      let result: number = stdlib.llabs(0)
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LLABS_0300
     * @tc.name       : testMuslStdlibLLabs003
     * @tc.desc       : test labs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLLabs003', 0, async (done: Function) => {
      let result: number = stdlib.llabs(-1)
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_JRAND48_0100
     * @tc.name       : testMuslStdlibJrand48001
     * @tc.desc       : test jrand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibJrand48001', 0, async (done: Function) => {
      let oldData: number = stdlib.jrand48(1, 2, 3);
      let newData: number = stdlib.jrand48(6, 6, 6);
      console.info("Test rand oldData = " + JSON.stringify(oldData));
      console.info("Test rand newData = " + JSON.stringify(newData));
      let result = (oldData != newData)
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_JRAND48_0200
     * @tc.name       : testMuslStdlibJrand48002
     * @tc.desc       : test jrand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibJrand48002', 0, async (done: Function) => {
      let newData: number = stdlib.jrand48(1, 2, 3);
      console.info("Test rand newData = " + JSON.stringify(newData));
      let result = (null != newData)
      expect(result).assertTrue();
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_0100
     * @tc.name       : testMuslStdlibRand001
     * @tc.desc       : test rand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRand001', 0, async (done: Function) => {
      let param = 0;
      let result: number = stdlib.rand(param)
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_0200
     * @tc.name       : testMuslStdlibRand002
     * @tc.desc       : test rand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRand002', 0, async (done: Function) => {
      let param = 1;
      let result: number = stdlib.rand(param)
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_R_0100
     * @tc.name       : testMuslStdlibRandR001
     * @tc.desc       : test rand_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandR001', 0, async (done: Function) => {
      let param = 0;
      let result: number = stdlib.randR(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_R_0200
     * @tc.name       : testMuslStdlibRandR002
     * @tc.desc       : test rand_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandR002', 0, async (done: Function) => {
      let param = 1;
      let result: number = stdlib.randR(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RANDOM_0100
     * @tc.name       : testMuslStdlibRandom001
     * @tc.desc       : test random
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandom001', 0, async (done: Function) => {
      let oldData: number = stdlib.random();
      let newData: number = stdlib.random();
      console.info("Test random oldData = " + JSON.stringify(oldData));
      console.info("Test random newData = " + JSON.stringify(newData));
      let result = oldData != newData
      expect(result).assertTrue()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RANDOM_0200
     * @tc.name       : testMuslStdlibRandom002
     * @tc.desc       : test random
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandom002', 0, async (done: Function) => {
      let oldData: number = stdlib.random();
      console.info("Test random oldData = " + JSON.stringify(oldData));
      let result = oldData != null;
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SEED48_0100
     * @tc.name       : testMuslStdlibSeed48001
     * @tc.desc       : test seed48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSeed48001', 0, async (done: Function) => {
      let a: number = stdlib.seed48(0);
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKTEMP_0100
     * @tc.name     : testMuslStdlibMkTemp001
     * @tc.desc     : test mktemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkTemp001', 0, async (done: Function) => {
      let result: number = stdlib.mkTemp(0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKTEMP_0200
     * @tc.name     : testMuslStdlibMkTemp002
     * @tc.desc     : test mktemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkTemp002', 0, async (done: Function) => {
      let result: number = stdlib.mkTemp(1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKTEMP_0300
     * @tc.name     : testMuslStdlibMkTemp003
     * @tc.desc     : test mktemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkTemp003', 0, async (done: Function) => {
      let result: number = stdlib.mkTemp(2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP_0100
     * @tc.name     : testMuslStdlibMkSTemp001
     * @tc.desc     : test mkstemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkSTemp001', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp(0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP_0200
     * @tc.name     : testMuslStdlibMkSTemp002
     * @tc.desc     : test mkstemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTemp002', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp(1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP_0300
     * @tc.name     : testMuslStdlibMkSTemp003
     * @tc.desc     : test mkstemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTemp003', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp(2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS_0100
     * @tc.name     : testMuslStdlibMkSTempS001
     * @tc.desc     : test mkstempS
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkSTempS001', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS(0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS_0200
     * @tc.name     : testMuslStdlibMkSTempS002
     * @tc.desc     : test mkstempS
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTempS002', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS(1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS_0300
     * @tc.name     : testMuslStdlibMkSTempS003
     * @tc.desc     : test mkstempS
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTempS003', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS(2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0100
     * @tc.name     : testMuslStdlibMkOSTemp001
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp001', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(0, 0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0200
     * @tc.name     : testMuslStdlibMkOSTemp002
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp002', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(1, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0300
     * @tc.name     : testMuslStdlibMkOSTemp003
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp003', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(2, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0400
     * @tc.name     : testMuslStdlibMkOSTemp004
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp004', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(0, 1);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0500
     * @tc.name     : testMuslStdlibMkOSTemp005
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp005', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(1, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0600
     * @tc.name     : testMuslStdlibMkOSTemp006
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp006', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(2, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0700
     * @tc.name     : testMuslStdlibMkOSTemp007
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp007', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(0, 2);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0800
     * @tc.name     : testMuslStdlibMkOSTemp008
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp008', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(1, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP_0900
     * @tc.name     : testMuslStdlibMkOSTemp009
     * @tc.desc     : test mkostemp
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp009', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp(2, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0100
     * @tc.name     : testMuslStdlibMkOSTempS001
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS001', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(0, 0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0200
     * @tc.name     : testMuslStdlibMkOSTempS002
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS002', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(1, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0300
     * @tc.name     : testMuslStdlibMkOSTempS003
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS003', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(2, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0400
     * @tc.name     : testMuslStdlibMkOSTempS004
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS004', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(0, 1);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0500
     * @tc.name     : testMuslStdlibMkOSTempS005
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS005', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(1, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0600
     * @tc.name     : testMuslStdlibMkOSTempS006
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS006', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(2, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0700
     * @tc.name     : testMuslStdlibMkOSTempS007
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS007', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(0, 2);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0800
     * @tc.name     : testMuslStdlibMkOSTempS008
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS008', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(1, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS_0900
     * @tc.name     : testMuslStdlibMkOSTempS009
     * @tc.desc     : test mkostemps
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS009', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS(2, 2);
      expect(result).assertEqual(-1)
      done()
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP64_0100
     * @tc.name     : testMuslStdlibMkSTemp64001
     * @tc.desc     : test mkstemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkSTemp64001', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp64(0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP64_0200
     * @tc.name     : testMuslStdlibMkSTemp64002
     * @tc.desc     : test mkstemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTemp64002', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp64(1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMP64_0300
     * @tc.name     : testMuslStdlibMkSTemp64003
     * @tc.desc     : test mkstemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTemp64003', 0, async (done: Function) => {
      let result: number = stdlib.mkSTemp64(2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS64_0100
     * @tc.name     : testMuslStdlibMkSTempS64001
     * @tc.desc     : test mkstempS64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkSTempS64001', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS64(0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS64_0200
     * @tc.name     : testMuslStdlibMkSTempS64002
     * @tc.desc     : test mkstempS64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTempS64002', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS64(1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKSTEMPS64_0300
     * @tc.name     : testMuslStdlibMkSTempS64003
     * @tc.desc     : test mkstempS64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkSTempS64003', 0, async (done: Function) => {
      let result: number = stdlib.mkSTempS64(2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0100
     * @tc.name     : testMuslStdlibMkOSTemp64001
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp64001', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(0, 0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0200
     * @tc.name     : testMuslStdlibMkOSTemp64002
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64002', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(1, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0300
     * @tc.name     : testMuslStdlibMkOSTemp64003
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64003', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(2, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0400
     * @tc.name     : testMuslStdlibMkOSTemp64004
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp64004', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(0, 1);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0500
     * @tc.name     : testMuslStdlibMkOSTemp64005
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64005', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(1, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0600
     * @tc.name     : testMuslStdlibMkOSTemp64006
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64006', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(2, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0700
     * @tc.name     : testMuslStdlibMkOSTemp64007
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTemp64007', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(0, 2);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0800
     * @tc.name     : testMuslStdlibMkOSTemp64008
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64008', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(1, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMP64_0900
     * @tc.name     : testMuslStdlibMkOSTemp64009
     * @tc.desc     : test mkostemp64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTemp64009', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTemp64(2, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0100
     * @tc.name     : testMuslStdlibMkOSTempS64001
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS64001', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(0, 0);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0200
     * @tc.name     : testMuslStdlibMkOSTempS64002
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64002', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(1, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0300
     * @tc.name     : testMuslStdlibMkOSTempS64003
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64003', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(2, 0);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0400
     * @tc.name     : testMuslStdlibMkOSTempS64004
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS64004', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(0, 1);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0500
     * @tc.name     : testMuslStdlibMkOSTempS64005
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64005', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(1, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0600
     * @tc.name     : testMuslStdlibMkOSTempS64006
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64006', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(2, 1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0700
     * @tc.name     : testMuslStdlibMkOSTempS64007
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibMkOSTempS64007', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(0, 2);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0800
     * @tc.name     : testMuslStdlibMkOSTempS64008
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64008', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(1, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_MKOSTEMPS64_0900
     * @tc.name     : testMuslStdlibMkOSTempS64009
     * @tc.desc     : test mkostemps64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStdlibMkOSTempS64009', 0, async (done: Function) => {
      let result: number = stdlib.mkOSTempS64(2, 2);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_GETLOADAVG_0100
     * @tc.name       : testMuslStdlibGetloadavg001
     * @tc.desc       : test getloadavg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibGetloadavg001', 0, async (done: Function) => {
      let result: number = stdlib.getloadavg();
      expect(result).assertEqual(3)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_GETSUBOPT_0100
     * @tc.name     : testMuslStdlibGetsubopt001
     * @tc.desc     : test getsubopt
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibGetsubopt001', 0, async (done: Function) => {
      let result: number = stdlib.getsubopt();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STDLIB_GRANTPT_0100
     * @tc.name     : testMuslStdlibGrantpt001
     * @tc.desc     : test grantpt
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStdlibGrantpt001', 0, async (done: Function) => {
      let result: number = stdlib.grantpt();
      expect(result).assertEqual(0)
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0100
     * @tc.name       : testMuslStdlibSrand001
     * @tc.desc       : test srand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand001', 0, async (done: Function) => {
      let a: number = stdlib.srand(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0200
     * @tc.name       : testMuslStdlibSrand002
     * @tc.desc       : test srand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand002', 0, async (done: Function) => {
      let a: number = stdlib.srand(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0300
     * @tc.name       : testMuslStdlibSrand003
     * @tc.desc       : test srand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand003', 0, async (done: Function) => {
      let a: number = stdlib.srand(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0100
     * @tc.name       : testMuslStdlibSrand48001
     * @tc.desc       : test srand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48001', 0, async (done: Function) => {
      let a: number = stdlib.srand48(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0200
     * @tc.name       : testMuslStdlibSrand48002
     * @tc.desc       : test srand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48002', 0, async (done: Function) => {
      let a: number = stdlib.srand48(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0300
     * @tc.name       : testMuslStdlibSrand48003
     * @tc.desc       : test srand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48003', 0, async (done: Function) => {
      let a: number = stdlib.srand48(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0100
     * @tc.name       : testMuslStdlibSrandom001
     * @tc.desc       : test srandom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom001', 0, async (done: Function) => {
      let a: number = stdlib.srandom(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0200
     * @tc.name       : testMuslStdlibSrandom002
     * @tc.desc       : test srandom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom002', 0, async (done: Function) => {
      let a: number = stdlib.srandom(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0300
     * @tc.name       : testMuslStdlibSrandom003
     * @tc.desc       : test srandom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom003', 0, async (done: Function) => {
      let a: number = stdlib.srandom(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOD_0100
     * @tc.name       : testMuslStdlibStrtod001
     * @tc.desc       : test strtod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtod001', 0, async (done: Function) => {
      let a = '12345.6789';
      let strtodResult: number = stdlib.strtod(a);
      console.info("Test strtodResult= " + strtodResult);
      expect(strtodResult).assertEqual(12345.678900);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOD_0200
     * @tc.name       : testMuslStdlibStrtod002
     * @tc.desc       : test strtod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtod002', 0, async (done: Function) => {
      let a = '-232.23e4';
      let strtodResult: number = stdlib.strtod(a);
      console.info("Test strtodResult= " + strtodResult);
      expect(strtodResult).assertEqual(-2322300.000000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOF_0100
     * @tc.name       : testMuslStdlibStrtof001
     * @tc.desc       : test strtof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtof001', 0, async (done: Function) => {
      let a = '123.456';
      let strtofResult: number = stdlib.strtof(a);
      console.info("Test strtofResult= " + strtofResult);
      expect(Number(strtofResult).toFixed(3)).assertEqual("123.456");

      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOF_0200
     * @tc.name       : testMuslStdlibStrtof002
     * @tc.desc       : test strtof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtof002', 0, async (done: Function) => {
      let a = '-123';
      let strtofResult: number = stdlib.strtof(a);
      console.info("Test strtofResult= " + strtofResult);
      expect(strtofResult).assertEqual(-123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOL_0100
     * @tc.name       : testMuslStdlibStrtol001
     * @tc.desc       : test strtol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtol001', 0, async (done: Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtolResult: number = stdlib.strtol(a, b);
      console.info("Test strtolResult= " + strtolResult);
      expect(strtolResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOL_0200
     * @tc.name       : testMuslStdlibStrtol002
     * @tc.desc       : test strtol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtol002', 0, async (done: Function) => {
      let a = '123';
      let b = 10;
      let strtolResult: number = stdlib.strtol(a, b);
      console.info("Test strtolResult= " + strtolResult);
      expect(strtolResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLD_0100
     * @tc.name       : testMuslStdlibStrtold001
     * @tc.desc       : test strtold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtold001', 0, async (done: Function) => {
      let a = '12345.6789';
      let strtoldResult: number = stdlib.strtold(a);
      console.info("Test strtoldResult= " + strtoldResult);
      expect(strtoldResult).assertEqual(12345.678900);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLD_0200
     * @tc.name       : testMuslStdlibStrtold002
     * @tc.desc       : test strtold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtold002', 0, async (done: Function) => {
      let a = '-232.23e4';
      let strtoldResult: number = stdlib.strtold(a);
      console.info("Test strtoldResult= " + strtoldResult);
      expect(strtoldResult).assertEqual(-2322300.000000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLL_0100
     * @tc.name       : testMuslStdlibStrtoll001
     * @tc.desc       : test strtoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoll001', 0, async (done: Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtollResult: number = stdlib.strtoll(a, b);
      console.info("Test strtollResult= " + strtollResult);
      expect(strtollResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLL_0200
     * @tc.name       : testMuslStdlibStrtoll002
     * @tc.desc       : test strtoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoll002', 0, async (done: Function) => {
      let a = '123';
      let b = 10;
      let strtollResult: number = stdlib.strtoll(a, b);
      console.info("Test strtollResult= " + strtollResult);
      expect(strtollResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOUL_0100
     * @tc.name       : testMuslStdlibStrtoul001
     * @tc.desc       : test strtoul
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoul001', 0, async (done: Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtoulResult: number = stdlib.strtoul(a, b);
      console.info("Test strtoulResult= " + strtoulResult);
      expect(strtoulResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOUL_0200
     * @tc.name       : testMuslStdlibStrtoul002
     * @tc.desc       : test strtoul
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoul002', 0, async (done: Function) => {
      let a = '123';
      let b = 10;
      let strtoulResult: number = stdlib.strtoul(a, b);
      console.info("Test strtoulResult= " + strtoulResult);
      expect(strtoulResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOULL_0100
     * @tc.name       : testMuslStdlibStrtoull001
     * @tc.desc       : test strtoull
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoull001', 0, async (done: Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtoullResult: number = stdlib.strtoull(a, b);
      console.info("Test strtoullResult= " + strtoullResult);
      expect(strtoullResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOULL_0200
     * @tc.name       : testMuslStdlibStrtoull002
     * @tc.desc       : test strtoull
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoull002', 0, async (done: Function) => {
      let a = '123';
      let b = 10;
      let strtoullResult: number = stdlib.strtoull(a, b);
      console.info("Test strtoullResult= " + strtoullResult);
      expect(strtoullResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SETENV_0100
     * @tc.name       : testMuslStdlibSetenv001
     * @tc.desc       : test setenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSetenv001', 0, async (done: Function) => {
      let b = "TEST"
      let c = "2"
      let d = 0
      let a: number = stdlib.setenv(b, c, d);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SETENV_0200
     * @tc.name       : testMuslStdlibSetenv002
     * @tc.desc       : test setenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSetenv002', 0, async (done: Function) => {
      let b = ""
      let c = "2"
      let d = 0
      let a: number = stdlib.setenv(b, c, d);
      expect(a).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SYSTEM_0100
     * @tc.name       : testMuslStdlibSystem001
     * @tc.desc       : test system
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibSystem001', 0, async (done: Function) => {
      let a: number = stdlib.system();
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_UNSETENV_0100
     * @tc.name       : testMuslStdlibUnsetenv001
     * @tc.desc       : test unsetenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibUnsetenv001', 0, async (done: Function) => {
      let b = "";
      let a: number = stdlib.unsetenv(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_POSIX_MEM_ALIGN_0100
     * @tc.name       : testMuslStdlibPosixMemAlign001
     * @tc.desc       : test posixMemAlign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibPosixMemAlign001', 0, async (done: Function) => {
      let a: number = stdlib.posixMemAlign();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ERAND48_0100
     * @tc.name       : testMuslStdlibERand48001
     * @tc.desc       : test erand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibERand48001', 0, async (done: Function) => {
      let a = 1;
      let b = 2;
      let c = 3;
      let result: boolean = false;
      let data: number = stdlib.erand48(a, b, c);
      if (data >= 0 && data < 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_DRAND48_0100
     * @tc.name       : testMuslStdlibDRand48001
     * @tc.desc       : test drand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibDRand48001', 0, async (done: Function) => {
      let result: boolean = false;
      let data: number = stdlib.drand48();
      if (data >= 0 && data < 1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_DIV_0100
     * @tc.name       : testMuslStdlibDiv001
     * @tc.desc       : test div
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibDiv001', 0, async (done: Function) => {
      let firstNum = -5;
      let secondNum = 3;
      let data: string = stdlib.div(firstNum, secondNum);
      expect(data).assertEqual("(-1,-2)");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ABS_0100
     * @tc.name       : testMuslStdlibAbs001
     * @tc.desc       : test abs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAbs001', 0, async (done: Function) => {
      let firstNum = -1;
      let data: number = stdlib.abs(firstNum);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0100
     * @tc.name       : testMuslStdlibAtof001
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof001', 0, async (done: Function) => {
      let param = " Atof";
      let resultTrue = 0;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0200
     * @tc.name       : testMuslStdlibAtof002
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof002', 0, async (done: Function) => {
      let param = "122";
      let resultTrue = 122;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0300
     * @tc.name       : testMuslStdlibAtof003
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof003', 0, async (done: Function) => {
      let param = "atof";
      let resultTrue = 0;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0400
     * @tc.name       : testMuslStdlibAtof004
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof004', 0, async (done: Function) => {
      let param = "";
      let resultTrue = 0;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0500
     * @tc.name       : testMuslStdlibAtof005
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof005', 0, async (done: Function) => {
      let param = "122 5s";
      let resultTrue = 122;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0600
     * @tc.name       : testMuslStdlibAtof006
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof006', 0, async (done: Function) => {
      let param = "a";
      let resultTrue = 0;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0700
     * @tc.name       : testMuslStdlibAtof007
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof007', 0, async (done: Function) => {
      let param = "a122";
      let resultTrue = 0;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0800
     * @tc.name       : testMuslStdlibAtof008
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof008', 0, async (done: Function) => {
      let param = "122s5";
      let resultTrue = 122;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOF_0900
     * @tc.name       : testMuslStdlibAtof009
     * @tc.desc       : test atof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtof009', 0, async (done: Function) => {
      let param = "-122";
      let resultTrue = -122;
      let result: number = stdlib.atof(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0100
     * @tc.name       : testMuslStdlibAtoi001
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi001', 0, async (done: Function) => {
      let param = " Atoi";
      let resultTrue = 0;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0200
     * @tc.name       : testMuslStdlibAtoi002
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi002', 0, async (done: Function) => {
      let param = "122";
      let resultTrue = 122;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0300
     * @tc.name       : testMuslStdlibAtoi003
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi003', 0, async (done: Function) => {
      let param = "atoi";
      let resultTrue = 0;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0400
     * @tc.name       : testMuslStdlibAtoi004
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi004', 0, async (done: Function) => {
      let param = "";
      let resultTrue = 0;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0500
     * @tc.name       : testMuslStdlibAtoi005
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi005', 0, async (done: Function) => {
      let param = "122 5s";
      let resultTrue = 122;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0600
     * @tc.name       : testMuslStdlibAtoi006
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi006', 0, async (done: Function) => {
      let param = "a";
      let resultTrue = 0;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0700
     * @tc.name       : testMuslStdlibAtoi007
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi007', 0, async (done: Function) => {
      let param = "a122";
      let resultTrue = 0;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0800
     * @tc.name       : testMuslStdlibAtoi008
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi008', 0, async (done: Function) => {
      let param = "122s5";
      let resultTrue = 122;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOI_0900
     * @tc.name       : testMuslStdlibAtoi009
     * @tc.desc       : test atoi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoi009', 0, async (done: Function) => {
      let param = "-122";
      let resultTrue = -122;
      let result: number = stdlib.atoi(param);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0100
     * @tc.name       : testMuslStdlibAtol001
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol001', 0, async (done: Function) => {
      let param = " Atol";
      let resultTrue = 0;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0200
     * @tc.name       : testMuslStdlibAtol002
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol002', 0, async (done: Function) => {
      let param = "122";
      let resultTrue = 122;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0300
     * @tc.name       : testMuslStdlibAtol003
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol003', 0, async (done: Function) => {
      let param = "atol";
      let resultTrue = 0;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0400
     * @tc.name       : testMuslStdlibAtol004
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol004', 0, async (done: Function) => {
      let param = "";
      let resultTrue = 0;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0500
     * @tc.name       : testMuslStdlibAtol005
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol005', 0, async (done: Function) => {
      let param = "122 5s";
      let resultTrue = 122;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0600
     * @tc.name       : testMuslStdlibAtol006
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol006', 0, async (done: Function) => {
      let param = "a";
      let resultTrue = 0;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0700
     * @tc.name       : testMuslStdlibAtol007
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol007', 0, async (done: Function) => {
      let param = "a122";
      let resultTrue = 0;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0800
     * @tc.name       : testMuslStdlibAtol008
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol008', 0, async (done: Function) => {
      let param = "122s5";
      let resultTrue = 122;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOL_0900
     * @tc.name       : testMuslStdlibAtol009
     * @tc.desc       : test atol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtol009', 0, async (done: Function) => {
      let param = "-122";
      let resultTrue = -122;
      let result: number = stdlib.atol(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0100
     * @tc.name       : testMuslStdlibAtoll001
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll001', 0, async (done: Function) => {
      let param = " Atoll";
      let resultTrue = 0;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0200
     * @tc.name       : testMuslStdlibAtoll002
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll002', 0, async (done: Function) => {
      let param = "122";
      let resultTrue = 122;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0300
     * @tc.name       : testMuslStdlibAtoll003
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll003', 0, async (done: Function) => {
      let param = "atoll";
      let resultTrue = 0;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0400
     * @tc.name       : testMuslStdlibAtoll004
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll004', 0, async (done: Function) => {
      let param = "";
      let resultTrue = 0;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0500
     * @tc.name       : testMuslStdlibAtoll005
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll005', 0, async (done: Function) => {
      let param = "122 5s";
      let resultTrue = 122;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0600
     * @tc.name       : testMuslStdlibAtoll006
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll006', 0, async (done: Function) => {
      let param = "a";
      let resultTrue = 0;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0700
     * @tc.name       : testMuslStdlibAtoll007
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll007', 0, async (done: Function) => {
      let param = "a122";
      let resultTrue = 0;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0800
     * @tc.name       : testMuslStdlibAtoll008
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll008', 0, async (done: Function) => {
      let param = "122s5";
      let resultTrue = 122;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATOLL_0900
     * @tc.name       : testMuslStdlibAtoll009
     * @tc.desc       : test atoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibAtoll009', 0, async (done: Function) => {
      let param = "-122";
      let resultTrue = -122;
      let result: number = stdlib.atoll(param);
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ALIGNED_ALLOC_0100
     * @tc.name       : testMuslStdlibAlignedAlloc001
     * @tc.desc       : test aligned_alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslStdlibAlignedAlloc001', 0, async (done: Function) => {
      let param = 3;
      let resultValue = 1;
      let result: number = stdlib.alignedAlloc(param);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATQUICKEXIT_0100
     * @tc.name       : testMuslStdlibAtQuickExit001
     * @tc.desc       : test at_quick_exit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibAtQuickExit001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = stdlib.atQuickExit();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_CALLOC_0100
     * @tc.name       : testMuslStdlibCalloc001
     * @tc.desc       : test calloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibCalloc001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = stdlib.calloc();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_GETENV_0100
     * @tc.name       : testMuslStdlibGetenv001
     * @tc.desc       : test getenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibGetenv001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = stdlib.getenv();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_FREE_0100
     * @tc.name       : testMuslStdlibFree001
     * @tc.desc       : test free
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibFree001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = stdlib.free();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_BSEARCH_0100
     * @tc.name       : testMuslStdlibBsearch001
     * @tc.desc       : test bsearch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibBsearch001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = stdlib.bsearch();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_CLEARENV_0100
     * @tc.name       : testMuslStdlibClearenv001
     * @tc.desc       : test clearenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslStdlibClearenv001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = stdlib.clearenv();
      expect(result).assertEqual(resultValue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_MKDTEMP_0100
     * @tc.name       : testMuslStdlibMkDTemp001
     * @tc.desc       : test mkdtemp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibMkDTemp001', 0, async (done: Function) => {
      let a: number = stdlib.mkDTemp();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_MBLEN_0100
     * @tc.name       : testMuslStdlibMblen001
     * @tc.desc       : test mblen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibMblen001', 0, async (done: Function) => {
      let a: number = stdlib.mblen();
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_INITSTATE_0100
     * @tc.name       : testMuslStdlibInitState001
     * @tc.desc       : test initstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibInitState001', 0, async (done: Function) => {
      let a: number = stdlib.initState();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_LRAND48_0100
     * @tc.name       : testMuslStdlibLrand48001
     * @tc.desc       : test lrand48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibLrand48001', 0, async (done: Function) => {
      let oldData: number = stdlib.lrand48();
      let newData: number = stdlib.lrand48();
      let result = oldData != newData
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_QSORT_0100
     * @tc.name       : testMuslStdlibQsort001
     * @tc.desc       : test qsort
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibQsort001', 0, async (done: Function) => {
      let data: number = stdlib.qsort(1);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_PTSNAME_0100
     * @tc.name       : testMuslStdlibPtsName001
     * @tc.desc       : test ptsname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibPtsName001', 0, async (done: Function) => {
      let a: number = stdlib.ptsName();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_REALPATH_0100
     * @tc.name       : testMuslStdlibRealPath001
     * @tc.desc       : test realPath
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRealPath001', 0, async (done: Function) => {
      let result: number = stdlib.realPath();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_ATEXIT_0100
     * @tc.name       : testMuslStdlibAtexit001
     * @tc.desc       : test atexit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibAtexit001', 0, async (done: Function) => {
      let result: number = stdlib.atexit();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_UNSETENV_0200
     * @tc.name       : testMuslStdlibUnsetenv002
     * @tc.desc       : test unsetenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdlibUnsetenv002', 0, async (done: Function) => {
      let b = "test";
      let a: number = stdlib.unsetenv(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SETSTATE_0100
     * @tc.name       : testMuslStdlibSetState001
     * @tc.desc       : test setstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSetState001', 0, async (done: Function) => {
      let data: number = stdlib.setState();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOFL_0100
     * @tc.name       : testMuslStdlibStrToFL001
     * @tc.desc       : test strtof_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrToFL001', 0, async (done: Function) => {
      let data: number = stdlib.strToFL();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTODL_0100
     * @tc.name       : testMuslStdlibStrToDL001
     * @tc.desc       : test strtod_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrToDL001', 0, async (done: Function) => {
      let data: number = stdlib.strToDL();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLDL_0100
     * @tc.name       : testMuslStdlibStrToLdL001
     * @tc.desc       : test strtold_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrToLdL001', 0, async (done: Function) => {
      let data: number = stdlib.strToLdL();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_VALLOC_0100
     * @tc.name       : testMuslStdlibValloc001
     * @tc.desc       : test valloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibValloc001', 0, async (done: Function) => {
      let data: number = stdlib.valloc();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_REALLOC_0100
     * @tc.name       : testMuslStdlibRealloc001
     * @tc.desc       : test valloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRealloc001', 0, async (done: Function) => {
      let data: number = stdlib.realloc();
      expect(data).assertEqual(0);
      done();
    });
  })
}