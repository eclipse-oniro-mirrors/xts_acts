/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import Telephony_NETSTACK_HTTPTest from './NetworkManagerHttp.test.js';
import Http2Test from './Http2Test.test.js';
import HttpCacheTest from './HttpCacheTest.test.js';
import HttpRequest2JsunitTest from './HttpRequest2JsunitTest.test.js';
import EmptyTest from './Empty.test'
import sim from '@ohos.telephony.sim'

export default function testsuite() {
    if(sim.getMaxSimCount()>1){
        HttpCacheTest();
        Telephony_NETSTACK_HTTPTest();
        Http2Test();
        HttpRequest2JsunitTest();
    }else{
        EmptyTest()
    }
}
