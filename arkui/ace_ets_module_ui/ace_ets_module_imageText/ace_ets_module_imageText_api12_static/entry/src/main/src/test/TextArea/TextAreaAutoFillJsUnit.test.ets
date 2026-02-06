'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON,Component } from '@ohos.UiTest'
import router from '@ohos.router';
import Utils from './Utils';
import { ContentType } from './AutoFillEnum';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function textAreaAutoFillTest() {
  describe('textAreaAutoFillTest', () => {
    beforeAll(() => {
      console.info("textAreaAutoFillTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaAutoFillTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaAutoFill",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaAutoFillTest state pages:" + JSON.stringify(pages));
        if (!("textAreaAutoFill" == pages.name)) {
          console.info("get textAreaAutoFillTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaAutoFillTest page error:" + err);
      }
      console.info("textAreaAutoFillTest beforeEach end");
    }); 


    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0100
     * @tc.name     AutoFillTextAreaTest_static_0100
     * @tc.desc     AutoFillTextAreaTest_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea3 = await (driver.waitForComponent(ON.id('textArea3'), 2000) as Promise<Component>);
      expect(textArea3 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea3';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.FULL_STREET_ADDRESS).assertEqual(3);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.FULL_STREET_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0200
     * @tc.name     AutoFillTextAreaTest_static_0200
     * @tc.desc     AutoFillTextAreaTest_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea4 = await (driver.waitForComponent(ON.id('textArea4'), 2000) as Promise<Component>);
      expect(textArea4 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea4';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.HOUSE_NUMBER).assertEqual(4);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.HOUSE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0300
     * @tc.name     AutoFillTextAreaTest_static_0300
     * @tc.desc     AutoFillTextAreaTest_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea5 = await (driver.waitForComponent(ON.id('textArea5'), 2000) as Promise<Component>);
      expect(textArea5 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea5';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.DISTRICT_ADDRESS).assertEqual(5);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.DISTRICT_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0400
     * @tc.name     AutoFillTextAreaTest_static_0400
     * @tc.desc     AutoFillTextAreaTest_static_0400
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea6 = await (driver.waitForComponent(ON.id('textArea6'), 2000) as Promise<Component>);
      expect(textArea6 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea6';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.CITY_ADDRESS).assertEqual(6);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.CITY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0500
     * @tc.name     AutoFillTextAreaTest_static_0500
     * @tc.desc     AutoFillTextAreaTest_static_0500
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea7 = await (driver.waitForComponent(ON.id('textArea7'), 2000) as Promise<Component>);
      expect(textArea7 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea7';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PROVINCE_ADDRESS).assertEqual(7);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PROVINCE_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0600
     * @tc.name     AutoFillTextAreaTest_static_0600
     * @tc.desc     AutoFillTextAreaTest_static_0600
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0600_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea8 = await (driver.waitForComponent(ON.id('textArea8'), 2000) as Promise<Component>);
      expect(textArea8 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea8';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.COUNTRY_ADDRESS).assertEqual(8);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.COUNTRY_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0700
     * @tc.name     AutoFillTextAreaTest_static_0700
     * @tc.desc     AutoFillTextAreaTest_static_0700
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0700_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea9 = await (driver.waitForComponent(ON.id('textArea9'), 2000) as Promise<Component>);
      expect(textArea9 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea9';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FULL_NAME).assertEqual(9);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PERSON_FULL_NAME');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0800
     * @tc.name     AutoFillTextAreaTest_static_0800
     * @tc.desc     AutoFillTextAreaTest_static_0800
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0800_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea10 = await (driver.waitForComponent(ON.id('textArea10'), 2000) as Promise<Component>);
      expect(textArea10 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea10';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PERSON_LAST_NAME).assertEqual(10);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PERSON_LAST_NAME');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_0900
     * @tc.name     AutoFillTextAreaTest_static_0900
     * @tc.desc     AutoFillTextAreaTest_static_0900
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_0900_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea11 = await (driver.waitForComponent(ON.id('textArea11'), 2000) as Promise<Component>);
      expect(textArea11 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea11';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PERSON_FIRST_NAME).assertEqual(11);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PERSON_FIRST_NAME');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1000
     * @tc.name     AutoFillTextAreaTest_static_1000
     * @tc.desc     AutoFillTextAreaTest_static_1000
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1000_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea12 = await (driver.waitForComponent(ON.id('textArea12'), 2000) as Promise<Component>);
      expect(textArea12 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea12';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PHONE_NUMBER).assertEqual(12);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1100
     * @tc.name     AutoFillTextAreaTest_static_1100
     * @tc.desc     AutoFillTextAreaTest_static_1100
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1100_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea13 = await (driver.waitForComponent(ON.id('textArea13'), 2000) as Promise<Component>);
      expect(textArea13 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea13';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.PHONE_COUNTRY_CODE).assertEqual(13);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.PHONE_COUNTRY_CODE');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1200
     * @tc.name     AutoFillTextAreaTest_static_1200
     * @tc.desc     AutoFillTextAreaTest_static_1200
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1200_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea14 = await (driver.waitForComponent(ON.id('textArea14'), 2000) as Promise<Component>);
      expect(textArea14 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea14';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.FULL_PHONE_NUMBER).assertEqual(14);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.FULL_PHONE_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1300
     * @tc.name     AutoFillTextAreaTest_static_1300
     * @tc.desc     AutoFillTextAreaTest_static_1300
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1300_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea15 = await (driver.waitForComponent(ON.id('textArea15'), 2000) as Promise<Component>);
      expect(textArea15 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea15';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.EMAIL_ADDRESS).assertEqual(15);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.EMAIL_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1400
     * @tc.name     AutoFillTextAreaTest_static_1400
     * @tc.desc     AutoFillTextAreaTest_static_1400
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1400_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea16 = await (driver.waitForComponent(ON.id('textArea16'), 2000) as Promise<Component>);
      expect(textArea16 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea16';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.BANK_CARD_NUMBER).assertEqual(16);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.BANK_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1500
     * @tc.name     AutoFillTextAreaTest_static_1500
     * @tc.desc     AutoFillTextAreaTest_static_1500
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1500_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea17 = await (driver.waitForComponent(ON.id('textArea17'), 2000) as Promise<Component>);
      expect(textArea17 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea17';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.ID_CARD_NUMBER).assertEqual(17);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.ID_CARD_NUMBER');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1600
     * @tc.name     AutoFillTextAreaTest_static_1600
     * @tc.desc     AutoFillTextAreaTest_static_1600
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1600_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea23 = await (driver.waitForComponent(ON.id('textArea23'), 2000) as Promise<Component>);
      expect(textArea23 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea23';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.NICKNAME).assertEqual(23);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.NICKNAME');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1700
     * @tc.name     AutoFillTextAreaTest_static_1700
     * @tc.desc     AutoFillTextAreaTest_static_1700
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1700_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea24 = await (driver.waitForComponent(ON.id('textArea24'), 2000) as Promise<Component>);
      expect(textArea24 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea24';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.DETAIL_INFO_WITHOUT_STREET).assertEqual(24);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.DETAIL_INFO_WITHOUT_STREET');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1800
     * @tc.name     AutoFillTextAreaTest_static_1800
     * @tc.desc     AutoFillTextAreaTest_static_1800
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1800_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea25 = await (driver.waitForComponent(ON.id('textArea25'), 2000) as Promise<Component>);
      expect(textArea25 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea25';
      let strJson = inspector.getInspectorByKey(baseKey);
      expect(ContentType.FORMAT_ADDRESS).assertEqual(25);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType')).assertEqual('TextContentType.FORMAT_ADDRESS');
      console.info(TAG, 'End');
      done();
    })

    
    /**
     * @tc.number   AutoFillTextAreaTest_static_1900
     * @tc.name     AutoFillTextAreaTest_static_1900
     * @tc.desc     AutoFillTextAreaTest_static_1900
     * @tc.level   Level.LEVEL0
     */
    it('AutoFillTextAreaTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'AutoFillTextAreaTest_1900_TAG';
      console.info(TAG, 'Start');
      let driver = Driver.create();
      await driver.delayMs(500);
      let textArea18 = await (driver.waitForComponent(ON.id('textArea18'), 2000) as Promise<Component>);
      expect(textArea18 != null).assertEqual(true);
      await CommonFunc.sleep(2000);
      let baseKey = 'textArea18';
      let strJson = inspector.getInspectorByKey(baseKey);
      console.info(TAG, 'End');
      done();
    })
  })
}