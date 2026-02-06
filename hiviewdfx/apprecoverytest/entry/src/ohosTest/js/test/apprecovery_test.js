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
import appRecovery from "@ohos.app.ability.appRecovery"
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

export default function ActsAppRecoveryTest() {
describe("ActsAppRecoveryTest", function () {

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0100
    * @tc.name: 故障发生时总是重启应用
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0100 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0100 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0100 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0200
    * @tc.name: 当发生JS_CRASH时重启应用
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0200 start-------------------------");
        try{
            appRecovery.enableAppRecovery(1, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0200 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0200 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0300
    * @tc.name: APP_FREEZE故障发生时重启应用
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0300 start-------------------------");
        try{
            appRecovery.enableAppRecovery(2, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0300 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0300 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0400
    * @tc.name: JS_CRASH或APP_FREEZE故障发生时重启应用
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0400 start-------------------------");
        try{
            appRecovery.enableAppRecovery(3, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0400 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0400 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0500
    * @tc.name: 任何情况下不重启应用
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0500 start-------------------------");
        try{
            appRecovery.enableAppRecovery(4, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0500 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0500 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0600
    * @tc.name: 当error时保存数据
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0600 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 1, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0600 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0600 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0700
    * @tc.name: 当切换到后台时保存数据
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0700 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 2, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0700 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0700 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0800
    * @tc.name: 以文件保存数据
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0800 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0800 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0800 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_0900
    * @tc.name: 以共享内存保存数据
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_0900 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 3, 2);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_0900 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_0900 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1000
    * @tc.name: 调用restartApp接口
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1000 start-------------------------");
        try{
            appRecovery.restartApp();
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1000 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1000 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1100
    * @tc.name: 调用saveAppState接口(不传参)
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1100 start-------------------------");
        try{
            appRecovery.saveAppState();
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1100 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1100 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1200
    * @tc.name: enableAppRecovery接口不传参使用默认值
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1200 start-------------------------");
        try{
            appRecovery.enableAppRecovery();
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1200 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1200 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1300
    * @tc.name: enableAppRecovery接口传1个参数
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1300 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1300 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1300 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1400
    * @tc.name: enableAppRecovery接口传2个参数
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1400 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 3);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1400 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1400 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1500
    * @tc.name: enableAppRecovery接口传3个参数
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1500 start-------------------------");
        try{
            appRecovery.enableAppRecovery(0, 3, 1);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1500 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1500 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1600
    * @tc.name: enableAppRecovery接口关键字传参
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1600 start-------------------------");
        try{
            appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1600 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1600 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1700
    * @tc.name: enableAppRecovery接口关键字传多个参数
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1700 start-------------------------");
        try{
            appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART,
                appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR, appRecovery.SaveModeFlag.SAVE_WITH_FILE);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1700 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1700 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1800
    * @tc.name: enableAppRecovery接口关键字传多个组合参数
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1800 start-------------------------");
        try{
            appRecovery.enableAppRecovery(
                appRecovery.RestartFlag.ALWAYS_RESTART | appRecovery.RestartFlag.RESTART_WHEN_JS_CRASH | appRecovery.RestartFlag.RESTART_WHEN_APP_FREEZE,
                appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR | appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND,
                appRecovery.SaveModeFlag.SAVE_WITH_FILE);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_1800 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1800 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_1900
    * @tc.name: onSaveState接口测试
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_1900 start-------------------------");
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
            console.info("DFX_DFR_AppRecovery_Interface_1900 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_1900 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_2000
    * @tc.name: 检验appRecovery属性返回值是否符合预期
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_2000 start-------------------------");
        try{
            expect(appRecovery.RestartFlag.ALWAYS_RESTART).assertEqual(0);
            expect(appRecovery.RestartFlag.RESTART_WHEN_JS_CRASH).assertEqual(0x0001);
            expect(appRecovery.RestartFlag.RESTART_WHEN_APP_FREEZE).assertEqual(0x0002);
            expect(appRecovery.RestartFlag.NO_RESTART).assertEqual(0xFFFF);
            expect(appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR).assertEqual(0x0001);
            expect(appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND).assertEqual(0x0002);
            expect(appRecovery.SaveModeFlag.SAVE_WITH_FILE).assertEqual(0x0001);
            expect(appRecovery.SaveModeFlag.SAVE_WITH_SHARED_MEMORY).assertEqual(0x0002);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_2000 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_2000 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_2100
    * @tc.name: 检验AbilityConstant属性返回值是否符合预期
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_2100 start-------------------------");
        try{
            expect(AbilityConstant.LaunchReason.APP_RECOVERY).assertEqual(4);
            expect(AbilityConstant.OnSaveResult.ALL_AGREE).assertEqual(0);
            expect(AbilityConstant.OnSaveResult.CONTINUATION_REJECT).assertEqual(1);
            expect(AbilityConstant.OnSaveResult.CONTINUATION_MISMATCH).assertEqual(2);
            expect(AbilityConstant.OnSaveResult.RECOVERY_AGREE).assertEqual(3);
            expect(AbilityConstant.OnSaveResult.RECOVERY_REJECT).assertEqual(4);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_2100 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_2100 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_2200
    * @tc.name: 调用saveAppState接口(传参Ability)
    * @tc.desc: appRecovery interface test.
    */
    it("DFX_DFR_AppRecovery_Interface_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_2200 start-------------------------");
        try{
            appRecovery.saveAppState(globalThis.abilityContext);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_2200 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_2200 end");
    })

    /**
    * @tc.number: DFX_DFR_AppRecovery_Interface_2300
    * @tc.name: 调用setRestartWant接口
    * @tc.desc: appRecovery interface test.
    */
     it("DFX_DFR_AppRecovery_Interface_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info("-------------------------DFX_DFR_AppRecovery_Interface_2300 start-------------------------");
        try{
            let want = {
                bundleName: "ohos.samples.recovery",
                abilityName: "RecoveryAbility"
              };
            appRecovery.setRestartWant(want);
        }catch(error){
            console.info("DFX_DFR_AppRecovery_Interface_2300 err = " + error);
            expect(false).assertTrue();
        }
        console.info("DFX_DFR_AppRecovery_Interface_2300 end");
    })

})
}