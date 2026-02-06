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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundleName: string = 'com.example.webpagesize.static';

export default function webPageSizeTest() {

    describe("WebPageSizeTest", (): void => {
        beforeAll(async () : Promise<void> => {
            hilog.info(domain, tag, "WebPageSizeTest loadup start!!!!!");
            await Utils.msSleep(2000)
            hilog.info(domain, tag, "WebPageSizeTest loadup over!!!!!");
        })

        /**
         * @tc.name   testGetPageHeight001
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETPAGEHEIGHT_0100
         * @tc.desc   test getPageHeight
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testGetPageHeight001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            hilog.info(domain, tag, 'testGetPageHeight001 start!!!');
            try {
                let driver = Driver.create();
                await startAbility(bundleName, 'EntryAbility');
                hilog.info(domain, tag, 'testGetPageHeight001 startAbility');
                await driver.delayMs(1000);
                hilog.info(domain, tag, 'testGetPageHeight001 delayMs');

                let button = await driver.findComponent(ON.id('get_page_height_button'));
                hilog.info(domain, tag, `testGetPageHeight001 button, ${JSON.stringify(button)}`);
                expect(button != null).assertTrue();

                if (button != null) {
                    await driver.delayMs(3000);
                    hilog.info(domain, tag, "testGetPageHeight001 get_page_height_button_click");
                    await button.click();
                    await driver.delayMs(1000);

                    let resultText = await driver.findComponent(ON.id('result_text'));
                    hilog.info(domain, tag, `testGetPageHeight001 resultText component, ${JSON.stringify(resultText)}`);
                    expect(resultText != null).assertTrue();

                    if (resultText != null) {
                        let text = await resultText.getText();
                        hilog.info(domain, tag, `testGetPageHeight001 resultText text, ${JSON.stringify(text)}`);
                        expect(text == 'pass').assertTrue();
                    }
                }
            } catch(error) {
                hilog.info(domain, tag, `testGetPageHeight001 error, ${JSON.stringify(error)}`);
                expect().assertFail();
            }
            hilog.info(domain, tag, 'testGetPageHeight001 over!!!');
        })
    })

}