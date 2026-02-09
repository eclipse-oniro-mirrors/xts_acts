/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, afterEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError, RecordData } from '@ohos.base';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import formHost from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

const DOMAIN: Int = 0x0000;
const TAG: string = 'testTag formProviderTest';
const BOOL_TRUE: boolean = true;
const ERROR_CODE = 16501000;
const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500100;
const ERROR_CODE3 = 801;

export default function formProviderTest() {
  describe('formProviderTest', (): void => {
    hilog.info(DOMAIN, TAG, 'formProviderTest describe start');
    let formId = '98881849';
    let bundleName = 'com.example.actsformtest.static';
    let formAbilityName = 'EntryFormAbility';
    let editAbilityName = 'EntryFormEditAbility'
    let moduleName = 'entry';
    let widgetName = 'widget';
    let wantParams: Record<string, RecordData> = {
      'ohos.extra.param.key.form_dimension': formInfo.FormDimension.Dimension_2_2,
      'ohos.extra.param.key.form_name': 'widget',
      'ohos.extra.param.key.module_name': 'entry',
      'ohos.extra.param.key.form_is_theme': true,
    }
    let want: Want = {
      bundleName: bundleName,
      abilityName: formAbilityName,
      parameters: wantParams
    }
    formHost.addForm(want).then((result) => {
      hilog.info(DOMAIN, TAG, `formId set for test: ${result.formId}`);
      formId = result.formId;
    }).catch((error: Error) => {
      hilog.error(DOMAIN, TAG, `addForm error, set formId manually error error, code: ${error?.code}, message: ${error?.message}`);
    })

    afterEach(() => {
      await Utils.msSleep(100);
    })


    /**
     * @tc.name   SetFormNextRefreshTimeTest001
     * @tc.number SetFormNextRefreshTimeTest001
     * @tc.desc   check SetFormNextRefreshTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetFormNextRefreshTimeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest001 start');

      try {
        formProvider.setFormNextRefreshTime(formId, 5, (error: BusinessError<void> | null) => {
          if (error != null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest001 error, code: ${error?.code}, message: ${error?.message}`);
          } else {
            hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest001 success');
          }
          expect(error?.code).assertEqual(16501001);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest001 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest001 end');
    })

    /**
     * @tc.name   SetFormNextRefreshTimeTest002
     * @tc.number SetFormNextRefreshTimeTest002
     * @tc.desc   check SetFormNextRefreshTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetFormNextRefreshTimeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest002 start');

      try {
        formProvider.setFormNextRefreshTime(formId, 3).then(() => {
          hilog.info(DOMAIN, TAG, `SetFormNextRefreshTimeTest002 success`);
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest002 error, code: ${error?.code}, message: ${error?.message}`);
          expect(error?.code).assertEqual(16501001);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest002 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest002 end');
    })

    /**
     * @tc.name   SetFormNextRefreshTimeTest003
     * @tc.number SetFormNextRefreshTimeTest003
     * @tc.desc   check SetFormNextRefreshTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetFormNextRefreshTimeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest003 start');

      try {
        let falseFormId = '123123123';
        formProvider.setFormNextRefreshTime(falseFormId, 2, (error: BusinessError<void> | null) => {
          if (error != null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest003 error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(16501001);
          } else {
            hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest003 success');
            expect().assertFail();
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest003 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest003 end');
    })

    /**
     * @tc.name   SetFormNextRefreshTimeTest004
     * @tc.number SetFormNextRefreshTimeTest004
     * @tc.desc   check SetFormNextRefreshTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetFormNextRefreshTimeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest004 start');
      try {
        let falseFormId = '123123123';
        formProvider.setFormNextRefreshTime(falseFormId, 3).then(() => {
          hilog.info(DOMAIN, TAG, `SetFormNextRefreshTimeTest004 success`);
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest004 error, code: ${error?.code}, message: ${error?.message}`);
          expect(error?.code).assertEqual(16501001);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest004 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest004 end');
    })

    /**
     * @tc.name   UpdateFormTest001
     * @tc.number UpdateFormTest001
     * @tc.desc   check UpdateForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UpdateFormTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormTest001 start');

      let data: Record<string, string> = {
        'testData1': 'testVal1',
        'testData2': 'testVal2'
      };
      let bindingData = formBindingData.createFormBindingData(data)

      try {
        formProvider.updateForm(formId, bindingData).then(() => {
          hilog.info(DOMAIN, TAG, `UpdateFormTest001 success`);
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `UpdateFormTest001 error, code: ${error?.code}, message: ${error?.message}`);
          expect(error?.code).assertEqual(16501001);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `UpdateFormTest001 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'UpdateFormTest001 end');
    })

    /**
     * @tc.name   UpdateFormTest002
     * @tc.number UpdateFormTest002
     * @tc.desc   check UpdateForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UpdateFormTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormTest002 start');

      let data: Record<string, string> = {
        'testData1': 'testVal1',
        'testData2': 'testVal2'
      };
      let bindingData = formBindingData.createFormBindingData(data);

      try {
        formProvider.updateForm(formId, bindingData, (error: BusinessError<void> | null) => {
          if (error != null && error?.code != 0) {
            hilog.info(DOMAIN, TAG, `UpdateFormTest002 error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(16501001);
          } else {
            hilog.info(DOMAIN, TAG, 'UpdateFormTest002 success');
            expect().assertFail();
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `UpdateFormTest002 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'UpdateFormTest002 end');
    })

    /**
     * @tc.name   UpdateFormTest003
     * @tc.number UpdateFormTest003
     * @tc.desc   check UpdateForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UpdateFormTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormTest003 start');

      let data: Record<string, string> = {
        'testData1': 'testVal1',
        'testData2': 'testVal2'
      };
      let bindingData = formBindingData.createFormBindingData(data);

      try {
        let falseFormId = '123123123';
        formProvider.updateForm(falseFormId, bindingData, (error: BusinessError<void> | null) => {
          if (error != null && error?.code != 0) {
            hilog.info(DOMAIN, TAG, `UpdateFormTest003 error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(16501001);
          } else {
            hilog.info(DOMAIN, TAG, 'UpdateFormTest003 success');
            expect().assertFail();
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `UpdateFormTest003 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'UpdateFormTest003 end');
    })

    /**
     * @tc.name   UpdateFormTest004
     * @tc.number UpdateFormTest004
     * @tc.desc   check UpdateForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UpdateFormTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormTest004 start');

      let data: Record<string, string> = {
        'testData1': 'testVal1',
        'testData2': 'testVal2'
      };
      let bindingData = formBindingData.createFormBindingData(data)
      let falseFormId = '123123123';
      try {
        formProvider.updateForm(falseFormId, bindingData).then(() => {
          hilog.info(DOMAIN, TAG, `UpdateFormTest004 success`);
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `UpdateFormTest004 error, code: ${error?.code}, message: ${error?.message}`);
          expect(error?.code).assertEqual(16501001);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `UpdateFormTest004 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'UpdateFormTest003 end');
    })

    /**
     * @tc.name   OpenFormManagerTest001
     * @tc.number OpenFormManagerTest001
     * @tc.desc   check OpenFormManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OpenFormManagerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OpenFormManagerTest001 start');

      try {
        let want: Want = {
          deviceId: '', // An empty deviceId indicates the local device.
          bundleName: bundleName,
          abilityName: formAbilityName
        }
        expect(Utils.startAbility(
          'EntryAbility',
          bundleName,
        )).assertTrue();
        hilog.info(DOMAIN, TAG, `OpenFormManagerTest001 currentBundleName is` + bundleName);
        formProvider.openFormManager(want);
        expect(BOOL_TRUE).assertEqual(true);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `OpenFormManagerTest001 error, code: ${error?.code}, message: ${error?.message}`);
      }

      done();
      hilog.info(DOMAIN, TAG, 'OpenFormManagerTest001 end');
    })

    /**
     * @tc.name   OpenFormManagerTest002
     * @tc.number OpenFormManagerTest002
     * @tc.desc   check OpenFormManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OpenFormManagerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OpenFormManagerTest002 start');

      try {
        let want: Want = {
          deviceId: ''
        }
        expect(Utils.startAbility(
          'EntryAbility',
          bundleName,
        )).assertTrue();
        hilog.info(DOMAIN, TAG, `OpenFormManagerTest002 currentBundleName is` + bundleName);
        formProvider.openFormManager(want);
        expect().assertFail();
      } catch (error) {
        hilog.error(DOMAIN, TAG, `OpenFormManagerTest002 error, code: ${error?.code}, message: ${error?.message}`);
      }

      done();
      hilog.info(DOMAIN, TAG, 'OpenFormManagerTest002 end');
    })

    /**
     * @tc.name   OpenFormEditAbilityTest001
     * @tc.number OpenFormEditAbilityTest001
     * @tc.desc   check OpenFormEditAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OpenFormEditAbilityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OpenFormEditAbilityTest001 start');

      try {
        formProvider.openFormEditAbility(editAbilityName, formId);
        hilog.info(DOMAIN, TAG, `OpenFormEditAbilityTest001 success`);
        expect().assertFail();
      } catch (error) {
        hilog.error(DOMAIN, TAG, `OpenFormEditAbilityTest001 error, code: ${error?.code}, message: ${error?.message}`);
        expect(error?.code).assertEqual(16501001);
      }

      done();
      hilog.info(DOMAIN, TAG, 'OpenFormEditAbilityTest001 end');
    })

    /**
     * @tc.name   OpenFormEditAbilityTest002
     * @tc.number OpenFormEditAbilityTest002
     * @tc.desc   check OpenFormEditAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OpenFormEditAbilityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OpenFormEditAbilityTest002 start');

      try {
        let falseFormId = '123123123';
        formProvider.openFormEditAbility(editAbilityName, falseFormId);
        hilog.info(DOMAIN, TAG, `OpenFormEditAbilityTest002 success`);
        expect().assertFail();
      } catch (error) {
        hilog.error(DOMAIN, TAG, `OpenFormEditAbilityTest002 error, code: ${error?.code}, message: ${error?.message}`);
        expect(error?.code).assertEqual(16501001);
      }

      done();
      hilog.info(DOMAIN, TAG, 'OpenFormEditAbilityTest002 end');
    })


    /**
     * @tc.name   GetFormsInfoTest001
     * @tc.number GetFormsInfoTest001
     * @tc.desc   check GetFormsInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetFormsInfoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest001 start');

      try {
        formProvider.getFormsInfo().then((result: Array<formInfo.FormInfo>) => {
          expect(Array.isArray(result)).assertTrue();
          expect(result.length > 0).assertTrue();
          for (let i = 0; i < result.length; i++) {
            const element: formInfo.FormInfo = result[i];
            expect(element.bundleName).assertEqual(bundleName);
            expect(element.name).assertEqual(widgetName);
          }
          hilog.info(DOMAIN, TAG, `GetFormsInfoTest001 success`);
          expect(BOOL_TRUE).assertEqual(true);
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `GetFormsInfoTest001 error, code: ${error?.code}, message: ${error?.message}`);
          expect().assertFail();
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest001 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest001 end');
    })

    /**
     * @tc.name   GetFormsInfoTest002
     * @tc.number GetFormsInfoTest002
     * @tc.desc   check GetFormsInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetFormsInfoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest002 start');

      try {
        // const expectedBundleName = bundleName;
        // const expectedName = widgetName;
        formProvider.getFormsInfo((error: BusinessError<void> | null, result: Array<formInfo.FormInfo> | undefined) => {
          if (error !== null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `GetFormsInfoTest002 error, code: ${error?.code}, message: ${error?.message}`);
            expect().assertFail();
            done();
          }
          // Type guard to handle the undefined case
          if (result === undefined) {
            hilog.error(DOMAIN, TAG, 'GetFormsInfoTest002 error, result is undefined');
            expect(false).assertTrue();
          } else {
            expect(Array.isArray(result)).assertTrue();
            expect(result.length > 0).assertTrue();

            for (let i = 0; i < result.length; i++) {
              const element: formInfo.FormInfo = result[i];
              expect(element.bundleName).assertEqual(bundleName);
              expect(element.name).assertEqual(widgetName);
            }
            hilog.info(DOMAIN, TAG, `GetFormsInfoTest002 success`);
            expect(BOOL_TRUE).assertEqual(true);
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest002 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest002 end');
    })

    /**
     * @tc.name   GetFormsInfoTest003
     * @tc.number GetFormsInfoTest003
     * @tc.desc   check GetFormsInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetFormsInfoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest003 start');

      try {
        let filter: formInfo.FormInfoFilter = {
          bundleName: bundleName,
          moduleName: moduleName
        };

        formProvider.getFormsInfo(filter, (error: BusinessError<void> | null, result: Array<formInfo.FormInfo> | undefined) => {
          if (error !== null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `GetFormsInfoTest003 error, code: ${error?.code}, message: ${error?.message}`);
            expect(false).assertTrue();
            done();
          }
          // Type guard to handle the undefined case
          if (result === undefined) {
            hilog.error(DOMAIN, TAG, 'GetFormsInfoTest003 error: result is undefined');
            expect(false).assertTrue();
          } else {
            expect(Array.isArray(result)).assertTrue();
            expect(result.length > 0).assertTrue();
            for (let i = 0; i < result.length; i++) {
              const element: formInfo.FormInfo = result[i];
              expect(element.bundleName).assertEqual(bundleName);
              expect(element.name).assertEqual(widgetName);
            }
            hilog.info(DOMAIN, TAG, `GetFormsInfoTest003 success`);
            expect(BOOL_TRUE).assertEqual(true);
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest003 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest003 end');
    })

    /**
     * @tc.name   GetFormsInfoTest004
     * @tc.number GetFormsInfoTest004
     * @tc.desc   check GetFormsInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetFormsInfoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest004 start');

      try {

        let filter: formInfo.FormInfoFilter = {
          bundleName: '',
          moduleName: ''
        };

        formProvider.getFormsInfo(filter, (error: BusinessError<void> | null, result: Array<formInfo.FormInfo> | undefined) => {
          if (error !== null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `GetFormsInfoTest004 error, code: ${error?.code}, message: ${error?.message}`);
            if (error?.code === 401) {
              expect(BOOL_TRUE).assertEqual(true);
            } else {
              expect().assertFail();
            }
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest004 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'GetFormsInfoTest004 end');
    })

    /**
     * @tc.name   IsRequestPublishFormSupportedTest001
     * @tc.number IsRequestPublishFormSupportedTest001
     * @tc.desc   check IsRequestPublishFormSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IsRequestPublishFormSupportedTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported start');

      try {
        formProvider.isRequestPublishFormSupported().then(() => {
          hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported success');
          expect(BOOL_TRUE).assertEqual(true);
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `IsRequestPublishFormSupported error, code: ${error?.code}, message: ${error?.message}`);
          expect().assertFail();
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `IsRequestPublishFormSupported error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported end');
    })

    /**
     * @tc.name   IsRequestPublishFormSupportedTest002
     * @tc.number IsRequestPublishFormSupportedTest002
     * @tc.desc   check IsRequestPublishFormSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IsRequestPublishFormSupportedTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported start');

      try {
        formProvider.isRequestPublishFormSupported((error: BusinessError<void> | null, result: boolean | undefined) => {
          hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported success');
          expect(BOOL_TRUE).assertEqual(true);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `IsRequestPublishFormSupported error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'IsRequestPublishFormSupported end');
    })

    /**
     * @tc.name   RequestPublishFormTest001
     * @tc.number RequestPublishFormTest001
     * @tc.desc   check RequestPublishForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestPublishFormTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest001 start');

      try {
        let wantParams: Record<string, RecordData> = {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry",
          "ohos.extra.param.key.form_is_theme": true,
        }
        let want: Want = {
          bundleName: bundleName,
          abilityName: formAbilityName,
          parameters: wantParams
        }
        formProvider.requestPublishForm(want, (error: BusinessError<void> | null, data: string | undefined) => {
          if (error != null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `RequestPublishFormTest001 error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(202);
          } else {
            hilog.info(DOMAIN, TAG, 'RequestPublishFormTest001 success');
            expect().assertFail();
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `RequestPublishFormTest001 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest001 end');
    })

    /**
     * @tc.name   RequestPublishFormTest002
     * @tc.number RequestPublishFormTest002
     * @tc.desc   check RequestPublishForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestPublishFormTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest002 start');

      try {
        let wantParams: Record<string, RecordData> = {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry",
          "ohos.extra.param.key.form_is_theme": true,
        }
        let want: Want = {
          bundleName: bundleName,
          abilityName: formAbilityName,
          parameters: wantParams
        }
        let param: Record<string, string> = {
          'temperature': '22c',
          'time': '22:00'
        }
        let bindingData: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);

        formProvider.requestPublishForm(want, bindingData, (error: BusinessError<void> | null, data: string | undefined) => {
          if (error != null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `RequestPublishFormTest002 error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(202);
          } else {
            hilog.info(DOMAIN, TAG, 'RequestPublishFormTest002 success');
            expect().assertFail();
          }
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `RequestPublishFormTest002 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest002 end');
    })

    /**
     * @tc.name   RequestPublishFormTest003
     * @tc.number RequestPublishFormTest003
     * @tc.desc   check RequestPublishForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestPublishFormTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest003 start');

      try {
        let wantParams: Record<string, RecordData> = {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry",
          "ohos.extra.param.key.form_is_theme": true,
        }
        let want: Want = {
          bundleName: bundleName,
          abilityName: formAbilityName,
          parameters: wantParams
        }

        formProvider.requestPublishForm(want).then((data: string | undefined) => {
          hilog.info(DOMAIN, TAG, 'RequestPublishFormTest003 promise success');
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `RequestPublishFormTest003 error, code: ${error?.code}, message: ${error?.message}`);
          expect(error.code).assertEqual(202);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `RequestPublishFormTest003 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'RequestPublishFormTest003 end');
    })

    /**
     * @tc.name   RequestPublishFormTest004
     * @tc.number RequestPublishFormTest004
     * @tc.desc   check RequestPublishForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestPublishFormTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE_TAG: string = 'RequestPublishFormTest004';
      hilog.info(DOMAIN, TAG, `${CASE_TAG} start`);

      try {
        let wantParams: Record<string, RecordData> = {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry",
          "ohos.extra.param.key.form_is_theme": true,
        }
        let want: Want = {
          bundleName: bundleName,
          abilityName: formAbilityName,
          parameters: wantParams
        }
        let param: Record<string, string> = {
          'temperature': '22c',
          'time': '22:00'
        }
        let bindingData: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);

        formProvider.requestPublishForm(want, bindingData).then((data: string) => {
          hilog.info(DOMAIN, TAG, `${CASE_TAG} success`);
          expect().assertFail();
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `${CASE_TAG} error, code: ${error?.code}, message: ${error?.message}`);
          expect(error.code).assertEqual(202);
        });
      } catch (error: Error) {
        hilog.error(DOMAIN, TAG, `${CASE_TAG} error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, `${CASE_TAG} end`);
    })

    /**
     * @tc.name   RequestPublishFormTest005
     * @tc.number RequestPublishFormTest005
     * @tc.desc   check RequestPublishForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestPublishFormTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE_TAG: string = 'RequestPublishFormTest005';
      hilog.info(DOMAIN, TAG, `${CASE_TAG} start`);

      try {
        let want: Want = {
          bundleName: ''
        }
        formProvider.requestPublishForm(want, (error: BusinessError<void> | null, data: string | undefined) => {
          if (error != null && error?.code != 0) {
            hilog.error(DOMAIN, TAG, `${CASE_TAG} error, code: ${error?.code}, message: ${error?.message}`);
            expect(error?.code).assertEqual(202);
          } else {
            hilog.info(DOMAIN, TAG, `${CASE_TAG} success`);
            expect().assertFail();
          }
        });
      } catch (error: Error) {
        hilog.error(DOMAIN, TAG, `${CASE_TAG} error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, `${CASE_TAG} end`);
    })

    /**
     * @tc.name   GetPublishedRunningFormInfosTest001
     * @tc.number GetPublishedRunningFormInfosTest001
     * @tc.desc   check GetPublishedRunningFormInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetPublishedRunningFormInfosTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE_TAG: string = 'GetPublishedRunningFormInfosTest001';
      hilog.info(DOMAIN, TAG, `${CASE_TAG} start`);
      formProvider.getPublishedRunningFormInfos().then((result: Array<formInfo.RunningFormInfo>) => {
        hilog.info(DOMAIN, TAG, `${CASE_TAG} success, data: ${JSON.stringify(result)}`);
        done();
      }).catch((error: Error) => {
        hilog.info(DOMAIN, TAG, `${CASE_TAG} catch: ${JSON.stringify(error)}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, TAG, `${CASE_TAG} error`);
          expect().assertFail();
        }
        done();
      });
      hilog.info(DOMAIN, TAG, `${CASE_TAG} end`);
    })

    /**
     * @tc.name   GetPublishedRunningFormInfoByIdTest001
     * @tc.number GetPublishedRunningFormInfoByIdTest001
     * @tc.desc   check GetPublishedRunningFormInfoById
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetPublishedRunningFormInfoByIdTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE_TAG: string = 'GetPublishedRunningFormInfoByIdTest001';
      hilog.info(DOMAIN, TAG, `${CASE_TAG} start`);

      formProvider.getPublishedRunningFormInfoById(formId).then((result: formInfo.RunningFormInfo) => {
        hilog.info(DOMAIN, TAG, `${CASE_TAG} success`);
        expect().assertFail();
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `GetPublishedRunningFormInfoByIdTest001 error, code: ${error?.code}, message: ${error?.message}`);
      });

      done();
      hilog.info(DOMAIN, TAG, `${CASE_TAG} end`);
    })

    /**
     * @tc.name   GetPublishedRunningFormInfoByIdTest002
     * @tc.number GetPublishedRunningFormInfoByIdTest002
     * @tc.desc   check GetPublishedRunningFormInfoById
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetPublishedRunningFormInfoByIdTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let CASE_TAG: string = 'GetPublishedRunningFormInfoByIdTest002';
      hilog.info(DOMAIN, TAG, `${CASE_TAG} start`);

      let falseFormId = "123123123";
      formProvider.getPublishedRunningFormInfoById(falseFormId).then((result: formInfo.RunningFormInfo) => {
        hilog.info(DOMAIN, TAG, `${CASE_TAG} success`);
        expect().assertFail();
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `${CASE_TAG} error, code: ${error?.code}, message: ${error?.message}`);
      });

      done();
      hilog.info(DOMAIN, TAG, `${CASE_TAG} end`);
    })
  });
}