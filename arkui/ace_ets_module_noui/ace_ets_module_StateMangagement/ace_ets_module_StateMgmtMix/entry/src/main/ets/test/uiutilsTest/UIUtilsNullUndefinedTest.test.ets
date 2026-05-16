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
import { UIUtils } from '@kit.ArkUI';
export default function uiUtilsNullUndefinedTest() {
  describe('UIUtilsNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info('[UIUtilsNullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[UIUtilsNullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[UIUtilsNullUndefinedTest] afterEach called');
    });

    afterAll(async () => {
      console.info('[UIUtilsNullUndefinedTest] afterAll called');
    });

    // ==================== getTarget Tests ====================

    /**
     * @tc.name   UIUtils_getTarget_null_001
     * @tc.number SUB_ARUI_UIUTILS_GETTARGET_PARAM_NULL_001
     * @tc.desc   Test UIUtils.getTarget with null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_getTarget_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getTarget_null_001] START');
      try {
        const source: object | null = null;
        const result: object = UIUtils.getTarget<object>(source);
        console.info('[UIUtils_getTarget_null_001] result: ' + JSON.stringify(result));
        // getTarget with null should return null
        expect(result === null).assertTrue();
        console.info('[UIUtils_getTarget_null_001] END');
      } catch (err) {
        console.error('[UIUtils_getTarget_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_getTarget_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_GETTARGET_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.getTarget with undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_getTarget_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getTarget_undefined_001] START');
      try {
        const source: object | undefined = undefined;
        const result: object = UIUtils.getTarget<object>(source);
        console.info('[UIUtils_getTarget_undefined_001] result: ' + JSON.stringify(result));
        // getTarget with undefined should return undefined
        expect(result === undefined).assertTrue();
        console.info('[UIUtils_getTarget_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_getTarget_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    // ==================== makeObserved Tests ====================

    /**
     * @tc.name   UIUtils_makeObserved_null_001
     * @tc.number SUB_ARUI_UIUTILS_MAKEOBSERVED_PARAM_NULL_001
     * @tc.desc   Test UIUtils.makeObserved with null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_makeObserved_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeObserved_null_001] START');
      try {
        const source: object | null = null;
        const result: object = UIUtils.makeObserved<object>(source);
        console.info('[UIUtils_makeObserved_null_001] result: ' + JSON.stringify(result));
        // makeObserved with null should return null or handle gracefully
        expect(result === null).assertTrue();
        console.info('[UIUtils_makeObserved_null_001] END');
      } catch (err) {
        console.error('[UIUtils_makeObserved_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_makeObserved_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_MAKEOBSERVED_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.makeObserved with undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_makeObserved_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeObserved_undefined_001] START');
      try {
        const source: object | undefined = undefined;
        const result: object = UIUtils.makeObserved<object>(source);
        console.info('[UIUtils_makeObserved_undefined_001] result: ' + JSON.stringify(result));
        // makeObserved with undefined should return undefined or handle gracefully
        expect(result === undefined).assertTrue();
        console.info('[UIUtils_makeObserved_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_makeObserved_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    // ==================== makeV1Observed Tests ====================

    /**
     * @tc.name   UIUtils_makeV1Observed_null_001
     * @tc.number SUB_ARUI_UIUTILS_MAKEV1OBSERVED_PARAM_NULL_001
     * @tc.desc   Test UIUtils.makeV1Observed with null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_makeV1Observed_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeV1Observed_null_001] START');
      try {
        const source: object | null = null;
        const result: object = UIUtils.makeV1Observed<object>(source);
        console.info('[UIUtils_makeV1Observed_null_001] result: ' + JSON.stringify(result));
        // makeV1Observed with null should return null or handle gracefully
        expect(result === null).assertTrue();
        console.info('[UIUtils_makeV1Observed_null_001] END');
      } catch (err) {
        console.error('[UIUtils_makeV1Observed_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_makeV1Observed_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_MAKEV1OBSERVED_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.makeV1Observed with undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_makeV1Observed_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_makeV1Observed_undefined_001] START');
      try {
        const source: object | undefined = undefined;
        const result: object = UIUtils.makeV1Observed<object>(source);
        console.info('[UIUtils_makeV1Observed_undefined_001] result: ' + JSON.stringify(result));
        // makeV1Observed with undefined should return undefined or handle gracefully
        expect(result === undefined).assertTrue();
        console.info('[UIUtils_makeV1Observed_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_makeV1Observed_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    // ==================== enableV2Compatibility Tests ====================

    /**
     * @tc.name   UIUtils_enableV2Compatibility_null_001
     * @tc.number SUB_ARUI_UIUTILS_ENABLEV2COMPATIBILITY_PARAM_NULL_001
     * @tc.desc   Test UIUtils.enableV2Compatibility with null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_enableV2Compatibility_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_enableV2Compatibility_null_001] START');
      try {
        const source: object | null = null;
        const result: object = UIUtils.enableV2Compatibility<object>(source);
        console.info('[UIUtils_enableV2Compatibility_null_001] result: ' + JSON.stringify(result));
        // enableV2Compatibility with null should return null or handle gracefully
        expect(result === null).assertTrue();
        console.info('[UIUtils_enableV2Compatibility_null_001] END');
      } catch (err) {
        console.error('[UIUtils_enableV2Compatibility_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_enableV2Compatibility_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_ENABLEV2COMPATIBILITY_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.enableV2Compatibility with undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_enableV2Compatibility_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_enableV2Compatibility_undefined_001] START');
      try {
        const source: object | undefined = undefined;
        const result: object = UIUtils.enableV2Compatibility<object>(source);
        console.info('[UIUtils_enableV2Compatibility_undefined_001] result: ' + JSON.stringify(result));
        // enableV2Compatibility with undefined should return undefined or handle gracefully
        expect(result === undefined).assertTrue();
        console.info('[UIUtils_enableV2Compatibility_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_enableV2Compatibility_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    // ==================== addMonitor Tests ====================

    /**
     * @tc.name   UIUtils_addMonitor_null_target_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_NULL_TARGET_001
     * @tc.desc   Test UIUtils.addMonitor with null target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_null_target_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_null_target_001] START');
      try {
        const target: object | null = null;
        const path: string = 'testPath';
        const monitorCallback: (monitorValue: object) => void = (monitorValue: object) => {
          console.info('[UIUtils_addMonitor_null_target_001] monitorCallback called');
        };

        UIUtils.addMonitor(null, path, monitorCallback, null);
        console.info('[UIUtils_addMonitor_null_target_001] addMonitor called with null target');
        // 对于不支持的类型，会抛出运行时错误
        expect().assertFail();
        console.info('[UIUtils_addMonitor_null_target_001] END');
      } catch (err) {
        console.error('[UIUtils_addMonitor_null_target_001] Error: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   UIUtils_addMonitor_undefined_target_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_UNDEFINED_TARGET_001
     * @tc.desc   Test UIUtils.addMonitor with undefined target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_undefined_target_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_undefined_target_001] START');
      try {
        const target: object | undefined = undefined;
        const path: string = '';
        const monitorCallback: (monitorValue: object) => void = (monitorValue: object) => {
          console.info('[UIUtils_addMonitor_undefined_target_001] monitorCallback called');
        };
        UIUtils.addMonitor(target, path, monitorCallback, undefined);
        console.info('[UIUtils_addMonitor_undefined_target_001] addMonitor called with undefined target');
        // 对于不支持的类型，会抛出运行时错误
        expect().assertFail();
        console.info('[UIUtils_addMonitor_undefined_target_001] END');
      } catch (err) {
        console.info('[UIUtils_addMonitor_undefined_target_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for undefined target
      }
    });

    /**
     * @tc.name   UIUtils_addMonitor_null_path_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_NULL_PATH_001
     * @tc.desc   Test UIUtils.addMonitor with null path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_null_path_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_null_path_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string | null = null;
        const monitorCallback: (monitorValue: object) => void = (monitorValue: object) => {
          console.info('[UIUtils_addMonitor_null_path_001] monitorCallback called');
        };
        UIUtils.addMonitor(target, path, monitorCallback);
        // 对于不支持的类型，会抛出运行时错误
        expect().assertFail();
        console.info('[UIUtils_addMonitor_null_path_001] END');
      } catch (err) {
        console.info('[UIUtils_addMonitor_null_path_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for null path
      }
    });

    /**
     * @tc.name   UIUtils_addMonitor_undefined_path_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_UNDEFINED_PATH_001
     * @tc.desc   Test UIUtils.addMonitor with undefined path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_undefined_path_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_undefined_path_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string | undefined = undefined;
        const monitorCallback: (monitorValue: object) => void = (monitorValue: object) => {
          console.info('[UIUtils_addMonitor_undefined_path_001] monitorCallback called');
        };
        UIUtils.addMonitor(target, path, monitorCallback);
        // 对于不支持的类型，会抛出运行时错误 
        expect().assertFail();
        console.info('[UIUtils_addMonitor_undefined_path_001] END');
      } catch (err) {
        console.info('[UIUtils_addMonitor_undefined_path_001] Error: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   UIUtils_addMonitor_null_callback_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_NULL_CALLBACK_001
     * @tc.desc   Test UIUtils.addMonitor with null callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_null_callback_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_null_callback_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string = 'testValue';
        const monitorCallback: ((monitorValue: object) => void) | null = null;
        UIUtils.addMonitor(target, path, monitorCallback);
        console.info('[UIUtils_addMonitor_null_callback_001] addMonitor called with null callback');
        // Expected: error expected for null callback per spec (error code 130002)
        expect().assertFail();
      } catch (err) {
        console.error('[UIUtils_addMonitor_null_callback_001] Error: ' + JSON.stringify(err));
        // Expected behavior: should throw error for null callback
        console.info('[UIUtils_addMonitor_null_callback_001] Expected error caught');
        console.info('[UIUtils_addMonitor_null_callback_001] END');
      }
    });

    /**
     * @tc.name   UIUtils_addMonitor_undefined_callback_001
     * @tc.number SUB_ARUI_UIUTILS_ADDMONITOR_PARAM_UNDEFINED_CALLBACK_001
     * @tc.desc   Test UIUtils.addMonitor with undefined callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_addMonitor_undefined_callback_001', Level.LEVEL2, () => {
      console.info('[UIUtils_addMonitor_undefined_callback_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string = 'testValue';
        const monitorCallback: ((monitorValue: object) => void) | undefined = undefined;
        UIUtils.addMonitor(target, path, monitorCallback);
        console.info('[UIUtils_addMonitor_undefined_callback_001] addMonitor called with undefined callback');
        // Expected: error expected for undefined callback per spec (error code 130002)
        expect().assertFail();
      } catch (err) {
        console.error('[UIUtils_addMonitor_undefined_callback_001] Error: ' + JSON.stringify(err));
        // Expected behavior: should throw error for undefined callback
        console.info('[UIUtils_addMonitor_undefined_callback_001] Expected error caught');
        console.info('[UIUtils_addMonitor_undefined_callback_001] END');
      }
    });

    // ==================== clearMonitor Tests ====================

    /**
     * @tc.name   UIUtils_clearMonitor_null_target_001
     * @tc.number SUB_ARUI_UIUTILS_CLEARMONITOR_PARAM_NULL_TARGET_001
     * @tc.desc   Test UIUtils.clearMonitor with null target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_clearMonitor_null_target_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_null_target_001] START');
      try {
        const target: object | null = null;
        const path: string = 'testPath';
        UIUtils.clearMonitor(target, path);
        console.info('[UIUtils_clearMonitor_null_target_001] clearMonitor called with null target');
        // 对于不支持的类型，会抛出运行时错误
        expect().assertFail();
        console.info('[UIUtils_clearMonitor_null_target_001] END');
      } catch (err) {
        console.error('[UIUtils_clearMonitor_null_target_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for null target
      }
    });

    /**
     * @tc.name   UIUtils_clearMonitor_undefined_target_001
     * @tc.number SUB_ARUI_UIUTILS_CLEARMONITOR_PARAM_UNDEFINED_TARGET_001
     * @tc.desc   Test UIUtils.clearMonitor with undefined target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_clearMonitor_undefined_target_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_undefined_target_001] START');
      try {
        const target: object | undefined = undefined;
        const path: string = 'testPath';
        UIUtils.clearMonitor(target, path);
        console.info('[UIUtils_clearMonitor_undefined_target_001] clearMonitor called with undefined target');
        // 对于不支持的类型，会抛出运行时错误 
        expect().assertFail();
        console.info('[UIUtils_clearMonitor_undefined_target_001] END');
      } catch (err) {
        console.error('[UIUtils_clearMonitor_undefined_target_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for undefined target
      }
    });

    /**
     * @tc.name   UIUtils_clearMonitor_null_path_001
     * @tc.number SUB_ARUI_UIUTILS_CLEARMONITOR_PARAM_NULL_PATH_001
     * @tc.desc   Test UIUtils.clearMonitor with null path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_clearMonitor_null_path_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_null_path_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string | null = null;
        UIUtils.clearMonitor(target, path);
        // 对于不支持的类型，会抛出运行时错误 
        expect().assertFail();
        console.info('[UIUtils_clearMonitor_null_path_001] END');
      } catch (err) {
        console.error('[UIUtils_clearMonitor_null_path_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for null path
      }
    });

    /**
     * @tc.name   UIUtils_clearMonitor_undefined_path_001
     * @tc.number SUB_ARUI_UIUTILS_CLEARMONITOR_PARAM_UNDEFINED_PATH_001
     * @tc.desc   Test UIUtils.clearMonitor with undefined path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_clearMonitor_undefined_path_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_undefined_path_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string | undefined = undefined;
        UIUtils.clearMonitor(target, path);
        // 对于不支持的类型，会抛出运行时错误 
        expect().assertFail();
        console.info('[UIUtils_clearMonitor_undefined_path_001] END');
      } catch (err) {
        console.error('[UIUtils_clearMonitor_undefined_path_001] Error: ' + JSON.stringify(err));
      }
    });

  /**
     * @tc.name   UIUtils_clearMonitor_empty_path_001
     * @tc.number SUB_ARUI_UIUTILS_CLEARMONITOR_PARAM_EMPTY_PATH_001
     * @tc.desc   Test UIUtils.clearMonitor with empty path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_clearMonitor_empty_path_001', Level.LEVEL2, () => {
      console.info('[UIUtils_clearMonitor_empty_path_001] START');
      try {
        class TestClass {
          public testValue: number = 100;
        }
        const target: TestClass = new TestClass();
        const path: string | undefined = '';
        UIUtils.clearMonitor(target, path);
        // 对于不支持的类型，会抛出运行时错误
        expect().assertFail();
        console.info('[UIUtils_clearMonitor_empty_path_001] END');
      } catch (err) {
        console.error('[UIUtils_clearMonitor_empty_path_001] Error: ' + JSON.stringify(err));
      }
    });


    // ==================== canBeObserved Tests ====================

    /**
     * @tc.name   UIUtils_canBeObserved_null_001
     * @tc.number SUB_ARUI_UIUTILS_CANBEOBSERVED_PARAM_NULL_001
     * @tc.desc   Test UIUtils.canBeObserved with null source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_canBeObserved_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_canBeObserved_null_001] START');
      try {
        const source: object | null = null;
        const result = UIUtils.canBeObserved(source);
        console.info('[UIUtils_canBeObserved_null_001] result: ' + JSON.stringify(result));
        // canBeObserved with null should return isObserved: false
        expect(result.isObserved).assertFalse();
        console.info('[UIUtils_canBeObserved_null_001] END');
      } catch (err) {
        console.error('[UIUtils_canBeObserved_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return isObserved: false
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_canBeObserved_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_CANBEOBSERVED_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.canBeObserved with undefined source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_canBeObserved_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_canBeObserved_undefined_001] START');
      try {
        const source: object | undefined = undefined;
        const result = UIUtils.canBeObserved(source);
        console.info('[UIUtils_canBeObserved_undefined_001] result: ' + JSON.stringify(result));
        // canBeObserved with undefined should return isObserved: false
        expect(result.isObserved).assertFalse();
        console.info('[UIUtils_canBeObserved_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_canBeObserved_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return isObserved: false
        expect().assertFail();
      }
    });

    // ==================== getLifecycle Tests ====================

    /**
     * @tc.name   UIUtils_getLifecycle_null_001
     * @tc.number SUB_ARUI_UIUTILS_GETLIFECYCLE_PARAM_NULL_001
     * @tc.desc   Test UIUtils.getLifecycle with null customComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_getLifecycle_null_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getLifecycle_null_001] START');
      try {
        const result = UIUtils.getLifecycle(null);
        console.info('[UIUtils_getLifecycle_null_001] result: ' + JSON.stringify(result));
        // getLifecycle with null should return null or undefined
        expect(result === null || result === undefined).assertTrue();
        console.info('[UIUtils_getLifecycle_null_001] END');
      } catch (err) {
        console.error('[UIUtils_getLifecycle_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null/undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   UIUtils_getLifecycle_undefined_001
     * @tc.number SUB_ARUI_UIUTILS_GETLIFECYCLE_PARAM_UNDEFINED_001
     * @tc.desc   Test UIUtils.getLifecycle with undefined customComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIUtils_getLifecycle_undefined_001', Level.LEVEL2, () => {
      console.info('[UIUtils_getLifecycle_undefined_001] START');
      try {
        const result = UIUtils.getLifecycle(undefined);
        console.info('[UIUtils_getLifecycle_undefined_001] result: ' + JSON.stringify(result));
        // getLifecycle with undefined should return null or undefined
        expect(result === null || result === undefined).assertTrue();
        console.info('[UIUtils_getLifecycle_undefined_001] END');
      } catch (err) {
        console.error('[UIUtils_getLifecycle_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return null/undefined
        expect().assertFail();
      }
    });
  });
}
