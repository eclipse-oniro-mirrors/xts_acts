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

import { describe, it, expect, Level } from '@ohos/hypium'
import formProvider from '@ohos.app.form.formProvider'
import formBindingData from '@ohos.app.form.formBindingData'
import { BusinessError } from '@ohos.base';

let ERROR_CODE = 202;
export default function formProviderTest() {
  describe('formProviderTest', () => {

    /**
     * @tc.number: System_API_Test_Form_Provider_0100
     * @tc.name: Multi-parameter requestPublishForm system interface interception test in the form of callback
     * @tc.desc:  Test the third-party application call requestPublishForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Provider_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_Form_Provider_0100';
      try {
        let obj = formBindingData.createFormBindingData({temperature:"22c", time:"22:00"});
        formProvider.requestPublishForm({
          abilityName: "FormAbility",
          parameters: {
            "ohos.extra.param.key.form_dimension": 2,
            "ohos.extra.param.key.form_name": "widget",
            "ohos.extra.param.key.module_name": "entry"
          }
        }, obj, (error, data) => {
          if (error) {
            console.log(TAG + ' formProvider requestPublishForm, error: ' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log('formProvider requestPublishForm, form ID is: ' + JSON.stringify(data));
          }
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Provider_0200
     * @tc.name: Multi-parameter requestPublishForm system interface interception test in the form of promise
     * @tc.desc:  Test the third-party application call requestPublishForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Provider_0200', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_Form_Provider_0200';
      try {
        let obj = formBindingData.createFormBindingData({temperature:"22c", time:"22:00"});
        formProvider.requestPublishForm({
          abilityName: "FormAbility",
          parameters: {
            "ohos.extra.param.key.form_dimension": 2,
            "ohos.extra.param.key.form_name": "widget",
            "ohos.extra.param.key.module_name": "entry"
          }
        }, obj).then((data) => {
          console.log(TAG + ' formProvider requestPublishForm success, form ID is :' + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(TAG + ' formProvider requestPublishForm, error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Provider_0300
     * @tc.name: promise form requestPublishForm system interface interception test
     * @tc.desc:  Test the third-party application call requestPublishForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Provider_0300', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_Form_Provider_0300';
      let want : Want = {
        abilityName: "FormAbility",
        parameters: {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry"
        }
      };
      try {
        formProvider.requestPublishForm(want).then((data) => {
          console.log(TAG + ' formProvider requestPublishForm success, form ID is :' + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(TAG + ' formProvider requestPublishForm, error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Provider_0400
     * @tc.name: callback form isRequestPublishFormSupported system interface interception test
     * @tc.desc:  Test the third-party application call isRequestPublishFormSupported will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Provider_0400', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_Form_Provider_0400';
      try {
        formProvider.isRequestPublishFormSupported((error, data) => {
          if (error) {
            console.log(TAG + ' formProvider isRequestPublishFormSupported, error: ' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          }
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Provider_0500
     * @tc.name: promise form isRequestPublishFormSupported system interface interception test
     * @tc.desc:  Test the third-party application call isRequestPublishFormSupported will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Provider_0500', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_Form_Provider_0500';
      try {
        formProvider.isRequestPublishFormSupported().then((data) => {
          console.log(TAG + ' formProvider isRequestPublishFormSupported success');
        }).catch((error:BusinessError) => {
          console.log(TAG + ' formProvider isRequestPublishFormSupported, error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })
  })
}
