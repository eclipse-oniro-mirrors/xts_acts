/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SwiperChangeIndexTest() {
  describe('SwiperChangeIndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwiperChangeIndexTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/SwiperChangeIndex',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwiperChangeIndexTest state pages: ' + JSON.stringify(pages));
        if (!('SwiperChangeIndex' == pages.name)) {
          console.info('get SwiperChangeIndexTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SwiperChangeIndexTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SwiperChangeIndexTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0100
     * @tc.number swiperChangeIndexTest_0100
     * @tc.desc   Set the ChangeIndex to Swiper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0100 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('text1');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      await CommonFunc.sleep(1000);
      console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
      expect(marq2).assertEqual("6");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0200
     * @tc.number swiperChangeIndexTest_0200
     * @tc.desc   Set the ChangeIndex to Swiper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0200 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('text2');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      await CommonFunc.sleep(1000);
      console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
       expect(marq2).assertEqual("0");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0300
     * @tc.number swiperChangeIndexTest_0300
     * @tc.desc   Set the ChangeIndex to Swiper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0300 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn3'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('text3');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      await CommonFunc.sleep(1000);
      console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
      expect(marq2).assertEqual("0");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0400
     * @tc.number swiperChangeIndexTest_0400
     * @tc.desc   Set the ChangeIndex to Swiper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0400 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn4'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('text4');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      await CommonFunc.sleep(1000);
      console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
      expect(marq2).assertEqual("");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0400 END');
      done();
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0500
     * @tc.number swiperChangeIndexTest_0500
     * @tc.desc   Set the ChangeIndex to Swiper.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0500 START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn5'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('text5');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      await CommonFunc.sleep(1000);
      console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
      expect(marq2).assertEqual("");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_0500 END');
      done();
    });
    
  })
}