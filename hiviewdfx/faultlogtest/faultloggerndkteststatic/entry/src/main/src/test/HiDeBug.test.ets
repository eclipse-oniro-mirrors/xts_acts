/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;

export default function HidebugJsTest() {
    describe("HidebugJsTest", (): void => {

        /**
         * @tc.name   testFaultlogExtension_0100
         * @tc.number SUB_DFX_DFR_FaultlogExtension_C_0100
         * @tc.desc   test testFaultlogExtension_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testFaultlogExtension_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("====> testFaultlogExtension_0100  start");
            try {
                const data = await bundleManager.getBundleInfoForSelf(bundleFlags);
                expect(data!.hapModulesInfo[0].extensionAbilitiesInfo[0].extensionAbilityTypeName).assertEqual("faultLog");
                expect(bundleManager.ExtensionAbilityType.FAULT_LOG).assertEqual(33);
                done();
            } catch (err) {
                console.info("====> testFaultlogExtension_0100  catch error: " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })

        
    })
}
