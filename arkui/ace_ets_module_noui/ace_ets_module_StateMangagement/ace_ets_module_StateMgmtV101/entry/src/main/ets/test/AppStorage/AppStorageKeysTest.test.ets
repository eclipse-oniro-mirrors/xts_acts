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

export default function appStorageKeysTest() {
  describe('AppStorageKeysTest', () => {
    beforeAll(() => {
      console.info('[AppStorageKeysTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[AppStorageKeysTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[AppStorageKeysTest] afterEach called');
    });

    afterAll(() => {
      console.info('[AppStorageKeysTest] afterAll called');
    });

    /**
     * @tc.name   AppStorage_keys_empty_001
     * @tc.number SUB_ARUI_APPSTORAGE_KEYS_RETURN_001
     * @tc.desc   Test AppStorage.keys() returns empty iterator when AppStorage is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AppStorage_keys_empty_001', Level.LEVEL0, () => {
      console.info('[AppStorage_keys_empty_001] START');
      try {
        // Ensure AppStorage is clean
        const allKeys: IterableIterator<string> = AppStorage.keys();
        const keysArray: string[] = Array.from(allKeys);
        // Delete all existing keys to ensure clean state
        for (let i: number = 0; i < keysArray.length; i++) {
          const key: string = keysArray[i];
          AppStorage.delete(key);
        }

        // Now test keys() on empty AppStorage
        const result: IterableIterator<string> = AppStorage.keys();
        // Convert to array and verify it's empty
        const resultArray: string[] = Array.from(result);
        expect(resultArray.length).assertEqual(0);

        console.info('[AppStorage_keys_empty_001] END');
      } catch (err) {
        console.error('[AppStorage_keys_empty_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_keys_singleProp_001
     * @tc.number SUB_ARUI_APPSTORAGE_KEYS_RETURN_002
     * @tc.desc   Test AppStorage.keys() returns iterator with single property name
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AppStorage_keys_singleProp_001', Level.LEVEL0, () => {
      console.info('[AppStorage_keys_singleProp_001] START');
      try {
        const propName: string = 'testKeysSingleProp';
        const propValue: number = 123;

        // Create a property
        AppStorage.setOrCreate(propName, propValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();

        // Get keys
        const result: IterableIterator<string> = AppStorage.keys();

        // Convert to array and verify
        const resultArray: string[] = Array.from(result);
        expect(resultArray.length).assertLarger(0);

        // Verify our property exists in the keys
        const hasKey: boolean = resultArray.indexOf(propName) >= 0;
        expect(hasKey).assertTrue();

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_keys_singleProp_001] END');
      } catch (err) {
        console.error('[AppStorage_keys_singleProp_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Keys_empty_001
     * @tc.number SUB_ARUI_APPSTORAGE_KEYS_CAPITAL_RETURN_001
     * @tc.desc   Test AppStorage.Keys() returns empty iterator when AppStorage is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AppStorage_Keys_empty_001', Level.LEVEL0, () => {
      console.info('[AppStorage_Keys_empty_001] START');
      try {
        // Ensure AppStorage is clean
        const allKeys: IterableIterator<string> = AppStorage.Keys();
        const keysArray: string[] = Array.from(allKeys);
        // Delete all existing Keys to ensure clean state
        for (let i: number = 0; i < keysArray.length; i++) {
          const key: string = keysArray[i];
          AppStorage.delete(key);
        }

        // Now test Keys() on empty AppStorage
        const result: IterableIterator<string> = AppStorage.Keys();
        // Convert to array and verify it's empty
        const resultArray: string[] = Array.from(result);
        expect(resultArray.length).assertEqual(0);

        console.info('[AppStorage_Keys_empty_001] END');
      } catch (err) {
        console.error('[AppStorage_Keys_empty_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Keys_singleProp_001
     * @tc.number SUB_ARUI_APPSTORAGE_KEYS_CAPITAL_RETURN_002
     * @tc.desc   Test AppStorage.Keys() returns iterator with single property name
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('AppStorage_Keys_singleProp_001', Level.LEVEL0, () => {
      console.info('[AppStorage_Keys_singleProp_001] START');
      try {
        const propName: string = 'testKeysSingleProp';
        const propValue: number = 123;

        // Create a property
        AppStorage.setOrCreate(propName, propValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();

        // Get Keys
        const result: IterableIterator<string> = AppStorage.Keys();

        // Convert to array and verify
        const resultArray: string[] = Array.from(result);
        expect(resultArray.length).assertLarger(0);

        // Verify our property exists in the Keys
        const hasKey: boolean = resultArray.indexOf(propName) >= 0;
        expect(hasKey).assertTrue();

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_Keys_singleProp_001] END');
      } catch (err) {
        console.error('[AppStorage_Keys_singleProp_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });
  });
}
