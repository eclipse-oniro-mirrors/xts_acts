/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import FormInfo from '@ohos.application.formInfo';
import formInfoNew from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const INTERVAL_TIME = 2500;

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

export default function FormApiCoverTest() {
  describe('FormApiCoverTestTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', 0, async (done: Function) => {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM);
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED);
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID);
      expect(1).assertEqual(formError.FormError.ERR_COMMON);
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED);
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED);
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY);
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION);
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE);
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED);
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED);
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED);
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY);
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT);
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM);
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS);
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS);
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID);
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF);
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY);
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL);
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED);
      done();
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0100
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0100', 0, async (done: Function) => {
      console.info("SUB_AA_Form_provider_TestFormInfo_0100");
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY);
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY);
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY);
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY);
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY);
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY);
      expect("ohos.extra.param.key.form_identity").assertEqual(FormInfo.FormParam.IDENTITY_KEY);
      expect(0).assertEqual(FormInfo.FormState.DEFAULT);
      expect(1).assertEqual(FormInfo.FormState.READY);
      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN);
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK);
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT);
      expect(1).assertEqual(FormInfo.FormType.JS);
      done();
    });

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0200
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0200', 0, async (done: Function) => {
      console.info("SUB_AA_Form_provider_TestFormInfo_0200");
      expect("ohos.extra.param.key.form_dimension").assertEqual(formInfoNew.FormParam.DIMENSION_KEY);
      expect("ohos.extra.param.key.form_height").assertEqual(formInfoNew.FormParam.HEIGHT_KEY);
      expect("ohos.extra.param.key.module_name").assertEqual(formInfoNew.FormParam.MODULE_NAME_KEY);
      expect("ohos.extra.param.key.form_width").assertEqual(formInfoNew.FormParam.WIDTH_KEY);
      expect("ohos.extra.param.key.form_name").assertEqual(formInfoNew.FormParam.NAME_KEY);
      expect("ohos.extra.param.key.form_temporary").assertEqual(formInfoNew.FormParam.TEMPORARY_KEY);
      expect("ohos.extra.param.key.form_identity").assertEqual(formInfoNew.FormParam.IDENTITY_KEY);
      expect("ohos.extra.param.key.bundle_name").assertEqual(formInfoNew.FormParam.BUNDLE_NAME_KEY);
      expect("ohos.extra.param.key.ability_name").assertEqual(formInfoNew.FormParam.ABILITY_NAME_KEY);
      expect('ohos.extra.param.key.form_customize').assertEqual(formInfoNew.FormParam.PARAM_FORM_CUSTOMIZE_KEY);
      expect('ohos.extra.param.key.form_launch_reason').assertEqual(formInfoNew.FormParam.LAUNCH_REASON_KEY);
      console.info("SUB_AA_Test_InsightIntent_0100:" + formInfoNew.FormParam.FORM_RENDERING_MODE_KEY);
      expect('ohos.extra.param.key.host_bg_inverse_color').assertEqual(formInfoNew.FormParam.HOST_BG_INVERSE_COLOR_KEY)
      if (deviceType !== '2in1') {
        expect('ohos.extra.param.key.permission_name').assertEqual(formInfoNew.FormParam.FORM_PERMISSION_NAME_KEY)
        expect('ohos.extra.param.key.permission_granted').assertEqual(formInfoNew.FormParam.FORM_PERMISSION_GRANTED_KEY)
      }
      expect(1).assertEqual(formInfoNew.LaunchReason.FORM_DEFAULT);
      expect(2).assertEqual(formInfoNew.LaunchReason.FORM_SHARE);
      expect(0).assertEqual(formInfoNew.FormState.DEFAULT);
      expect(1).assertEqual(formInfoNew.FormState.READY);
      expect(-1).assertEqual(formInfoNew.FormState.UNKNOWN);
      expect(0).assertEqual(formInfoNew.ColorMode.MODE_DARK);
      expect(1).assertEqual(formInfoNew.ColorMode.MODE_LIGHT);
      console.info("SUB_AA_Form_provider_TestFormInfo_0200:" + formInfoNew.FormDimension.DIMENSION_1_1);
      expect(1).assertEqual(formInfoNew.FormDimension.Dimension_1_2);
      expect(2).assertEqual(formInfoNew.FormDimension.Dimension_2_2);
      expect(3).assertEqual(formInfoNew.FormDimension.Dimension_2_4);
      expect(4).assertEqual(formInfoNew.FormDimension.Dimension_4_4);
      expect(5).assertEqual(formInfoNew.FormDimension.Dimension_2_1);
      expect(7).assertEqual(formInfoNew.FormDimension.DIMENSION_6_4);
      console.info("SUB_AA_Test_InsightIntent_0100:" + formInfoNew.FormDimension.Dimension_2_1);
      expect(1).assertEqual(formInfoNew.FormType.JS);
      expect(2).assertEqual(formInfoNew.FormType.eTS);
      expect(1).assertEqual(formInfoNew.VisibilityType.FORM_VISIBLE);
      expect(2).assertEqual(formInfoNew.VisibilityType.FORM_INVISIBLE);
      expect(1).assertEqual(formInfoNew.FormShape.RECT);
      expect(2).assertEqual(formInfoNew.FormShape.CIRCLE);
      let formStateInfo: formInfoNew.FormStateInfo = {
        formState: formInfoNew.FormState.READY,
        want: {
          bundleName: "com.example.extensionapitest",
          abilityName: "FirstExtension"
        }
      }
      done();
    });
  })
}