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
import {Driver, ON} from '@ohos.UiTest'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import ContentType from './AutoFillEnum';

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function textInputAutoFillJsUnit() {
  describe('textInputAutoFillTest', async () => {
    beforeEach(async (done: Function) => {
      console.info('textInputAutoFill beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textInputAutoFill',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info('get textInputAutoFill state pages:' + JSON.stringify(pages));
        if (!('textInputAutoFill' == pages.name)) {
          console.info('get textInputAutoFill state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push textInputAutoFill page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textInputAutoFill page error:' + err);
      }
      done();
    });

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0100
     * @tc.name: AutoFillContextualizationTest_0100
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0100',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password3 = await driver.waitForComponent(ON.id('password3'), 2000);
      expect(password3 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password3';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.FULL_STREET_ADDRESS).assertEqual(3);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.FULL_STREET_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0200
     * @tc.name: AutoFillContextualizationTest_0200
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0200',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password4 = await driver.waitForComponent(ON.id('password4'), 2000);
      expect(password4 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password4';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.HOUSE_NUMBER).assertEqual(4);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.HOUSE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0300
     * @tc.name: AutoFillContextualizationTest_0300
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0300',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password5 = await driver.waitForComponent(ON.id('password5'), 2000);
      expect(password5 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password5';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.DISTRICT_ADDRESS).assertEqual(5);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.DISTRICT_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0400
     * @tc.name: AutoFillContextualizationTest_0400
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0400',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password6 = await driver.waitForComponent(ON.id('password6'), 2000);
      expect(password6 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password6';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.CITY_ADDRESS).assertEqual(6);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.CITY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0500
     * @tc.name: AutoFillContextualizationTest_0500
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0500',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password7 = await driver.waitForComponent(ON.id('password7'), 2000);
      expect(password7 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password7';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PROVINCE_ADDRESS).assertEqual(7);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PROVINCE_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0600
     * @tc.name: AutoFillContextualizationTest_0600
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0600',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0600_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password8 = await driver.waitForComponent(ON.id('password8'), 2000);
      expect(password8 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password8';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.COUNTRY_ADDRESS).assertEqual(8);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.COUNTRY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0700
     * @tc.name: AutoFillContextualizationTest_0700
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0700',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0700_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password9 = await driver.waitForComponent(ON.id('password9'), 2000);
      expect(password9 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password9';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FULL_NAME).assertEqual(9);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_FULL_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0800
     * @tc.name: AutoFillContextualizationTest_0800
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0800',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0800_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password10 = await driver.waitForComponent(ON.id('password10'), 2000);
      expect(password10 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password10';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_LAST_NAME).assertEqual(10);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_LAST_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_0900
     * @tc.name: AutoFillContextualizationTest_0900
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_0900',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_0900_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password11 = await driver.waitForComponent(ON.id('password11'), 2000);
      expect(password11 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password11';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FIRST_NAME).assertEqual(11);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PERSON_FIRST_NAME');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1000
     * @tc.name: AutoFillContextualizationTest_1000
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1000',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1000_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password12 = await driver.waitForComponent(ON.id('password12'), 2000);
      expect(password12 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password12';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PHONE_NUMBER).assertEqual(12);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1100
     * @tc.name: AutoFillContextualizationTest_1100
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1100',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password13 = await driver.waitForComponent(ON.id('password13'), 2000);
      expect(password13 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password13';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.PHONE_COUNTRY_CODE).assertEqual(13);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.PHONE_COUNTRY_CODE');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1200
     * @tc.name: AutoFillContextualizationTest_1200
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1200',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password14 = await driver.waitForComponent(ON.id('password14'), 2000);
      expect(password14 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password14';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.FULL_PHONE_NUMBER).assertEqual(14);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.FULL_PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1300
     * @tc.name: AutoFillContextualizationTest_1300
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1300',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password15 = await driver.waitForComponent(ON.id('password15'), 2000);
      expect(password15 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password15';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.EMAIL_ADDRESS).assertEqual(15);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.EMAIL_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1400
     * @tc.name: AutoFillContextualizationTest_1400
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1400',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password16 = await driver.waitForComponent(ON.id('password16'), 2000);
      expect(password16 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password16';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.BANK_CARD_NUMBER).assertEqual(16);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.BANK_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1500
     * @tc.name: AutoFillContextualizationTest_1500
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1500',0, async (done: Function) => {
      const TAG = 'AutoFillContextualizationTest_1500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let password17 = await driver.waitForComponent(ON.id('password17'), 2000);
      expect(password17 != null).assertEqual(true);
      await sleep(2000);
      let baseKey = 'password17';
      let strJson = getInspectorByKey(baseKey);
      expect(ContentType.ID_CARD_NUMBER).assertEqual(17);
      expect(JSON.parse(strJson).$attrs.contentType).assertEqual('TextContentType.ID_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_TextInputAutoFill_1600
     * @tc.name: AutoFillContextualizationTest_1600
     * @tc.desc: Verify that the contentType passed in is equal to the contentType in JSON.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level      : 0
     */
    it('AutoFillContextualizationTest_1600',0, async (done: Function) => {
        const TAG = 'AutoFillContextualizationTest_1600_TAG';
        console.info(TAG, 'Start');
        let driver = Driver.create();
        await driver.delayMs(500);
        let password18 = await driver.waitForComponent(ON.id('password18'), 2000);
        expect(password18 != null).assertEqual(true);
        await sleep(2000);
        let baseKey = 'password18';
        let strJson = getInspectorByKey(baseKey);
        console.info(TAG, 'End');
        done();
      })
  })
}
