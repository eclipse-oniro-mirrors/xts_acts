/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
    Level,
    expect,
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
import CommonFunc from "../../MainAbility/utils/Common"
import {
    MessageManager,
    Callback,
} from "../../MainAbility/utils/MessageManager"
export default function ResourceColor() {
    describe("ResourceColor", () => {
        beforeEach(async (done: Function) => {
            console.info("ResourceColor beforeEach start")
            let options: router.RouterOptions = {
                url: "MainAbility/pages/Resource/ResourceColor",
            }
            try {
                router.clear()
                let pages = router.getState()
                console.info(
                    "get ResourceColor state pages: " + JSON.stringify(pages)
                )
                if (!("ResourceColor" == pages.name)) {
                    console.info(
                        "get ResourceColor state pages.name: " +
                            JSON.stringify(pages.name)
                    )
                    let result = await router.push(options)
                    await CommonFunc.sleep(2000)
                    console.info(
                        "push ResourceColor success: " + JSON.stringify(result)
                    )
                }
            } catch (err) {
                console.error("push ResourceColor page error: " + err)
                expect().assertFail()
            }
            done()
        })

        /*
         * @tc.number       ResourceColor_0100
         * @tc.name         ResourceColor_0100
         * @tc.desic         ResourceColor
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */

        it("ResourceColor_0100", Level.LEVEL0, async (done: Function) => {
            console.info("ResourceColor_0100 START")
            let strJson = getInspectorByKey("color")
            let obj: ESObject = JSON.parse(strJson)
            console.info(
                "[ResourceColor_0100] component obj is: " + JSON.stringify(obj)
            )
            console.info(
                "[ResourceColor_0100] title: " +
                    JSON.stringify(obj.$attrs.backgroundColor)
            )
            expect(obj.$attrs.backgroundColor).assertEqual("#FF445566")
            console.info("[ResourceColor_0100] END")
            done()
        })
        /*
         * @tc.number       ResourceColor_0200
         * @tc.name         ResourceColor_0200
         * @tc.desic         ResourceColor
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */

        it("ResourceColor_0200", Level.LEVEL0, async (done: Function) => {
            console.info("ResourceColor_0200 START")
            let driver = Driver.create()
            await CommonFunc.sleep(2000)
            let button = await driver.findComponent(ON.id("ResourceColor"))
            await button.click()
            await CommonFunc.sleep(2000)
            let strJson = getInspectorByKey("color")
            let obj: ESObject = JSON.parse(strJson)
            console.info(
                "[ResourceColor_0200] component obj is: " + JSON.stringify(obj)
            )
            console.info(
                "[ResourceColor_0200] title: " +
                    JSON.stringify(obj.$attrs.backgroundColor)
            )
            expect(obj.$attrs.backgroundColor).assertEqual("#FF998877")
            console.info("[ResourceColor_0200] END")
            done()
            done()
        })
    })
}
