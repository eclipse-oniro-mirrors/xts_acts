/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium'
import userAuth from '@ohos.userIAM.userAuth'

export default function signNormalNotAccessBiometricEnumExecute() {
  describe('signNormalNotAccessBiometricEnumExecute', function () {
    /*
        * @tc.number    : Security_IAM_userAuthType_Kit_Func_0084
        * @tc.name      : execute_enum_userAuthType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_userAuthType_Kit_Func_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testFace Security_IAM_userAuthType_Kit_Func_0084 start');
      expect(1).assertEqual(userAuth.UserAuthType.PIN);
      expect(2).assertEqual(userAuth.UserAuthType.FACE);
      expect(4).assertEqual(userAuth.UserAuthType.FINGERPRINT);
      expect(16).assertEqual(userAuth.UserAuthType.PRIVATE_PIN);
      console.info('Security_IAM_userAuthType_Kit_Func_0084 end');
      done();
    })

    /*
        * @tc.number    : Security_IAM_widgetNotice_Kit_Func_0085
        * @tc.name      : execute_enum_windowModeType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_widgetNotice_Kit_Func_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('Security_IAM_widgetNotice_Kit_Func_0085 start');
      expect(1).assertEqual(userAuth.WindowModeType.DIALOG_BOX);
      expect(2).assertEqual(userAuth.WindowModeType.FULLSCREEN);
      console.info('Security_IAM_widgetNotice_Kit_Func_0085 end');
      done();
    })

    /*
        * @tc.number    : Security_IAM_widgetNotice_Kit_Func_0086
        * @tc.name      : execute_enum_noticeType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_widgetNotice_Kit_Func_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('testFace Security_IAM_widgetNotice_Kit_Func_0086 start');
      expect(1).assertEqual(userAuth.NoticeType.WIDGET_NOTICE);
      console.info('Security_IAM_widgetNotice_Kit_Func_0086 end');
      done();
    })

    /*
        * @tc.number    : Security_IAM_userAuthResultCode_Kit_Func_0087
        * @tc.name      : execute_enum_userAuthResultCode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_userAuthResultCode_Kit_Func_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info('Security_IAM_userAuthResultCode_Kit_Func_0087 start');
      expect(12500011).assertEqual(userAuth.UserAuthResultCode.CANCELED_FROM_WIDGET);
      console.info('Security_IAM_userAuthResultCode_Kit_Func_0087 end');
      done();
    })
  });
};