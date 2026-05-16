/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License")
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import HttpCreateHttpResponseCacheTest from './HttpCreateHttpResponseCache.test';
import HttpFlushTest from './HttpFlush.test';
import HttpDeleteTest from './HttpDelete.test';
import EmptyTestCheckCard from './EmptyTestCheckCard.test';
import EmptyTestCheckNetwork from './EmptyTestCheckNetwork.test';
import sim from '@ohos.telephony.sim';
import connection from '@ohos.net.connection';
 	 
let netHandle = connection.getDefaultNetSync();
 	 
export default function testsuite() {
  if (sim.getMaxSimCount()>1){
    if(netHandle.netId != 0){
      HttpCreateHttpResponseCacheTest();
      HttpFlushTest();
      HttpDeleteTest();
    } else {
      EmptyTestCheckNetwork();
    }
  }else{
    EmptyTestCheckCard();
  }
}