/*
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';
import nativeFunc from 'libnativefunc.so'

export default function SwiperFakeTest() {

  describe('SwiperFakeTest', () => {

    let PAGE_TAG = 'SwiperFakeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`swiper/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   SwiperFakeTest_0100
     * @tc.number SwiperFakeTest_0100
     * @tc.desc   test OH_ArkUI_Swiper_ShowNext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0100',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0100 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn6Id'));
      await button.click();
      console.info('SwiperFakeTest_0100 111');
      await Utils.sleep(3000);
      let textJson1 = getInspectorByKey('SwiperAutoPlayText_10');
      let textobj1: ESObject = JSON.parse(textJson1);
      console.info('[SwiperFakeTest_0100] text content: ' + textobj1.$attrs.content);
      expect(textobj1.$attrs.content).assertEqual('10');

      let strJson1 = getInspectorByKey('btn6Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0100] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0100 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0200
     * @tc.number SwiperFakeTest_0200
     * @tc.desc   test OH_ArkUI_Swiper_ShowPrevious
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0200',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0200 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn7Id'));
      await button.click();
      console.info('SwiperFakeTest_0200 111');
      await Utils.sleep(1000);
      console.info('SwiperFakeTest_0200 222');
      let strJson1 = getInspectorByKey('SwiperAutoPlayText_0');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0200] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0');
      console.info('SwiperFakeTest_0200 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0300
     * @tc.number SwiperFakeTest_0300
     * @tc.desc   test OH_ArkUI_Swiper_IsFakeDragging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0300',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0300 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn9Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn9Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0900] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0300 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0400
     * @tc.number SwiperFakeTest_0400
     * @tc.desc   test errcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0400',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0400 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('errtestId'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('errtestId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0400] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('401Code');
      console.info('SwiperFakeTest_0400 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0500
     * @tc.number SwiperFakeTest_0500
     * @tc.desc   test errcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0500',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0500 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn5Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn5Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0500] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0500 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0600
     * @tc.number SwiperFakeTest_0600
     * @tc.desc   test errcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0600',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0600 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn4Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn4Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0600] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0600 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0700
     * @tc.number SwiperFakeTest_0700
     * @tc.desc   test errcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0700',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0700 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn3Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn3Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0700] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0700 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0800
     * @tc.number SwiperFakeTest_0800
     * @tc.desc   test errcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0800',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0800 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn2Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn2Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0800] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');
      console.info('SwiperFakeTest_0800 END');
      done();
    });

    /**
     * @tc.name   SwiperFakeTest_0900
     * @tc.number SwiperFakeTest_0900
     * @tc.desc   test OH_ArkUI_Swiper_StartFakeDrag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0900',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0900 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn1Id'));
      await button.click();
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('btn1Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0900] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0Code');

      console.info('SwiperFakeTest_0900 END');
      done();
    });

  })
}