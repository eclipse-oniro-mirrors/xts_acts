/**
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

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BY } from '@ohos.UiTest'

const TestTag = 'testTag';
const OldErrorCode = 5;

export default function uitestEnumTest() {
  describe('UitestBy401ErrorCodeTest', () => {

    /**
     * @tc.name   testApi8_BY_text_5
     * @tc.number UiTest_uitest401_010
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_text_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_text_5 start`);
      try {
        BY.text(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_text_5 txt = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.text(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_text_5 txt = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_text_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_key_5
     * @tc.number UiTest_uitest401_011
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_key_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_key_5 start`);
      try {
        BY.key(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_key_5 key = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.key(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_key_5 key = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_text_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_id_5
     * @tc.number UiTest_uitest401_012
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_id_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_id_5 start`);
      try {
        BY.id(null);
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_id_5 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        BY.id(undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_id_5 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        BY.id(-1);
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_id_5 id = -1 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi8_BY_id_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_type_5
     * @tc.number UiTest_uitest401_013
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_type_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_type_5 start`);
      try {
        BY.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_type_5 tp = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.type(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_type_5 tp = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_type_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_isBefore_5
     * @tc.number UiTest_uitest401_014
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_isBefore_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_isBefore_5 start`);
      try {
        BY.isBefore(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isBefore_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.isBefore(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isBefore_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_isBefore_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_isAfter_5
     * @tc.number UiTest_uitest401_015
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_isAfter_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_isAfter_5 start`);
      try {
        BY.isAfter(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isAfter_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.isAfter(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isAfter_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_isAfter_5 END`);
    })

  })
}