/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from '../../../hypium/index';
import hilog from '@ohos.hilog';
import formInfo from '@ohos.app.form.formInfo';
import Utils from './Util.test';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formInfoTest';

export default function formInfoTest() {
    describe("formInfoTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formInfoTest describe start');

        /**
         * @tc.name   FormInfoStaticTest001
         * @tc.number FormInfoStaticTest001
         * @tc.desc   check formInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormInfoStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest001 start');

            expect(0).assertEqual(formInfo.RenderingMode.AUTO_COLOR);
            expect(1).assertEqual(formInfo.RenderingMode.FULL_COLOR);
            expect(2).assertEqual(formInfo.RenderingMode.SINGLE_COLOR);

            expect(1).assertEqual(formInfo.FormType.JS);
            expect(2).assertEqual(formInfo.FormType.eTS);

            expect(-1).assertEqual(formInfo.FormState.UNKNOWN);
            expect(0).assertEqual(formInfo.FormState.DEFAULT);
            expect(1).assertEqual(formInfo.FormState.READY);

            expect('ohos.extra.param.key.form_identity').assertEqual(formInfo.FormParam.IDENTITY_KEY);
            expect('ohos.extra.param.key.form_dimension').assertEqual(formInfo.FormParam.DIMENSION_KEY);
            expect('ohos.extra.param.key.form_name').assertEqual(formInfo.FormParam.NAME_KEY);
            expect('ohos.extra.param.key.module_name').assertEqual(formInfo.FormParam.MODULE_NAME_KEY);
            expect('ohos.extra.param.key.form_width').assertEqual(formInfo.FormParam.WIDTH_KEY);
            expect('ohos.extra.param.key.form_height').assertEqual(formInfo.FormParam.HEIGHT_KEY);
            expect('ohos.extra.param.key.form_temporary').assertEqual(formInfo.FormParam.TEMPORARY_KEY);
            expect('ohos.extra.param.key.bundle_name').assertEqual(formInfo.FormParam.BUNDLE_NAME_KEY);
            expect('ohos.extra.param.key.ability_name').assertEqual(formInfo.FormParam.ABILITY_NAME_KEY);
            expect('ohos.extra.param.key.form_is_theme').assertEqual(formInfo.FormParam.THEME_KEY);
            expect('ohos.extra.param.key.device_id').assertEqual(formInfo.FormParam.DEVICE_ID_KEY);
            expect('ohos.extra.param.key.form_launch_reason').assertEqual(formInfo.FormParam.LAUNCH_REASON_KEY);
            expect('ohos.extra.param.key.form_customize').assertEqual(formInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY);
            expect('ohos.extra.param.key.form_location').assertEqual(formInfo.FormParam.FORM_LOCATION_KEY);
            expect('ohos.extra.param.key.form_rendering_mode').assertEqual(formInfo.FormParam.FORM_RENDERING_MODE_KEY);
            expect('ohos.extra.param.key.host_bg_inverse_color').assertEqual(formInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY);
            expect('ohos.extra.param.key.permission_name').assertEqual(formInfo.FormParam.FORM_PERMISSION_NAME_KEY);
            expect('ohos.extra.param.key.permission_granted').assertEqual(formInfo.FormParam.FORM_PERMISSION_GRANTED_KEY);
            expect('ohos.extra.param.key.original_form_id').assertEqual(formInfo.FormParam.ORIGINAL_FORM_KEY);
            expect('ohos.extra.param.key.edit_form_id').assertEqual(formInfo.FormParam.EDIT_FORM_KEY);
            expect("ohos.extra.param.key.update_form_reason").assertEqual(formInfo.FormParam.UPDATE_FORM_REASON_KEY);

            expect(1).assertEqual(formInfo.FormDimension.Dimension_1_2);
            expect(2).assertEqual(formInfo.FormDimension.Dimension_2_2);
            expect(3).assertEqual(formInfo.FormDimension.Dimension_2_4);
            expect(4).assertEqual(formInfo.FormDimension.Dimension_4_4);
            expect(6).assertEqual(formInfo.FormDimension.DIMENSION_1_1);
            expect(7).assertEqual(formInfo.FormDimension.DIMENSION_6_4);
            expect(8).assertEqual(formInfo.FormDimension.DIMENSION_2_3);
            expect(9).assertEqual(formInfo.FormDimension.DIMENSION_3_3);

            expect(1).assertEqual(formInfo.FormShape.RECT);
            expect(2).assertEqual(formInfo.FormShape.CIRCLE);

            expect(0).assertEqual(formInfo.VisibilityType.UNKNOWN);
            expect(1).assertEqual(formInfo.VisibilityType.FORM_VISIBLE);
            expect(2).assertEqual(formInfo.VisibilityType.FORM_INVISIBLE);

            expect(1).assertEqual(formInfo.LaunchReason.FORM_DEFAULT);
            expect(2).assertEqual(formInfo.LaunchReason.FORM_SHARE);
            expect(3).assertEqual(formInfo.LaunchReason.FORM_SIZE_CHANGE);

            expect(0).assertEqual(formInfo.PublishFormErrorCode.SUCCESS);
            expect(1).assertEqual(formInfo.PublishFormErrorCode.NO_SPACE);
            expect(2).assertEqual(formInfo.PublishFormErrorCode.PARAM_ERROR);
            expect(3).assertEqual(formInfo.PublishFormErrorCode.INTERNAL_ERROR);

            expect(0).assertEqual(formInfo.FormUsageState.USED);
            expect(1).assertEqual(formInfo.FormUsageState.UNUSED);

            expect(-1).assertEqual(formInfo.FormLocation.OTHER);
            expect(0).assertEqual(formInfo.FormLocation.DESKTOP);
            expect(1).assertEqual(formInfo.FormLocation.FORM_CENTER);
            expect(2).assertEqual(formInfo.FormLocation.FORM_MANAGER);
            expect(3).assertEqual(formInfo.FormLocation.NEGATIVE_SCREEN);
            expect(4).assertEqual(formInfo.FormLocation.FORM_CENTER_NEGATIVE_SCREEN);
            expect(5).assertEqual(formInfo.FormLocation.FORM_MANAGER_NEGATIVE_SCREEN);
            expect(6).assertEqual(formInfo.FormLocation.SCREEN_LOCK);
            expect(7).assertEqual(formInfo.FormLocation.AI_SUGGESTION);
            expect(8).assertEqual(formInfo.FormLocation.STANDBY);

            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest001 end');
        })

        /**
         * @tc.name   FormInfoStaticTest002
         * @tc.number FormInfoStaticTest002
         * @tc.desc   check formInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormInfoStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 start');
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 assert FormInfoFilter');
            let formInfoFilterFo: formInfo.FormInfoFilter = {
                bundleName: 'bundle',
                moduleName: 'module',
                supportedDimensions: [1,2,3,4],
                supportedShapes: [1,2,3,4,5],
            }
            expect('bundle').assertEqual(formInfoFilterFo.bundleName);
            expect('module').assertEqual(formInfoFilterFo.moduleName);
            expect(JSON.stringify([1,2,3,4])).assertEqual(JSON.stringify(formInfoFilterFo.supportedDimensions));
            expect(JSON.stringify([1,2,3,4,5])).assertEqual(JSON.stringify(formInfoFilterFo.supportedShapes));
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 assert FormStateInfo');
            let formStateFo: formInfo.FormStateInfo = {
                formState: formInfo.FormState.DEFAULT,
                want: { bundleName: 'bundleName' },
            }
            expect(0).assertEqual(formStateFo.formState);
            expect('bundleName').assertEqual(formStateFo.want.bundleName);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 assert FormProviderFilter');
            let formProviderFilterFo: formInfo.FormProviderFilter = {
                bundleName: 'bundleName',
                formName: 'formName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                isUnusedIncluded: false,
            }
            expect('bundleName').assertEqual(formProviderFilterFo.bundleName);
            expect('formName').assertEqual(formProviderFilterFo.formName);
            expect('moduleName').assertEqual(formProviderFilterFo.moduleName);
            expect('abilityName').assertEqual(formProviderFilterFo.abilityName);
            expect(false).assertEqual(formProviderFilterFo.isUnusedIncluded as boolean);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 assert PublishFormResult');
            let publishFormResultFo: formInfo.PublishFormResult = {
                code: formInfo.PublishFormErrorCode.INTERNAL_ERROR,
                message: 'message',
            }
            expect(3).assertEqual(publishFormResultFo.code);
            expect('message').assertEqual(publishFormResultFo.message);
            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 end');
        })

        /**
         * @tc.name   FormInfoStaticTest003
         * @tc.number FormInfoStaticTest003
         * @tc.desc   check formInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormInfoStaticTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest003 start');

            let formStateFo: formInfo.FormStateInfo = {
                formState: formInfo.FormState.UNKNOWN,
                want: { bundleName: 'bundleName' },
            }
            expect(-1).assertEqual(formStateFo.formState);
            expect('bundleName').assertEqual(formStateFo.want.bundleName);

            let formInfoFilterFo: formInfo.FormInfoFilter = {
                bundleName: 'bundleName',
                moduleName: 'moduleName',
                supportedDimensions: [1,2,3],
                supportedShapes: [1,2,3],
            }
            expect('bundleName').assertEqual(formInfoFilterFo.bundleName);
            expect('moduleName').assertEqual(formInfoFilterFo.moduleName);
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedDimensions));
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedShapes));
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest003 assert publishFormResultFo');
            let publishFormResultFo: formInfo.PublishFormResult = {
                code: formInfo.PublishFormErrorCode.SUCCESS,
                message: 'message',
            }
            expect(0).assertEqual(publishFormResultFo.code);
            expect('message').assertEqual(publishFormResultFo.message);

            let formProviderFilterFo: formInfo.FormProviderFilter = {
                bundleName: 'bundleName',
                formName: 'formName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                isUnusedIncluded: true,
            }
            expect('bundleName').assertEqual(formProviderFilterFo.bundleName);
            expect('formName').assertEqual(formProviderFilterFo.formName);
            expect('moduleName').assertEqual(formProviderFilterFo.moduleName);
            expect('abilityName').assertEqual(formProviderFilterFo.abilityName);
            expect(true).assertEqual(formProviderFilterFo.isUnusedIncluded);

            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest003 end');
        })

       /**
        * @tc.name   FormInfoStaticTest004
        * @tc.number SUB_ABILITY_FWK_FORMINFOSTATICTEST_0100
        * @tc.desc   check formInfo
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it("FormInfoStaticTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            const itName: string = 'FormInfoStaticTest004';
            hilog.info(DOMAIN, TAG, `${itName} start`);
            expect(-1).assertEqual(formInfo.FormUpdateReason.UNKNOWN);
            expect(0).assertEqual(formInfo.FormUpdateReason.FORM_NODE_REUSE);
            hilog.info(DOMAIN, TAG, `${itName} end`);
        })
    })
}