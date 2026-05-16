/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  searchStringEqualsRegExpSymbolSearch,
  searchCustomSymbolSearchObject,
  searchBigIntCoerces,
  searchSymbolParameterThrows,
  searchFunctionCoerces,
  searchObjectWithSymbolToPrimitive,
  regexpSearchCallUndefinedThrows,
  regexpSearchCallNullThrows,
  regexpSearchRegexLikeIndex
} from './RegExpHelper';

export default function searchExtrasTest() {

    describe('SearchExtras_Tests', () => {
      /**
       * @tc.name testSearch0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0100
      * @tc.desc   Test uses RegExp[Symbol.search] semantics
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchStringEqualsRegExpSymbolSearch()).assertTrue();
      });

      /**
       * @tc.name testSearch0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0200
      * @tc.desc   Test supports custom objects via Symbol.search
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchCustomSymbolSearchObject()).assertTrue();
      });

      /**
       * @tc.name testSearch0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0300
      * @tc.desc   Test coerces BigInt to string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchBigIntCoerces()).assertTrue();
      });

      /**
       * @tc.name testSearch0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0400
      * @tc.desc   Test throws TypeError for Symbol pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchSymbolParameterThrows()).assertTrue();
      });

      /**
       * @tc.name testSearch0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0500
      * @tc.desc   Test coerces function to string pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchFunctionCoerces()).assertTrue();
      });

      /**
       * @tc.name testSearch0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0600
      * @tc.desc   Test uses @@toPrimitive when available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchObjectWithSymbolToPrimitive()).assertTrue();
      });

      /**
       * @tc.name testSearch0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0700
      * @tc.desc   Test throws when calling RegExp[Symbol.search] with undefined receiver
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchCallUndefinedThrows()).assertTrue();
      });

      /**
       * @tc.name testSearch0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0800
      * @tc.desc   Test throws when calling RegExp[Symbol.search] with null receiver
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchCallNullThrows()).assertTrue();
      });

      /**
       * @tc.name testSearch0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0900
      * @tc.desc   Test supports regex-like objects via RegExp[Symbol.search]
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchRegexLikeIndex()).assertTrue();
      });
    });

}
