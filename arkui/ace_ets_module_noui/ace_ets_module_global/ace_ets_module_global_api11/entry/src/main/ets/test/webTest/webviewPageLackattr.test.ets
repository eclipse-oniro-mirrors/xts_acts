/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from "@ohos.router"
import events_emitter from "@ohos.events.emitter"
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
import Utils from "../../MainAbility/common/Utils"
export default function webViewPageattrLackJsunit() {
    describe("webViewPageattrLackJsunit", () => {
        beforeAll(async (done: Function) => {
            console.info("webviewpageLackattr beforeEach start")
            let options: router.RouterOptions = {
                url: "MainAbility/pages/web/webviewpageLackattr",
            }
            try {
                router.clear()
                let pages = router.getState()
                console.info(
                    "get webviewpageLackattr state success " +
                        JSON.stringify(pages)
                )
                if (!("webviewpageLackattr" == pages.name)) {
                    console.info(
                        "get webviewpageLackattr state success " +
                            JSON.stringify(pages.name)
                    )
                    let result = await router.pushUrl(options)
                    await Utils.sleep(2000)
                    console.info(
                        "push webviewpageLackattr page success " +
                            JSON.stringify(result)
                    )
                }
            } catch (err) {
                console.error("push webviewpageLackattr page error: " + err)
            }
            done()
        })
        afterEach(async () => {
            await Utils.sleep(1000)
            console.info("webviewpageLackattr after each called")
        })

        /**
         * @tc.name   testWebviewpageLackattr01
         * @tc.number testWebviewpageLackattr01
         * @tc.desc   testWebviewpageLackattr01
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "testWebviewpageLackattr01",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("testWebviewpageLackattr01 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: events_emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr01 get state result is: " +
                                JSON.stringify(indexEvent)
                        )
                        expect(indexEvent.data.STATUS).assertTrue()
                    }
                    let indexEvent: events_emitter.InnerEvent = {
                        eventId: 90201,
                        priority: events_emitter.EventPriority.LOW,
                    }
                    sendEventByKey("loadUrl", 10, "")
                    events_emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr01 events_emitter err : " +
                            JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr01 END")
                done()
            }
        )

        /**
         * @tc.name   testWebviewpageLackattr02
         * @tc.number testWebviewpageLackattr02
         * @tc.desc   testWebviewpageLackattr02
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "testWebviewpageLackattr02",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("testWebviewpageLackattr02 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: events_emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr02 get state result is: " +
                                JSON.stringify(indexEvent)
                        )
                        expect(!!indexEvent.data.STATUS).assertTrue()
                    }
                    let indexEvent: events_emitter.InnerEvent = {
                        eventId: 90202,
                        priority: events_emitter.EventPriority.LOW,
                    }
                    sendEventByKey("getHitTest", 10, "")
                    events_emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr02events_emitter err : " +
                            JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr02 END")
                done()
            }
        )

        /**
         * @tc.name   testWebviewpageLackattr04
         * @tc.number testWebviewpageLackattr04
         * @tc.desc   testWebviewpageLackattr04
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "testWebviewpageLackattr04",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("testWebviewpageLackattr04 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: events_emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr04 get state result is: " +
                                JSON.stringify(indexEvent)
                        )
                        expect(indexEvent.data.STATUS).assertEqual("prign")
                    }
                    let indexEvent: events_emitter.InnerEvent = {
                        eventId: 90204,
                        priority: events_emitter.EventPriority.LOW,
                    }
                    sendEventByKey("getOriginsPromise", 10, "")
                    events_emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr04events_emitter err : " +
                            JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr04 END")
                done()
            }
        )

        /**
         * @tc.name   testWebviewpageLackattr03
         * @tc.number testWebviewpageLackattr03
         * @tc.desc   testWebviewpageLackattr03
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "testWebviewpageLackattr03",
            Level.LEVEL0,
            async (done: Function) => {
                console.info("testWebviewpageLackattr03 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: events_emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr03 get state result is: " +
                                JSON.stringify(indexEvent)
                        )
                        expect(indexEvent.data.STATUS.extra).assertEqual(
                            "hello"
                        )
                    }
                    let indexEvent: events_emitter.InnerEvent = {
                        eventId: 90203,
                        priority: events_emitter.EventPriority.LOW,
                    }
                    sendEventByKey("getHitTestValue", 10, "")
                    events_emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr03events_emitter err : " +
                            JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr03 END")
                done()
            }
        )

        /**
         * @tc.name   testgetOriginQuota005
         * @tc.number testgetOriginQuota005
         * @tc.desc   testgetOriginQuota005
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testgetOriginQuota005", Level.LEVEL0, async (done: Function) => {
            console.info("testgetOriginQuota005 START")
            await Utils.sleep(2000)
            let strJson: string = getInspectorByKey("getOriginQuotakey")
            console.info("[testgetOriginQuota005] component strJson:" + strJson)
            expect(JSON.parse(strJson).$type).assertEqual("Button")
            done()
        })

        /**
         * @tc.name   testWebviewpageLackattr6
         * @tc.number testWebviewpageLackattr6
         * @tc.desc   testWebviewpageLackattr6
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testWebviewpageLackattr6", Level.LEVEL0, async (done: Function) => {
            console.info("testWebviewpageLackattr06 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: events_emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr06 get state result is: " +
                            JSON.stringify(indexEvent)
                    )
                    expect(indexEvent.data.STATUS.usage).assertEqual(0)
                }
                let indexEvent: events_emitter.InnerEvent = {
                    eventId: 90206,
                    priority: events_emitter.EventPriority.LOW,
                }
                sendEventByKey("getOriginUsage", 10, "")
                events_emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr06events_emitter err : " +
                        JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr06 END")
            done()
        })

        /**
         * @tc.name   testWebviewpageLackattr7
         * @tc.number testWebviewpageLackattr7
         * @tc.desc   testWebviewpageLackattr7
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testWebviewpageLackattr7", Level.LEVEL0, async (done: Function) => {
            console.info("testWebviewpageLackattr07 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: events_emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr07 get state result is: " +
                            JSON.stringify(indexEvent)
                    )
                    expect(indexEvent.data.STATUS).assertTrue()
                }
                let indexEvent: events_emitter.InnerEvent = {
                    eventId: 90207,
                    priority: events_emitter.EventPriority.LOW,
                }
                sendEventByKey("saveCookieAsync", 10, "")
                events_emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr07events_emitter err : " +
                        JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr07END")
            done()
        })

        /**
         * @tc.name   testWebviewpageLackattr8
         * @tc.number testWebviewpageLackattr8
         * @tc.desc   testWebviewpageLackattr8
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testWebviewpageLackattr8", Level.LEVEL0, async (done: Function) => {
            console.info("testWebviewpageLackattr08 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: events_emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr08 get state result is: " +
                            JSON.stringify(indexEvent)
                    )
                    expect(indexEvent.data.STATUS != null).assertTrue()
                }
                let indexEvent: events_emitter.InnerEvent = {
                    eventId: 90208,
                    priority: events_emitter.EventPriority.LOW,
                }
                sendEventByKey("saveWebArchive", 10, "")
                events_emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr8events_emitter err : " +
                        JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr08END")
            done()
        })

        /**
         * @tc.name   testWebviewpageLackattr9
         * @tc.number testWebviewpageLackattr9
         * @tc.desc   testWebviewpageLackattr9
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testWebviewpageLackattr9", Level.LEVEL0, async (done: Function) => {
            console.info("testrunJavaScript09 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: events_emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr09 get state result is: " +
                            JSON.stringify(indexEvent)
                    )
                    expect(indexEvent.data.STATUS != null).assertTrue()
                }
                let indexEvent: events_emitter.InnerEvent = {
                    eventId: 90209,
                    priority: events_emitter.EventPriority.LOW,
                }
                sendEventByKey("runJavaScript", 10, "")
                events_emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr9events_emitter err : " +
                        JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr09END")
            done()
        })
    })
}
