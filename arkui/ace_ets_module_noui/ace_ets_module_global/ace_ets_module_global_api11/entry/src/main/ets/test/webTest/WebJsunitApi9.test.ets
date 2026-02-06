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
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0010
         * @tc.name         testmultiWindow01
         * @tc.desic         multiWindow
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
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
        /*
         *tc.number SUB_ACE_BASIC_ETS_API_0012
         *tc.name  testonWindowExit02
         *tc.desic onWindowExit
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testonWindowExit02", Level.LEVEL0, async () => {
            Utils.registerContainEvent("WindowExit", true, 800)
            sendEventByKey("multiwindow", 10, "")
        })
        /*
         *tc.number SUB_ACE_BASIC_ETS_API_0013
         *tc.name  testweb03
         *tc.desic onWindowNew
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("tesweb03", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onWindowNew", true, 801)
            sendEventByKey("onWindowNew", 10, "")
        })
        /*
         *tc.number SUB_ACE_BASIC_ETS_API_0014
         *tc.name  testweb04
         *tc.desc onFullScreen
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("tesweb04", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onFullScreen", true, 802)
            sendEventByKey("onWindowNew", 10, "")
        })
        /*
         *tc.number SUB_ACE_BASIC_ETS_API_0015
         *tc.name  testweb05
         *tc.desc onSslErrorEventReceive
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("tesweb05", Level.LEVEL0, async () => {
            Utils.registerContainEvent("onSslErrorEventReceive", true, 803)
            sendEventByKey("onSslErrorEventReceive", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0016
         * @tc.name         testweb06
         * @tc.desic        multiWindow
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
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
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0017
         * @tc.name         testweb07
         * @tc.desic        getUrl
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb07", Level.LEVEL0, async () => {
            emitKey = "emitGeturl"
            Utils.registerContainEvent("Geturl", null, 810)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0018
         * @tc.name         testweb08
         * @tc.desic        clearClientAuthenticationCache
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
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
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0018
         * @tc.name         testweb08
         * @tc.desic        clearSslCache
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb08", Level.LEVEL0, async () => {
            emitKey = "emitclearSslCache"
            Utils.registerContainEvent("clearSslCache", true, 812)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0019
         * @tc.name         testweb09
         * @tc.desic        searchNext
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb09", Level.LEVEL0, async () => {
            emitKey = "emitsearchNext"
            Utils.registerContainEvent("clearsearchNext", true, 813)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0020
         * @tc.name         testweb10
         * @tc.desic        clearMatches
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb10", Level.LEVEL0, async () => {
            emitKey = "emitclearMatches"
            Utils.registerContainEvent("clearMatches", true, 814)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0021
         * @tc.name         testweb11
         * @tc.desic        getDefaultUserAgent
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb11", Level.LEVEL0, async () => {
            emitKey = "emitDefaultUserAgent"
            Utils.registerContainEvent("getDefaultUserAgent", "", 815)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0022
         * @tc.name         testweb12
         * @tc.desic        getDefaultUserAgent
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb12", Level.LEVEL0, async () => {
            emitKey = "emitgetWebId"
            Utils.registerContainEvent("getWebId", 0, 816)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0022
         * @tc.name         testweb13
         * @tc.desic        getDefaultUserAgen
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb13", Level.LEVEL0, async () => {
            emitKey = "emitcreateWebMessagePorts"
            Utils.registerContainEvent("createWebMessagePorts", 0, 817)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0022
         * @tc.name         testweb14
         * @tc.desic        getDefaultUserAgent
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb14", Level.LEVEL0, async () => {
            emitKey = "emitdeleteSessionCookie"
            Utils.registerContainEvent("deleteSessionCookie", true, 818)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0023
         * @tc.name         testweb15
         * @tc.desic        getDefaultUserAgent
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb15", Level.LEVEL0, async () => {
            emitKey = "emitdeleteExpiredCookie"
            Utils.registerContainEvent("deleteExpiredCookie", true, 819)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0023
         * @tc.name         testweb16
         * @tc.desic        existCookie
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb16", Level.LEVEL0, async () => {
            emitKey = "emitexistCookie"
            Utils.registerContainEvent("existCookie", true, 820)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb17
         * @tc.desic        getCookie
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb17", Level.LEVEL0, async () => {
            emitKey = "emitgetCookie"
            Utils.registerContainEvent("getCookie", "", 821)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb18
         * @tc.desic        getCookie
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb18", Level.LEVEL0, async () => {
            emitKey = "emitsetCookie"
            Utils.registerContainEvent("setCookie", true, 822)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb19
         * @tc.desic        saveCookie
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb19", Level.LEVEL0, async () => {
            emitKey = "emitsaveCookie"
            Utils.registerContainEvent("saveCookie", true, 823)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb20
         * @tc.desic        putAcceptFileURICookieEnabled
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
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
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb20
         * @tc.desic        putAcceptFileURICookieEnabled
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
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
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb22
         * @tc.desic        putAcceptFileURICookieEnabled
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb22", Level.LEVEL0, async () => {
            emitKey = "emitisFileURICookieAllowed"
            Utils.registerContainEvent("isFileURICookieAllowed", false, 825)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0024
         * @tc.name         testweb22
         * @tc.desic        putAcceptFileURICookieEnabled
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb23", Level.LEVEL0, async () => {
            emitKey = "hasImage"
            Utils.registerContainEvent("isThirdPartyCookieAllowed", false, 826)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0025
         * @tc.name         testweb22
         * @tc.desic        hasImageCallback
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb24", Level.LEVEL0, async () => {
            emitKey = "hasImageTwo"
            Utils.registerContainEvent("hasImage", true, 828)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0026
         * @tc.name         testweb22
         * @tc.desic        hasImagePromise
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb25", Level.LEVEL0, async () => {
            emitKey = "setNetworkAvailable"
            Utils.registerContainEvent("hasImage", true, 829)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0027
         * @tc.name         testweb22
         * @tc.desic        setNetworkAvailable
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb26", Level.LEVEL0, async () => {
            emitKey = "getFavicon"
            Utils.registerContainEvent("setNetworkAvailable", false, 830)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0028
         * @tc.name         testweb22
         * @tc.desic        getFavicon
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb27", Level.LEVEL0, async () => {
            emitKey = "getOriginalUrl"
            Utils.registerContainEvent("getFavicon", "baidu", 831)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0029
         * @tc.name         testweb22
         * @tc.desic        getFavicon
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb28", Level.LEVEL0, async () => {
            emitKey = "history"
            Utils.registerContainEvent("getOriginalUrl", "www.baidu.com", 832)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0030
         * @tc.name         testweb22
         * @tc.desic        getFavicon
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb29", Level.LEVEL0, async () => {
            emitKey = "pageUp"
            Utils.registerContainEvent("history", 1, 833)
            sendEventByKey("webcomponentapi9", 10, "")
        })
        /*
         * @tc.number       SUB_ACE_BASIC_ETS_API_0031
         * @tc.name         testweb22
         * @tc.desic        getFavicon
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */

        it("testweb30", Level.LEVEL0, async () => {
            emitKey = "pageUp"
            Utils.registerContainEvent("pageUp", true, 834)
            sendEventByKey("webcomponentapi9", 10, "")
        })
    })
}
