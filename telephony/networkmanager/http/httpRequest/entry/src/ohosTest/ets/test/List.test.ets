/**
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import HttpRequestDataCATest from './HttpRequestCAData.test';
import HttpRequestMethodTest from './HttpRequestMethod.test';
import HttpRequestAndDestroyTest from './HttpRequestAndDestory.test';
import HttpRequestInStreamTest from './HttpRequestInStream.test';
import HttpRequestOptionsTest from './HttpRequestOptions.test';
import EmptyTest from './Empty.test';
import sim from '@ohos.telephony.sim';
import httpErrorCodeTest from './HttpErrorCodeTest.test';
import HttpRequestGmssl from './HttpRequestGmssl.test.ets';

export default function testsuite() {
if (sim.getMaxSimCount()>1){
  HttpRequestGmssl();
  HttpRequestDataCATest();
  HttpRequestMethodTest();
  HttpRequestAndDestroyTest();
  HttpRequestInStreamTest();
  HttpRequestOptionsTest();
  httpErrorCodeTest();
  }else{
    EmptyTest()
  }
}
