/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { common } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';

const DOMAIN: Int = 0x0000;
const TAG: string = 'testTag formProviderTest';
const BOOL_TRUE: boolean = true;
const ERROR_CODE = 16501000;
const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500100;
const ERROR_CODE3 = 801;
const ERROR_CODE4 = 16500050;
const ERROR_CODE5 = 16500060;
const ERROR_CODE6 = 16501002;
const ERROR_CODE7 = 16501003;
const ERROR_CODE8 = 16501007;
const ERROR_CODE9 = 16501015;
const ERROR_CODE10 = 16501001;
const ERROR_CODE11 = 16501011;

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

    afterEach(async (): Promise<void> => {
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
          expect(error?.code).assertEqual(ERROR_CODE10);
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
          expect(error?.code).assertEqual(ERROR_CODE10);
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
            expect(error?.code).assertEqual(ERROR_CODE10);
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
          expect(error?.code).assertEqual(ERROR_CODE10);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `SetFormNextRefreshTimeTest004 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'SetFormNextRefreshTimeTest004 end');
    })

    /**
     * @tc.name   SetFormNextRefreshTimeTest005
     * @tc.number SetFormNextRefreshTimeTest005
     * @tc.desc   check SetFormNextRefreshTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
        it('SetFormNextRefreshTimeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          let itName: string = 'SetFormNextRefreshTimeTest005';
          hilog.info(DOMAIN, TAG, `${itName} start`);
          try {
            formProvider.setFormNextRefreshTime('', 123).then(() => {
              hilog.info(DOMAIN, TAG, `${itName} then success`);
              expect().assertFail();
            });
            hilog.info(DOMAIN, TAG, `${itName} callBack start`);
            formProvider.setFormNextRefreshTime('', 123, () => {
              hilog.error(DOMAIN, TAG, `${itName} callBack success`);
            });
            hilog.info(DOMAIN, TAG, `${itName} setFormNextRefreshTime end`);
          } catch (error) {
            hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
            if (error?.code === ERROR_CODE) {
              expect(error.code).assertEqual(ERROR_CODE);
            } else if (error?.code === ERROR_CODE1) {
              expect(error.code).assertEqual(ERROR_CODE1);
            } else if (error?.code === ERROR_CODE2) {
              expect(error.code).assertEqual(ERROR_CODE2);
            } else if (error?.code === ERROR_CODE3) {
              expect(error.code).assertEqual(ERROR_CODE3);
            } else if (error?.code === ERROR_CODE4) {
              expect(error.code).assertEqual(ERROR_CODE4);
            } else if (error?.code === ERROR_CODE5) {
              expect(error.code).assertEqual(ERROR_CODE5);
            } else if (error?.code === ERROR_CODE6) {
              expect(error.code).assertEqual(ERROR_CODE6);
            } else if (error?.code === ERROR_CODE7) {
              expect(error.code).assertEqual(ERROR_CODE7);
            } else {
              expect().assertFail();
            }
          }
          done();
          hilog.info(DOMAIN, TAG, `${itName} end`);
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
          expect(error?.code).assertEqual(ERROR_CODE10);
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
            expect(error?.code).assertEqual(ERROR_CODE10);
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
            expect(error?.code).assertEqual(ERROR_CODE10);
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
          expect(error?.code).assertEqual(ERROR_CODE10);
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `UpdateFormTest004 error, code: ${error?.code}, message: ${error?.message}`);
        expect().assertFail();
      }

      done();
      hilog.info(DOMAIN, TAG, 'UpdateFormTest003 end');
    })

    /**
     * @tc.name   UpdateFormTest005
     * @tc.number UpdateFormTest005
     * @tc.desc   check UpdateForm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UpdateFormTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'UpdateFormTest005';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        let ProxyDatasEmpty: formBindingData.ProxyData[] = [];
        let bindingData: formBindingData.FormBindingData = {
            data: "com.example.test123",
            proxies: ProxyDatasEmpty
        }
        formProvider.updateForm('', bindingData).then(() => {
          hilog.info(DOMAIN, TAG, `${itName} empty proxies, then success`);
          expect().assertFail();
        });
        hilog.info(DOMAIN, TAG, `${itName} empty proxies, callBack start`);
        formProvider.updateForm('', bindingData, () => {
          hilog.info(DOMAIN, TAG, `${itName} empty proxies, callBack success`);
        });
        let ProxyData1: formBindingData.ProxyData = {
          key: '',
          subscriberId: ''
        }
        let ProxyData2: formBindingData.ProxyData = {
          key: '123',
          subscriberId: '123'
        }
        let ProxyDatas: formBindingData.ProxyData[] = [ProxyData1, ProxyData2];
        let bindingData1: formBindingData.FormBindingData = {
          data: "com.example.test123",
          proxies: ProxyDatas
        }
        formProvider.updateForm('', bindingData1).then(() => {
          hilog.info(DOMAIN, TAG, `${itName} notEmpty proxies, then success`);
          expect().assertFail();
        });
        hilog.info(DOMAIN, TAG, `${itName} notEmpty proxies, callBack start`);
        formProvider.updateForm('', bindingData1, () => {
          hilog.info(DOMAIN, TAG, `${itName} notEmpty proxies, callBack success`);
        });
        hilog.info(DOMAIN, TAG, `${itName} updateForm end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error?.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
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
        expect(await Utils.startAbility(
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
        expect(await Utils.startAbility(
          'EntryAbility',
          bundleName,
        )).assertTrue();
        hilog.info(DOMAIN, TAG, `OpenFormManagerTest002 currentBundleName is` + bundleName);
        formProvider.openFormManager(want);
        expect().assertFail();
      } catch (error) {
        hilog.error(DOMAIN, TAG, `OpenFormManagerTest002 error, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error?.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE4) {
          expect(error?.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE1) {
          expect(error?.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error?.code).assertEqual(ERROR_CODE2);
        }
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
        expect(error?.code).assertEqual(ERROR_CODE10);
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
        expect(error?.code).assertEqual(ERROR_CODE10);
      }

      done();
      hilog.info(DOMAIN, TAG, 'OpenFormEditAbilityTest002 end');
    })

    /**
     * @tc.name   OpenFormEditAbilityTest003
     * @tc.number OpenFormEditAbilityTest003
     * @tc.desc   check OpenFormEditAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
        it('OpenFormEditAbilityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
          let itName: string = 'OpenFormEditAbilityTest003';
          hilog.info(DOMAIN, TAG, `${itName} start`);
          try {
            let abilityName: string = '';
            let formId: string = '';
            hilog.info(DOMAIN, TAG, `${itName} isMainPage is true`);
            formProvider.openFormEditAbility(abilityName, formId, true);
            hilog.info(DOMAIN, TAG, `${itName} isMainPage is false`);
            formProvider.openFormEditAbility(abilityName, formId, false);
            hilog.info(DOMAIN, TAG, `${itName} success`);
            expect().assertFail();
          } catch (error) {
            hilog.error(DOMAIN, TAG, `${itName} catch error, code:${error?.code}, message:${error?.message}`);
            if (error?.code === ERROR_CODE) {
              expect(error?.code).assertEqual(ERROR_CODE);
            } else if (error?.code === ERROR_CODE2) {
              expect(error?.code).assertEqual(ERROR_CODE2);
            } else if (error?.code === ERROR_CODE3) {
              expect(error?.code).assertEqual(ERROR_CODE3);
            } else if (error?.code === ERROR_CODE4) {
              expect(error?.code).assertEqual(ERROR_CODE4);
            } else if (error?.code === ERROR_CODE7) {
              expect(error?.code).assertEqual(ERROR_CODE7);
            } else if (error?.code === ERROR_CODE8) {
              expect(error?.code).assertEqual(ERROR_CODE8);
            } else if (error?.code === ERROR_CODE1) {
              expect(error?.code).assertEqual(ERROR_CODE1);
            }
          }
          done();
          hilog.info(DOMAIN, TAG, `${itName} end`);
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
            expect(moduleName).assertEqual(element.moduleName as string);
            expect(formAbilityName).assertEqual(element.abilityName as string);
            expect('widget displayName').assertEqual(element.displayName as string);
            expect('This is a widget description').assertEqual(element.description as string);
            expect('').assertEqual(element.jsComponentName as string);
            expect('10:30').assertEqual(element.scheduledUpdateTime as string);
            expect('').assertEqual(element.formConfigAbility as string);
            expect(0).assertEqual(element.displayNameId);
            expect(0).assertEqual(element.descriptionId);
            expect(1).assertEqual(element.updateDuration);
            expect(2).assertEqual(element.defaultDimension);
            expect(formInfo.FormType.JS).assertEqual(element.type);
            expect(1).assertEqual(element.supportDimensions.length);
            expect(6).assertEqual(Object.keys(element.customizeData).length);
            expect(1).assertEqual(element.supportedShapes.length);
            expect(false).assertEqual(element.transparencyEnabled as boolean);
            expect(true).assertEqual(element.isDynamic as boolean);
            expect(false).assertEqual(element.formVisibleNotify as boolean);
            expect(true).assertEqual(element.isDefault as boolean);
            expect(false).assertEqual(element.updateEnabled as boolean);
          }
          hilog.info(DOMAIN, TAG, `GetFormsInfoTest001 success`);
          expect(BOOL_TRUE).assertEqual(true);
        }).catch((error: Error) => {
          hilog.error(DOMAIN, TAG, `GetFormsInfoTest001 error, code: ${error?.code}, message: ${error?.message}`);
          expect().assertFail();
        });
      } catch (error) {
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest001 catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        }
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
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest002 catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        }
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
        hilog.error(DOMAIN, TAG, `GetFormsInfoTest003 catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else {
          expect().assertFail();
        }

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
      } catch (error) {
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
      } catch (error) {
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
     * @tc.name   GetPublishedRunningFormInfosTest002
     * @tc.number GetPublishedRunningFormInfosTest002
     * @tc.desc   check GetPublishedRunningFormInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetPublishedRunningFormInfosTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'GetPublishedRunningFormInfosTest002';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        formProvider.getPublishedRunningFormInfos().then((result: Array<formInfo.RunningFormInfo>) => {
          hilog.info(DOMAIN, TAG, `${itName} then success, result: ${JSON.stringify(result)}`);
        });
        hilog.info(DOMAIN, TAG, `${itName} getPublishedRunningFormInfos end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
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

    /**
     * @tc.name   GetPublishedRunningFormInfoByIdTest003
     * @tc.number GetPublishedRunningFormInfoByIdTest003
     * @tc.desc   check GetPublishedRunningFormInfoById
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetPublishedRunningFormInfoByIdTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'GetPublishedRunningFormInfoByIdTest003';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        formProvider.getPublishedRunningFormInfoById('').then((data: formInfo.RunningFormInfo) => {
          hilog.info(DOMAIN, TAG, `${itName} then, data: ${JSON.stringify(data)}`);
          expect(data.formId.length > 0).assertTrue();
          expect(data.bundleName.length > 0).assertTrue();
          expect(data.hostBundleName.length > 0).assertTrue();
          expect(data.formLocation).assertEqual(formInfo.FormLocation.SCREEN_LOCK);
          expect(data.visibilityType).assertEqual(formInfo.VisibilityType.FORM_VISIBLE);
          expect(data.moduleName.length > 0).assertTrue();
          expect(data.moduleName.length > 0).assertTrue();
          expect(data.formName.length > 0).assertTrue();
          expect(data.dimension > 0).assertTrue();
          expect(data.formUsageState).assertEqual(formInfo.FormUsageState.USED);
          expect(data.formDescription.length > 0).assertTrue();
          expect(data.extraData).assertUndefined();
          done();
        });
        hilog.info(DOMAIN, TAG, `${itName} getPublishedRunningFormInfoById end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE9) {
          expect(error.code).assertEqual(ERROR_CODE9);
        }  else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if (error?.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   CloseFormEditAbilityTest001
     * @tc.number CloseFormEditAbilityTest001
     * @tc.desc   check closeFormEditAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CloseFormEditAbilityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'CloseFormEditAbilityTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        formProvider.closeFormEditAbility();
        hilog.info(DOMAIN, TAG, `${itName} isMainPage is true`);
        formProvider.closeFormEditAbility(true);
        hilog.info(DOMAIN, TAG, `${itName} isMainPage is false`);
        formProvider.closeFormEditAbility(false);
        hilog.info(DOMAIN, TAG, `${itName} closeFormEditAbility end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE9) {
          expect(error.code).assertEqual(ERROR_CODE9);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   RequestOverflowTest001
     * @tc.number RequestOverflowTest001
     * @tc.desc   check requestOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RequestOverflowTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'RequestOverflowTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        let infoRect: formInfo.Rect = {
          left: -30,
          top: -30,
          width: 200,
          height: 200
        }
        let overflowInfo: formInfo.OverflowInfo = {
          area: infoRect,
          duration: 123,
          useDefaultAnimation: true
        }
        
        formProvider.requestOverflow('', overflowInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${itName} then success`);
        });
        hilog.info(DOMAIN, TAG, `${itName} requestOverflow end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error?.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if (error?.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else if (error?.code === ERROR_CODE11) {
          expect(error.code).assertEqual(ERROR_CODE11);
        }else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   CancelOverflowTest001
     * @tc.number CancelOverflowTest001
     * @tc.desc   check cancelOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CancelOverflowTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'CancelOverflowTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        formProvider.cancelOverflow('').then(() => {
          hilog.info(DOMAIN, TAG, `${itName} then success`);
        });
        hilog.info(DOMAIN, TAG, `${itName} cancelOverflow end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error?.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if (error?.code === ERROR_CODE11) {
          expect(error.code).assertEqual(ERROR_CODE11);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   GetFormRectTest001
     * @tc.number GetFormRectTest001
     * @tc.desc   check getFormRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetFormRectTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'GetFormRectTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        formProvider.getFormRect('').then((data: formInfo.Rect) => {
          hilog.info(DOMAIN, TAG, `${itName} then success, data: ${JSON.stringify(data)}`);
          expect(data.left >= 0).assertTrue();
          expect(data.top >= 0).assertTrue();
          expect(data.width >= 0).assertTrue();
          expect(data.height >= 0).assertTrue();
          done();
        });
        hilog.info(DOMAIN, TAG, `${itName} getFormRect end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error?.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error?.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if (error?.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error?.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if (error?.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else {
          expect().assertFail();
        }
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   ReloadFormsTest001
     * @tc.number ReloadFormsTest001
     * @tc.desc   check reloadForms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReloadFormsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'ReloadFormsTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>("abilityContext");
        if (context) {
          formProvider.reloadForms(context, 'moduleName', 'abilityName', 'formName').then((data: int) => {
            hilog.info(DOMAIN, TAG, `${itName} then success, data: ${data}`);
          });
        }
        hilog.info(DOMAIN, TAG, `${itName} reloadForms end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        expect(error.code).assertEqual(ERROR_CODE);
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })

    /**
     * @tc.name   ReloadAllFormsTest001
     * @tc.number ReloadAllFormsTest001
     * @tc.desc   check reloadAllForms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReloadAllFormsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let itName: string = 'ReloadAllFormsTest001';
      hilog.info(DOMAIN, TAG, `${itName} start`);
      try {
        let context: common.UIAbilityContext|undefined = AppStorage.get<common.UIAbilityContext>("abilityContext");
        if (context) {
          formProvider.reloadAllForms(context).then((data: int) => {
            hilog.info(DOMAIN, TAG, `${itName} then success, data: ${data}`);
          });
        }
        hilog.info(DOMAIN, TAG, `${itName} reloadAllForms end`);
      } catch (error) {
        hilog.error(DOMAIN, TAG, `${itName} catch, code:${error?.code}, message:${error?.message}`);
        expect(error.code).assertEqual(ERROR_CODE);
      }
      done();
      hilog.info(DOMAIN, TAG, `${itName} end`);
    })
    
  });
}