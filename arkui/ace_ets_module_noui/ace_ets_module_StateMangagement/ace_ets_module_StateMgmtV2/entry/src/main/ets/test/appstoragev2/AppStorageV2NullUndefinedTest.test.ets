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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { AppStorageV2 } from '@kit.ArkUI';

@ObservedV2
class SampleClass {
  @Trace id: number = 0;
}

export default function AppStorageV2NullUndefinedTest() {
  describe('AppStorageV2NullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[AppStorageV2NullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[AppStorageV2NullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[AppStorageV2NullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[AppStorageV2NullUndefinedTest] afterAll called');
    });

    /**
     * @tc.name   AppStorageV2_connect_keyOrDefaultCreator_null_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_CONNECT_PARAM_NULL_001
     * @tc.desc   Test AppStorageV2.connect with null keyOrDefaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_connect_keyOrDefaultCreator_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_null_001] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass,
          () => new SampleClass()
        );
        const result: SampleClass | undefined = AppStorageV2.connect<SampleClass>(
          SampleClass,
          null
        );
        console.info('[AppStorageV2_connect_keyOrDefaultCreator_null_001] result: ' + JSON.stringify(result));
        expect(result?.id).assertEqual(0);
        AppStorageV2.remove(SampleClass)
        console.info('[AppStorageV2_connect_keyOrDefaultCreator_null_001] END');
      } catch (err) {
        console.error('[AppStorageV2_connect_keyOrDefaultCreator_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorageV2_connect_keyOrDefaultCreator_undefined_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_CONNECT_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorageV2.connect with undefined keyOrDefaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_connect_keyOrDefaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass,
          () => new SampleClass()
        );
        const result: SampleClass | undefined = AppStorageV2.connect<SampleClass>(
          SampleClass,
          undefined
        );
        console.info('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] result: ' + JSON.stringify(result));
        expect(result?.id).assertEqual(0);
        AppStorageV2.remove(SampleClass)
        console.info('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] END');
      } catch (err) {
        console.error('[AppStorageV2_connect_keyOrDefaultCreator_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorageV2_connect_defaultCreator_null_003
     * @tc.number SUB_ARKUI_APPSTORAGEV2_CONNECT_PARAM_NULL_003
     * @tc.desc   Test AppStorageV2.connect with null defaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_connect_defaultCreator_null_003', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_defaultCreator_null_003] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass,
          'test_key_null_default_creator',
          () => new SampleClass()
        );
        const result: SampleClass | undefined = AppStorageV2.connect<SampleClass>(
          SampleClass,
          'test_key_null_default_creator',
          null
        );
        console.info('[AppStorageV2_connect_defaultCreator_null_003] result: ' + JSON.stringify(result));
        expect(result?.id).assertEqual(0);
        AppStorageV2.remove('test_key_undefined_default_creator')
        console.info('[AppStorageV2_connect_defaultCreator_null_003] END');
      } catch (err) {
        console.error('[AppStorageV2_connect_defaultCreator_null_003] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorageV2_connect_defaultCreator_undefined_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_CONNECT_PARAM_UNDEFINED_002
     * @tc.desc   Test AppStorageV2.connect with undefined defaultCreator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_connect_defaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_defaultCreator_undefined_001] START');
      try {
        AppStorageV2.connect<SampleClass>(
          SampleClass,
          'test_key_undefined_default_creator',
          () => new SampleClass()
        );
        const result: SampleClass | undefined = AppStorageV2.connect<SampleClass>(
          SampleClass,
          'test_key_undefined_default_creator',
          undefined
        );
        console.info('[AppStorageV2_connect_defaultCreator_undefined_001] result: ' + JSON.stringify(result));
        expect(result?.id).assertEqual(0);
        AppStorageV2.remove('test_key_undefined_default_creator')
        console.info('[AppStorageV2_connect_defaultCreator_undefined_001] END');
      } catch (err) {
        console.error('[AppStorageV2_connect_defaultCreator_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorageV2_remove_keyOrType_null_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_REMOVE_PARAM_NULL_001
     * @tc.desc   Test AppStorageV2.remove with null keyOrType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_remove_keyOrType_null_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_remove_keyOrType_null_001] START');
      try {
        AppStorageV2.remove(null);
        console.info('[AppStorageV2_remove_keyOrType_null_001] remove called with null');
        console.info('[AppStorageV2_remove_keyOrType_null_001] END');
      } catch (err) {
        console.error('[AppStorageV2_remove_keyOrType_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorageV2_remove_keyOrType_undefined_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_REMOVE_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorageV2.remove with undefined keyOrType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_remove_keyOrType_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_remove_keyOrType_undefined_001] START');
      try {
        AppStorageV2.remove(undefined);
        console.info('[AppStorageV2_remove_keyOrType_undefined_001] remove called with undefined');
        console.info('[AppStorageV2_remove_keyOrType_undefined_001] END');
      } catch (err) {
        console.error('[AppStorageV2_remove_keyOrType_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

        /**
     * @tc.name   AppStorageV2_connect_null_002
     * @tc.number SUB_ARKUI_APPSTORAGEV2_CONNECT_PARAM_NULL_002
     * @tc.desc   Test AppStorageV2.connect with null type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_connect_null_002', Level.LEVEL2, () => {
      console.info('[AppStorageV2_connect_null_002] START');
      try {
        const result: object | undefined = AppStorageV2.connect<object>(
          null
        );
        console.info('[AppStorageV2_connect_null_002] result: ' + JSON.stringify(result));
        // connect with null type should return undefined or throw error
        expect().assertFail();
        console.info('[AppStorageV2_connect_null_002] END');
      } catch (err) {
        console.error('[AppStorageV2_connect_null_002] Error: ' + JSON.stringify(err));

      }
    });



    /**
     * @tc.name   AppStorageV2_remove_emptyString_001
     * @tc.number SUB_ARKUI_APPSTORAGEV2_REMOVE_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorageV2.remove with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorageV2_remove_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorageV2_remove_emptyString_001] START');
      try {
        // Test remove with empty string key
        AppStorageV2.remove('');
        console.info('[AppStorageV2_remove_emptyString_001] remove called with empty string');
        // remove with empty string should not crash, may show warning
        console.info('[AppStorageV2_remove_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorageV2_remove_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or show warning
        expect().assertFail();
      }
    });


  });
}
