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

import HttpProtocolTest from './HttpProtocol.test';
import HttpDataTypeTest from './HttpDataType.test';
import HttpMultiFormDataListTest from './HttpMultiFormDataList.test';
import HttpClientCertTest from './HttpClientCert.test';
import HttpCertificatePinTest from './HttpCertificatePin.test';
import connection from '@ohos.net.connection';
let netHandle = connection.getDefaultNetSync();

export default function testsuite() {
  if(netHandle.netId >= 100){
	HttpProtocolTest();
 	HttpDataTypeTest();
  	HttpMultiFormDataListTest();
  	HttpClientCertTest();
  }
HttpCertificatePinTest();
}
