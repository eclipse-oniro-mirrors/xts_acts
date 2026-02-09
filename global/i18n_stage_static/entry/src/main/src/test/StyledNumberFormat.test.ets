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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { Driver, ON, Component } from '@ohos.UiTest';
import { i18n } from '@kit.LocalizationKit';
import hilog from '@ohos.hilog'
import { UtilsTest } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function styledNumberFormatTest() {

    describe("styledNumberFormatTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'styledNumberFormatTest beforeAll start');

            await UtilsTest.startAbility("ohos.acts.i18nStage.static", "EntryAbility");
            await UtilsTest.msSleep(4000);
        });

        /**
         * @tc.name   SUB_GLOBAL_I18N_StyledNumberFormat_static_02_00100
         * @tc.number SUB_GLOBAL_I18N_StyledNumberFormat_static_02_00100
         * @tc.desc   Check start ability by bundl
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_GLOBAL_I18N_StyledNumberFormat_static_02_00100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_GLOBAL_I18N_StyledNumberFormat_static_02_00100 start');
            let driver: Driver = Driver.create();
            let button: Component | null = await driver.findComponent(ON.id('i18nStageStaticText'));
            expect(button !== null).assertTrue();
            let text = await (button as Component).getText();
            let str = '<span style="font-size: 16.00px;font-style: italic;font-weight: lighter;color: #FF0000FF;font-family: Arial;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;">+</span><span style="font-size: 16.00px;font-style: italic;font-weight: lighter;color: #FF0000FF;font-family: Arial;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;">123,456</span><span style="font-size: 16.00px;font-style: normal;font-weight: normal;color: #000000FF;font-family: Arial;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;">.</span><span style="font-size: 16.00px;font-style: normal;font-weight: regular;color: #008000FF;font-family: Arial;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;">79</span><span style="font-size: 16.00px;font-style: normal;font-weight: normal;color: #000000FF;font-family: HarmonyOS Sans;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;"> </span><span style="font-size: 16.00px;font-style: italic;font-weight: medium;color: #0000FFFF;font-family: Arial;stroke-width: 0.00px;stroke-color: #000000FF;font-superscript: normal;">euros</span>';
            expect(text).assertContain(str);
            hilog.info(domain, tag, '%{public}s', 'SUB_GLOBAL_I18N_StyledNumberFormat_static_02_00100 end');
            done();
        })
    })
}