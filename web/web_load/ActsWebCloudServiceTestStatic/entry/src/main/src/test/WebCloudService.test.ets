import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, afterEach, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { Utils, startAbility, stopApplication } from './Util.test';
import webview from '@ohos.web.webview';
import router from '@ohos.router';
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function webCloudServiceTest() {

    describe("webCloudServiceTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.msSleep(2000);
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    testAbilityContext = abilitys.context
                    hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError | null) : void => {
                if (err != null ) {
                    hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
                }
                hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebcloudservicetest.static")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(() => {
            emitter.off(10);
        })

        /**
         * @tc.name   testOnPageBegin_static
         * @tc.number SUB_WEB_WEBATTRIBUTE_ONPAGEBEGIN_0001
         * @tc.desc   test OnPageBegin
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOnPageBegin_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnPageBegin", 10);
            Utils.registerEvent("testOnPageBegin_static", "resource://rawfile/first.html", 100, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    hilog.info(domain, tag, '%{public}s', 'button is not null');
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnPageBegin end');
        })

        /**
         * @tc.name   testOnPageEnd_static
         * @tc.number SUB_WEB_WEBATTRIBUTE_ONPAGEEND_0001
         * @tc.desc   test OnPageEnd
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOnPageEnd_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnPageEnd", 10);
            Utils.registerEvent("testOnPageEnd_static", "resource://rawfile/first.html", 101, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnPageEnd end');
        })

        /**
         * @tc.name   testOnProgressChange_static
         * @tc.number SUB_WEB_WEBATTRIBUTE_ONPROGRESSCHANGE_0001
         * @tc.desc   test OnProressChange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOnProgressChange_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnProgressChange", 10);
            Utils.registerEvent("testOnProgressChange_static", "onProgressChange", 102, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text("WebAttributeTestButton"));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnProgressChange end');
        })

        /**
         * @tc.name   testOnLoadIntercept_static
         * @tc.number SUB_WEB_WEBATTRIBUTE_ONLOADINTERCEPT_0001
         * @tc.desc   test OnLoadIntercept
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOnLoadIntercept_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnLoadIntercept", 10);
            Utils.registerEvent("testOnLoadIntercept_static", "onLoadIntercept", 104, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnLoadIntercept end');
        })

        /**
         * @tc.name   testWebviewController_refresh_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0001
         * @tc.desc   test Refresh
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_refresh_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Refresh", 10);
            Utils.registerEvent("testWebviewController_refresh_static", "resource://rawfile/first.html", 105, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_refresh end');
        })

        /**
         * @tc.name   testWebviewController_stop_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STOP_0001
         * @tc.desc   test Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_stop_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Stop", 10);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_stop end');
        })

        /**
         * @tc.name   testWebviewController_postUrl_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTURL_0001
         * @tc.desc   test PostUrl
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_postUrl_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("PostUrl", 10);
            Utils.registerEvent("testWebviewController_postUrl_static", "resource://rawfile/second.html", 106, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_postUrl end');
        })

        /**
         * @tc.name   testWebviewController_loadData_getTitle_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETTITLE_0001
         * @tc.desc   test PostUrl
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_loadData_getTitle_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("LoadData", 10);
            Utils.registerEvent("testWebviewController_loadData_getTitle_static", "LoadData", 107, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_loadData_getTitle end');
        })

        /**
         * @tc.name   testWebviewController_url_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_URL_0001
         * @tc.desc   test url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_url_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OriginalUrl", 10);
            Utils.registerEvent("testWebviewController_url_static", "resource://rawfile/second.html*resource://rawfile/first.html", 111, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_userAgent&url end');
        })

        /**
         * @tc.name   testWebviewController_getLastJavascriptProxyCallingFrameUrl_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETLASTJAVASCRIPTPROXYCALLINGFRAMEURL_0001
         * @tc.desc   test GetLastJavascriptProxyCallingFrameUrl
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_getLastJavascriptProxyCallingFrameUrl_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("GetLastJavascriptProxyCallingFrameUrl", 10);
            Utils.registerEvent("testWebviewController_getLastJavascriptProxyCallingFrameUrl_static", "true", 112, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_getLastJavascriptProxyCallingFrameUrl end');
        })

        /**
         * @tc.name   testWebviewController_backwardAndforward_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BACKWARDANDFORWARD_0001
         * @tc.desc   test BackwardAndForward
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_backwardAndforward_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("BackwardAndForward", 10);
            Utils.registerEvent("testWebviewController_backwardAndforward_static", "true*resource://rawfile/first.html*true*resource://rawfile/second.html", 117, done);
            await Utils.msSleep(2000);

            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_backwardAndforward end');
        })

        /**
         * @tc.name   testWebviewController_clearWebSchemeHandler_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARWEBSCHEMEHANDLER_0001
         * @tc.desc   test ClearWebSchemeHandler
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebviewController_clearWebSchemeHandler_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("ClearWebSchemeHandler", 10);
            Utils.registerEvent("testWebviewController_clearWebSchemeHandler_static", "done", 118, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_clearWebSchemeHandler end');
        })

        /**
         * @tc.name   testWebview_webSchemeHandlerResponse_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WEBSCHEMEHANDLERRESPONSE_0001
         * @tc.desc   test WebSchemeHandlerResponse
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebview_webSchemeHandlerResponse_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("WebSchemeHandlerResponse", 10);
            Utils.registerEvent("testWebview_webSchemeHandlerResponse_static", "https://www.example.com", 120, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_webSchemeHandlerResponse end');
        })

        /**
         * @tc.name   testWebview_webDownloadItem_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WEBDOWNLOADITEM_0001
         * @tc.desc   test WebDownloadItem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebview_webDownloadItem_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("WebDownloadItem", 10);
            Utils.registerEvent("testWebview_webDownloadItem_static", "https://www.example.com/", 121, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_webDownloadItem end');
        })

        /**
         * @tc.name   testWebview_Constructor_static
         * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CONSTRUCTOR_0001
         * @tc.desc   test Constructor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testWebview_Constructor_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Constructor", 10);
            Utils.registerEvent("testWebview_Constructor_static", "done", 130, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.text('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_cookieManager end');
        })

    })

}