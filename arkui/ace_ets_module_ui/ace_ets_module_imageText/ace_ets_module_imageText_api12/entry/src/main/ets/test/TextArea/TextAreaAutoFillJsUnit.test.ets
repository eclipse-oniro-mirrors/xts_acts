/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import ContentType from './AutoFillEnum';

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function textAreaAutoFillTest() {
  describe('textAreaAutoFillTest', async () => {
    beforeEach(async (done: Function) => {
      console.info('textAreaAutoFill beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaAutoFill',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info('get textAreaAutoFill state pages:' + JSON.stringify(pages));
        if (!('textAreaAutoFill' == pages.name)) {
          console.info('get textAreaAutoFill state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push textAreaAutoFill page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textAreaAutoFill page error:' + err);
      }
      done();
    });

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0100
     * @tc.name: AutoFillTextAreaTest_0100
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0100', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea3 = await driver.waitForComponent(ON.id('textArea3'), 2000);
      expect(textArea3 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea3';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.FULL_STREET_ADDRESS).assertEqual(3);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.FULL_STREET_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0200
     * @tc.name: AutoFillTextAreaTest_0200
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0200', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea4 = await driver.waitForComponent(ON.id('textArea4'), 2000);
      expect(textArea4 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea4';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.HOUSE_NUMBER).assertEqual(4);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.HOUSE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0300
     * @tc.name: AutoFillTextAreaTest_0300
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0300', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea5 = await driver.waitForComponent(ON.id('textArea5'), 2000);
      expect(textArea5 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea5';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.DISTRICT_ADDRESS).assertEqual(5);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.DISTRICT_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0400
     * @tc.name: AutoFillTextAreaTest_0400
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0400', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea6 = await driver.waitForComponent(ON.id('textArea6'), 2000);
      expect(textArea6 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea6';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.CITY_ADDRESS).assertEqual(6);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.CITY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0500
     * @tc.name: AutoFillTextAreaTest_0500
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0500', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea7 = await driver.waitForComponent(ON.id('textArea7'), 2000);
      expect(textArea7 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea7';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PROVINCE_ADDRESS).assertEqual(7);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PROVINCE_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0600
     * @tc.name: AutoFillTextAreaTest_0600
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0600', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0600_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea8 = await driver.waitForComponent(ON.id('textArea8'), 2000);
      expect(textArea8 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea8';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.COUNTRY_ADDRESS).assertEqual(8);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.COUNTRY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0700
     * @tc.name: AutoFillTextAreaTest_0700
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0700', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0700_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea9 = await driver.waitForComponent(ON.id('textArea9'), 2000);
      expect(textArea9 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea9';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FULL_NAME).assertEqual(9);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_FULL_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0800
     * @tc.name: AutoFillTextAreaTest_0800
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0800', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0800_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea10 = await driver.waitForComponent(ON.id('textArea10'), 2000);
      expect(textArea10 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea10';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_LAST_NAME).assertEqual(10);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_LAST_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_0900
     * @tc.name: AutoFillTextAreaTest_0900
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_0900', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_0900_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea11 = await driver.waitForComponent(ON.id('textArea11'), 2000);
      expect(textArea11 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea11';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FIRST_NAME).assertEqual(11);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_FIRST_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1000
     * @tc.name: AutoFillTextAreaTest_1000
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1000', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1000_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea12 = await driver.waitForComponent(ON.id('textArea12'), 2000);
      expect(textArea12 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea12';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PHONE_NUMBER).assertEqual(12);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1100
     * @tc.name: AutoFillTextAreaTest_1100
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1100', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea13 = await driver.waitForComponent(ON.id('textArea13'), 2000);
      expect(textArea13 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea13';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PHONE_COUNTRY_CODE).assertEqual(13);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PHONE_COUNTRY_CODE');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1200
     * @tc.name: AutoFillTextAreaTest_1200
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1200', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea14 = await driver.waitForComponent(ON.id('textArea14'), 2000);
      expect(textArea14 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea14';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.FULL_PHONE_NUMBER).assertEqual(14);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.FULL_PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1300
     * @tc.name: AutoFillTextAreaTest_1300
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1300', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea15 = await driver.waitForComponent(ON.id('textArea15'), 2000);
      expect(textArea15 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea15';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.EMAIL_ADDRESS).assertEqual(15);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.EMAIL_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1400
     * @tc.name: AutoFillTextAreaTest_1400
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1400', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea16 = await driver.waitForComponent(ON.id('textArea16'), 2000);
      expect(textArea16 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea16';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.BANK_CARD_NUMBER).assertEqual(16);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.BANK_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1500
     * @tc.name: AutoFillTextAreaTest_1500
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1500', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea17 = await driver.waitForComponent(ON.id('textArea17'), 2000);
      expect(textArea17 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea17';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.ID_CARD_NUMBER).assertEqual(17);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.ID_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1700
     * @tc.name: AutoFillTextAreaTest_1700
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1600', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1600_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea23 = await driver.waitForComponent(ON.id('textArea23'), 2000);
      expect(textArea23 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea23';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.NICKNAME).assertEqual(23);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.NICKNAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1700
     * @tc.name: AutoFillTextAreaTest_1700
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1700', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1700_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea24 = await driver.waitForComponent(ON.id('textArea24'), 2000);
      expect(textArea24 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea24';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.DETAIL_INFO_WITHOUT_STREET).assertEqual(24);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.DETAIL_INFO_WITHOUT_STREET');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1800
     * @tc.name: AutoFillTextAreaTest_1800
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1800', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1800_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea25 = await driver.waitForComponent(ON.id('textArea25'), 2000);
      expect(textArea25 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea25';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.FORMAT_ADDRESS).assertEqual(25);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.FORMAT_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextAreaAutoFill_1900
     * @tc.name: AutoFillTextAreaTest_1900
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillTextAreaTest_1900', 0, async (done: Function) => {
      const TAG = 'AutoFillTextAreaTest_1900_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea18 = await driver.waitForComponent(ON.id('textArea18'), 2000);
      expect(textArea18 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'textArea18';
      let strJson = getInspectorByKey(baseKey);
      console.info(TAG, 'End');
      done();
    })
  })
}