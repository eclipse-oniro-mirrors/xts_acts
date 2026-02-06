/**
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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

import httpJsunit from './HttpJsunit.test';
import responseCodeJsunit from './ResponseCodeJsunit.test';
import requestMethodJsunit from './RequestMethodJsunit.test';
import httpResponseJsunit from './HttpResponseJsunit.test';
import HttpRequestOptionsJsunit from './HttpRequestOptionsJsunit.test';
import httpRequestJsunit from './HttpRequestJsunit.test';
import NetworkManagerHttpEnhanceTest from './NetworkManagerHttpEnhance.test';
import NetworkManagerMulticastHTTP1Test from './NetworkManagerMulticastHTTP1.test';
import NetworkManagerMulticastHTTP2Test from './NetworkManagerMulticastHTTP2.test';
import NetworkManagerHTTP_Multicast1Test from './NetworkManagerHTTP_Multicast1.test';
import NetworkManagerHTTP_Multicast2Test from './NetworkManagerHTTP_Multicast2.test';
import EmptyTestCheckCard from './EmptyTestCheckCard.test';
import EmptyTestCheckNetwork from './EmptyTestCheckNetwork.test';
import sim from '@ohos.telephony.sim';
import connection from '@ohos.net.connection';
 	  	 
let netHandle = connection.getDefaultNetSync();
 	 
export default function testsuite() {
  if (sim.getMaxSimCount()>1){
    if(netHandle.netId != 0){
      httpJsunit();
      responseCodeJsunit();
      requestMethodJsunit();
      httpResponseJsunit();
      HttpRequestOptionsJsunit();
      httpRequestJsunit();
      NetworkManagerHttpEnhanceTest();
      NetworkManagerMulticastHTTP1Test();
      NetworkManagerMulticastHTTP2Test();
      NetworkManagerHTTP_Multicast1Test();
      NetworkManagerHTTP_Multicast2Test();
    } else {
      EmptyTestCheckNetwork();
    }
  }else{
    EmptyTestCheckCard();
  }
}