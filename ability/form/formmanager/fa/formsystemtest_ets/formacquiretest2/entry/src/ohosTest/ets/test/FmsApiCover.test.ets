/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import FormInfo from '@ohos.app.form.formInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

let formState: FormInfo.FormState;

export default function ApiCoverTest() {
  describe('ApiCoverTestTest', () => {

    /**
     * @tc.name   FMS_apiCoverTest_001
     * @tc.number FMS_apiCoverTest_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`FMS_apiCoverTest_001`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info("FMS_apiCoverTest_001 start");

      if (FormInfo.FormParam.FORM_LOCATION_KEY) {
        expect("ohos.extra.param.key.form_location").assertEqual(FormInfo.FormParam.FORM_LOCATION_KEY);
      }

      expect("ohos.extra.param.key.form_identity").assertEqual(FormInfo.FormParam.IDENTITY_KEY);
      expect("ohos.extra.param.key.bundle_name").assertEqual(FormInfo.FormParam.BUNDLE_NAME_KEY);
      expect("ohos.extra.param.key.ability_name").assertEqual(FormInfo.FormParam.ABILITY_NAME_KEY);
      expect("ohos.extra.param.key.form_launch_reason").assertEqual(FormInfo.FormParam.LAUNCH_REASON_KEY);
      expect("ohos.extra.param.key.form_customize").assertEqual(FormInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY);
      expect("ohos.extra.param.key.form_rendering_mode").assertEqual(FormInfo.FormParam.FORM_RENDERING_MODE_KEY);
      expect("ohos.extra.param.key.host_bg_inverse_color").assertEqual(FormInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY);
      expect("ohos.extra.param.key.permission_name").assertEqual(FormInfo.FormParam.FORM_PERMISSION_NAME_KEY);
      expect("ohos.extra.param.key.permission_granted").assertEqual(FormInfo.FormParam.FORM_PERMISSION_GRANTED_KEY);
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY);
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY);
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY);
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY);
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY);
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY);

      expect(1).assertEqual(FormInfo.FormType.JS);
      expect(2).assertEqual(FormInfo.FormType.eTS);
      expect(1).assertEqual(FormInfo.FormShape.RECT);
      expect(2).assertEqual(FormInfo.FormShape.CIRCLE);
      expect(0).assertEqual(FormInfo.VisibilityType.UNKNOWN);
      expect(1).assertEqual(FormInfo.VisibilityType.FORM_VISIBLE);
      expect(2).assertEqual(FormInfo.VisibilityType.FORM_INVISIBLE);
      expect(1).assertEqual(FormInfo.LaunchReason.FORM_DEFAULT);
      expect(2).assertEqual(FormInfo.LaunchReason.FORM_SHARE);
      expect(-1).assertEqual(FormInfo.ColorMode.MODE_AUTO);
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK);
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT);

      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN);
      expect(0).assertEqual(FormInfo.FormState.DEFAULT);
      expect(1).assertEqual(FormInfo.FormState.READY);

      expect(1).assertEqual(FormInfo.FormDimension.Dimension_1_2);
      expect(2).assertEqual(FormInfo.FormDimension.Dimension_2_2);
      expect(3).assertEqual(FormInfo.FormDimension.Dimension_2_4);
      expect(4).assertEqual(FormInfo.FormDimension.Dimension_4_4);
      expect(5).assertEqual(FormInfo.FormDimension.Dimension_2_1);
      expect(6).assertEqual(FormInfo.FormDimension.DIMENSION_1_1);
      expect(7).assertEqual(FormInfo.FormDimension.DIMENSION_6_4);
      expect(FormInfo.FormDimension.DIMENSION_2_3).assertEqual(FormInfo.FormDimension.DIMENSION_2_3);
      expect(FormInfo.FormDimension.DIMENSION_3_3).assertEqual(FormInfo.FormDimension.DIMENSION_3_3);

      expect(-1).assertEqual(FormInfo.FormLocation.OTHER);
      expect(0).assertEqual(FormInfo.FormLocation.DESKTOP);
      expect(1).assertEqual(FormInfo.FormLocation.FORM_CENTER);
      expect(2).assertEqual(FormInfo.FormLocation.FORM_MANAGER);
      expect(3).assertEqual(FormInfo.FormLocation.NEGATIVE_SCREEN);
      expect(4).assertEqual(FormInfo.FormLocation.FORM_CENTER_NEGATIVE_SCREEN);
      expect(5).assertEqual(FormInfo.FormLocation.FORM_MANAGER_NEGATIVE_SCREEN);
      expect(6).assertEqual(FormInfo.FormLocation.SCREEN_LOCK);
      expect(7).assertEqual(FormInfo.FormLocation.AI_SUGGESTION);

      console.info("FMS_apiCoverTest_001 end");
      done();
    });
  })
}