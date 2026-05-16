/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
    beforeEach,
    afterEach,
    it,
    expect,
    Level,
} from "@ohos/hypium"
import events_emitter from "@ohos.events.emitter"
import Utils from "../../MainAbility/common/Utils"
let emitKey = "emitUserAgent"
export default function webJsunit() {
    describe("ActsAceWebDevTest1", () => {
        beforeEach(async () => {
            await Utils.sleep(2000)
            console.info("web beforeEach start")
        })
        afterEach(async () => {
            console.info("web afterEach start:" + emitKey)
            try {
                let backData: events_emitter.EventData = {
                    data: {
                        ACTION: emitKey,
                    },
                }
                let backEvent: events_emitter.InnerEvent = {
                    eventId: 10,
                    priority: events_emitter.EventPriority.LOW,
                }
                console.info("start send emitKey")
                events_emitter.emit(backEvent, backData)
            } catch (err) {
                console.info("emit emitKey  err: " + JSON.stringify(err))
            }
            await Utils.sleep(2000)
        })

        /**
         * @tc.name   testmultiWindow01
         * @tc.number testmultiWindow01
         * @tc.desc   testmultiWindow01
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testmultiWindow01", Level.LEVEL0, async () => {
            console.info("testmultiWindow01  START")
            await Utils.sleep(2000)
            let strJson = getInspectorByKey("multiwindow")
            console.info("[multiwindow] component strJson:" + strJson)
            let obj: Record<string, Object> = JSON.parse(strJson)
            expect(obj.$type).assertEqual("web")
            expect(JSON.parse(strJson).$attrs.multiWindow).assertTrue()
            console.info(
                "[testmultiWindow0010]  value :" +
                    JSON.parse(strJson).$attrs.multiWindow
            )
        })

        /**
         * @tc.name   testonWindowExit02
         * @tc.number testonWindowExit02
         * @tc.desc   testonWindowExit02
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testonWindowExit02", Level.LEVEL0, async () => {
            Utils.registerContainEvent("WindowExit", true, 800)
            sendEventByKey("multiwindow", 10, "")
        })

        /**
         * @tc.name   tesweb03
         * @tc.number tesweb03
         * @tc.desc   tesweb03
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("tesweb03", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onWindowNew", true, 801)
            sendEventByKey("onWindowNew", 10, "")
        })

        /**
         * @tc.name   tesweb04
         * @tc.number tesweb04
         * @tc.desc   tesweb04
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("tesweb04", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onFullScreen", true, 802)
            sendEventByKey("onWindowNew", 10, "")
        })

        /**
         * @tc.name   tesweb05
         * @tc.number tesweb05
         * @tc.desc   tesweb05
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("tesweb05", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onSslErrorEventReceive", true, 803)
            sendEventByKey("onSslErrorEventReceive", 10, "")
        })

        /**
         * @tc.name   testweb06
         * @tc.number testweb06
         * @tc.desc   testweb06
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb06", Level.LEVEL0, async () => {
            console.info("testmultiWindow016 START")
            await Utils.sleep(2000)
            let strJson = getInspectorByKey("web2")
            console.info("[multiwindow] component strJson:" + strJson)
            let obj: Record<string, Object> = JSON.parse(strJson)
            expect(obj.$type).assertEqual("web")
            expect(JSON.parse(strJson).$attrs.atio).assertEqual(150)
            console.info(
                "[testmultiWindow0016]  value :" +
                    JSON.parse(strJson).$attrs.multiWindow
            )
        })

        /**
         * @tc.name   testweb07
         * @tc.number testweb07
         * @tc.desc   testweb07
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb07", Level.LEVEL0, async () => {
            emitKey = "emitGeturl"
            Utils.registerContainEvent("Geturl", null, 810)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb07
         * @tc.number testweb07
         * @tc.desc   testweb07
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb07", Level.LEVEL0, async () => {
            emitKey = "emitclearClientAuthenticationCache"
            Utils.registerContainEvent(
                "clearClientAuthenticationCache",
                true,
                811
            )
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb08
         * @tc.number testweb08
         * @tc.desc   testweb08
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb08", Level.LEVEL0, async () => {
            emitKey = "emitclearSslCache"
            Utils.registerContainEvent("clearSslCache", true, 812)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb09
         * @tc.number testweb09
         * @tc.desc   testweb09
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb09", Level.LEVEL0, async () => {
            emitKey = "emitsearchNext"
            Utils.registerContainEvent("clearsearchNext", true, 813)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb10
         * @tc.number testweb10
         * @tc.desc   testweb10
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb10", Level.LEVEL0, async () => {
            emitKey = "emitclearMatches"
            Utils.registerContainEvent("clearMatches", true, 814)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb11
         * @tc.number testweb11
         * @tc.desc   testweb11
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb11", Level.LEVEL0, async () => {
            emitKey = "emitDefaultUserAgent"
            Utils.registerContainEvent("getDefaultUserAgent", "", 815)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb12
         * @tc.number testweb12
         * @tc.desc   testweb12
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb12", Level.LEVEL0, async () => {
            emitKey = "emitgetWebId"
            Utils.registerContainEvent("getWebId", 0, 816)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb13
         * @tc.number testweb13
         * @tc.desc   testweb13
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb13", Level.LEVEL0, async () => {
            emitKey = "emitcreateWebMessagePorts"
            Utils.registerContainEvent("createWebMessagePorts", 0, 817)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb14
         * @tc.number testweb14
         * @tc.desc   testweb14
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb14", Level.LEVEL0, async () => {
            emitKey = "emitdeleteSessionCookie"
            Utils.registerContainEvent("deleteSessionCookie", true, 818)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb15
         * @tc.number testweb15
         * @tc.desc   testweb15
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb15", Level.LEVEL0, async () => {
            emitKey = "emitdeleteExpiredCookie"
            Utils.registerContainEvent("deleteExpiredCookie", true, 819)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb16
         * @tc.number testweb16
         * @tc.desc   testweb16
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb16", Level.LEVEL0, async () => {
            emitKey = "emitexistCookie"
            Utils.registerContainEvent("existCookie", true, 820)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb17
         * @tc.number testweb17
         * @tc.desc   testweb17
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb17", Level.LEVEL0, async () => {
            emitKey = "emitgetCookie"
            Utils.registerContainEvent("getCookie", "", 821)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb18
         * @tc.number testweb18
         * @tc.desc   testweb18
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb18", Level.LEVEL0, async () => {
            emitKey = "emitsetCookie"
            Utils.registerContainEvent("setCookie", true, 822)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb19
         * @tc.number testweb19
         * @tc.desc   testweb19
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb19", Level.LEVEL0, async () => {
            emitKey = "emitsaveCookie"
            Utils.registerContainEvent("saveCookie", true, 823)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb20
         * @tc.number testweb20
         * @tc.desc   testweb20
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb20", Level.LEVEL0, async () => {
            emitKey = "emitputAcceptFileURICookieEnabled"
            Utils.registerContainEvent(
                "putAcceptFileURICookieEnabled",
                true,
                823
            )
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb21
         * @tc.number testweb21
         * @tc.desc   testweb21
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb21", Level.LEVEL0, async () => {
            emitKey = "emitputAcceptThirdPartyCookieEnabled"
            Utils.registerContainEvent(
                "putAcceptThirdPartyCookieEnabled",
                true,
                824
            )
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb22
         * @tc.number testweb22
         * @tc.desc   testweb22
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb22", Level.LEVEL0, async () => {
            emitKey = "emitisFileURICookieAllowed"
            Utils.registerContainEvent("isFileURICookieAllowed", false, 825)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb23
         * @tc.number testweb23
         * @tc.desc   testweb23
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb23", Level.LEVEL0, async () => {
            emitKey = "hasImage"
            Utils.registerContainEvent("isThirdPartyCookieAllowed", false, 826)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb24
         * @tc.number testweb24
         * @tc.desc   testweb24
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb24", Level.LEVEL0, async () => {
            emitKey = "hasImageTwo"
            Utils.registerContainEvent("hasImage", true, 828)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb25
         * @tc.number testweb25
         * @tc.desc   testweb25
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb25", Level.LEVEL0, async () => {
            emitKey = "setNetworkAvailable"
            Utils.registerContainEvent("hasImage", true, 829)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb26
         * @tc.number testweb26
         * @tc.desc   testweb26
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb26", Level.LEVEL0, async () => {
            emitKey = "getFavicon"
            Utils.registerContainEvent("setNetworkAvailable", false, 830)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb27
         * @tc.number testweb27
         * @tc.desc   testweb27
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb27", Level.LEVEL0, async () => {
            emitKey = "getOriginalUrl"
            Utils.registerContainEvent("getFavicon", "baidu", 831)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb28
         * @tc.number testweb28
         * @tc.desc   testweb28
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb28", Level.LEVEL0, async () => {
            emitKey = "history"
            Utils.registerContainEvent("getOriginalUrl", "www.baidu.com", 832)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb29
         * @tc.number testweb29
         * @tc.desc   testweb29
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb29", Level.LEVEL0, async () => {
            emitKey = "pageUp"
            Utils.registerContainEvent("history", 1, 833)
            sendEventByKey("webcomponentapi9", 10, "")
        })

        /**
         * @tc.name   testweb30
         * @tc.number testweb30
         * @tc.desc   testweb30
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testweb30", Level.LEVEL0, async () => {
            emitKey = "pageUp"
            Utils.registerContainEvent("pageUp", true, 834)
            sendEventByKey("webcomponentapi9", 10, "")
        })
    })
}
