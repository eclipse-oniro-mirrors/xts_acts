/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

const TAG = 'ParamManager';

export default class ParamManager {
  testName: string = '';

  public setTextNme(name: string) {
    this.testName = name;
  }

  public getTextNme(): string {
    return this.testName;
  }

  getResultCode(): number {
    let resultCode = 100;
    switch (this.testName) {
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1600':
        resultCode = 3 | 5;
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1500':
        resultCode = 0.111;
        break;
      default:
        break;
    }
    ;
    return resultCode;
  }

  public getParam(): {} {
    let param = {}
    switch (this.testName) {
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3800':
        param = {
          'keyForInt': 100,
          'keyForDouble': 99.99
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3700':
        param = {
          'keyForInt': 100
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3600':
        param = {
          'keyForStrArray': ["str1", "str2", "str3"]
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3400':
        param = {
          'keyForStr': "str"
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3300':
        param = {
          'keyForDouble': "a"
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3200':
        param = {
          'keyForJson': {
            "name": "张三", "age": 30, "isStudent": false, "hobbies": ["阅读", "旅行", "烹饪"]
          }
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3100':
        param = {
          'keyForJsonArray': [{
            "name": "zhang", "password": "123"
          }, {
            "name": "yang", "password": "456"
          }]
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3000':
        param = {
          'keyForDouble': [100, 200, 300, 400]
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2900':
        param = {
          'keyForInt': 1.1212
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2800':
        param = {
          'keyForDouble': 99.0123456789
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2700':
        param = {
          'keyForBigDecimal': true
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2600':
        param = {
          'keyForBigteger': 123456789101112
        };
        break;
      case 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2500':
        param = {
          'keyForBigDecimal': 1.1234567890123457
        };
        break;
      default:
        break;
    }
    return param;
  }
}