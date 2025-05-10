/*
 * Copyright (result) 2023 Huawei Device Co., Ltd.
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
import search from 'libsearchndk.so'

export default function SearchNdkTest() {
  describe('MuslSearchTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEARCH_TDESTROY_0100
     * @tc.name       : testMuslSearchTdestroy001
     * @tc.desc       : test tdestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSearchTdestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.tdestroy();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEARCH_TDELETE_0100
     * @tc.name       : testMuslSearchTdelete001
     * @tc.desc       : test tdelete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSearchTdelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.tdelete();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEARCH_TFIND_0100
     * @tc.name       : testMuslSearchTfind001
     * @tc.desc       : test tfind
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSearchTfind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.tfind();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HCREATE_0100
     * @tc.name     : testMuslSearchHcreate001
     * @tc.desc     : test hcreate
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHcreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hcreate();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HCREATE_R_0100
     * @tc.name     : testMuslSearchHcreateR001
     * @tc.desc     : test hcreate_r
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHcreateR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hcreateR();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HDESTROY_0100
     * @tc.name     : testMuslSearchHdestroy001
     * @tc.desc     : test hdestroy
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHdestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hdestroy();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HDESTROY_R_0100
     * @tc.name     : testMuslSearchHdestroyR001
     * @tc.desc     : test hdestroy_r
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHdestroyR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hdestroyR();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HEARCH_0100
     * @tc.name     : testMuslSearchHsearch001
     * @tc.desc     : test hsearch
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHsearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hsearch();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_HEARCH_R_0100
     * @tc.name     : testMuslSearchHsearchR001
     * @tc.desc     : test hsearch_r
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchHsearchR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.hsearchR();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_INSQUE_0100
     * @tc.name     : testMuslSearchInsque001
     * @tc.desc     : test insque
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchInsque001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.insque();
      expect(result).assertEqual(0)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_LSEARCH_0100
     * @tc.name     : testMuslSearchSearch001
     * @tc.desc     : test lsearch
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : level 1
     */
    it('testMuslSearchSearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number= search.lSearch();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SAERCH_REMQUE_0100
     * @tc.name     : testMuslSearchRemque001
     * @tc.desc     : test remque
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchRemque001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.remque();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_LFIND_0100
     * @tc.name     : testMuslSearchLfind001
     * @tc.desc     : test lfind
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchLfind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.lfind(25,14,29,14);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_LFIND_0200
     * @tc.name     : testMuslSearchLfind002
     * @tc.desc     : test lfind
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslSearchLfind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.lfind(25,14,29,1);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_TSEARCH_0100
     * @tc.name     : testMuslSearchTsearch001
     * @tc.desc     : test tsearch
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchTsearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.tsearch();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SEARCH_TWALK_0100
     * @tc.name     : testMuslSearchTwalk001
     * @tc.desc     : test twalk
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSearchTwalk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = search.twalk();
      expect(result).assertEqual(0)
      done()
    });
  })
}