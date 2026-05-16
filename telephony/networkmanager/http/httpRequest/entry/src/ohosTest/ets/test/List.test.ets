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
import HttpRequestInterceptor from './HttpRequestInterceptor.test';
import HttpRequestMaxAutoRedirectsTest from './HttpRequestRedirects.test';
import HttpRequestMaxAutoRedirectsWithInterceptorTest from './HttpRequestRedirectsInterceptor.test';
import HttpRequestCustomMethodTest from './HttpRequestCustomMethod.test';
import HttpRequestSniTest from './HttpRequestSni.test';
import HttpRequestCustomResponseHeaderTest from './HttpRequestCustomResponseHeader.test';
import HttpRequestInactivityMsTest from './HttpRequestInactivityMs.test';
import HttpRequestPatchTest from './HttpRequestPatch.test';
import HttpRequestSyncTest from './HttpRequestSync.test';
import HttpRequestReuseConnectionsTest from './HttpRequestReuseConnections.test';
import HttpInterceptorForSafeCheckTest from './HttpInterceptorForSafeCheck.test';
import HttpRequestEnableAutoCookieTest from './HttpRequestEnableAutoCookie.test';
import HttpRequestSocket5Test from './HttpRequestSocket5.test';
import connection from '@ohos.net.connection';

let netHandle = connection.getDefaultNetSync();

export default function testsuite() {
  if (netHandle.netId != 0 && canIUse("SystemCapability.Communication.NetStack")) {
  HttpInterceptorForSafeCheckTest();
  HttpRequestInterceptor();
  HttpRequestMaxAutoRedirectsTest();
  HttpRequestMaxAutoRedirectsWithInterceptorTest();
  HttpRequestCustomMethodTest();
  HttpRequestCustomResponseHeaderTest();
  if (sim.getMaxSimCount() > 1) {
    HttpRequestGmssl();
    HttpRequestDataCATest();
    HttpRequestMethodTest();
    HttpRequestAndDestroyTest();
    HttpRequestInStreamTest();
    HttpRequestOptionsTest();
    HttpRequestSniTest();
    httpErrorCodeTest();
    HttpRequestInactivityMsTest();
    HttpRequestPatchTest();
    HttpRequestSyncTest();
    HttpRequestReuseConnectionsTest();
    HttpRequestEnableAutoCookieTest();
    HttpRequestSocket5Test();
    
  } else {
    EmptyTest();
  }
} else {
  EmptyTest();
}
}