/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import formProvider from '@ohos.application.formProvider';
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { DATA_TYPE_LIST, getFuzzData } from './getParam.ets';

export const setFormNextRefreshTimeFuzzTest = (describeName:string, filterParameter:number) => {
  const ERR_COMMON_CODE = 1;
  const ERR_COMMON = `internal error`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;
  const ERR_NOT_EXIST_ID_CODE = 9;
  const ERR_NOT_EXIST_ID = `the ID of the form to be operated does not exist`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_setnexttime`;
    const promiseName = `FMS_fuzzTest_setnexttime`;
    const length:number = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name   ${callbackName}_${tcNumber}
       * @tc.number FMS_fuzzTest_setnexttime_0100 ~ FMS_fuzzTest_setnexttime_0800
       * @tc.desc   Check whether the setFormNextRefreshTime interface can pass the fuzzy test (by AsyncCallback)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${callbackName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = getFuzzData(dataType) as string;
        const nextTime = 5;
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} nextTime typeof: ${typeof nextTime}`);
        try {
          formProvider.setFormNextRefreshTime(formId, nextTime, (error, data) => {
            console.log(`${callbackName} ${tcNumber} setFormNextRefreshTime data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
            done();
          });
        } catch (error) {
          console.log(`${callbackName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          console.log(`${callbackName} ${tcNumber} should not reach here`);
          expect().assertFail();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      let tcNumber: string | number = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name   ${promiseName}_${tcNumber}
       * @tc.number FMS_fuzzTest_setnexttime_0900 ~ FMS_fuzzTest_setnexttime_1600
       * @tc.desc   Check whether the setFormNextRefreshTime interface can pass the fuzzy test (by Promise)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${promiseName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = getFuzzData(dataType) as string;
        const nextTime = 5;
        console.log(`${promiseName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} nextTime typeof: ${typeof nextTime}`);
        try {
          const data = await formProvider.setFormNextRefreshTime(formId, nextTime);
          console.log(`${promiseName} ${tcNumber} setFormNextRefreshTime data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      const tcNumber: number = (i + 1 + length * 2) * 100;
      /**
       * @tc.name   ${callbackName}_${tcNumber}
       * @tc.number FMS_fuzzTest_setnexttime_1700 ~ FMS_fuzzTest_setnexttime_2400
       * @tc.desc   Check whether the setFormNextRefreshTime interface can pass the fuzzy test (by AsyncCallback)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${callbackName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = `${tcNumber}`;
        const nextTime:number = getFuzzData(dataType) as number;
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} nextTime typeof: ${typeof nextTime}`);
        try {
          formProvider.setFormNextRefreshTime(formId, nextTime, (error, data) => {
            console.log(`${callbackName} ${tcNumber} setFormNextRefreshTime data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            if (`number` === typeof nextTime) {
              if (ERR_NOT_EXIST_ID_CODE === error.code) {
                expect(error.message).assertEqual(ERR_NOT_EXIST_ID);
              } else if (ERR_ADD_INVALID_PARAM_CODE === error.code) {
                expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
              } else {
                console.log(`${callbackName} ${tcNumber} should not reach here`);
                expect().assertFail();
              }
            } else {
              expect(error.code).assertEqual(ERR_COMMON_CODE);
              expect(error.message).assertEqual(ERR_COMMON);
            }
            done();
          });
        } catch (error) {
          console.log(`${callbackName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          console.log(`${callbackName} ${tcNumber} should not reach here`);
          expect().assertFail();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      const tcNumber: number = (i + 1 + length * 3) * 100;
      /**
       * @tc.name   ${promiseName}_${tcNumber}
       * @tc.number FMS_fuzzTest_setnexttime_2500 ~ FMS_fuzzTest_setnexttime_3200
       * @tc.desc   Check whether the setFormNextRefreshTime interface can pass the fuzzy test (by Promise)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${promiseName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = `${tcNumber}`;
        const nextTime:number = getFuzzData(dataType) as number;
        console.log(`${promiseName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} nextTime typeof: ${typeof nextTime}`);
        try {
          const data = await formProvider.setFormNextRefreshTime(formId, nextTime);
          console.log(`${promiseName} ${tcNumber} setFormNextRefreshTime data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`number` === typeof nextTime) {
            if (ERR_NOT_EXIST_ID_CODE === error.code) {
              expect(error.message).assertEqual(ERR_NOT_EXIST_ID);
            } else if (ERR_ADD_INVALID_PARAM_CODE === error.code) {
              expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
            } else {
              console.log(`${promiseName} ${tcNumber} should not reach here`);
              expect().assertFail();
            }
          } else {
            expect(error.code).assertEqual(ERR_COMMON_CODE);
            expect(error.message).assertEqual(ERR_COMMON);
          }
          done();
        }
      });
    }
  });
};
