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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function WebViewEnumAndFontLibrary() {

  describe('WebViewEnumAndFontLibraryTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewEnumAndFontLibrary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages));
        if (!("WebViewEnumAndFontLibrary" == pages.name)) {
          console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewEnumAndFontLibrary page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibrary page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORMODE_0100
    * @tc.name       : testFileSelectorMode001
    * @tc.desc       : test FileSelectorModeFileOpenMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorMode001', 0, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorMode001", 0, 861, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0100
    * @tc.name       : testRunJavaScript001
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript001', 0, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScript", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript001", true, 1241, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MIXEDMODENONE_0100
    * @tc.name       : testMixedModeNone001
    * @tc.desc       : test MixedModeNone
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMixedModeNone001', 0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeNone", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMixedModeNone001", 4, 186, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MIXEDMODEALL_0100
    * @tc.name       : testMixedModeAll001
    * @tc.desc       : test MixedModeAll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMixedModeAll001', 0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeAll", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMixedModeAll001", 3, 188, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0100
    * @tc.name       : testMessageLevel001
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMessageLevel001', 0, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelDebug", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMessageLevel001", '1', 601, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0200
    * @tc.name       : testMessageLevel002
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMessageLevel002', 0, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelInfo", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMessageLevel002", '2', 602, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0300
    * @tc.name       : testMessageLevel003
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMessageLevel003', 0, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelWarn", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMessageLevel003", '3', 603, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0400
    * @tc.name       : testMessageLevel004
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMessageLevel004', 0, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelError", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMessageLevel004", '4', 604, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0500
    * @tc.name       : testMessageLevel005
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMessageLevel005', 0, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelLog", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMessageLevel005", '2', 605, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMX_0100
    * @tc.name       : testWebContextMenuParamX001
    * @tc.desc       : test WebContextMenuParamX
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamX001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamX", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamX001", true, 801, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMY_0100
    * @tc.name       : testWebContextMenuParamY001
    * @tc.desc       : test WebContextMenuParamY
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamY001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamY", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamY001", true, 802, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetLinkUrl001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetLinkUrl", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetLinkUrl001", "http://www.baidu.com/", 803, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETUNFILTEREDLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetUnfilteredLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetUnfilteredLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetUnfilteredLinkUrl001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetUnfilteredLinkUrl", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetUnfilteredLinkUrl001", "http://www.baidu.com/", 804, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCEURL_0100
    * @tc.name       : testWebContextMenuParamGetSourceUrl001
    * @tc.desc       : test WebContextMenuParamGetSourceUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceUrl001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSourceUrl", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetSourceUrl001", "", 805, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMEXISTSIMAGECONTENTS_0100
    * @tc.name       : testWebContextMenuParamExistsImageContents001
    * @tc.desc       : test WebContextMenuParamExistsImageContents
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamExistsImageContents001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamExistsImageContents", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamExistsImageContents001", false, 806, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETMEDIATYPE_0100
    * @tc.name       : testWebContextMenuParamGetMediaType001
    * @tc.desc       : test WebContextMenuParamGetMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetMediaType001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetMediaType", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetMediaType001", 0, 807, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSELECTIONTEXT_0100
    * @tc.name       : testWebContextMenuParamGetSelectionText001
    * @tc.desc       : test WebContextMenuParamGetSelectionText
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSelectionText001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSelectionText", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetSelectionText001", "", 808, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCETYPE_0100
    * @tc.name       : testWebContextMenuParamGetSourceType001
    * @tc.desc       : test WebContextMenuParamGetSourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceType001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSourceType", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetSourceType001", 2, 809, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETINPUTFIELDTYPE_0100
    * @tc.name       : testWebContextMenuParamGetInputFieldType001
    * @tc.desc       : test WebContextMenuParamGetInputFieldType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetInputFieldType001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetInputFieldType", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetInputFieldType001", 0, 810, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMISEDITABLE_0100
    * @tc.name       : testWebContextMenuParamIsEditable001
    * @tc.desc       : test WebContextMenuParamIsEditable
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamIsEditable001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamIsEditable", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamIsEditable001", false, 811, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETEDITSTATEFLAGS_0100
    * @tc.name       : testWebContextMenuParamGetEditStateFlags001
    * @tc.desc       : test WebContextMenuParamGetEditStateFlags
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetEditStateFlags001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetEditStateFlags", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebContextMenuParamGetEditStateFlags", 8, 812, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUINPUTFIELDTYPENONE_0100
    * @tc.name       : testContextMenuInputFieldTypeNone001
    * @tc.desc       : test ContextMenuInputFieldTypeNone
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuInputFieldTypeNone001', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuInputFieldTypeNone", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuInputFieldTypeNone001", 0, 831, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUSOURCETYPELONGPRESS_0100
    * @tc.name       : testContextMenuSourceTypeLongPress001
    * @tc.desc       : test ContextMenuSourceTypeLongPress
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuSourceTypeLongPress001', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuSourceTypeLongPress", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuSourceTypeLongPress001", 2, 841, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUEDITSTATEFLAGS_0100
    * @tc.name       : testContextMenuEditStateFlags001
    * @tc.desc       : test ContextMenuEditStateFlags
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuEditStateFlags001', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuEditStateFlags", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuEditStateFlags001", 8, 851, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUMEDIATYPE_0100
    * @tc.name       : testContextMenuMediaType001
    * @tc.desc       : test ContextMenuMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuMediaType001', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeNone", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuMediaType001", 0, 881, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PROTECTEDRESOURCETYPE_0100
    * @tc.name       : testProtectedResourceType001
    * @tc.desc       : test ProtectedResourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testProtectedResourceType001', 0, async (done: Function) => {
      Utils.emitEvent("emitProtectedResourceType", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testProtectedResourceType001", 'TYPE_VIDEO_CAPTURE,TYPE_AUDIO_CAPTURE', 1101, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PERMISSIONREQUESTGETORIGIN_0100
    * @tc.name       : testPermissionRequestGetOrigin001
    * @tc.desc       : test PermissionRequestGetOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPermissionRequestGetOrigin001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequestGetOrigin", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PermissionRequestGetOrigin", 'resource://rawfile/', 1102, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PERMISSIONREQUEST_0100
    * @tc.name       : testPermissionRequest001
    * @tc.desc       : test PermissionRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPermissionRequest001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequest", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPermissionRequest001", true, 1103, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_RENDEREXITREASONPROCESSCRASHED_0100
    * @tc.name       : testRenderExitReasonProcessCrashed001
    * @tc.desc       : test RenderExitReasonProcessCrashed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderExitReasonProcessCrashed001', 0, async (done: Function) => {
      Utils.emitEvent("emitRenderExitReasonProcessCrashed", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRenderExitReasonProcessCrashed001", 2, 901, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0100
    * @tc.name       : testDefaultFontSize001
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize001', 0, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSize", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize001", '"13px"', 1202, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0200
    * @tc.name       : testDefaultFontSize002
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize002', 0, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMax", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize002", '"72px"', 1203, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0300
    * @tc.name       : testDefaultFontSize003
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize003', 0, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMin", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize003", '"13px"', 1204, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MINFONTSIZE_0100
    * @tc.name       : testMinFontSize001
    * @tc.desc       : test minFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMinFontSize001', 0, async (done: Function) => {
      Utils.emitEvent("emitMinFontSize", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMinFontSize001", 18, 1205, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONCONTROLLERATTACHED_0100
    * @tc.name       : testOnControllerAttached001
    * @tc.desc       : test onControllerAttached
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnControllerAttached001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnControllerAttached", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnControllerAttached001", true, 1221, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HASIMAGE_0100
    * @tc.name       : testHasImage001
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage001', 0, async (done: Function) => {
      Utils.emitEvent("emitHasImage", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage001", true, 1251, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONCONTEXTMENUSHOW_0100
    * @tc.name       : testOnContextMenuShow001
    * @tc.desc       : test onContextMenuShow
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnContextMenuShow001', 0, async (done: Function) => {
      Utils.emitEvent("onContextMenuShow", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnContextMenuShow001", true, 1252, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DATABASEACCESSTRUE_0100
    * @tc.name       : testDatabaseAccessTrue001
    * @tc.desc       : test DatabaseAccessTrue
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDatabaseAccessTrue001', 0, async (done: Function) => {
      Utils.emitEvent("emitDatabaseAccessTrue", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDatabaseAccessTrue001", '"openDatabase"', 1301, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_TEXTZOOMRATIO_0100
     * @tc.name       : testTextZoomRatio001
     * @tc.desc       : test textZoomRatio
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextZoomRatio001', 0, async (done: Function) => {
      Utils.emitEvent("emitTextZoomRatio", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testTextZoomRatio001", true, 1231, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0200
    * @tc.name       : testRunJavaScript002
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript002', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript002", 'null', 10001, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0300
    * @tc.name       : testRunJavaScript003
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript003', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript003", '"This value is from indexJru.html"', 10002, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0400
    * @tc.name       : testRunJavaScript004
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript004', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript004", 'null', 10003, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0100
    * @tc.name       : testRunJavaScriptExt001
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt001', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt001", '"This value is from indexJru.html"', 10004, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0200
    * @tc.name       : testRunJavaScriptExt002
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt002', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt002", true, 10005, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0300
    * @tc.name       : testRunJavaScriptExt003
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt003', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt003", '"This value is from indexJru.html"', 10006, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0400
    * @tc.name       : testRunJavaScriptExt004
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt004', 0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt004", true, 10007, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

  })
}
