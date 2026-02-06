/**
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
    UiDriver,
    Component,
    Driver,
    UiWindow,
    ON,
    BY,
    MatchPattern,
    DisplayRotation,
    ResizeDirection,
    WindowMode,
    PointerMatrix,
} from "@ohos.UiTest"
import CommonFunc from "../../MainAbility/common/CommonC"
import {
    MessageManager,
    Callback,
} from "../../MainAbility/utils/MessageManagerC"
const waitUiReadyMs = 1000

export default function sliderJsunitSliderTest() {
    describe("sliderJsunitSliderTestSliderTest", () => {
        beforeEach(async (done: Function) => {
            console.info("sliderJsunitSliderTest beforeEach start")
            let options: router.RouterOptions = {
                url: "MainAbility/pages/SliderC/slider",
            }
            try {
                router.clear()
                let pages = router.getState()
                console.info(
                    "get sliderJsunitSliderTest state pages:" +
                        JSON.stringify(pages)
                )
                if (!("slider" == pages.name)) {
                    console.info(
                        "get sliderJsunitSliderTest state pages.name:" +
                            JSON.stringify(pages.name)
                    )
                    let result = await router.push(options)
                    console.info(
                        "push sliderJsunitSliderTest success " +
                            JSON.stringify(result)
                    )
                }
            } catch (err) {
                console.error("push sliderJsunitSliderTest page error:" + err)
                expect().assertFail()
            }
            done()
        })
        /**
         * @tc.number    sliderJsunitSliderTest_0100
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0100",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0100 START")
                await CommonFunc.sleep(1000)
                // get the slider component with no parameter and test attribute
                let strJson = getInspectorByKey("sliderConstructor2")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0100 component obj is: " +
                        obj.$attrs.style
                )
                expect(obj.$attrs.style).assertEqual("SliderStyle.OutSet")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0200
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0200",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0200 START")
                // get the slider component with parameter and test attribute
                let strJson = getInspectorByKey("sliderConstructor")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0200 component obj is: " +
                        obj.$attrs.style +
                        "---" +
                        obj.$attrs.constructor.direction +
                        "--" +
                        obj.$attrs.constructor.value +
                        "---" +
                        obj.$attrs.constructor.reverse +
                        "----" +
                        obj.$attrs.constructor.min +
                        "----" +
                        obj.$attrs.constructor.max +
                        "---" +
                        obj.$attrs.constructor.step +
                        "---" +
                        JSON.stringify(obj.$attrs.constructor)
                )
                expect(obj.$attrs.style).assertEqual("SliderStyle.InSet")
                expect(obj.$attrs.constructor.direction).assertEqual(
                    "Axis.Vertical"
                )
                expect(obj.$attrs.constructor.value).assertEqual("40.000000")
                expect(obj.$attrs.constructor.reverse).assertEqual("true")
                expect(obj.$attrs.constructor.min).assertEqual("2.000000")
                expect(obj.$attrs.constructor.max).assertEqual("1000.000000")
                expect(obj.$attrs.constructor.step).assertEqual("0.700000")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0300
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0300",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0300 START")
                await CommonFunc.sleep(1000)
                // get the slider component attribute
                let strJson = getInspectorByKey("sliderA")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0300 component obj is: " +
                        obj.$attrs.blockColor +
                        "---" +
                        obj.$attrs.trackColor +
                        "--" +
                        obj.$attrs.selectedColor +
                        "---" +
                        obj.$attrs.showSteps +
                        "----" +
                        obj.$attrs.showTips +
                        "----" +
                        obj.$attrs.trackThickness +
                        "--" +
                        obj.$attrs.selectedColor
                )
                expect(obj.$attrs.blockColor).assertEqual("#FF191970")
                expect(obj.$attrs.trackColor).assertEqual("#FFADD8E6")
                expect(obj.$attrs.showSteps).assertEqual("true")
                expect(obj.$attrs.showTips).assertEqual("true")
                expect(obj.$attrs.trackThickness).assertEqual("10.00px")
                expect(obj.$attrs.selectedColor).assertEqual("#FF191970")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0400
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0400",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0400 START")
                // modify the Color attribute normal value of slider dynamically
                globalThis.value.message.notify({
                    name: "blockColor",
                    value: "#FFFFFF",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "trackColor",
                    value: "#EEFFFF",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "selectedColor",
                    value: "#AEFFFF",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "trackThickness",
                    value: "12.00px",
                })
                await CommonFunc.sleep(200)
                // get the slider component attribute
                let strJson = getInspectorByKey("sliderA")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0400 component obj is: " +
                        obj.$attrs.blockColor +
                        "---" +
                        obj.$attrs.trackColor +
                        "--" +
                        obj.$attrs.selectedColor +
                        "---" +
                        obj.$attrs.trackThickness
                )
                expect(obj.$attrs.blockColor).assertEqual("#FFFFFFFF")
                expect(obj.$attrs.trackColor).assertEqual("#FFEEFFFF")
                expect(obj.$attrs.trackThickness).assertEqual("12.00px")
                expect(obj.$attrs.selectedColor).assertEqual("#FFAEFFFF")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0500
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0500",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0500 START")
                // modify the Color attribute normal value of slider dynamically
                globalThis.value.message.notify({
                    name: "blockColor",
                    value: "rgb(238, 130, 238)",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "trackColor",
                    value: "rgb(238, 130, 238)",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "selectedColor",
                    value: "rgb(238, 130, 238)",
                })
                await CommonFunc.sleep(200)
                // get the slider component attribute
                let strJson = getInspectorByKey("sliderA")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0500 component obj is: " +
                        obj.$attrs.blockColor +
                        "---" +
                        obj.$attrs.trackColor +
                        "--" +
                        obj.$attrs.selectedColor +
                        "--"
                )
                expect(obj.$attrs.blockColor).assertEqual("#FFEE82EE")
                expect(obj.$attrs.trackColor).assertEqual("#FFEE82EE")
                expect(obj.$attrs.selectedColor).assertEqual("#FFEE82EE")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0600
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0600",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0600 START")
                // modify the Color attribute illegal value of slider dynamically
                globalThis.value.message.notify({
                    name: "blockColor",
                    value: "#ACE",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "trackColor",
                    value: "#ACE",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "selectedColor",
                    value: "#ACE",
                })
                await CommonFunc.sleep(200)
                globalThis.value.message.notify({
                    name: "trackThickness",
                    value: "-px",
                })
                await CommonFunc.sleep(200)
                // get the slider component attribute
                let strJson = getInspectorByKey("sliderA")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0600 component obj is: " +
                        obj.$attrs.blockColor +
                        "---" +
                        obj.$attrs.trackColor +
                        "--" +
                        obj.$attrs.selectedColor +
                        "---" +
                        obj.$attrs.trackThickness
                )
                expect(obj.$attrs.blockColor).assertEqual("#FFAACCEE")
                expect(obj.$attrs.trackColor).assertEqual("#FFAACCEE")
                expect(obj.$attrs.trackThickness).assertEqual("4.00vp")
                expect(obj.$attrs.selectedColor).assertEqual("#FFAACCEE")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0700
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0700",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("sliderJsunitSliderTest_0700 START")
                // modify the constructor attribute of slider dynamically
                globalThis.value.message.notify({
                    name: "vInSetValueOne",
                    value: 30,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "style",
                    value: SliderStyle.OutSet,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "directionT",
                    value: Axis.Horizontal,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "reverse",
                    value: false,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "min", value: 20 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "max", value: 80 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "step", value: 0.9 })
                await CommonFunc.sleep(2000)
                // check the value of changed parameter
                let strJson = getInspectorByKey("sliderConstructor")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "sliderJsunitSliderTest_0700 component obj is: " +
                        obj.$attrs.style +
                        "---" +
                        obj.$attrs.constructor.direction +
                        "--" +
                        obj.$attrs.constructor.value +
                        "---" +
                        obj.$attrs.constructor.reverse +
                        "----" +
                        obj.$attrs.constructor.min +
                        "----" +
                        obj.$attrs.constructor.max +
                        "---" +
                        obj.$attrs.constructor.step
                )
                expect(obj.$attrs.style).assertEqual("SliderStyle.OutSet")
                expect(obj.$attrs.constructor.direction).assertEqual(
                    "Axis.Horizontal"
                )
                expect(obj.$attrs.constructor.reverse).assertEqual("false")
                expect(obj.$attrs.constructor.min).assertEqual("20.000000")
                expect(obj.$attrs.constructor.max).assertEqual("80.000000")
                expect(obj.$attrs.constructor.step).assertEqual("0.900000")
                expect(obj.$attrs.constructor.value).assertEqual("30.000000")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0800
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0800",
            Level.LEVEL0,
            async (done: Function) => {
                // Verify the swipe function of slider component
                console.info("sliderJsunitSliderTest_0800 START")
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "vInSetValueOne",
                    value: 30,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "style",
                    value: SliderStyle.OutSet,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "directionT",
                    value: Axis.Horizontal,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "reverse",
                    value: false,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "min", value: 20 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "max", value: 80 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "step", value: 0.9 })
                await CommonFunc.sleep(2000)

                let driver = await Driver.create()
                let slider = await driver.findComponent(ON.id('sliderConstructor'));
                let rect = await slider.getBounds();

                let top = rect.top
                let bottom = rect.bottom
                let left = rect.left
                let right = rect.right
                let x = Math.round(left + (right - left) / 2)
                let y = Math.round(top + (bottom - top) / 2)

                await driver.delayMs(waitUiReadyMs)
                await driver.swipe(x,y,right,y)

                await driver.delayMs(waitUiReadyMs)
                let strJson = getInspectorByKey("tex")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "[sliderJsunitSliderTest_0800] obj: " + JSON.stringify(obj)
                )
                console.info("[sliderJsunitSliderTest_0800] obj.$attrs.content: " + JSON.stringify(obj.$attrs.content))
                expect(Math.round(obj.$attrs.content)).assertEqual(80)
                let strJson1 = getInspectorByKey("modeT")
                let obj1: ESObject = JSON.parse(strJson1)
                console.info(
                    "[sliderJsunitSliderTest_0800] obj1: " +
                        JSON.stringify(obj1)
                )
                expect(obj1.$attrs.content).assertEqual("2")
                done()
            }
        )
        /**
         * @tc.number    sliderJsunitSliderTest_0900
         * @tc.name      Test the api of slider
         * @tc.desc      api
         * @tc.level:    Level 0
         * @tc.type :
         * @tc.size :
         */
        it(
            "sliderJsunitSliderTest_0900",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("[sliderJsunitSliderTest_0800] START")
                // modify the constructor attribute of slider dynamically
                globalThis.value.message.notify({
                    name: "vInSetValueOne",
                    value: -30,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "reverse", value: 1 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "style", value: 4 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({
                    name: "directionT",
                    value: 6,
                })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "min", value: -20 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "max", value: 1000 })
                await CommonFunc.sleep(1000)
                globalThis.value.message.notify({ name: "step", value: 10007 })
                await CommonFunc.sleep(2000)
                // check the value of changed parameter
                let strJson = getInspectorByKey("sliderConstructor")
                let obj: ESObject = JSON.parse(strJson)
                console.info(
                    "[sliderJsunitSliderTest_0900] component obj is: " +
                        obj.$attrs.style +
                        "---" +
                        obj.$attrs.constructor.direction +
                        "--" +
                        obj.$attrs.constructor.value +
                        "---" +
                        obj.$attrs.constructor.reverse +
                        "----" +
                        obj.$attrs.constructor.min +
                        "----" +
                        obj.$attrs.constructor.max +
                        "---" +
                        obj.$attrs.constructor.step
                )
                expect(obj.$attrs.style).assertEqual("SliderStyle.OutSet")
                expect(obj.$attrs.constructor.direction).assertEqual(
                    "Axis.Horizontal"
                )
                expect(obj.$attrs.constructor.value).assertEqual("20.000000")
                expect(obj.$attrs.constructor.reverse).assertEqual("false")
                expect(obj.$attrs.constructor.min).assertEqual("-20.000000")
                expect(obj.$attrs.constructor.max).assertEqual("1000.000000")
                expect(obj.$attrs.constructor.step).assertEqual("1.000000")
                console.info("[sliderJsunitSliderTest_0900] END")
                done()
            }
        )
    })
}