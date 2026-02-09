'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, TestType, Size, Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function SwiperChangeIndexTest(){

  describe('SwiperChangeIndexTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   swiperChangeIndexTest001
     * @tc.name     swiperChangeIndexTest001
     * @tc.desc     swiperChangeIndexTest001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('swiperChangeIndexTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('swiperChangeIndexTest001 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('changeIndex_9')) as Component;
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest001=============');
      let strJson2 = inspector.getInspectorByKey('text1');
      let obj = JSON.parseJsonElement(strJson2);
      console.info('=========swiperChangeIndexTest001=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest001' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("9");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_001 END');
      done();
    });

    
    /**
     * @tc.number   swiperChangeIndexTest002
     * @tc.name     swiperChangeIndexTest002
     * @tc.desc     swiperChangeIndexTest002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('swiperChangeIndexTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('swiperChangeIndexTest002 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('changeIndex_-1')) as Component;
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest002=============');
      let strJson2 = inspector.getInspectorByKey('text2');
      let obj = JSON.parseJsonElement(strJson2);
      console.info('=========swiperChangeIndexTest002=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest002' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("0");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_002 END');
      done();
    });

    
    /**
     * @tc.number   swiperChangeIndexTest003
     * @tc.name     swiperChangeIndexTest003
     * @tc.desc     swiperChangeIndexTest003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('swiperChangeIndexTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('swiperChangeIndexTest003 START');
      let PAGE_TAG = 'SwiperChangeIndex';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('changeIndex_1000')) as Component;
      await button1.click();
      await Utils.sleep(1000);
      console.info('=========swiperChangeIndexTest003=============');
      let strJson2 = inspector.getInspectorByKey('text3');
      let obj = JSON.parseJsonElement(strJson2);
      console.info('=========swiperChangeIndexTest003=============');
      await Utils.sleep(1000);
      console.info('swiperChangeIndexTest003:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("0");
      await Utils.sleep(1000)
      await button1.click();
      console.info('swiperChangeIndexTest_003 END');
      done();
    });
  })
}