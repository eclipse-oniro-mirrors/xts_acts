/*
 * Copyright (C) 2024 HiHope Open Source Organization
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEvent';
import common from '@ohos.app.ability.common';
import { UIAbility, application} from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const PARAMETER_ERROR_CODE  = 401;

const TAG = 'CreateModuleContext';
const TEST_SUITE_NAME: string = 'CreateModuleContextTest';

export default function abilityTest() {
  describe('ACTS_CreateModuleContext_Test', () => {
    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1300
     * @tc.name      : Test_CreateModuleContext_NullContext
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1300', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = null;
      let moduleName = 'entry_test';
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1400
     * @tc.name      : Test_CreateModuleContext_UndefinedContext
     * @tc.desc      : Test CreateModuleContext function when context is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1400', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = undefined;
      let moduleName = 'entry_test';
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1500
     * @tc.name      : Test_CreateModuleContext_NullModuleName
     * @tc.desc      : Test CreateModuleContext function when moduleName is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1500', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = AppStorage.get<Context>("abilityContext");
      let moduleName = null;
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1600
     * @tc.name      : Test_CreateModuleContext_UndefinedModuleName
     * @tc.desc      : Test CreateModuleContext function when moduleName is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1600', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = AppStorage.get<Context>("abilityContext");
      let moduleName = undefined;
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1700
     * @tc.name      : Test_CreateModuleContext_WrongModuleName
     * @tc.desc      : Test CreateModuleContext function when moduleName is wrong
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1700', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = AppStorage.get<Context>("abilityContext");
      let moduleName = 'x&x';
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1800
     * @tc.name      : Test_CreateModuleContext_EmptyModuleName
     * @tc.desc      : Test CreateModuleContext function when moduleName is empty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_1800', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'CreateModuleContext_1800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let context = AppStorage.get<Context>("abilityContext");
      let moduleName = '';
      try {
        await application.createModuleContext(context,moduleName).then((data: Context)=>{
          hilog.info(0x0000, TAG, '%{public}s', 'createBundleContext success!');
          expect().assertFail();
        }).catch((error : BusinessError)=>{
          hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        });
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', ` error, errorCode: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} completed`);
      };
      done();
    })
  })
}