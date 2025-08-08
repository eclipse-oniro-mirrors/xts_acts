/**
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
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect,
    Level
} from "@ohos/hypium"
import router from "@ohos.router"
import {
    UiComponent,
    Driver,
    Component,
    UiWindow,
    ON,
    BY,
    MatchPattern,
    DisplayRotation,
    ResizeDirection,
    WindowMode,
    PointerMatrix,
} from "@ohos.UiTest"
import CommonFunc from "../../MainAbility/common/Common"
import deviceInfo from "@ohos.deviceInfo"

export default function popupKeyboardAvoidMode() {
    describe("popupKeyboardAvoidMode", () => {
        let currentDeviceIsPC = false
        beforeAll(() => {
            console.info("popupKeyboardAvoidMode beforeAll start")
            let deviceTypeInfo = deviceInfo.deviceType
            currentDeviceIsPC = deviceTypeInfo === "2in1" ? true : false
            console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
            console.info("the value of the deviceType is " + deviceInfo.deviceType)
        })

        beforeEach(async (done: Function) => {
            console.info("popupKeyboardAvoidMode beforeEach start")
            let options: router.RouterOptions = {
                url: "MainAbility/pages/popup/popupKeyboardAvoidMode",
            }
            try {
                router.clear()
                let pages = router.getState()
                console.info(
                    "get popupKeyboardAvoidMode state pages: " +
                        JSON.stringify(pages)
                )
                if (!("popupKeyboardAvoidMode" == pages.name)) {
                    console.info(
                        "get popupKeyboardAvoidMode state pages.name: " +
                            JSON.stringify(pages.name)
                    )
                    let result = await router.replace(options)
                    await CommonFunc.sleep(2000)
                    console.info(
                        "push popupKeyboardAvoidMode success: " +
                            JSON.stringify(result)
                    )
                }
            } catch (err) {
                console.error("push popupKeyboardAvoidMode page error: " + err)
                expect().assertFail()
            }
            done()
        })

        /**
         * @tc.number    popupKeyboardAvoidMode_0100
         * @tc.name      popupKeyboardAvoidMode_0100
         * @tc.desc      set PopupOption keyboardAvoidMode:0(KeyboardAvoidMode.DEFAULT)
         * @tc.level:    Level 1
         * @tc.type :
         * @tc.size :
         */
        it("popupKeyboardAvoidMode_0100", Level.LEVEL1, async (done: Function) => {
            console.info("popupKeyboardAvoidMode_0100 START")
            if (!currentDeviceIsPC) {
                await CommonFunc.sleep(1000)
                let driver: Driver = Driver.create()
                let btn: Component = await driver.findComponent(ON.id("popup"))
                await btn.click()
                console.info("[popupKeyboardAvoidMode_0100] popup click")
                await CommonFunc.sleep(1000)
                let confirm = await driver.findComponent(ON.text("confirm"))

                let rect = await confirm.getBounds()
                let height = rect.top
                console.info("[popupKeyboardAvoidMode_0100] height " + height)

                let btn0: Component = await driver.findComponent(ON.id("ipt"))
                await btn0.click()
                await CommonFunc.sleep(1000)

                let rect1 = await confirm.getBounds()
                let height1 = rect1.top
                console.info("[popupKeyboardAvoidMode_0100] height1 " + height1)
                expect(height - height1 > 0).assertTrue()
                await confirm.click()
                await driver.triggerKey(2070)
            }
            console.info("[popupKeyboardAvoidMode_0100] END")
            done()
        })

        /**
         * @tc.number    popupKeyboardAvoidMode_0200
         * @tc.name      popupKeyboardAvoidMode_0200
         * @tc.desc      set PopupOption keyboardAvoidMode:0(KeyboardAvoidMode.NONE)
         * @tc.level:    Level 1
         * @tc.type :
         * @tc.size :
         */
        it("popupKeyboardAvoidMode_0200", Level.LEVEL1, async (done: Function) => {
            console.info("popupKeyboardAvoidMode_0200 START")
            if (!currentDeviceIsPC) {
                await CommonFunc.sleep(1000)
                let driver: Driver = Driver.create()
                let btn: Component = await driver.findComponent(ON.id("none"))
                await btn.click()
                console.info("[popupKeyboardAvoidMode_0200] none click")

                let btn1: Component = await driver.findComponent(ON.id("popup"))
                await btn1.click()
                console.info("[popupKeyboardAvoidMode_0200] popup click")
                await CommonFunc.sleep(1000)

                let btn0: Component = await driver.findComponent(ON.id("ipt"))
                await btn0.click()
                await CommonFunc.sleep(1000)

                let confirm = await driver.findComponent(ON.text("confirm"))

                expect(confirm != null).assertFalse()
                await driver.triggerKey(2070)
            }
            console.info("[popupKeyboardAvoidMode_0200] END")
            done()
        })

        /**
         * @tc.number    popupKeyboardAvoidMode_0300
         * @tc.name      popupKeyboardAvoidMode_0300
         * @tc.desc      set customPopupOption keyboardAvoidMode:0(KeyboardAvoidMode.DEFAULT)
         * @tc.level:    Level 1
         * @tc.type :
         * @tc.size :
         */
        it("popupKeyboardAvoidMode_0300", Level.LEVEL1, async (done: Function) => {
            console.info("popupKeyboardAvoidMode_0300 START")
            if (!currentDeviceIsPC) {
                await CommonFunc.sleep(1000)
                let driver: Driver = Driver.create()
                let btn: Component = await driver.findComponent(
                    ON.id("default")
                )
                await btn.click()
                console.info("[popupKeyboardAvoidMode_0300] default click")
                await CommonFunc.sleep(1000)
                let btn1: Component = await driver.findComponent(
                    ON.id("CustomPopup")
                )
                await btn1.click()
                console.info("[popupKeyboardAvoidMode_0300] CustomPopup click")
                await CommonFunc.sleep(1000)
                let text = await driver.findComponent(ON.id("text"))
                let rect = await text.getBounds()
                let height = rect.top
                console.info("[popupKeyboardAvoidMode_0300] height " + height)

                let btn0: Component = await driver.findComponent(ON.id("ipt"))
                await btn0.click()
                await CommonFunc.sleep(1000)

                let text1 = await driver.findComponent(ON.id("text"))
                let rect1 = await text1.getBounds()
                let height1 = rect1.top

                console.info("[popupKeyboardAvoidMode_0300] height1 " + height1)
                expect(height - height1 > 0).assertTrue()
                await driver.triggerKey(2070)
            }
            console.info("[popupKeyboardAvoidMode_0300] END")
            done()
        })

        /**
         * @tc.number    popupKeyboardAvoidMode_0400
         * @tc.name      popupKeyboardAvoidMode_0400
         * @tc.desc      set customPopupOption keyboardAvoidMode:0(KeyboardAvoidMode.NONE)
         * @tc.level:    Level 1
         * @tc.type :
         * @tc.size :
         */
        it("popupKeyboardAvoidMode_0400", Level.LEVEL1, async (done: Function) => {
            console.info("popupKeyboardAvoidMode_0400 START")
            if (!currentDeviceIsPC) {
                await CommonFunc.sleep(1000)
                let driver: Driver = Driver.create()
                let btn: Component = await driver.findComponent(ON.id("none"))
                await btn.click()
                console.info("[popupKeyboardAvoidMode_0400] none click")

                let btn1: Component = await driver.findComponent(
                    ON.id("CustomPopup")
                )
                await btn1.click()
                console.info("[popupKeyboardAvoidMode_0400] CustomPopup click")
                await CommonFunc.sleep(1000)

                let btn0: Component = await driver.findComponent(ON.id("ipt"))
                await btn0.click()
                await CommonFunc.sleep(1000)

                let confirm = await driver.findComponent(ON.id("text"))

                expect(confirm != null).assertFalse()
                await driver.triggerKey(2070)
            }
            console.info("[popupKeyboardAvoidMode_0400] END")
            done()
        })
    })
}