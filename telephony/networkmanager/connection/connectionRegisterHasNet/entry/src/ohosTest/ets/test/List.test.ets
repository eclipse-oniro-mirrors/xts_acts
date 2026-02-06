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
import connection from '@ohos.net.connection';
import ConnectionRegisterTest from './ConnectionResgister.test';
import NetExtAttributeHasNetTest from './NetExtAttributeHasNet.test';
import ConnectionBasicTest from './ConnectionBasic.test';
import ConnectionGetNetCapabilitiesWithWifiTest from './ConnectionGetNetCapabilitiesWithWifi.test';
import EmptyTest from './Empty.test';

let netHandle = connection.getDefaultNetSync();

export default function testsuite() {
      if(netHandle.netId != 0){
        NetExtAttributeHasNetTest();
        ConnectionRegisterTest();
        ConnectionBasicTest();
        let NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        if(NetCapabilities.bearerTypes[0] == 1){
          ConnectionGetNetCapabilitiesWithWifiTest();
          }
          }else{
	      EmptyTest();
	    }
}
