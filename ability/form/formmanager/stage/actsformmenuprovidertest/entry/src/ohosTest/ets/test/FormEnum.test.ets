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

import hilog from '@ohos.hilog';
import { it, expect, TestType, Size, Level, describe } from '@ohos/hypium';
import formInfo from '@ohos.app.form.formInfo'
import formError from '@ohos.application.formError';

const tag = 'testTag';
const domain: number = 0xF811;

export default function formEnumTest() {
  describe('formEnumTest', () => {
    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_LOCATION_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_LOCATION_0100
     * @tc.desc   form FormLocation enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_LOCATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_LOCATION_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(8).assertEqual(formInfo.FormLocation.STANDBY);
      expect(7).assertEqual(formInfo.FormLocation.AI_SUGGESTION);
      expect(6).assertEqual(formInfo.FormLocation.SCREEN_LOCK);
      expect(5).assertEqual(formInfo.FormLocation.FORM_MANAGER_NEGATIVE_SCREEN);
      expect(4).assertEqual(formInfo.FormLocation.FORM_CENTER_NEGATIVE_SCREEN);
      expect(3).assertEqual(formInfo.FormLocation.NEGATIVE_SCREEN);
      expect(2).assertEqual(formInfo.FormLocation.FORM_MANAGER);
      expect(1).assertEqual(formInfo.FormLocation.FORM_CENTER);
      expect(0).assertEqual(formInfo.FormLocation.DESKTOP);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_LAUNCH_REASON_0100
     * @tc.number SUB_ABILITY_FORM_FWK_LAUNCH_REASON_0100
     * @tc.desc   form LaunchReason enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_LAUNCH_REASON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_LAUNCH_REASON_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(2).assertEqual(formInfo.LaunchReason.FORM_SHARE);
      expect(1).assertEqual(formInfo.LaunchReason.FORM_DEFAULT);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_PARAM_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_PARAM_0100
     * @tc.desc   form FormParam enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_PARAM_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect('ohos.extra.param.key.permission_granted').assertEqual(formInfo.FormParam.FORM_PERMISSION_GRANTED_KEY);
      expect('ohos.extra.param.key.permission_name').assertEqual(formInfo.FormParam.FORM_PERMISSION_NAME_KEY);
      expect('ohos.extra.param.key.host_bg_inverse_color').assertEqual(formInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY);
      expect('ohos.extra.param.key.form_rendering_mode').assertEqual(formInfo.FormParam.FORM_RENDERING_MODE_KEY);
      expect("ohos.extra.param.key.form_customize").assertEqual(formInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY);
      expect("ohos.extra.param.key.form_launch_reason").assertEqual(formInfo.FormParam.LAUNCH_REASON_KEY);
      expect("ohos.extra.param.key.ability_name").assertEqual(formInfo.FormParam.ABILITY_NAME_KEY);
      expect("ohos.extra.param.key.bundle_name").assertEqual(formInfo.FormParam.BUNDLE_NAME_KEY);
      expect("ohos.extra.param.key.form_temporary").assertEqual(formInfo.FormParam.TEMPORARY_KEY);
      expect("ohos.extra.param.key.form_height").assertEqual(formInfo.FormParam.HEIGHT_KEY);
      expect("ohos.extra.param.key.form_width").assertEqual(formInfo.FormParam.WIDTH_KEY);
      expect("ohos.extra.param.key.module_name").assertEqual(formInfo.FormParam.MODULE_NAME_KEY);
      expect("ohos.extra.param.key.form_name").assertEqual(formInfo.FormParam.NAME_KEY);
      expect("ohos.extra.param.key.form_dimension").assertEqual(formInfo.FormParam.DIMENSION_KEY);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_ERROR_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_ERROR_0100
     * @tc.desc   form FormError enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_ERROR_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_VISIBILITY_TYPE_0100
     * @tc.number SUB_ABILITY_FORM_FWK_VISIBILITY_TYPE_0100
     * @tc.desc   form VisibilityType enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_VISIBILITY_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_VISIBILITY_TYPE_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(2).assertEqual(formInfo.VisibilityType.FORM_INVISIBLE);
      expect(1).assertEqual(formInfo.VisibilityType.FORM_VISIBLE);
      expect(0).assertEqual(formInfo.VisibilityType.UNKNOWN);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_SHAPE_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_SHAPE_0100
     * @tc.desc   form FormShape enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_SHAPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_SHAPE_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(2).assertEqual(formInfo.FormShape.CIRCLE);
      expect(1).assertEqual(formInfo.FormShape.RECT);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_DIMENSION_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_DIMENSION_0100
     * @tc.desc   form FormDimension enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_DIMENSION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_DIMENSION_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(7).assertEqual(formInfo.FormDimension.DIMENSION_6_4);
      expect(6).assertEqual(formInfo.FormDimension.DIMENSION_1_1);
      expect(4).assertEqual(formInfo.FormDimension.Dimension_4_4);
      expect(3).assertEqual(formInfo.FormDimension.Dimension_2_4);
      expect(2).assertEqual(formInfo.FormDimension.Dimension_2_2);
      expect(1).assertEqual(formInfo.FormDimension.Dimension_1_2);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_STATE_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_STATE_0100
     * @tc.desc   form FormState enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_STATE_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(1).assertEqual(formInfo.FormState.READY);
      expect(0).assertEqual(formInfo.FormState.DEFAULT);
      expect(-1).assertEqual(formInfo.FormState.UNKNOWN);
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_TYPE_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_TYPE_0100
     * @tc.desc   form FormType enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const itName: string = 'SUB_ABILITY_FORM_FWK_FORM_TYPE_0100';
      hilog.info(domain, tag, `${itName} start`);
      expect(2).assertEqual(formInfo.FormType.eTS);
      expect(1).assertEqual(formInfo.FormType.JS);
      hilog.info(domain, tag, `${itName} end`);
    })
  })
}

