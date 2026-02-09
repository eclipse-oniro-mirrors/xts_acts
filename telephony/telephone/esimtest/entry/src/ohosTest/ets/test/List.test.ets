/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import EmptyTest from './Empty.test';
import EsimPublic1 from './EsimPublic1.test';
import eSIM from '@ohos.telephony.esim';
const SLOT_0: number = 0;
const SLOT_1: number = 1;

export default function testsuite() {
    if (canIUse("SystemCapability.Telephony.CoreService.Esim")) {
     let slotId=-1
     if (eSIM.isSupported(SLOT_0)) {
        slotId=0
      } else if(eSIM.isSupported(SLOT_1)) {
        slotId=1
      }
     if(slotId!=-1){
       EsimPublic1();
     }else{
       EmptyTest();
     }
    } else {
      EmptyTest();
    }
}