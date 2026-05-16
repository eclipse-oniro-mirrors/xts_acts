/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import appRecovery from '@ohos.app.ability.appRecovery';
import Want from '@ohos.app.ability.Want';
import UIAbilityContext from 'application.UIAbilityContext';
import Ability from "@ohos.app.ability.UIAbility"
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


class AbilityTest1 extends Ability {
    onSaveState(reason:AbilityConstant.StateType, wantParam:Record<string, Object> ) {
        if (reason == AbilityConstant.StateType.APP_RECOVERY) {
            wantParam["test3"] = 3;
            return AbilityConstant.OnSaveResult.ALL_AGREE
        }
        return AbilityConstant.OnSaveResult.ALL_REJECT
    }
}
let ability_test = new AbilityTest1();

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0100
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0100
         * @tc.desc   故障发生时总是重启应用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0100 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0100 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0100 end");
        })


        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0200
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0200
         * @tc.desc   JS故障发生时总是重启应用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0200 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.RESTART_WHEN_JS_CRASH,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0200 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0200 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0300
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0300
         * @tc.desc   发生APP_FREEZE时重启应用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0300 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.RESTART_WHEN_APP_FREEZE,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0300 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0300 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0400
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0400
         * @tc.desc   总是不重启应用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0400 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.NO_RESTART,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0400 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0400 end");
        })


        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0500
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0500
         * @tc.desc   当发生应用故障时保存
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0500 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0500 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0500 end");
        })
        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0600
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0600
         * @tc.desc   当切后台保存数据
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0600 start--------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.RESTART_WHEN_JS_CRASH,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0600 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0600 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0700
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0700
         * @tc.desc   当发生应用故障时保存
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0700 start--------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.RESTART_WHEN_APP_FREEZE,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0700 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0700 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0800
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0800
         * @tc.desc   每次状态保存都会写入到本地文件缓存
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0800 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.NO_RESTART,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
                    appRecovery.SaveModeFlag.SAVE_WITH_FILE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0800 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0800 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_0900
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_0900
         * @tc.desc   调用restartApp接口
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_0900 start---------------------");
            try{
                appRecovery.restartApp();
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_0900 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_0900 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1000
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1000
         * @tc.desc   调用saveAppState接口(不传参)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1000 start---------------------");
            try{
                appRecovery.saveAppState();
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1000 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1000 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1100
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1100
         * @tc.desc   enableAppRecovery接口不传参使用默认值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1100 start---------------------");
            try{
                appRecovery.enableAppRecovery();
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1100 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1100 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1200
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1200
         * @tc.desc   enableAppRecovery接口传1个参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1200 start--------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1200 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1200 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1300
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1300
         * @tc.desc   enableAppRecovery接口传2个参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1300 start---------------------");
            try{
                appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART,
                    appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1300 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1300 end");
        })


        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1400
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1400
         * @tc.desc   检验appRecovery属性返回值是否符合预期
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1400 start---------------------");
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
                console.info("DFX_DFR_AppRecovery_Interface_Static_1400 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1400 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1500
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1500
         * @tc.desc   检验AbilityConstant属性返回值是否符合预期
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1500 start--------------------");
            try{
                expect(AbilityConstant.LaunchReason.APP_RECOVERY).assertEqual(4);
                expect(AbilityConstant.OnSaveResult.ALL_AGREE).assertEqual(0);
                expect(AbilityConstant.OnSaveResult.CONTINUATION_REJECT).assertEqual(1);
                expect(AbilityConstant.OnSaveResult.CONTINUATION_MISMATCH).assertEqual(2);
                expect(AbilityConstant.OnSaveResult.RECOVERY_AGREE).assertEqual(3);
                expect(AbilityConstant.OnSaveResult.RECOVERY_REJECT).assertEqual(4);
                console.info("1500 AbilityConstant.LaunchReason.APP_RECOVERY = " + AbilityConstant.LaunchReason.APP_RECOVERY);
                console.info("1500 AbilityConstant.LaunchReason.ALL_AGREE = " + AbilityConstant.OnSaveResult.ALL_AGREE);
                console.info("1500 AbilityConstant.LaunchReason.CONTINUATION_REJECT = " + AbilityConstant.OnSaveResult.CONTINUATION_REJECT);
                console.info("1500 AbilityConstant.LaunchReason.CONTINUATION_MISMATCH = " + AbilityConstant.OnSaveResult.CONTINUATION_MISMATCH);
                console.info("1500 AbilityConstant.LaunchReason.RECOVERY_AGREE = " + AbilityConstant.OnSaveResult.RECOVERY_AGREE);
                console.info("1500 AbilityConstant.LaunchReason.RECOVERY_REJECT = " + AbilityConstant.OnSaveResult.RECOVERY_REJECT);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1500 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1500 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1600
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1600
         * @tc.desc   调用saveAppState接口(传参Ability)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1600 start--------------------");
            try{
                let content: UIAbilityContext;
                appRecovery.saveAppState(content);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1600 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1600 end");
        })

        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1700
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1700
         * @tc.desc   调用setRestartWant接口
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1700 start--------------------");
            try{
                let want: Want = {
                    bundleName: "ohos.samples.recovery",
                    abilityName: "RecoveryAbility"
                };
                appRecovery.setRestartWant(want);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1700 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1700 end");
        })


        /**
         * @tc.name   DFX_DFR_AppRecovery_Interface_Static_1800
         * @tc.number DFX_DFR_AppRecovery_Interface_Static_1800
         * @tc.desc   onSaveState接口测试
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("DFX_DFR_AppRecovery_Interface_Static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            console.info("-------------------------DFX_DFR_AppRecovery_Interface_Static_1800 start--------------------");
            try{
                let StateType = AbilityConstant.StateType.APP_RECOVERY;
                let wantParam:Record<string, Object>= {"test1": 1, "test2": 2};
                let ret = ability_test.onSaveState(StateType, wantParam);
                if (wantParam["test3"] == 3) {
                    console.info("test3 == 3");
                } else {
                    console.info("test3 not exist");
                    expect(false).assertTrue();
                }
                expect(ret).assertEqual(AbilityConstant.OnSaveResult.ALL_AGREE);
            }catch(error){
                console.info("DFX_DFR_AppRecovery_Interface_Static_1800 err = " + error);
                expect(false).assertTrue();
            }
            console.info("DFX_DFR_AppRecovery_Interface_Static_1800 end");
        })


    })
}