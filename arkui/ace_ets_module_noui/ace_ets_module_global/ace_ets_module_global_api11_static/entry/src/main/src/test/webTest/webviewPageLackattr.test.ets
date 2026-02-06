'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import emitter from "@ohos.events.emitter"
import Utils from "../../../ets/MainAbility/common/Utils"
export default function webViewPageattrLackJsunit() {
    describe("webviewpageLackattr", () => {
        beforeAll(() => {
            console.info("webviewpageLackattr beforeAll start");
            await UtilsTest.msSleep(4000)
            await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });

        beforeEach(async (): Promise<void> => {
            console.info("webviewpageLackattr beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/web/webviewpageLackattr',
            }
            try {
                const routerInstance = AppStorage.get<Router>("router") as Router
                routerInstance.clear();
                let pages = routerInstance.getState();
                console.info("get webviewpageLackattr state pages:" + JSON.stringify(pages));
                if (!("webviewpageLackattr" == pages.name)) {
                    console.info("get webviewpageLackattr pages.name:" + JSON.stringify(pages.name));
                    // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
                    // let result = await routerInstance.pushUrl(options);
                    routerInstance.pushUrl(options);
                    await CommonFunc.sleep(2000);
                    // console.info("push webviewpageLackattr page result:" + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push webviewpageLackattr page error:" + err);
            }
            console.info("webviewpageLackattr beforeEach end");
        });

        afterEach(async () => {
            await Utils.sleep(1000)
            console.info("webviewpageLackattr after each called")
        })
        
    
        /**
     * @tc.number   testWebviewpageLackattr_static_01
     * @tc.name     testWebviewpageLackattr_static_01
     * @tc.desc     testWebviewpageLackattr_static_01
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
                console.info("testWebviewpageLackattr_static_01 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr_static_01 get state result is: " +
                            JSON.stringify(indexEvent)
                        )
                        expect((indexEvent.data as ESObject).getProperty('STATUS')).assertTrue()
                    }
                    let indexEvent: emitter.InnerEvent = {
                        eventId: 90201,
                        priority: emitter.EventPriority.LOW,
                    }
                    inspector.sendEventByKey("loadUrl", 10, "")
                    emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr_static_01 emitter err : " +
                        JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr_static_01 END")
                done()
            }
        )
        
    
        /**
     * @tc.number   testWebviewpageLackattr_static_02
     * @tc.name     testWebviewpageLackattr_static_02
     * @tc.desc     testWebviewpageLackattr_static_02
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
                console.info("testWebviewpageLackattr_static_02 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr_static_02 get state result is: " +
                            JSON.stringify(indexEvent)
                        )
                        expect(!!(indexEvent.data as ESObject).getProperty('STATUS')).assertTrue()
                    }
                    let indexEvent: emitter.InnerEvent = {
                        eventId: 90202,
                        priority: emitter.EventPriority.LOW,
                    }
                    inspector.sendEventByKey("getHitTest", 10, "")
                    emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr_static_02events_emitter err : " +
                        JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr_static_02 END")
                done()
            }
        )
        
    
        /**
     * @tc.number   testWebviewpageLackattr_static_04
     * @tc.name     testWebviewpageLackattr_static_04
     * @tc.desc     testWebviewpageLackattr_static_04
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
                console.info("testWebviewpageLackattr_static_04 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr_static_04 get state result is: " +
                            JSON.stringify(indexEvent)
                        )
                        expect((indexEvent.data as ESObject).getProperty('STATUS')).assertEqual("prign")
                    }
                    let indexEvent: emitter.InnerEvent = {
                        eventId: 90204,
                        priority: emitter.EventPriority.LOW,
                    }
                    inspector.sendEventByKey("getOriginsPromise", 10, "")
                    emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr_static_04events_emitter err : " +
                        JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr_static_04 END")
                done()
            }
        )
        
    
        /**
     * @tc.number   testWebviewpageLackattr_static_03
     * @tc.name     testWebviewpageLackattr_static_03
     * @tc.desc     testWebviewpageLackattr_static_03
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
                console.info("testWebviewpageLackattr_static_03 START")
                await Utils.sleep(2000)
                try {
                    let callback = (indexEvent: emitter.EventData) => {
                        console.info(
                            "testWebviewpageLackattr_static_03 get state result is: " +
                            JSON.stringify(indexEvent)
                        )
                        expect(JSON.parseJsonElement((indexEvent.data as ESObject).getProperty('STATUS').toString()).getString('extra')).assertEqual(
                            "hello"
                        )
                    }
                    let indexEvent: emitter.InnerEvent = {
                        eventId: 90203,
                        priority: emitter.EventPriority.LOW,
                    }
                    inspector.sendEventByKey("getHitTestValue", 10, "")
                    emitter.on(indexEvent, callback)
                } catch (err) {
                    console.info(
                        "testWebviewpageLackattr_static_03events_emitter err : " +
                        JSON.stringify(err)
                    )
                }
                console.info("testWebviewpageLackattr_static_03 END")
                done()
            }
        )
        

    
    
/**
     * @tc.number   testgetOriginQuota005
     * @tc.name     testgetOriginQuota005
     * @tc.desc     testgetOriginQuota005
     * @tc.level    Level.LEVEL0
     */
it('testgetOriginQuota005', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testgetOriginQuota005 START")
            await Utils.sleep(2000)
            let strJson: string = inspector.getInspectorByKey("getOriginQuotakey")
            await Utils.sleep(2000)
            console.info("[testgetOriginQuota005] component strJson:" + strJson)
            expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Button")
            done()
        })
        

    
    
/**
     * @tc.number   testWebviewpageLackattr_static_06
     * @tc.name     testWebviewpageLackattr_static_06
     * @tc.desc     testWebviewpageLackattr_static_06
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testWebviewpageLackattr_static_06 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr_static_06 get state result is: " +
                        JSON.stringify(indexEvent)
                    )
                    expect(JSON.parseJsonElement((indexEvent.data as ESObject).getProperty('STATUS').toString()).getString('usage')).assertEqual(0)
                }
                let indexEvent: emitter.InnerEvent = {
                    eventId: 90206,
                    priority: emitter.EventPriority.LOW,
                }
                inspector.sendEventByKey("getOriginUsage", 10, "")
                emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr_static_06events_emitter err : " +
                    JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr_static_06 END")
            done()
        })
        

    
    
/**
     * @tc.number   testWebviewpageLackattr_static_07
     * @tc.name     testWebviewpageLackattr_static_07
     * @tc.desc     testWebviewpageLackattr_static_07
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testWebviewpageLackattr_static_07 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr_static_07 get state result is: " +
                        JSON.stringify(indexEvent)
                    )
                    expect((indexEvent.data as ESObject).getProperty('STATUS')).assertTrue()
                }
                let indexEvent: emitter.InnerEvent = {
                    eventId: 90207,
                    priority: emitter.EventPriority.LOW,
                }
                inspector.sendEventByKey("saveCookieAsync", 10, "")
                emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr_static_07events_emitter err : " +
                    JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr_static_07END")
            done()
        })
        

    
    
/**
     * @tc.number   testWebviewpageLackattr_static_08
     * @tc.name     testWebviewpageLackattr_static_08
     * @tc.desc     testWebviewpageLackattr_static_08
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testWebviewpageLackattr_static_08 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr_static_08 get state result is: " +
                        JSON.stringify(indexEvent)
                    )
                    expect((indexEvent.data as ESObject).getProperty('STATUS') != null).assertTrue()
                }
                let indexEvent: emitter.InnerEvent = {
                    eventId: 90208,
                    priority: emitter.EventPriority.LOW,
                }
                inspector.sendEventByKey("saveWebArchive", 10, "")
                emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr_static_08 emitter err : " +
                    JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr_static_08 END")
            done()
        })
        

    
    
/**
     * @tc.number   testWebviewpageLackattr_static_09
     * @tc.name     testWebviewpageLackattr_static_09
     * @tc.desc     testWebviewpageLackattr_static_09
     * @tc.level    Level.LEVEL0
     */
it('testWebviewpageLackattr_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info("testWebviewpageLackattr_static_09 START")
            await Utils.sleep(2000)
            try {
                let callback = (indexEvent: emitter.EventData) => {
                    console.info(
                        "testWebviewpageLackattr_static_09 get state result is: " +
                        JSON.stringify(indexEvent)
                    )
                    expect((indexEvent.data as ESObject).getProperty('STATUS') != null).assertTrue()
                }
                let indexEvent: emitter.InnerEvent = {
                    eventId: 90209,
                    priority: emitter.EventPriority.LOW,
                }
                inspector.sendEventByKey("runJavaScript", 10, "")
                emitter.on(indexEvent, callback)
            } catch (err) {
                console.info(
                    "testWebviewpageLackattr_static_09 emitter err : " +
                    JSON.stringify(err)
                )
            }
            console.info("testWebviewpageLackattr_static_09 END")
            done()
        })
    })
}
