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
import { ON, MatchPattern } from '@ohos.UiTest'

const TestTag = 'testTag';
const ErrorCode = 401;
const NewErrorCode = 17000007;

export default function uitestEnumTest() {
  describe('UitestOn401ErrorCode', () => {

    /**
     * @tc.name   testApi9_ON_text_401
     * @tc.number UiTest_uitest401_029
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_text_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_text_401 start`);
      try {
        ON.text(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_text_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.text(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_text_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_text_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_id_401
     * @tc.number UiTest_uitest401_030
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_id_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_id_401 start`);
      try {
        ON.id(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_id_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.id(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_id_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_id_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_type_401
     * @tc.number UiTest_uitest401_031
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_type_401 start`);
      try {
        ON.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_type_401 type = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.id(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_type_401 type = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_type_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_isBefore_401
     * @tc.number UiTest_uitest401_032
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_isBefore_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_isBefore_401 start`);
      try {
        ON.isBefore(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isBefore_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.isBefore(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isBefore_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_isBefore_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_isAfter_401
     * @tc.number UiTest_uitest401_033
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_isAfter_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_isAfter_401 start`);
      try {
        ON.isAfter(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isAfter_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.isAfter(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isAfter_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_isAfter_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_within_401
     * @tc.number UiTest_uitest401_034
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_within_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_within_401 start`);
      try {
        ON.within(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_within_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.within(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_within_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_within_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_inWindow_401
     * @tc.number UiTest_uitest401_035
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_inWindow_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_inWindow_401 start`);
      try {
        ON.inWindow(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_inWindow_401 bundleName = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.inWindow(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_inWindow_401 bundleName = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_inWindow_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_description_401
     * @tc.number UiTest_uitest401_036
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_description_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_description_401 start`);
      try {
        ON.description(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = null,pat = default error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.description(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = undefined,pat = default error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.description(null, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.description(undefined, MatchPattern.CONTAINS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.description('next page', null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 pattern = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        ON.description('next page', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 pattern = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi9_ON_description_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_id_401
     * @tc.number UiTest_uitest401_037
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_id_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_id_401 start`);
      try {
        ON.id(null, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_id_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.id(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_id_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.id('key', null);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_id_401 parrern = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        ON.id('key', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_id_401 parrern = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_ON_id_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_type_401
     * @tc.number UiTest_uitest401_038
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_type_401 start`);
      try {
        ON.type(null, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 type = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.type(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 type = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.type('Button', null);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 pattern = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        ON.type('Button', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 pattern = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_ON_type_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_hint_401
     * @tc.number UiTest_uitest401_039
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_hint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_hint_401 start`);
      try {
        ON.hint(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 hint = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.hint(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 hint = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.hint('toast', null);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 pattern = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        ON.hint('toast', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 pattern = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_ON_hint_401 END`);
    })

    /**
     * @tc.name   testApi20_ON_originalText_17000007
     * @tc.number UiTest_uitest401_040
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_ON_originalText_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_ON_originalText_17000007 start`);
      try {
        ON.originalText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_17000007 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        ON.originalText(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_17000007 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        ON.originalText('toast', null);
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_17000007 pattern = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        ON.originalText('toast', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_17000007 pattern = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_ON_originalText_17000007 END`);
    })
  })
}