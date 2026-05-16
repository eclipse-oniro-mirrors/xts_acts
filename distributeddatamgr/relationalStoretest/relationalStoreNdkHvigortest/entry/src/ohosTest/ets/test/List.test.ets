/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import rdbConfigV2NdkTest from './Ability.test';
import rdbValueNdkTest from './rdbValueNdkTest.test';
import transactionNdktest from './transactionNdk.test';
import rdbCryptoParamNdkTest from './rdbCryptoParam.test';
import rdbInterfaceNdkTest from './RdbInterfaceNdk.test';
import rdbRekeyExNdkTest from './RdbRekeyEx.test';
import rdbReturningNdkTest from './RdbReturning.test';

export default function testsuite() {
  rdbConfigV2NdkTest();
  rdbValueNdkTest();
  transactionNdktest();
  rdbCryptoParamNdkTest();
  rdbInterfaceNdkTest();
  rdbRekeyExNdkTest();
  rdbReturningNdkTest();
}