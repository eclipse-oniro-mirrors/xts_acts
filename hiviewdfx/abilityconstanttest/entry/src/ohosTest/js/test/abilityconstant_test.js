/*
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
import AbilityConstant from "@ohos.app.ability.AbilityConstant"
import Ability from "@ohos.app.ability.UIAbility"
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'

class AbilityTest extends Ability {
    onSaveState(reason, wantParam) {
        if (reason == AbilityConstant.StateType.APP_RECOVERY) {
            wantParam["test3"] = 3;
            return AbilityConstant.OnSaveResult.ALL_AGREE
        }
        return AbilityConstant.OnSaveResult.ALL_REJECT
    }
}
let ability_test = new AbilityTest();

export default function ActsAbilityConstantTest() {
describe("ActsAbilityConstantTest", function () {
    /**
    * @tc.number: DFX_DFR_AbilityConstant_Interface_0100
    * @tc.name: onSaveState接口测试
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AbilityConstant_Interface_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AbilityConstant_Interface_0100 start-------------------------");
        try{
            let StateType = AbilityConstant.StateType.APP_RECOVERY;
            let wantParam = {"test1": 1, "test2": 2};
            let ret = ability_test.onSaveState(StateType, wantParam);
            if (wantParam["test3"] == 3) {
                expect(true).assertTrue();
            } else {
                console.info("test3 not exist");
                expect(false).assertTrue();
            }
            expect(ret).assertEqual(AbilityConstant.OnSaveResult.ALL_AGREE);
        }catch(error){
            console.info("DFX_DFR_AbilityConstant_Interface_0100 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AbilityConstant_Interface_0100 end");
    })

    /**
    * @tc.number: DFX_DFR_AbilityConstant_Interface_0200
    * @tc.name: 检验AbilityConstant属性返回值是否符合预期
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AbilityConstant_Interface_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AbilityConstant_Interface_0200 start-------------------------");
        try{
            expect(AbilityConstant.LaunchReason.APP_RECOVERY).assertEqual(4);
            expect(AbilityConstant.OnSaveResult.ALL_AGREE).assertEqual(0);
            expect(AbilityConstant.OnSaveResult.CONTINUATION_REJECT).assertEqual(1);
            expect(AbilityConstant.OnSaveResult.CONTINUATION_MISMATCH).assertEqual(2);
            expect(AbilityConstant.OnSaveResult.RECOVERY_AGREE).assertEqual(3);
            expect(AbilityConstant.OnSaveResult.RECOVERY_REJECT).assertEqual(4);
        }catch(error){
            console.info("DFX_DFR_AbilityConstant_Interface_0200 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AbilityConstant_Interface_0200 end");
    })

})
}