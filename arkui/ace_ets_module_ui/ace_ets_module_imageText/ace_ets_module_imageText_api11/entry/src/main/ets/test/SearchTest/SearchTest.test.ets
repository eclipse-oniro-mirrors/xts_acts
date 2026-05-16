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

import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

let emitKey = "emitUserAgent";
function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}

export default function search() {
  describe('ActsAceSearchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("search beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Search state pages:" + JSON.stringify(pages));
        if (!("SearchTest" == pages.name)) {
          console.info("get SearchTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTest page error:" + err);
      }
      console.info("SearchTest beforeEach end");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("search afterEach start");
      let caretWidthNumber: number = 5
      let caretWidthString: string = '15px'
      let caretWidthResource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let caretColorColor: Color = Color.Red
      let caretColorNumber: number = 0x000000
      let caretColorString: string = '#ff9a35'
      let caretColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let leftSearchIconSizeNumber: number = 20
      let leftSearchIconSizeString: string = '50px'
      let leftSearchIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let leftSearchIconColorColor: Color = Color.Red
      let leftSearchIconColorNumber: number = 0x000000
      let leftSearchIconColorString: string = '#ff9a35'
      let leftSearchIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let searchSrcPath: string = 'common/icon.png'
      let rightButtonStyleParam: CancelButtonStyle = CancelButtonStyle.INPUT
      let rightCancelIconSizeNumber: number = 20
      let rightCancelIconSizeString: string = '50px'
      let rightCancelIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let rightCancelIconColorColor: Color = Color.Red
      let rightCancelIconColorNumber: number = 0x000000
      let rightCancelIconColorString: string = '#ff9a35'
      let rightCancelIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let rightIconSrcPath: string = 'common/icon.png'
      let searchButtonFontSizeNumber: number = 20
      let searchButtonFontSizeString: string = '10vp'
      let searchButtonFontSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let searchButtonFontColorColor: Color = Color.Blue
      let searchButtonFontColorNumber: number = 0x000000
      let searchButtonFontColorString: string = '#ff9a35'
      let searchButtonFontColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let textColorColor: Color = Color.Red
      let textColorNumber: number = 0x000000
      let textColorString: string = '#ff9a35'
      let textColorResource: Resource = $r('sys.color.ohos_id_color_connected')

      try {
        let eventData: events_emitter.EventData = {
          data: {
            'caretWidthNumber': caretWidthNumber,
            'caretWidthString': caretWidthString,
            'caretWidthResource': caretWidthResource,
            'caretColorColor': caretColorColor,
            'caretColorNumber': caretColorNumber,
            'caretColorString': caretColorString,
            'caretColorResource': caretColorResource,
            'leftSearchIconSizeNumber': leftSearchIconSizeNumber,
            'leftSearchIconSizeString': leftSearchIconSizeString,
            'leftSearchIconSizeResource': leftSearchIconSizeResource,
            'leftSearchIconColorColor': leftSearchIconColorColor,
            'leftSearchIconColorNumber': leftSearchIconColorNumber,
            'leftSearchIconColorString': leftSearchIconColorString,
            'leftSearchIconColorResource': leftSearchIconColorResource,
            'searchSrcPath': searchSrcPath,
            'rightButtonStyleParam': rightButtonStyleParam,
            'rightCancelIconSizeNumber': rightCancelIconSizeNumber,
            'rightCancelIconSizeString': rightCancelIconSizeString,
            'rightCancelIconSizeResource': rightCancelIconSizeResource,
            'rightCancelIconColorColor': rightCancelIconColorColor,
            'rightCancelIconColorNumber': rightCancelIconColorNumber,
            'rightCancelIconColorString': rightCancelIconColorString,
            'rightCancelIconColorResource': rightCancelIconColorResource,
            'rightIconSrcPath': rightIconSrcPath,
            'searchButtonFontSizeNumber': searchButtonFontSizeNumber,
            'searchButtonFontSizeString': searchButtonFontSizeString,
            'searchButtonFontSizeResource': searchButtonFontSizeResource,
            'searchButtonFontColorColor': searchButtonFontColorColor,
            'searchButtonFontColorNumber': searchButtonFontColorNumber,
            'searchButtonFontColorString': searchButtonFontColorString,
            'searchButtonFontColorResource': searchButtonFontColorResource,
            'textColorColor': textColorColor,
            'textColorNumber': textColorNumber,
            'textColorString': textColorString,
            'textColorResource': textColorResource
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("search afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("search afterEach start to publish change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      done();
    })

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0100
     * @tc.number ArkUI_Stage_Search_CaretStyle_0100
     * @tc.desc   Get the default value of caretStyle.width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0200
     * @tc.number ArkUI_Stage_Search_CaretStyle_0200
     * @tc.desc   Set the value of caretStyle.width as 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0300
     * @tc.number ArkUI_Stage_Search_CaretStyle_0300
     * @tc.desc   Set the value of caretStyle.width as 15px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(newJson));

      let caretWidthString = '15px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("15.00px");
      console.info("[ArkUI_Stage_Search_CaretStyle_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0400
     * @tc.number ArkUI_Stage_Search_CaretStyle_0400
     * @tc.desc   Set the value of caretStyle.width as 10fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0400] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(newJson));

      let caretWidthString = '10fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00fp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0500
     * @tc.number ArkUI_Stage_Search_CaretStyle_0500
     * @tc.desc   Set the value of caretStyle.width as 15lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(newJson));

      let caretWidthString = '15lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("15.00lpx");
      console.info("[ArkUI_Stage_Search_CaretStyle_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0600
     * @tc.number ArkUI_Stage_Search_CaretStyle_0600
     * @tc.desc   Set the value of caretStyle.width as sys.float.ohos_id_text_margin_vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(newJson));

      let caretWidthResource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({
        name: 'caretWidthResource', value: caretWidthResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual('2.00vp');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0700
     * @tc.number ArkUI_Stage_Search_CaretStyle_0700
     * @tc.desc   Set the value of caretStyle.width as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(newJson));

      let caretWidthNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0800
     * @tc.number ArkUI_Stage_Search_CaretStyle_0800
     * @tc.desc   Set the value of caretStyle.width as -1.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(newJson));

      let caretWidthNumber = -1.5;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_0900
     * @tc.number ArkUI_Stage_Search_CaretStyle_0900
     * @tc.desc   Set the value of caretStyle.width as 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_0900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(newJson));

      let caretWidthNumber = 100000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("100000.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1000
     * @tc.number ArkUI_Stage_Search_CaretStyle_1000
     * @tc.desc   Set the value of caretStyle.width as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(newJson));

      let caretWidthNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1100
     * @tc.number ArkUI_Stage_Search_CaretStyle_1100
     * @tc.desc   Set the value of caretStyle.width as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1100] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(newJson));

      let caretWidthNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("2.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1200
     * @tc.number ArkUI_Stage_Search_CaretStyle_1200
     * @tc.desc   Get the default value of caretStyle.color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1200] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertContain('#');
      console.info("[ArkUI_Stage_Search_CaretStyle_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1300
     * @tc.number ArkUI_Stage_Search_CaretStyle_1300
     * @tc.desc   Set the value of caretStyle.color as 0xff0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(newJson));

      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1400
     * @tc.number ArkUI_Stage_Search_CaretStyle_1400
     * @tc.desc   Set the value of caretStyle.color as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1400] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(newJson));

      let caretColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorColor": caretColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1500
     * @tc.number ArkUI_Stage_Search_CaretStyle_1500
     * @tc.desc   Set the value of caretStyle.color as #ff9a35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(newJson));

      let caretColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CaretStyle_1500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1600
     * @tc.number ArkUI_Stage_Search_CaretStyle_1600
     * @tc.desc   Set the value of caretStyle.color as $r('sys.color.ohos_id_color_connected')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(newJson));

      let caretColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'caretColorResource', value: caretColorResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(obj2.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1700
     * @tc.number ArkUI_Stage_Search_CaretStyle_1700
     * @tc.desc   Set the value of caretStyle.color as abcdefghijk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1700] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(newJson));

      let caretColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertContain('#');
      console.info("[ArkUI_Stage_Search_CaretStyle_1700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1800
     * @tc.number ArkUI_Stage_Search_CaretStyle_1800
     * @tc.desc   Set the value of caretStyle.color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(newJson));

      let caretColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertContain('#');
      console.info("[ArkUI_Stage_Search_CaretStyle_1800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_1900
     * @tc.number ArkUI_Stage_Search_CaretStyle_1900
     * @tc.desc   Set the value of caretStyle.color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_1900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(newJson));

      let caretColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertContain('#');
      console.info("[ArkUI_Stage_Search_CaretStyle_1900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2000
     * @tc.number ArkUI_Stage_Search_CaretStyle_2000
     * @tc.desc   Set the value of caretStyle.width as 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_2000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber,
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_2000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2100
     * @tc.number ArkUI_Stage_Search_CaretStyle_2100
     * @tc.desc   Set the value of caretStyle.color as rgb(0, 0, 255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_2100] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_2100]: " + JSON.stringify(newJson));

      let caretColorString = 'rgb(0, 0, 255)';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_2100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2100]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2100]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_CaretStyle_2100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2200
     * @tc.number ArkUI_Stage_Search_CaretStyle_2200
     * @tc.desc   Set the value of caretStyle.color as rgba(0, 255, 0, 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_2200] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_2200]: " + JSON.stringify(newJson));

      let caretColorString = 'rgba(0, 255, 0, 0)';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_2200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_2200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2200]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2200]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#0000FF00");
      console.info("[ArkUI_Stage_Search_CaretStyle_2200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2300
     * @tc.number ArkUI_Stage_Search_CaretStyle_2300
     * @tc.desc   Set the value of caretStyle.color as $r('app.color.Caretcolor')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUI_Stage_Search_CaretStyle_2300 START');
      let strJson = getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_2300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2300]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2300]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_2300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2400
     * @tc.number ArkUI_Stage_Search_CaretStyle_2400
     * @tc.desc   Set the value of caretStyle.color as $r('app.float.Caretwidth')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUI_Stage_Search_CaretStyle_2400 START');
      let strJson = getInspectorByKey('searchTestDefaultapp');
      console.info("[ArkUI_Stage_Search_CaretStyle_2400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2400]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2400]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_2400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2500
     * @tc.number ArkUI_Stage_Search_CaretStyle_2500
     * @tc.desc   Set the value of caretStyle.color as $r('app.string.Caretwidth001')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUI_Stage_Search_CaretStyle_2500 START');
      let strJson = getInspectorByKey('searchTestDefaultapp001');
      console.info("[ArkUI_Stage_Search_CaretStyle_2500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2500]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2500]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("5.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_2500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2600
     * @tc.number ArkUI_Stage_Search_CaretStyle_2600
     * @tc.desc   Set the value of caretStyle.color as $r('app.integer.Caretwidth')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUI_Stage_Search_CaretStyle_2600 START');
      let strJson = getInspectorByKey('searchTestDefaultapp002');
      console.info("[ArkUI_Stage_Search_CaretStyle_2600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2600]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2600]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_2600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CaretStyle_2700
     * @tc.number ArkUI_Stage_Search_CaretStyle_2700
     * @tc.desc   Set the value of fontcolor as 0xff0000, assert caretStyle.caretColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CaretStyle_2700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_2700] start");
      let newJson = getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_2700]: " + JSON.stringify(newJson));

      let textColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestfontcaretcolor');
      console.info("[ArkUI_Stage_Search_CaretStyle_2700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2700]: " + JSON.stringify(obj.$attrs.fontColor));
      console.info("[ArkUI_Stage_Search_CaretStyle_2700]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.fontColor).assertEqual("#FFFF0000");

      let newJson1 = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_2700]: " + JSON.stringify(newJson1));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');
      let obj1: ESObject = JSON.parse(newJson1);
      expect(obj.$attrs.caretStyle.color).assertEqual(obj1.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_2700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0100
     * @tc.number ArkUI_Stage_Search_SearchIcon_0100
     * @tc.desc   Get the default value of searchIcon.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual(objDefault.$attrs.searchIcon.size);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0200
     * @tc.number ArkUI_Stage_Search_SearchIcon_0200
     * @tc.desc   Set the value of searchIcon.size as 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 26;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 26;
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0300
     * @tc.number ArkUI_Stage_Search_SearchIcon_0300
     * @tc.desc   Set the value of searchIcon.size as 50px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: string = px2vp(50) > 32 ? vp2px(32).toFixed(2) + "px" : '50.00px' ;
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + result);
      expect(obj.$attrs.searchIcon.size).assertEqual(result);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0400
     * @tc.number ArkUI_Stage_Search_SearchIcon_0400
     * @tc.desc   Set the value of searchIcon.size as 50fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + fp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0500
     * @tc.number ArkUI_Stage_Search_SearchIcon_0500
     * @tc.desc   Set the value of searchIcon.size as 50lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result = px2vp(lpx2px(50)) > 32 ? vp2px(32).toFixed(2) : lpx2px(50).toFixed(2) ;
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + result);
      expect(Math.abs(Number((obj.$attrs.searchIcon.size).slice(0,-3)) - Number(result)) <= 1).assertTrue();
      expect((obj.$attrs.searchIcon.size).slice(-2)).assertEqual("px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0600
     * @tc.number ArkUI_Stage_Search_SearchIcon_0600
     * @tc.desc   Set the value of searchIcon.size as $r('sys.float.ohos_id_text_paragraph_margin_m')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(newJson));

      let leftSearchIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeResource": leftSearchIconSizeResource
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 16;
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0700
     * @tc.number ArkUI_Stage_Search_SearchIcon_0700
     * @tc.desc   Set the value of searchIcon.size as 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 40;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0800
     * @tc.number ArkUI_Stage_Search_SearchIcon_0800
     * @tc.desc   Set the value of searchIcon.size as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 0;
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_0900
     * @tc.number ArkUI_Stage_Search_SearchIcon_0900
     * @tc.desc   Set the value of searchIcon.size as -16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_0900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = -16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0900]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual(obj2.$attrs.searchIcon.size);
      console.info("[ArkUI_Stage_Search_SearchIcon_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1000
     * @tc.number ArkUI_Stage_Search_SearchIcon_1000
     * @tc.desc   Set the value of searchIcon.size as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_SearchIcon_1000]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1100
     * @tc.number ArkUI_Stage_Search_SearchIcon_1100
     * @tc.desc   Set the value of searchIcon.size as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1100] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1100]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual(obj2.$attrs.searchIcon.size);
      console.info("[ArkUI_Stage_Search_SearchIcon_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1200
     * @tc.number ArkUI_Stage_Search_SearchIcon_1200
     * @tc.desc   Set the value of searchIcon.size as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1200]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual(obj2.$attrs.searchIcon.size);
      console.info("[ArkUI_Stage_Search_SearchIcon_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1300
     * @tc.number ArkUI_Stage_Search_SearchIcon_1300
     * @tc.desc   Get the default value of searchIcon.color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(''+obj.$attrs.searchIcon.color).assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_SearchIcon_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1400
     * @tc.number ArkUI_Stage_Search_SearchIcon_1400
     * @tc.desc   Set the value of searchIcon.color as 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1400]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1500
     * @tc.number ArkUI_Stage_Search_SearchIcon_1500
     * @tc.desc   Set the value of searchIcon.color as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(newJson));

      let leftSearchIconColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorColor": leftSearchIconColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1500]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchIcon_1500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1600
     * @tc.number ArkUI_Stage_Search_SearchIcon_1600
     * @tc.desc   Set the value of searchIcon.color as #ff9a35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorString": leftSearchIconColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1600]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchIcon_1600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1700
     * @tc.number ArkUI_Stage_Search_SearchIcon_1700
     * @tc.desc   Set the value of searchIcon.color as $r('sys.color.ohos_id_color_connected')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(newJson));

      let leftSearchIconColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'leftSearchIconColorResource', value: leftSearchIconColorResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1700]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual(obj2.$attrs.searchIcon.color);
      console.info("[ArkUI_Stage_Search_SearchIcon_1700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1800
     * @tc.number ArkUI_Stage_Search_SearchIcon_1800
     * @tc.desc   Set the value of searchIcon.color as abcdefghijk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(newJson));

      let leftSearchIconColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorString": leftSearchIconColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1800]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual(obj2.$attrs.searchIcon.color);
      console.info("[ArkUI_Stage_Search_SearchIcon_1800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_1900
     * @tc.number ArkUI_Stage_Search_SearchIcon_1900
     * @tc.desc   Set the value of searchIcon.color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_1900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_1900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_1900]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual(obj2.$attrs.searchIcon.color);
      console.info("[ArkUI_Stage_Search_SearchIcon_1900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2000
     * @tc.number ArkUI_Stage_Search_SearchIcon_2000
     * @tc.desc   Set the value of searchIcon.color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(newJson));

      let leftSearchIconColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2000]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual(obj2.$attrs.searchIcon.color);
      console.info("[ArkUI_Stage_Search_SearchIcon_2000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2100
     * @tc.number ArkUI_Stage_Search_SearchIcon_2100
     * @tc.desc   Set the value of searchIcon.size as 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 26;
      let leftSearchIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber,
            "leftSearchIconColorNumber": leftSearchIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 26;
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2100]: " + JSON.stringify(obj.$attrs.searchIcon.color));
      expect(obj.$attrs.searchIcon.color).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_SearchIcon_2100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2200
     * @tc.number ArkUI_Stage_Search_SearchIcon_2200
     * @tc.desc   Get the default value of searchIcon.src
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2200]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual(983081);
      console.info("[ArkUI_Stage_Search_SearchIcon_2200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2300
     * @tc.number ArkUI_Stage_Search_SearchIcon_2300
     * @tc.desc   Set the value of searchIcon.src as common/icon2.svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.svg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2300]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2400
     * @tc.number ArkUI_Stage_Search_SearchIcon_2400
     * @tc.desc   Set the value of searchIcon.src as common/icon2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.jpg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2400]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2500
     * @tc.number ArkUI_Stage_Search_SearchIcon_2500
     * @tc.desc   Set the value of searchIcon.src as common/icon2.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(newJson));

      let searchSrcPath = 'common/icon2.png';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2500]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2600
     * @tc.number ArkUI_Stage_Search_SearchIcon_2600
     * @tc.desc   Set the value of searchIcon.src as $r('sys.media.ohos_app_icon')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(newJson));

      let searchSrcPathResource = $r('sys.media.ohos_app_icon');
      globalThis.value.message.notify({
        name: 'searchSrcPathResource', value: searchSrcPathResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2600]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_SearchIcon_2600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2700
     * @tc.number ArkUI_Stage_Search_SearchIcon_2700
     * @tc.desc   Set the value of searchIcon.src as abc/def/ghi.jkl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(newJson));

      let searchSrcPath = 'abc/def/ghi.jkl';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2700]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_SearchIcon_2700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2800
     * @tc.number ArkUI_Stage_Search_SearchIcon_2800
     * @tc.desc   Set the value of searchIcon.src as ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(newJson));

      let searchSrcPath = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2800]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_2900
     * @tc.number ArkUI_Stage_Search_SearchIcon_2900
     * @tc.desc   Set the value of searchIcon.src as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_2900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_2900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(newJson));

      let searchSrcPath = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_2900]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_2900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchIcon_3000
     * @tc.number ArkUI_Stage_Search_SearchIcon_3000
     * @tc.desc   Set the value of searchIcon.src as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchIcon_3000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_3000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(newJson));

      let searchSrcPath = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchSrcPath": searchSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_3000]: " + JSON.stringify(obj.$attrs.searchIcon.src));
      expect(obj.$attrs.searchIcon.src).assertEqual('resource:///ohos_search.svg');
      console.info("[ArkUI_Stage_Search_SearchIcon_3000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0100
     * @tc.number ArkUI_Stage_Search_CancelButton_0100
     * @tc.desc   Get the default value of cancelButton.style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0100]: " + JSON.stringify(obj.$attrs.cancelButton.style));
      expect(obj.$attrs.cancelButton.style).assertContain("CancelButtonStyle");
      console.info("[ArkUI_Stage_Search_CancelButton_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0200
     * @tc.number ArkUI_Stage_Search_CancelButton_0200
     * @tc.desc   Set the value of cancelButton.style as CancelButtonStyle.CONSTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.CONSTANT;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0200]: " + JSON.stringify(obj.$attrs.cancelButton.style));
      expect(obj.$attrs.cancelButton.style).assertEqual("CancelButtonStyle.CONSTANT");
      console.info("[ArkUI_Stage_Search_CancelButton_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0300
     * @tc.number ArkUI_Stage_Search_CancelButton_0300
     * @tc.desc   Set the value of cancelButton.style as CancelButtonStyle.INVISIBLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = CancelButtonStyle.INVISIBLE;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0300]: " + JSON.stringify(obj.$attrs.cancelButton.style));
      expect(obj.$attrs.cancelButton.style).assertEqual("CancelButtonStyle.INVISIBLE");
      console.info("[ArkUI_Stage_Search_CancelButton_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0400
     * @tc.number ArkUI_Stage_Search_CancelButton_0400
     * @tc.desc   Set the value of cancelButton.style as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0400]: " + JSON.stringify(obj.$attrs.cancelButton.style));
      expect(obj.$attrs.cancelButton.style).assertContain("CancelButtonStyle");
      console.info("[ArkUI_Stage_Search_CancelButton_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0500
     * @tc.number ArkUI_Stage_Search_CancelButton_0500
     * @tc.desc   Set the value of cancelButton.style as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0500] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(newJson));

      let rightButtonStyleParam = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightButtonStyleParam": rightButtonStyleParam
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0500]: " + JSON.stringify(obj.$attrs.cancelButton.style));
      expect(obj.$attrs.cancelButton.style).assertContain("CancelButtonStyle");
      console.info("[ArkUI_Stage_Search_CancelButton_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0600
     * @tc.number ArkUI_Stage_Search_CancelButton_0600
     * @tc.desc   Get the default value of cancelButton.icon.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0600] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0600]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      expect(obj.$attrs.cancelButton.icon.size).assertContain("px");
      console.info("[ArkUI_Stage_Search_CancelButton_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0700
     * @tc.number ArkUI_Stage_Search_CancelButton_0700
     * @tc.desc   Set the value of cancelButton.icon.size as 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 26;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 26;
      console.info("[ArkUI_Stage_Search_CancelButton_0700]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0800
     * @tc.number ArkUI_Stage_Search_CancelButton_0800
     * @tc.desc   Set the value of cancelButton.icon.size as 50px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0800] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: string = px2vp(50) > 32 ? vp2px(32).toFixed(2) + "px" : '50.00px' ;
      console.info("[ArkUI_Stage_Search_CancelButton_0800]: " + result);
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(result);
      console.info("[ArkUI_Stage_Search_CancelButton_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_0900
     * @tc.number ArkUI_Stage_Search_CancelButton_0900
     * @tc.desc   Set the value of cancelButton.icon.size as 50fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_0900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_0900] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_CancelButton_0900]: " + fp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1000
     * @tc.number ArkUI_Stage_Search_CancelButton_1000
     * @tc.desc   Set the value of cancelButton.icon.size as 50lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1000] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(newJson));

      let rightCancelIconSizeString = '50lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeString": rightCancelIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result = px2vp(lpx2px(50)) > 32 ? vp2px(32).toFixed(2) : lpx2px(50).toFixed(2) ;
      console.info("[ArkUI_Stage_Search_CancelButton_1000]: " + result);
      expect(Math.abs(Number((obj.$attrs.cancelButton.icon.size).slice(0,-3)) - Number(result)) <= 1).assertTrue();
      expect((obj.$attrs.cancelButton.icon.size).slice(-2)).assertEqual("px");
      console.info("[ArkUI_Stage_Search_CancelButton_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1100
     * @tc.number ArkUI_Stage_Search_CancelButton_1100
     * @tc.desc   Set the value of cancelButton.icon.size as $r('sys.float.ohos_id_text_paragraph_margin_m')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1100] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(newJson));

      let rightCancelIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeResource": rightCancelIconSizeResource
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 16;
      console.info("[ArkUI_Stage_Search_CancelButton_1100]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1200
     * @tc.number ArkUI_Stage_Search_CancelButton_1200
     * @tc.desc   Set the value of cancelButton.icon.size as 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 40;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_CancelButton_1200]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1300
     * @tc.number ArkUI_Stage_Search_CancelButton_1300
     * @tc.desc   Set the value of cancelButton.icon.size as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1300]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      expect(obj.$attrs.cancelButton.icon.size).assertContain("px");
      console.info("[ArkUI_Stage_Search_CancelButton_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1400
     * @tc.number ArkUI_Stage_Search_CancelButton_1400
     * @tc.desc   Set the value of cancelButton.icon.size as -16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = -16;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1400]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(obj2.$attrs.cancelButton.icon.size);
      console.info("[ArkUI_Stage_Search_CancelButton_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1500
     * @tc.number ArkUI_Stage_Search_CancelButton_1500
     * @tc.desc   Set the value of cancelButton.icon.size as 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1500] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 10000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 32;
      console.info("[ArkUI_Stage_Search_CancelButton_1500]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_1500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1600
     * @tc.number ArkUI_Stage_Search_CancelButton_1600
     * @tc.desc   Set the value of cancelButton.icon.size as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1600] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1600]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(obj2.$attrs.cancelButton.icon.size);
      console.info("[ArkUI_Stage_Search_CancelButton_1600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1700
     * @tc.number ArkUI_Stage_Search_CancelButton_1700
     * @tc.desc   Set the value of cancelButton.icon.size as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1700]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(obj2.$attrs.cancelButton.icon.size);
      console.info("[ArkUI_Stage_Search_CancelButton_1700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1800
     * @tc.number ArkUI_Stage_Search_CancelButton_1800
     * @tc.desc   Get the default value of cancelButton.icon.color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1800] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1800]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(''+obj.$attrs.cancelButton.icon.color).assertContain(spliceColor($r('sys.color.search_symbol_icon_color')));
      console.info("[ArkUI_Stage_Search_CancelButton_1800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_1900
     * @tc.number ArkUI_Stage_Search_CancelButton_1900
     * @tc.desc   Set the value of cancelButton.icon.color as 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_1900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_1900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_1900]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_1900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2000
     * @tc.number ArkUI_Stage_Search_CancelButton_2000
     * @tc.desc   Set the value of cancelButton.icon.color as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2000] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(newJson));

      let rightCancelIconColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorColor": rightCancelIconColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2000]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CancelButton_2000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2100
     * @tc.number ArkUI_Stage_Search_CancelButton_2100
     * @tc.desc   Set the value of cancelButton.icon.color as #ff9a35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2100] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorString": rightCancelIconColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2100]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CancelButton_2100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2200
     * @tc.number ArkUI_Stage_Search_CancelButton_2200
     * @tc.desc   Set the value of cancelButton.icon.color as $r('sys.color.ohos_id_color_connected')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2200] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(newJson));

      let rightCancelIconColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'rightCancelIconColorResource', value: rightCancelIconColorResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2200]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(obj2.$attrs.cancelButton.icon.color);
      console.info("[ArkUI_Stage_Search_CancelButton_2200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2300
     * @tc.number ArkUI_Stage_Search_CancelButton_2300
     * @tc.desc   Set the value of cancelButton.icon.color as abcdefghijk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(newJson));

      let rightCancelIconColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorString": rightCancelIconColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2300]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(obj2.$attrs.cancelButton.icon.color);
      console.info("[ArkUI_Stage_Search_CancelButton_2300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2400
     * @tc.number ArkUI_Stage_Search_CancelButton_2400
     * @tc.desc   Set the value of cancelButton.icon.color as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2400]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(obj2.$attrs.cancelButton.icon.color);
      console.info("[ArkUI_Stage_Search_CancelButton_2400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2500
     * @tc.number ArkUI_Stage_Search_CancelButton_2500
     * @tc.desc   Set the value of cancelButton.icon.color as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2500] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(newJson));

      let rightCancelIconColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2500]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(obj2.$attrs.cancelButton.icon.color);
      console.info("[ArkUI_Stage_Search_CancelButton_2500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2600
     * @tc.number ArkUI_Stage_Search_CancelButton_2600
     * @tc.desc   Set the value of cancelButton.icon.size as 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2600] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(newJson));

      let rightCancelIconSizeNumber = 26;
      let rightCancelIconColorNumber = 0x00ff00;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightCancelIconSizeNumber": rightCancelIconSizeNumber,
            "rightCancelIconColorNumber": rightCancelIconColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2700);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(obj.$attrs.cancelButton.icon.size));
      let result: number = 26;
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2600]: " + JSON.stringify(obj.$attrs.cancelButton.icon.color));
      expect(obj.$attrs.cancelButton.icon.color).assertEqual("#FF00FF00");
      console.info("[ArkUI_Stage_Search_CancelButton_2600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2700
     * @tc.number ArkUI_Stage_Search_CancelButton_2700
     * @tc.desc   Get the default value of cancelButton.icon.src
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2700] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2700]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual(983126);
      console.info("[ArkUI_Stage_Search_CancelButton_2700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2800
     * @tc.number ArkUI_Stage_Search_CancelButton_2800
     * @tc.desc   Set the value of cancelButton.icon.src as common/icon2.svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.svg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2800]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('common/icon2.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_2800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_2900
     * @tc.number ArkUI_Stage_Search_CancelButton_2900
     * @tc.desc   Set the value of cancelButton.icon.src as common/icon2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_2900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_2900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.jpg';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_2900]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('common/icon2.jpg');
      console.info("[ArkUI_Stage_Search_CancelButton_2900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3000
     * @tc.number ArkUI_Stage_Search_CancelButton_3000
     * @tc.desc   Set the value of cancelButton.icon.src as common/icon2.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'common/icon2.png';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3000]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('common/icon2.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3100
     * @tc.number ArkUI_Stage_Search_CancelButton_3100
     * @tc.desc   Set the value of cancelButton.icon.src as $r('sys.media.ohos_app_icon')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3100] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(newJson));

      let rightIconSrcPathResource = $r('sys.media.ohos_app_icon');
      globalThis.value.message.notify({
        name: 'rightIconSrcPathResource', value: rightIconSrcPathResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3100]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('resource:///125829858.png');
      console.info("[ArkUI_Stage_Search_CancelButton_3100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3200
     * @tc.number ArkUI_Stage_Search_CancelButton_3200
     * @tc.desc   Set the value of cancelButton.icon.src as abc/def/ghi.jkl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(newJson));

      let rightIconSrcPath = 'abc/def/ghi.jkl';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3200]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('abc/def/ghi.jkl');
      console.info("[ArkUI_Stage_Search_CancelButton_3200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3300
     * @tc.number ArkUI_Stage_Search_CancelButton_3300
     * @tc.desc   Set the value of cancelButton.icon.src as ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(newJson));

      let rightIconSrcPath = '';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3300]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3400
     * @tc.number ArkUI_Stage_Search_CancelButton_3400
     * @tc.desc   Set the value of cancelButton.icon.src as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(newJson));

      let rightIconSrcPath = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3400]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_CancelButton_3500
     * @tc.number ArkUI_Stage_Search_CancelButton_3500
     * @tc.desc   Set the value of cancelButton.icon.src as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_CancelButton_3500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CancelButton_3500] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(newJson));

      let rightIconSrcPath = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rightIconSrcPath": rightIconSrcPath
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CancelButton_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CancelButton_3500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(obj.$attrs.cancelButton));
      console.info("[ArkUI_Stage_Search_CancelButton_3500]: " + JSON.stringify(obj.$attrs.cancelButton.icon.src));
      expect(obj.$attrs.cancelButton.icon.src).assertEqual('resource:///ohos_close.svg');
      console.info("[ArkUI_Stage_Search_CancelButton_3500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0100
     * @tc.number ArkUI_Stage_Search_SearchButton_0100
     * @tc.desc   Get the default value of searchButton.fontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0100]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual(objDefault.$attrs.searchButtonOption.fontSize);
      console.info("[ArkUI_Stage_Search_SearchButton_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0200
     * @tc.number ArkUI_Stage_Search_SearchButton_0200
     * @tc.desc   Set the value of searchButton.fontSize as 20vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0200] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '20vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0200]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0300
     * @tc.number ArkUI_Stage_Search_SearchButton_0300
     * @tc.desc   Set the value of searchButton.fontSize as 40vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0300]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("40.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0400
     * @tc.number ArkUI_Stage_Search_SearchButton_0400
     * @tc.desc   Set the value of searchButton.fontSize as 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber = 20;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeNumber": searchButtonFontSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0400]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual('20.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0500
     * @tc.number ArkUI_Stage_Search_SearchButton_0500
     * @tc.desc   Set the value of searchButton.fontSize as 40fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0500]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("40.00px");
      console.info("[ArkUI_Stage_Search_SearchButton_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0600
     * @tc.number ArkUI_Stage_Search_SearchButton_0600
     * @tc.desc   Set the value of searchButton.fontSize as 40lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0600] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '40lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0600]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("40.00lpx");
      console.info("[ArkUI_Stage_Search_SearchButton_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0700
     * @tc.number ArkUI_Stage_Search_SearchButton_0700
     * @tc.desc   Set the value of searchButton.fontSize as $r('sys.float.ohos_id_text_paragraph_margin_m')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0700] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(newJson));

      let searchButtonFontSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      globalThis.value.message.notify({
        name: 'searchButtonFontSizeResource', value: searchButtonFontSizeResource
      });
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0700]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual('16.00vp');
      console.info("[ArkUI_Stage_Search_SearchButton_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0800
     * @tc.number ArkUI_Stage_Search_SearchButton_0800
     * @tc.desc   Set the value of searchButton.fontSize as 0vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0800] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '0vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0800]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_0900
     * @tc.number ArkUI_Stage_Search_SearchButton_0900
     * @tc.desc   Set the value of searchButton.fontSize as 800vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_0900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_0900] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '800vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_0900]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("800.00vp");
      console.info("[ArkUI_Stage_Search_SearchButton_0900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1000
     * @tc.number ArkUI_Stage_Search_SearchButton_1000
     * @tc.desc   Set the value of searchButton.fontSize as -14vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1000] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = '-14vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1000]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      let resourceSize = getContext().resourceManager.getNumber($r('sys.float.Body_M').id)
	    console.info("[TextInputPageJsunit_0200] size: " +px2fp(resourceSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual('' +Math.round(px2fp(resourceSize))+ '.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_1000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1100
     * @tc.number ArkUI_Stage_Search_SearchButton_1100
     * @tc.desc   Set the value of searchButton.fontSize as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1100] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1100]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      let resourceSize = getContext().resourceManager.getNumber($r('sys.float.Body_M').id)
	    console.info("[TextInputPageJsunit_0200] size: " +px2fp(resourceSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual('' + Math.round(px2fp(resourceSize)) + '.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_1100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1200
     * @tc.number ArkUI_Stage_Search_SearchButton_1200
     * @tc.desc   Set the value of searchButton.fontSize as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1200] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(newJson));

      let searchButtonFontSizeString = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeString": searchButtonFontSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1200]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      let resourceSize = getContext().resourceManager.getNumber($r('sys.float.Body_M').id)
	    console.info("[TextInputPageJsunit_0200] size: " +px2fp(resourceSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual('' + Math.round(px2fp(resourceSize)) + '.00fp');
      console.info("[ArkUI_Stage_Search_SearchButton_1200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1300
     * @tc.number ArkUI_Stage_Search_SearchButton_1300
     * @tc.desc   Get the default value of searchButton.fontColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1300] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1300]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual(objDefault.$attrs.searchButtonOption.fontColor);
      console.info("[ArkUI_Stage_Search_SearchButton_1300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1400
     * @tc.number ArkUI_Stage_Search_SearchButton_1400
     * @tc.desc   Set the value of searchButton.fontColor as 0xff0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1400] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1400]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_1400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1500
     * @tc.number ArkUI_Stage_Search_SearchButton_1500
     * @tc.desc   Set the value of searchButton.fontColor as Color.Blue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1500] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(newJson));

      let searchButtonFontColorColor = Color.Blue;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorColor": searchButtonFontColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1500]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual("#FF0000FF");
      console.info("[ArkUI_Stage_Search_SearchButton_1500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1600
     * @tc.number ArkUI_Stage_Search_SearchButton_1600
     * @tc.desc   Set the value of searchButton.fontColor as #ff9a35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1600] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorString": searchButtonFontColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1600]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_SearchButton_1600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1700
     * @tc.number ArkUI_Stage_Search_SearchButton_1700
     * @tc.desc   Set the value of searchButton.fontColor as $r('sys.color.ohos_id_color_connected')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1700] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(newJson));

      let searchButtonFontColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'searchButtonFontColorResource', value: searchButtonFontColorResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1700]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual(obj2.$attrs.searchButtonOption.fontColor);
      console.info("[ArkUI_Stage_Search_SearchButton_1700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1800
     * @tc.number ArkUI_Stage_Search_SearchButton_1800
     * @tc.desc   Set the value of searchButton.fontColor as abcdefghijk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1800] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(newJson));

      let searchButtonFontColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorString": searchButtonFontColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1800]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual(obj2.$attrs.searchButtonOption.fontColor);
      console.info("[ArkUI_Stage_Search_SearchButton_1800] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_1900
     * @tc.number ArkUI_Stage_Search_SearchButton_1900
     * @tc.desc   Set the value of searchButton.fontColor as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_1900', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_1900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_1900]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual(obj2.$attrs.searchButtonOption.fontColor);
      console.info("[ArkUI_Stage_Search_SearchButton_1900] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_2000
     * @tc.number ArkUI_Stage_Search_SearchButton_2000
     * @tc.desc   Set the value of searchButton.fontColor as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_2000', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_2000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(newJson));

      let searchButtonFontColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_2000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_2000]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual(obj2.$attrs.searchButtonOption.fontColor);
      console.info("[ArkUI_Stage_Search_SearchButton_2000] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_SearchButton_2100
     * @tc.number ArkUI_Stage_Search_SearchButton_2100
     * @tc.desc   Set the value of searchButton.fontSize as 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_SearchButton_2100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchButton_2100] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(newJson));

      let searchButtonFontSizeNumber = 20;
      let searchButtonFontColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButtonFontSizeNumber": searchButtonFontSizeNumber,
            "searchButtonFontColorNumber": searchButtonFontColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchButton_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchButton_2100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2100);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontSize));
      expect(obj.$attrs.searchButtonOption.fontSize).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[ArkUI_Stage_Search_SearchButton_2100]: " + JSON.stringify(obj.$attrs.searchButtonOption.fontColor));
      expect(obj.$attrs.searchButtonOption.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_SearchButton_2100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0100
     * @tc.number ArkUI_Stage_Search_FontColor_0100
     * @tc.desc   Get the default value of fontColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      let newJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      let obj2: ESObject = JSON.parse(newJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0100]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info("[ArkUI_Stage_Search_FontColor_0100] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0200
     * @tc.number ArkUI_Stage_Search_FontColor_0200
     * @tc.desc   Set the value of fontColor as 0xff0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(newJson));

      let textColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0200]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0200] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0300
     * @tc.number ArkUI_Stage_Search_FontColor_0300
     * @tc.desc   Set the value of fontColor as Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0300] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(newJson));

      let textColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorColor": textColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0300]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_FontColor_0300] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0400
     * @tc.number ArkUI_Stage_Search_FontColor_0400
     * @tc.desc   Set the value of fontColor as #ff9a35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0400] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(newJson));

      let textColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorString": textColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_FontColor_0400]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_FontColor_0400] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0500
     * @tc.number ArkUI_Stage_Search_FontColor_0500
     * @tc.desc   Set the value of fontColor as $r('sys.color.ohos_id_color_connected')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0500] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(newJson));

      let textColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'textColorResource', value: textColorResource
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0500]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info("[ArkUI_Stage_Search_FontColor_0500] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0600
     * @tc.number ArkUI_Stage_Search_FontColor_0600
     * @tc.desc   Set the value of fontColor as abcdefghijk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0600] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(newJson));

      let textColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorString": textColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0600]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info("[ArkUI_Stage_Search_FontColor_0600] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0700
     * @tc.number ArkUI_Stage_Search_FontColor_0700
     * @tc.desc   Set the value of fontColor as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(newJson));

      let textColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0700]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info("[ArkUI_Stage_Search_FontColor_0700] end");
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_Search_FontColor_0800
     * @tc.number ArkUI_Stage_Search_FontColor_0800
     * @tc.desc   Set the value of fontColor as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_Search_FontColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_FontColor_0800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(newJson));

      let textColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textColorNumber": textColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_FontColor_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_FontColor_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_FontColor_0800]: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(obj2.$attrs.fontColor);
      console.info("[ArkUI_Stage_Search_FontColor_0800] end");
      done();
    });
  })
}
