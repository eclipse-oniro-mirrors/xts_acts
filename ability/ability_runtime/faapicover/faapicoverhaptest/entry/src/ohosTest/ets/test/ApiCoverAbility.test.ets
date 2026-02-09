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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

import FormInfo from '@ohos.application.formInfo';
import formError from '@ohos.application.formError';
import featureAbility from '@ohos.ability.featureAbility'
import {BusinessError} from "@ohos.base";
export default function ApiCoverTest() {
  describe('ApiCoverTestTest', () => {

    /**
     * @tc.name   SUB_AA_Form_Provider_Test_FormErr_0100
     * @tc.number SUB_AA_Form_Provider_Test_FormErr_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Form_Provider_Test_FormErr_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_Form_Provider_Test_FormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM)
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED)
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID)
      expect(1).assertEqual(formError.FormError.ERR_COMMON)
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED)
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED)
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY)
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION)
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE)
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED)
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED)
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED)
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY)
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT)
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM)
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS)
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS)
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID)
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF)
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY)
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL)
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED)
      done()
    })

    /**
     * @tc.name   SUB_AA_Form_Provider_Test_FormInfo_0100
     * @tc.number SUB_AA_Form_Provider_Test_FormInfo_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Form_Provider_Test_FormInfo_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_Form_Provider_Test_FormInfo_0100");
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY)
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY)
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY)
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY)
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY)
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY)
      expect(1).assertEqual(FormInfo.FormType.JS)
      expect(-1).assertEqual(FormInfo.ColorMode.MODE_AUTO)
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK)
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT)
      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN)
      expect(0).assertEqual(FormInfo.FormState.DEFAULT)
      expect(1).assertEqual(FormInfo.FormState.READY)
      done();
    });
    /**
     * @tc.name   SUB_AA_OpenHarmony_CoverApiContext_0100
     * @tc.number SUB_AA_OpenHarmony_CoverApiContext_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_CoverApiContext_0100', Level.LEVEL0, async (done: Function) => {
        console.log("------------start SUB_AA_OpenHarmony_CoverApi_0500-------------");
        let appContext = featureAbility.getContext()
        appContext.getExternalCacheDir((err, data) => {
          console.info('SUB_AA_OpenHarmony_CoverApiContext_0100 successful. data: ' + JSON.stringify(data));
          expect(true).assertTrue()
          done()
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_CoverApiContext_0200
     * @tc.number SUB_AA_OpenHarmony_CoverApiContext_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_CoverApiContext_0200', Level.LEVEL0, async (done: Function) => {
        console.log("------------start SUB_AA_OpenHarmony_CoverApi_0500-------------");
        let appContext = featureAbility.getContext()
        appContext.getExternalCacheDir().then((data)=>{
          console.info('SUB_AA_OpenHarmony_CoverApiContext_0200 successful. data: ' + JSON.stringify(data));
          expect(true).assertTrue()
          done()
        }).catch((err:BusinessError)=>{
            expect().assertFalse();
            done()
        })
    })

  })
}