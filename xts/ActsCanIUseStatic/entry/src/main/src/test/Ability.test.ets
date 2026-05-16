/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { canIUse } from "@internal.full.global"
import hilog from '@ohos.hilog'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest() {

    describe("caniusetest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   SUB_GLOBAL_CANIUSE_STATIC_0100
         * @tc.number SUB_GLOBAL_CANIUSE_STATIC_0100
         * @tc.desc   Check canIUs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_GLOBAL_CANIUSE_STATIC_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_GLOBAL_CANIUSE_STATIC_0100 start');
            try{
                let result =  canIUse("")
                expect(result == false).assertTrue()
            }catch(e){
                hilog.info(domain, tag, `SUB_GLOBAL_CANIUSE_STATIC_0100 failed: ${JSON.stringify(e)}`);
                expect().assertFail();
            }
            done()
            hilog.info(domain, tag, '%{public}s', 'SUB_GLOBAL_CANIUSE_STATIC_0100 end');
        })

    })

}