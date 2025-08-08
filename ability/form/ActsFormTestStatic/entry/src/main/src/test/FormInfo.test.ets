/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import formInfo from '@ohos.app.form.formInfo';
import Utils from './Util.test';


const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

export default function formInfoTest() {
    describe("formInfoTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formInfoTest describe start');

        /**
         * @tc.number: FormInfoStaticTest001
         * @tc.name: FormInfoStaticTest001
         * @tc.desc: check formInfo
         */
        it("FormInfoStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest001 start');

            expect(0).assertEqual(formInfo.RenderingMode.AUTO_COLOR as int);
            expect(1).assertEqual(formInfo.RenderingMode.FULL_COLOR as int);
            expect(2).assertEqual(formInfo.RenderingMode.SINGLE_COLOR as int);

            expect(1).assertEqual(formInfo.FormType.JS as int);
            expect(2).assertEqual(formInfo.FormType.eTS as int);

            expect(-1).assertEqual(formInfo.FormState.UNKNOWN as int);
            expect(0).assertEqual(formInfo.FormState.DEFAULT as int);
            expect(1).assertEqual(formInfo.FormState.READY as int);

            expect('ohos.extra.param.key.form_identity').assertEqual(formInfo.FormParam.IDENTITY_KEY as string);
            expect('ohos.extra.param.key.form_dimension').assertEqual(formInfo.FormParam.DIMENSION_KEY as string);
            expect('ohos.extra.param.key.form_name').assertEqual(formInfo.FormParam.NAME_KEY as string);
            expect('ohos.extra.param.key.module_name').assertEqual(formInfo.FormParam.MODULE_NAME_KEY as string);
            expect('ohos.extra.param.key.form_width').assertEqual(formInfo.FormParam.WIDTH_KEY as string);
            expect('ohos.extra.param.key.form_height').assertEqual(formInfo.FormParam.HEIGHT_KEY as string);
            expect('ohos.extra.param.key.form_temporary').assertEqual(formInfo.FormParam.TEMPORARY_KEY as string);
            expect('ohos.extra.param.key.bundle_name').assertEqual(formInfo.FormParam.BUNDLE_NAME_KEY as string);
            expect('ohos.extra.param.key.ability_name').assertEqual(formInfo.FormParam.ABILITY_NAME_KEY as string);
            expect('ohos.extra.param.key.form_is_theme').assertEqual(formInfo.FormParam.THEME_KEY as string);
            expect('ohos.extra.param.key.device_id').assertEqual(formInfo.FormParam.DEVICE_ID_KEY as string);
            expect('ohos.extra.param.key.form_launch_reason').assertEqual(formInfo.FormParam.LAUNCH_REASON_KEY as string);
            expect('ohos.extra.param.key.form_customize').assertEqual(formInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY as string);
            expect('ohos.extra.param.key.form_location').assertEqual(formInfo.FormParam.FORM_LOCATION_KEY as string);
            expect('ohos.extra.param.key.form_rendering_mode').assertEqual(formInfo.FormParam.FORM_RENDERING_MODE_KEY as string);
            expect('ohos.extra.param.key.host_bg_inverse_color').assertEqual(formInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY as string);
            expect('ohos.extra.param.key.permission_name').assertEqual(formInfo.FormParam.FORM_PERMISSION_NAME_KEY as string);
            expect('ohos.extra.param.key.permission_granted').assertEqual(formInfo.FormParam.FORM_PERMISSION_GRANTED_KEY as string);

            expect(1).assertEqual(formInfo.FormDimension.Dimension_1_2 as int);
            expect(2).assertEqual(formInfo.FormDimension.Dimension_2_2 as int);
            expect(3).assertEqual(formInfo.FormDimension.Dimension_2_4 as int);
            expect(4).assertEqual(formInfo.FormDimension.Dimension_4_4 as int);
            expect(6).assertEqual(formInfo.FormDimension.DIMENSION_1_1 as int);
            expect(7).assertEqual(formInfo.FormDimension.DIMENSION_6_4 as int);
            expect(8).assertEqual(formInfo.FormDimension.DIMENSION_2_3 as int);
            expect(9).assertEqual(formInfo.FormDimension.DIMENSION_3_3 as int);

            expect(1).assertEqual(formInfo.FormShape.RECT as int);
            expect(2).assertEqual(formInfo.FormShape.CIRCLE as int);

            expect(0).assertEqual(formInfo.VisibilityType.UNKNOWN as int);
            expect(1).assertEqual(formInfo.VisibilityType.FORM_VISIBLE as int);
            expect(2).assertEqual(formInfo.VisibilityType.FORM_INVISIBLE as int);

            expect(1).assertEqual(formInfo.LaunchReason.FORM_DEFAULT as int);
            expect(2).assertEqual(formInfo.LaunchReason.FORM_SHARE as int);

            expect(0).assertEqual(formInfo.PublishFormErrorCode.SUCCESS as int);
            expect(1).assertEqual(formInfo.PublishFormErrorCode.NO_SPACE as int);
            expect(2).assertEqual(formInfo.PublishFormErrorCode.PARAM_ERROR as int);
            expect(3).assertEqual(formInfo.PublishFormErrorCode.INTERNAL_ERROR as int);

            expect(0).assertEqual(formInfo.FormUsageState.USED as int);
            expect(1).assertEqual(formInfo.FormUsageState.UNUSED as int);

            expect(-1).assertEqual(formInfo.FormLocation.OTHER as int);
            expect(0).assertEqual(formInfo.FormLocation.DESKTOP as int);
            expect(1).assertEqual(formInfo.FormLocation.FORM_CENTER as int);
            expect(2).assertEqual(formInfo.FormLocation.FORM_MANAGER as int);
            expect(3).assertEqual(formInfo.FormLocation.NEGATIVE_SCREEN as int);
            expect(4).assertEqual(formInfo.FormLocation.FORM_CENTER_NEGATIVE_SCREEN as int);
            expect(5).assertEqual(formInfo.FormLocation.FORM_MANAGER_NEGATIVE_SCREEN as int);
            expect(6).assertEqual(formInfo.FormLocation.SCREEN_LOCK as int);
            expect(7).assertEqual(formInfo.FormLocation.AI_SUGGESTION as int);

            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest001 end');
        })

        /**
         * @tc.number: FormInfoStaticTest002
         * @tc.name: FormInfoStaticTest002
         * @tc.desc: check formInfo
         */
        it("FormInfoStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 start');

            let customizeData: Record<string, string> = {
                'abc1': '123',
                'abc2': '123',
                'abc3': '123',
            }
            let formInfoFo: formInfo.FormInfo = {
                bundleName: 'bundleName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                name: 'name',
                displayName: 'displayName',
                displayNameId: 123,
                description: 'description',
                descriptionId: 123,
                type: formInfo.FormType.eTS,
                jsComponentName: 'jsComponentName',
                isDefault: true,
                updateEnabled: true,
                formVisibleNotify: true,
                scheduledUpdateTime: 'scheduledUpdateTime',
                formConfigAbility: 'formConfigAbility',
                updateDuration: 123,
                defaultDimension: 123,
                supportDimensions: [1,2,3],
                customizeData: customizeData,
                isDynamic: true,
                transparencyEnabled: true,
                supportedShapes: [1,2,3],
                previewImages: [1,2,3],
                enableBlurBackground: true,
                renderingMode: formInfo.RenderingMode.AUTO_COLOR,
            }
            expect('bundleName').assertEqual(formInfoFo.bundleName as string);
            expect('moduleName').assertEqual(formInfoFo.moduleName as string);
            expect('abilityName').assertEqual(formInfoFo.abilityName as string);
            expect('name').assertEqual(formInfoFo.name as string);
            expect('displayName').assertEqual(formInfoFo.displayName as string);
            expect(123).assertEqual(formInfoFo.displayNameId as int);
            expect('description').assertEqual(formInfoFo.description as string);
            expect(123).assertEqual(formInfoFo.descriptionId as int);
            expect(2).assertEqual(formInfoFo.type as int);
            expect('jsComponentName').assertEqual(formInfoFo.jsComponentName as string);
            expect(formInfoFo.isDefault).assertTrue();
            expect(formInfoFo.updateEnabled).assertTrue();
            expect(formInfoFo.formVisibleNotify).assertTrue();
            expect('scheduledUpdateTime').assertEqual(formInfoFo.scheduledUpdateTime as string);
            expect('formConfigAbility').assertEqual(formInfoFo.formConfigAbility as string);
            expect(123).assertEqual(formInfoFo.updateDuration as int);
            expect(123).assertEqual(formInfoFo.defaultDimension as int);
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFo.supportedShapes));
            expect('123').assertEqual(formInfoFo.customizeData['abc1'] as string);
            expect(formInfoFo.isDynamic).assertTrue();
            expect(formInfoFo.transparencyEnabled).assertTrue();
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFo.previewImages));
            expect(formInfoFo.enableBlurBackground).assertTrue();
            expect(0).assertEqual(formInfo.RenderingMode.AUTO_COLOR as int);

            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest002 end');
        })

        /**
         * @tc.number: FormInfoStaticTest003
         * @tc.name: FormInfoStaticTest003
         * @tc.desc: check formInfo
         */
        it("FormInfoStaticTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest003 start');

            let formStateFo: formInfo.FormStateInfo = {
                formState: formInfo.FormState.UNKNOWN,
                want: { bundleName: 'bundleName' },
            }
            expect(-1).assertEqual(formStateFo.formState as int);
            expect('bundleName').assertEqual(formStateFo.want.bundleName as string);

            let formInfoFilterFo: formInfo.FormInfoFilter = {
                bundleName: 'bundleName',
                moduleName: 'moduleName',
                supportedDimensions: [1,2,3],
                supportedShapes: [1,2,3],
            }
            expect('bundleName').assertEqual(formInfoFilterFo.bundleName as string);
            expect('moduleName').assertEqual(formInfoFilterFo.moduleName as string);
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedDimensions));
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedShapes));

            let publishFormResultFo: formInfo.PublishFormResult = {
                code: formInfo.PublishFormErrorCode.SUCCESS,
                message: 'message',
            }
            expect(0).assertEqual(publishFormResultFo.code as int);
            expect('message').assertEqual(publishFormResultFo.message as string);

            let formProviderFilterFo: formInfo.FormProviderFilter = {
                bundleName: 'bundleName',
                formName: 'formName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                isUnusedIncluded: true,
            }
            expect('bundleName').assertEqual(formProviderFilterFo.bundleName as string);
            expect('formName').assertEqual(formProviderFilterFo.formName as string);
            expect('moduleName').assertEqual(formProviderFilterFo.moduleName as string);
            expect('abilityName').assertEqual(formProviderFilterFo.abilityName as string);
            expect(true).assertEqual(formProviderFilterFo.isUnusedIncluded as boolean);

            let extraData: Record<string, object> = {
                'abc1': '123',
                'abc2': '123',
                'abc3': '123',
            }
            let runningFormInfoFo: formInfo.RunningFormInfo = {
                formId: 'formId',
                bundleName: 'bundleName',
                hostBundleName: 'hostBundleName',
                formLocation: formInfo.FormLocation.DESKTOP,
                visibilityType: formInfo.VisibilityType.FORM_VISIBLE,
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                formName: 'formName',
                dimension: 123,
                formUsageState: formInfo.FormUsageState.UNUSED,
                formDescription: 'formDescription',
                extraData: extraData,
            }
            expect('formId').assertEqual(runningFormInfoFo.formId as string);
            expect('bundleName').assertEqual(runningFormInfoFo.bundleName as string);
            expect('hostBundleName').assertEqual(runningFormInfoFo.hostBundleName as string);
            expect(0).assertEqual(runningFormInfoFo.formLocation as int);
            expect(1).assertEqual(runningFormInfoFo.visibilityType as int);
            expect('moduleName').assertEqual(runningFormInfoFo.moduleName as string);
            expect('abilityName').assertEqual(runningFormInfoFo.abilityName as string);
            expect('formName').assertEqual(runningFormInfoFo.formName as string);
            expect(123).assertEqual(runningFormInfoFo.dimension as int);
            expect(1).assertEqual(runningFormInfoFo.formUsageState as int);
            expect('formDescription').assertEqual(runningFormInfoFo.formDescription as string);
            expect('123').assertEqual(runningFormInfoFo.extraData!['abc1'] as string);

            done();
            hilog.info(DOMAIN, TAG, 'FormInfoStaticTest003 end');
        })
    })
}