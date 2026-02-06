/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import formProvider from "@ohos.app.form.formProvider"
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { DATA_TYPE_LIST, getFuzzData } from './getParam.ets';


export const openFormEditAbilityFuzzTest = (describeName:string, filterParameter:number) => {

  const OPEN_FORM_EDIT_ABILITY_ERR_CODE = [ '401', '801', '16500050', '16500100', '16501000', '16501003', '16501007' ];
  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_openFormEditAbility`;
    const promiseName = `FMS_fuzzTest_openFormEditAbility`;
    const length: number = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber: string = `0${(i + 1) * 100}`;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_openFormEditAbility_0100 ~ FMS_fuzzTest_openFormEditAbility_0800
       * @tc.desc Check whether the openFormEditAbility interface can pass the fuzzy test.
       */
      it(`${callbackName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const dataType: string = DATA_TYPE_LIST[i];
        const abilityName: string = getFuzzData(dataType) as string;
        const formId: string = getFuzzData(dataType) as string;
        console.log(`${promiseName} ${tcNumber} ${describeName} abilityName typeof: ${typeof abilityName}`);
        try {
          formProvider.openFormEditAbility(abilityName, formId);
        } catch (err) {
          console.log(`${err} ${JSON.stringify(err)}`);
          let index = OPEN_FORM_EDIT_ABILITY_ERR_CODE.findIndex((id) => {
            return id === String(err?.code);
          })
          expect(index).not().assertEqual(-1);
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      let tcNumber: string | number = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_openFormEditAbility_0900 ~ FMS_fuzzTest_openFormEditAbility_1600
       * @tc.desc Check whether the openFormEditAbility interface can pass the fuzzy test
       */
      it(`${promiseName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const dataType: string = DATA_TYPE_LIST[i];
        const abilityName: string = getFuzzData(dataType) as string;
        const formId: string = getFuzzData(dataType) as string;
        const isMainPage: boolean = getFuzzData(dataType) as boolean;

        console.log(`${promiseName} ${tcNumber} ${describeName} abilityName typeof: ${typeof abilityName}`);
        try {
          formProvider.openFormEditAbility(abilityName, formId, isMainPage);
        } catch (err) {
          console.log(`${err} ${JSON.stringify(err)}`);
          let index = OPEN_FORM_EDIT_ABILITY_ERR_CODE.findIndex((id) => {
            return id === String(err?.code);
          })
          expect(index).not().assertEqual(-1);
        }
      });
    }
  });
};
