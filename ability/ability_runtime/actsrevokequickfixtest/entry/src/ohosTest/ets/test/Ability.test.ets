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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import quickFixManager from '@ohos.app.ability.quickFixManager';
import { BusinessError } from '@ohos.base';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1300
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: The passed-in exception parameter undefined calls revokeQuickFix, 
     *           and there is an exception return value.
     */
    it('Acts_applyQuickFixRevoke_1300', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix(undefined)
          .then(() => {
            console.info("====>Acts_applyQuickFixRevoke_1300  revokeQuickFix " + " ok");
          })
          .catch((err: BusinessError) => {
            console.info("====>Acts_applyQuickFixRevoke_1300  revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
          })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1300  try revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
        expect(err.code).assertEqual(401);
      }
      done();
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1400
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: An exception parameter null is passed in to call revokeQuickFix, 
     *           and there is an exception return value.
     */
    it('Acts_applyQuickFixRevoke_1400', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix(null)
          .then(() => {
            console.info("====>Acts_applyQuickFixRevoke_1400  revokeQuickFix " + " ok");
          })
          .catch((err: BusinessError) => {
            console.info("====>Acts_applyQuickFixRevoke_1400  revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
          })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1400   try revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
        expect(err.code).assertEqual(401);
      }
      done();
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1500
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: Non-system application calls revokeQuickFix, with abnormal return value.
     */
    it('Acts_applyQuickFixRevoke_1500', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix("com.ohos.quickfixno")
          .then(() => {
            console.info("====>Acts_applyQuickFixRevoke_1500  revokeQuickFix " + " ok");
          })
          .catch((err: BusinessError) => {
            console.info("====>Acts_applyQuickFixRevoke_1500  revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
          })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1500  try revokeQuickFix " + " failed, error code is ", JSON.stringify((err)));
        expect(err.code).assertEqual(202);
      }
      done();
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1600
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: The passed-in exception parameter undefined calls revokeQuickFix, 
     * and there is an exception return value.
     */
    it('Acts_applyQuickFixRevoke_1600', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix(undefined, (err) => {
          console.info("====>Acts_applyQuickFixRevoke_1600  revokeQuickFix " + err.code);
        })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1600  try revokeQuickFix " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1700
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: An exception parameter null is passed in to call revokeQuickFix, 
     * and there is an exception return value.
     */
    it('Acts_applyQuickFixRevoke_1700', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix(null, (err) => {
          console.info("====>Acts_applyQuickFixRevoke_1700  revokeQuickFix " + err.code);
        })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1700  try revokeQuickFix " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    })

    /*
     * @tc.number: Acts_applyQuickFixRevoke_1800
     * @tc.name: Apply quick fix to support undo.
     * @tc.desc: Non-system application calls revokeQuickFix, with abnormal return value.
     */
    it('Acts_applyQuickFixRevoke_1800', Level.LEVEL0, (done: Function) => {
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        quickFixManager.revokeQuickFix("com.ohos.quickfixno", (err) => {
          console.info("====>Acts_applyQuickFixRevoke_1600  revokeQuickFix " + err.code);
        })
      } catch (err) {
        console.info("====>Acts_applyQuickFixRevoke_1600  try revokeQuickFix " + err.code);
        expect(err.code).assertEqual(202);
      }
      done();
    })
  })
}