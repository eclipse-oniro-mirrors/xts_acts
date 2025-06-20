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
        url: 'testability/pages/WebViewEnumAndFontLibrary',
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
  })
}
