/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import AudioEffectTest from './AudioEffect.test'
import audioRendererTest from './AudioRenderer.test'    
import audioRendererTestPc from './AudioRendererPc.test'    
import AudioRendererInterruptUnitTest from './AudioRenderInterrupt.test'
import maxAmplitudeFor from './MaxAmplitudeFor.test'
import call from  '@ohos.telephony.call'
import audioSessionManagerTest from  './AudioSessionManager.test'
import audioSessionManagerErrorTest from  './AudioSessionManagerError.test'


let voice = call.hasVoiceCapability()
export default function testsuite() {
    if (voice){
        audioSessionManagerTest()
        audioSessionManagerErrorTest()
        audioRendererTest()
        AudioRendererInterruptUnitTest()
        AudioEffectTest()
        maxAmplitudeFor()
    }else{
        audioRendererTestPc();
    }
        
    
}