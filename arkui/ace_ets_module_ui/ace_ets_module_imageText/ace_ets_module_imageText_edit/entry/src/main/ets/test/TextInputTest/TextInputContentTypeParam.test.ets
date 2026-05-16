/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';


export default function TextInputContentTypeParamTest() {
  describe('TextInputContentTypeParamTest', () => {
    beforeAll(async () => {
      console.info("TextInputContentTypeParam beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputContentTypeParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputContentTypeParam state success " + JSON.stringify(pages));
        if (!("TextInputContentTypeParam" == pages.name)) {
          console.info("get TextInputContentTypeParam state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputContentTypeParam page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputContentTypeParam page error: " + err);
      }
    });

    /**
     * @tc.name   textInputContentTypeParam_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_NULL_0100
     * @tc.desc   Test TextInput contentType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0200', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0200] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_contentType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_contentType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputContentTypeParam_0200] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值
      expect(obj.$attrs.contentType).assertEqual(objCompare.$attrs.contentType);
      console.info('[textInputContentTypeParam_0200] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_UNDEFINED_0100
     * @tc.desc   Test TextInput contentType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0300', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0300] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_contentType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_contentType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0300] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputContentTypeParam_0300] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.contentType).assertEqual(objCompare.$attrs.contentType);
      console.info('[textInputContentTypeParam_0300] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0200
     * @tc.desc   Test TextInput contentType property with ContentType.USER_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0400', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0400] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_USER_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0400] USER_NAME obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.USER_NAME 的值应该是 'ContentType.USER_NAME'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.USER_NAME');
      console.info('[textInputContentTypeParam_0400] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0300
     * @tc.desc   Test TextInput contentType property with ContentType.PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0500', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0500] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0500] PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PASSWORD 的值应该是 'ContentType.PASSWORD'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.VISIBLE_PASSWORD');
      console.info('[textInputContentTypeParam_0500] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0600
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0400
     * @tc.desc   Test TextInput contentType property with ContentType.NEW_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0600', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0600] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_NEW_PASSWORD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0600] NEW_PASSWORD obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.NEW_PASSWORD 的值应该是 'ContentType.NEW_PASSWORD'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.NEW_PASSWORD');
      console.info('[textInputContentTypeParam_0600] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0700
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0500
     * @tc.desc   Test TextInput contentType property with ContentType.FULL_STREET_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0700', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0700] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_FULL_STREET_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0700] FULL_STREET_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.FULL_STREET_ADDRESS 的值应该是 'ContentType.FULL_STREET_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.FULL_STREET_ADDRESS');
      console.info('[textInputContentTypeParam_0700] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0800
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0600
     * @tc.desc   Test TextInput contentType property with ContentType.HOUSE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0800', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0800] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_HOUSE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0800] HOUSE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.HOUSE_NUMBER 的值应该是 'ContentType.HOUSE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.HOUSE_NUMBER');
      console.info('[textInputContentTypeParam_0800] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_0900
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0700
     * @tc.desc   Test TextInput contentType property with ContentType.DISTRICT_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_0900', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_0900] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_DISTRICT_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_0900] DISTRICT_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.DISTRICT_ADDRESS 的值应该是 'ContentType.DISTRICT_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.DISTRICT_ADDRESS');
      console.info('[textInputContentTypeParam_0900] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1000
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0800
     * @tc.desc   Test TextInput contentType property with ContentType.CITY_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1000', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1000] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_CITY_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1000] CITY_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.CITY_ADDRESS 的值应该是 'ContentType.CITY_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.CITY_ADDRESS');
      console.info('[textInputContentTypeParam_1000] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1100
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_0900
     * @tc.desc   Test TextInput contentType property with ContentType.PROVINCE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1100', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1100] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PROVINCE_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1100] PROVINCE_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PROVINCE_ADDRESS 的值应该是 'ContentType.PROVINCE_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PROVINCE_ADDRESS');
      console.info('[textInputContentTypeParam_1100] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1200
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1000
     * @tc.desc   Test TextInput contentType property with ContentType.COUNTRY_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1200', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1200] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_COUNTRY_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1200] COUNTRY_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.COUNTRY_ADDRESS 的值应该是 'ContentType.COUNTRY_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.COUNTRY_ADDRESS');
      console.info('[textInputContentTypeParam_1200] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1300
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1100
     * @tc.desc   Test TextInput contentType property with ContentType.PERSON_FULL_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1300', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1300] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PERSON_FULL_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1300] PERSON_FULL_NAME obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PERSON_FULL_NAME 的值应该是 'ContentType.PERSON_FULL_NAME'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PERSON_FULL_NAME');
      console.info('[textInputContentTypeParam_1300] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1400
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1200
     * @tc.desc   Test TextInput contentType property with ContentType.PERSON_LAST_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1400', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1400] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PERSON_LAST_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1400] PERSON_LAST_NAME obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PERSON_LAST_NAME 的值应该是 'ContentType.PERSON_LAST_NAME'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PERSON_LAST_NAME');
      console.info('[textInputContentTypeParam_1400] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1500
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1300
     * @tc.desc   Test TextInput contentType property with ContentType.PERSON_FIRST_NAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1500', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1500] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PERSON_FIRST_NAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1500] PERSON_FIRST_NAME obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PERSON_FIRST_NAME 的值应该是 'ContentType.PERSON_FIRST_NAME'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PERSON_FIRST_NAME');
      console.info('[textInputContentTypeParam_1500] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1600
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1400
     * @tc.desc   Test TextInput contentType property with ContentType.PHONE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1600', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1600] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PHONE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1600] PHONE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PHONE_NUMBER 的值应该是 'ContentType.PHONE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PHONE_NUMBER');
      console.info('[textInputContentTypeParam_1600] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1700
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1500
     * @tc.desc   Test TextInput contentType property with ContentType.PHONE_COUNTRY_CODE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1700', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1700] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PHONE_COUNTRY_CODE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1700] PHONE_COUNTRY_CODE obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PHONE_COUNTRY_CODE 的值应该是 'ContentType.PHONE_COUNTRY_CODE'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PHONE_COUNTRY_CODE');
      console.info('[textInputContentTypeParam_1700] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1800
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1600
     * @tc.desc   Test TextInput contentType property with ContentType.FULL_PHONE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1800', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1800] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_FULL_PHONE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1800] FULL_PHONE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.FULL_PHONE_NUMBER 的值应该是 'ContentType.FULL_PHONE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.FULL_PHONE_NUMBER');
      console.info('[textInputContentTypeParam_1800] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_1900
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1700
     * @tc.desc   Test TextInput contentType property with ContentType.EMAIL_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_1900', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_1900] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_EMAIL_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_1900] EMAIL_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.EMAIL_ADDRESS 的值应该是 'ContentType.EMAIL_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.EMAIL_ADDRESS');
      console.info('[textInputContentTypeParam_1900] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2000
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1800
     * @tc.desc   Test TextInput contentType property with ContentType.BANK_CARD_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2000', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2000] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_BANK_CARD_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2000] BANK_CARD_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.BANK_CARD_NUMBER 的值应该是 'ContentType.BANK_CARD_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.BANK_CARD_NUMBER');
      console.info('[textInputContentTypeParam_2000] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2100
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_1900
     * @tc.desc   Test TextInput contentType property with ContentType.ID_CARD_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2100', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2100] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_ID_CARD_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2100] ID_CARD_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.ID_CARD_NUMBER 的值应该是 'ContentType.ID_CARD_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.ID_CARD_NUMBER');
      console.info('[textInputContentTypeParam_2100] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2200
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2000
     * @tc.desc   Test TextInput contentType property with ContentType.NICKNAME
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2200', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2200] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_NICKNAME');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2200] NICKNAME obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.NICKNAME 的值应该是 'ContentType.NICKNAME'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.NICKNAME');
      console.info('[textInputContentTypeParam_2200] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2300
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2100
     * @tc.desc   Test TextInput contentType property with ContentType.DETAIL_INFO_WITHOUT_STREET
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2300', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2300] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_DETAIL_INFO_WITHOUT_STREET');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2300] DETAIL_INFO_WITHOUT_STREET obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.DETAIL_INFO_WITHOUT_STREET 的值应该是 'ContentType.DETAIL_INFO_WITHOUT_STREET'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.DETAIL_INFO_WITHOUT_STREET');
      console.info('[textInputContentTypeParam_2300] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2400
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2200
     * @tc.desc   Test TextInput contentType property with ContentType.FORMAT_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2400', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2400] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_FORMAT_ADDRESS');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2400] FORMAT_ADDRESS obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.FORMAT_ADDRESS 的值应该是 'ContentType.FORMAT_ADDRESS'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.FORMAT_ADDRESS');
      console.info('[textInputContentTypeParam_2400] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2500
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2300
     * @tc.desc   Test TextInput contentType property with ContentType.PASSPORT_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2500', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2500] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_PASSPORT_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2500] PASSPORT_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.PASSPORT_NUMBER 的值应该是 'ContentType.PASSPORT_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.PASSPORT_NUMBER');
      console.info('[textInputContentTypeParam_2500] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2600
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2400
     * @tc.desc   Test TextInput contentType property with ContentType.VALIDITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2600', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2600] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_VALIDITY');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2600] VALIDITY obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.VALIDITY 的值应该是 'ContentType.VALIDITY'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.VALIDITY');
      console.info('[textInputContentTypeParam_2600] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2700
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2500
     * @tc.desc   Test TextInput contentType property with ContentType.ISSUE_AT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2700', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2700] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_ISSUE_AT');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2700] ISSUE_AT obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.ISSUE_AT 的值应该是 'ContentType.ISSUE_AT'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.ISSUE_AT');
      console.info('[textInputContentTypeParam_2700] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2800
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2600
     * @tc.desc   Test TextInput contentType property with ContentType.ORGANIZATION
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2800', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2800] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_ORGANIZATION');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2800] ORGANIZATION obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.ORGANIZATION 的值应该是 'ContentType.ORGANIZATION'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.ORGANIZATION');
      console.info('[textInputContentTypeParam_2800] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_2900
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2700
     * @tc.desc   Test TextInput contentType property with ContentType.TAX_ID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_2900', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_2900] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_TAX_ID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_2900] TAX_ID obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.TAX_ID 的值应该是 'ContentType.TAX_ID'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.TAX_ID');
      console.info('[textInputContentTypeParam_2900] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3000
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2800
     * @tc.desc   Test TextInput contentType property with ContentType.ADDRESS_CITY_AND_STATE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3000', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3000] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_ADDRESS_CITY_AND_STATE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3000] ADDRESS_CITY_AND_STATE obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.ADDRESS_CITY_AND_STATE 的值应该是 'ContentType.ADDRESS_CITY_AND_STATE'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.ADDRESS_CITY_AND_STATE');
      console.info('[textInputContentTypeParam_3000] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3100
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_2900
     * @tc.desc   Test TextInput contentType property with ContentType.FLIGHT_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3100', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3100] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_FLIGHT_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3100] FLIGHT_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.FLIGHT_NUMBER 的值应该是 'ContentType.FLIGHT_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.FLIGHT_NUMBER');
      console.info('[textInputContentTypeParam_3100] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3200
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_3000
     * @tc.desc   Test TextInput contentType property with ContentType.LICENSE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3200', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3200] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_LICENSE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3200] LICENSE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.LICENSE_NUMBER 的值应该是 'ContentType.LICENSE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.LICENSE_NUMBER');
      console.info('[textInputContentTypeParam_3200] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3300
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_3100
     * @tc.desc   Test TextInput contentType property with ContentType.LICENSE_FILE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3300', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3300] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_LICENSE_FILE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3300] LICENSE_FILE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.LICENSE_FILE_NUMBER 的值应该是 'ContentType.LICENSE_FILE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.LICENSE_FILE_NUMBER');
      console.info('[textInputContentTypeParam_3300] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3400
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_3200
     * @tc.desc   Test TextInput contentType property with ContentType.LICENSE_PLATE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3400', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3400] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_LICENSE_PLATE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3400] LICENSE_PLATE obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.LICENSE_PLATE 的值应该是 'ContentType.LICENSE_PLATE'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.LICENSE_PLATE');
      console.info('[textInputContentTypeParam_3400] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3500
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_3300
     * @tc.desc   Test TextInput contentType property with ContentType.ENGINE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3500', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3500] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_ENGINE_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3500] ENGINE_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.ENGINE_NUMBER 的值应该是 'ContentType.ENGINE_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.ENGINE_NUMBER');
      console.info('[textInputContentTypeParam_3500] END');
    })

    /**
     * @tc.name   textInputContentTypeParam_3600
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_PARAM_3400
     * @tc.desc   Test TextInput contentType property with ContentType.LICENSE_CHASSIS_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputContentTypeParam_3600', Level.LEVEL0, async () => {
      console.info('[textInputContentTypeParam_3600] START');

      let strJson: string = getInspectorByKey('TextInput_contentType_LICENSE_CHASSIS_NUMBER');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputContentTypeParam_3600] LICENSE_CHASSIS_NUMBER obj is: " + JSON.stringify(obj.$attrs));

      // ContentType.LICENSE_CHASSIS_NUMBER 的值应该是 'ContentType.LICENSE_CHASSIS_NUMBER'
      let contentTypeValue: string = obj.$attrs.contentType as string;
      expect(contentTypeValue).assertEqual('TextContentType.LICENSE_CHASSIS_NUMBER');
      console.info('[textInputContentTypeParam_3600] END');
    })
  })
}
