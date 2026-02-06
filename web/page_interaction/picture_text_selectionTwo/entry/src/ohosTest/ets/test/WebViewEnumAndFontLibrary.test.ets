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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183201;
const driver = Driver.create();

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
          console.info("push WebViewEnumAndFontLibrary page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("buttonEnumAndFontLibrary"), 10000);
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibrary page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
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
    it('testWebContextMenuParamX001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamX", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamX001", true, 183210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamX001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamX" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMY_0100
    * @tc.name       : testWebContextMenuParamY001
    * @tc.desc       : test WebContextMenuParamY
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamY001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamY", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamY001", true, 183220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamY001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamY" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetLinkUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetLinkUrl", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetLinkUrl001", "http://www.baidu.com/", 183230, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "emitWebContextMenuParamGetLinkUrl");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetLinkUrl" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETUNFILTEREDLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetUnfilteredLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetUnfilteredLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetUnfilteredLinkUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetUnfilteredLinkUrl", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetUnfilteredLinkUrl001", "http://www.baidu.com/", 183240,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetUnfilteredLinkUrl001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetUnfilteredLinkUrl" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCEURL_0100
    * @tc.name       : testWebContextMenuParamGetSourceUrl001
    * @tc.desc       : test WebContextMenuParamGetSourceUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSourceUrl", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetSourceUrl001", "", 183250,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetSourceUrl001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetSourceUrl" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMEXISTSIMAGECONTENTS_0100
    * @tc.name       : testWebContextMenuParamExistsImageContents001
    * @tc.desc       : test WebContextMenuParamExistsImageContents
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamExistsImageContents001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamExistsImageContents", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamExistsImageContents001", false, 183260, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamExistsImageContents001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamExistsImageContents" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETMEDIATYPE_0100
    * @tc.name       : testWebContextMenuParamGetMediaType001
    * @tc.desc       : test WebContextMenuParamGetMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetMediaType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetMediaType", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetMediaType001", ContextMenuMediaType.None, 183270, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetMediaType001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetMediaType" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSELECTIONTEXT_0100
    * @tc.name       : testWebContextMenuParamGetSelectionText001
    * @tc.desc       : test WebContextMenuParamGetSelectionText
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSelectionText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSelectionText", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetSelectionText001", "", 183280,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetSelectionText001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetSelectionText" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCETYPE_0100
    * @tc.name       : testWebContextMenuParamGetSourceType001
    * @tc.desc       : test WebContextMenuParamGetSourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSourceType", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetSourceType001", ContextMenuSourceType.LongPress, 183290, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetSourceType001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetSourceType" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCETYPE_0200
    * @tc.name       : testWebContextMenuParamGetSourceType001
    * @tc.desc       : test WebContextMenuParamGetSourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetSourceTypeNone", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetSourceType002", ContextMenuSourceType.None, 183300, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetSourceType002");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetSourceTypeNone" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETINPUTFIELDTYPE_0100
    * @tc.name       : testWebContextMenuParamGetInputFieldType001
    * @tc.desc       : test WebContextMenuParamGetInputFieldType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetInputFieldType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetInputFieldType", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetInputFieldType001", ContextMenuInputFieldType.None, 183310, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetInputFieldType001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetInputFieldType" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMISEDITABLE_0100
    * @tc.name       : testWebContextMenuParamIsEditable001
    * @tc.desc       : test WebContextMenuParamIsEditable
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamIsEditable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamIsEditable", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamIsEditable001", false, 183320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamIsEditable001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamIsEditable" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETEDITSTATEFLAGS_0100
    * @tc.name       : testWebContextMenuParamGetEditStateFlags001
    * @tc.desc       : test WebContextMenuParamGetEditStateFlags
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetEditStateFlags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebContextMenuParamGetEditStateFlags", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebContextMenuParamGetEditStateFlags", 8, 183330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testWebContextMenuParamGetEditStateFlags001");
      await Utils.waitForExist(() => isReturn, "emitWebContextMenuParamGetEditStateFlags" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUINPUTFIELDTYPENONE_0100
    * @tc.name       : testContextMenuInputFieldTypeNone001
    * @tc.desc       : test ContextMenuInputFieldTypeNone
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuInputFieldTypeNone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuInputFieldTypeNone", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuInputFieldTypeNone001", ContextMenuInputFieldType.None, 183340,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testContextMenuInputFieldTypeNone001");
      await Utils.waitForExist(() => isReturn, "emitContextMenuInputFieldTypeNone" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUSOURCETYPELONGPRESS_0100
    * @tc.name       : testContextMenuSourceTypeLongPress001
    * @tc.desc       : test ContextMenuSourceTypeLongPress
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuSourceTypeLongPress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuSourceTypeLongPress", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuSourceTypeLongPress001", ContextMenuSourceType.LongPress, 183350, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testContextMenuSourceTypeLongPress001");
      await Utils.waitForExist(() => isReturn, "emitContextMenuInputFieldTypeNone" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUEDITSTATEFLAGS_0100
    * @tc.name       : testContextMenuEditStateFlags001
    * @tc.desc       : test ContextMenuEditStateFlags
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuEditStateFlags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuEditStateFlags", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuEditStateFlags001", 8, 183360, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testContextMenuEditStateFlags001");
      await Utils.waitForExist(() => isReturn, "emitContextMenuEditStateFlags" + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUMEDIATYPE_0100
    * @tc.name       : testContextMenuMediaType001
    * @tc.desc       : test ContextMenuMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuMediaType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeNone", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaType001", ContextMenuMediaType.None, 183370, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testContextMenuMediaType001");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeNone" + '_returnCheck', true, 500);
      done();
    })


    /*
    * @tc.number     : SUB_WEB_ONCONTEXTMENUSHOW_0100
    * @tc.name       : testOnContextMenuShow001
    * @tc.desc       : test onContextMenuShow
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnContextMenuShow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("onContextMenuShow", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnContextMenuShow001", true, 183380, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary", "testOnContextMenuShow001");
      await Utils.waitForExist(() => isReturn, "onContextMenuShow" + '_returnCheck', true, 500);
      done();
    })
  })
}
