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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import formError from "@ohos.application.formError";
import Utils from './Util.test';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formErrorTest';

export default function formErrorTest() {
    describe("formErrorTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formErrorTest describe start');

        /**
         * @tc.name   FormErrorStaticTest001
         * @tc.number FormErrorStaticTest001
         * @tc.desc   check formError
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormErrorStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormErrorStaticTest001 start');
            expect(1).assertEqual(formError.FormError.ERR_COMMON);
            expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY);
            expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED);
            expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED);
            expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED);
            expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM);
            expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID);
            expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID);
            expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED);
            expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS);
            expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM);
            expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF);
            expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL);
            expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT);
            expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS);
            expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE);
            expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY);
            expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION);
            expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED);
            expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED);
            expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED);
            expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY);
            expect(37).assertEqual(formError.FormError.ERR_DISTRIBUTED_SCHEDULE_FAILED);

            done();
            hilog.info(DOMAIN, TAG, 'FormErrorStaticTest001 end');
        })
    })
}