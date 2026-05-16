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

'use static';

import { describe, it, expect, Level } from '../../../../hypium/index';
import { EditModeOptions, OnGetPreviewBadgeCallback } from '@ohos.arkui.component';

export default function EditModeOptionsOnGetPreviewBadgeTest() {
  describe('EditModeOptionsOnGetPreviewBadgeTest', () => {
    /**
     * @tc.number EditModeOptionsOnGetPreviewBadgeTest_001
     * @tc.name editModeOptionsOnGetPreviewBadgeReturnBoolean
     * @tc.desc Test EditModeOptions.onGetPreviewBadge callback returning boolean value
     *          common.d.ets EditModeOptions.onGetPreviewBadge?: OnGetPreviewBadgeCallback;
     *          Verify that onGetPreviewBadge callback can return boolean (true/false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsOnGetPreviewBadgeReturnBoolean', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeReturnBoolean begin');
      
      // Test callback returning true
      let callbackTrue: OnGetPreviewBadgeCallback = (): boolean | int => {
        return true;
      };
      
      let optionsTrue: EditModeOptions = {
        onGetPreviewBadge: callbackTrue
      };
      
      expect(optionsTrue.onGetPreviewBadge != undefined).assertEqual(true);
      expect(typeof optionsTrue.onGetPreviewBadge).assertEqual('function');
      
      let resultTrue = callbackTrue();
      console.info('onGetPreviewBadge callback result (true): ' + resultTrue);
      console.info('onGetPreviewBadge true result type: ' + typeof resultTrue);
      expect(resultTrue).assertEqual(true);
      console.info('onGetPreviewBadge true value verification passed');
      
      // Test callback returning false
      let callbackFalse: OnGetPreviewBadgeCallback = (): boolean | int => {
        return false;
      };
      
      let optionsFalse: EditModeOptions = {
        onGetPreviewBadge: callbackFalse
      };
      
      let resultFalse = callbackFalse();
      console.info('onGetPreviewBadge callback result (false): ' + resultFalse);
      console.info('onGetPreviewBadge false result type: ' + typeof resultFalse);
      expect(resultFalse).assertEqual(false);
      console.info('onGetPreviewBadge false value verification passed');
      
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeReturnBoolean end');
      done();
    });

    /**
     * @tc.number EditModeOptionsOnGetPreviewBadgeTest_002
     * @tc.name editModeOptionsOnGetPreviewBadgeReturnInt
     * @tc.desc Test EditModeOptions.onGetPreviewBadge callback returning int value
     *          common.d.ets EditModeOptions.onGetPreviewBadge?: OnGetPreviewBadgeCallback;
     *          Verify that onGetPreviewBadge callback can return int values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsOnGetPreviewBadgeReturnInt', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeReturnInt begin');
      
      // Test callback returning positive int
      let callbackPositive: OnGetPreviewBadgeCallback = (): boolean | int => {
        return 5 as int;
      };
      
      let optionsPositive: EditModeOptions = {
        onGetPreviewBadge: callbackPositive
      };
      
      let resultPositive = callbackPositive();
      console.info('onGetPreviewBadge callback result (int 5): ' + resultPositive);
      console.info('onGetPreviewBadge result type: ' + typeof resultPositive);
      expect(resultPositive).assertEqual(5);
      // 在ArkTS中，int类型的typeof可能不是'number'，所以只验证值不验证类型
      console.info('onGetPreviewBadge int value verification passed');
      
      // Test callback returning zero
      let callbackZero: OnGetPreviewBadgeCallback = (): boolean | int => {
        return 0 as int;
      };
      
      let resultZero = callbackZero();
      console.info('onGetPreviewBadge callback result (int 0): ' + resultZero);
      console.info('onGetPreviewBadge zero type: ' + typeof resultZero);
      expect(resultZero).assertEqual(0);
      console.info('onGetPreviewBadge zero value verification passed');
      
      // Test callback returning negative int
      let callbackNegative: OnGetPreviewBadgeCallback = (): boolean | int => {
        return -1 as int;
      };
      
      let resultNegative = callbackNegative();
      console.info('onGetPreviewBadge callback result (int -1): ' + resultNegative);
      console.info('onGetPreviewBadge negative type: ' + typeof resultNegative);
      expect(resultNegative).assertEqual(-1);
      console.info('onGetPreviewBadge negative value verification passed');
      
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeReturnInt end');
      done();
    });

    /**
     * @tc.number EditModeOptionsOnGetPreviewBadgeTest_003
     * @tc.name editModeOptionsOnGetPreviewBadgeUndefined
     * @tc.desc Test EditModeOptions.onGetPreviewBadge property with undefined value
     *          common.d.ets EditModeOptions.onGetPreviewBadge?: OnGetPreviewBadgeCallback;
     *          Verify that onGetPreviewBadge can be undefined (optional property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsOnGetPreviewBadgeUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeUndefined begin');
      
      let options: EditModeOptions = {};
      
      console.info('EditModeOptions onGetPreviewBadge=unset: ' + options.onGetPreviewBadge);
      expect(options.onGetPreviewBadge == undefined).assertEqual(true);
      expect(typeof options.onGetPreviewBadge).assertEqual('undefined');
      
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeUndefined end');
      done();
    });

    /**
     * @tc.number EditModeOptionsOnGetPreviewBadgeTest_004
     * @tc.name editModeOptionsOnGetPreviewBadgeCallbackAssignment
     * @tc.desc Test EditModeOptions.onGetPreviewBadge callback assignment and reassignment
     *          common.d.ets EditModeOptions.onGetPreviewBadge?: OnGetPreviewBadgeCallback;
     *          Verify that onGetPreviewBadge callback can be assigned and reassigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsOnGetPreviewBadgeCallbackAssignment', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeCallbackAssignment begin');
      
      let options: EditModeOptions = {};
      
      // Initially undefined
      expect(options.onGetPreviewBadge == undefined).assertEqual(true);
      
      // Assign callback returning boolean
      let boolCallback: OnGetPreviewBadgeCallback = (): boolean | int => {
        return true;
      };
      options.onGetPreviewBadge = boolCallback;
      
      expect(options.onGetPreviewBadge != undefined).assertEqual(true);
      let boolResult = options.onGetPreviewBadge!();
      expect(boolResult).assertEqual(true);
      console.info('Assigned boolean callback result: ' + boolResult);
      
      // Reassign callback returning int
      let intCallback: OnGetPreviewBadgeCallback = (): boolean | int => {
        return 10 as int;
      };
      options.onGetPreviewBadge = intCallback;
      
      let intResult = options.onGetPreviewBadge!();
      expect(intResult).assertEqual(10);
      console.info('Reassigned int callback result: ' + intResult);
      
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeCallbackAssignment end');
      done();
    });

    /**
     * @tc.number EditModeOptionsOnGetPreviewBadgeTest_005
     * @tc.name editModeOptionsOnGetPreviewBadgeCombinedWithAnimation
     * @tc.desc Test EditModeOptions with both onGetPreviewBadge and enableGatherSelectedItemsAnimation
     *          common.d.ets EditModeOptions interface with both properties
     *          Verify that both properties can be used together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsOnGetPreviewBadgeCombinedWithAnimation', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeCombinedWithAnimation begin');
      
      let callback: OnGetPreviewBadgeCallback = (): boolean | int => {
        return 3 as int;
      };
      
      let options: EditModeOptions = {
        enableGatherSelectedItemsAnimation: true,
        onGetPreviewBadge: callback
      };
      
      // Verify both properties are set correctly
      expect(options.enableGatherSelectedItemsAnimation).assertEqual(true);
      expect(options.onGetPreviewBadge != undefined).assertEqual(true);
      
      let badgeResult = options.onGetPreviewBadge!();
      expect(badgeResult).assertEqual(3);
      
      console.info('Combined options - animation: ' + options.enableGatherSelectedItemsAnimation + ', badge result: ' + badgeResult);
      
      console.info('EditModeOptionsOnGetPreviewBadgeTest: onGetPreviewBadgeCombinedWithAnimation end');
      done();
    });
  });
}