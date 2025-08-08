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

import { expect, describe, it, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function SwiperChangeIndexTest(){

  describe('SwiperChangeIndexTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CHANGE_INDEX_0100
     * @tc.name       : swiperChangeIndexTest001
     * @tc.desc       : testing Swiper ChangeIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('swiperChangeIndexTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('swiperChangeIndexTest001 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('changeIndex_9'));
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest001=============');
      let strJson2: ESObject = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson2);
      console.info('=========swiperChangeIndexTest001=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest001' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual("9");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_001 END');
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CHANGE_INDEX_0200
     * @tc.name       : swiperChangeIndexTest001
     * @tc.desc       : testing Swiper ChangeIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('swiperChangeIndexTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('swiperChangeIndexTest002 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('changeIndex_-1'));
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest002=============');
      let strJson2: ESObject = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson2);
      console.info('=========swiperChangeIndexTest002=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest002' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual("0");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_002 END');
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CHANGE_INDEX_0300
     * @tc.name       : swiperChangeIndexTest003
     * @tc.desc       : testing Swiper ChangeIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('swiperChangeIndexTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('swiperChangeIndexTest003 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('changeIndex_1000'));
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest003=============');
      let strJson2: ESObject = getInspectorByKey('text3');
      let obj: ESObject = JSON.parse(strJson2);
      console.info('=========swiperChangeIndexTest003=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest003:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual("0");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_003 END');
      done();
    });
  })
}