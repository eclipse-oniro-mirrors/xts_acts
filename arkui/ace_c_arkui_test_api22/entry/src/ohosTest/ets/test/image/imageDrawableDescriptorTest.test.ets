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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

const SLEEP_TIME = 1000;

export default function ImageDrawableDescriptorTest(){

  describe('ImageDrawableDescriptorTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.name   imageDrawableDescriptorTest001
     * @tc.number imageDrawableDescriptorTest001
     * @tc.desc   Test the SetAnimationFrameDurations interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageDrawableDescriptorTest001', Level.LEVEL1, async (done: Function) => {
      console.info('imageDrawableDescriptorTest001 START');
      let PAGE_TAG = 'imageDrawableDescriptorTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('Button001'));
      await button.click();
      console.info('button1 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text001');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest001]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('500,1500,1000,3000,');
      console.info('imageDrawableDescriptorTest001 END');
      done();
    });

    /**
     * @tc.name   imageDrawableDescriptorTest002
     * @tc.number imageDrawableDescriptorTest002
     * @tc.desc   Test the functionality of the StartAnimation, StopAnimation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageDrawableDescriptorTest002', Level.LEVEL1, async (done: Function) => {
      console.info('imageDrawableDescriptorTest002 START');
      let PAGE_TAG = 'imageDrawableDescriptorTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button2 = await driver.findComponent(ON.id('Button003'));
      await button2.click();
      console.info('button3 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson2 = getInspectorByKey('text003');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest002]:' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('getStatus = 3');
      let button3 = await driver.findComponent(ON.id('Button002'));
      await button3.click();
      console.info('button2 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson3 = getInspectorByKey('text002');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest002]:' + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('getStatus = 1');
      let button4 = await driver.findComponent(ON.id('Button004'));
      await button4.click();
      console.info('button4 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson4 = getInspectorByKey('text004');
      let obj4: ESObject = JSON.parse(strJson4);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest002]:' + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('getStatus = 2');
      let button5 = await driver.findComponent(ON.id('Button005'));
      await button5.click();
      console.info('button5 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson5: string = getInspectorByKey('text005');
      let obj5: ESObject = JSON.parse(strJson5);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest002]:' + JSON.stringify(obj5.$attrs.content));
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('getStatus = 1');
      done();
    });

    /**
     * @tc.name   imageDrawableDescriptorTest003
     * @tc.number imageDrawableDescriptorTest003
     * @tc.desc   Test the AutoPlay interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('imageDrawableDescriptorTest003', Level.LEVEL2, async (done: Function) => {
      console.info('imageDrawableDescriptorTest003 START');
      let PAGE_TAG = 'imageDrawableDescriptorTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text006');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest003]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('AutoPlay = 1');
      let strJson1 = getInspectorByKey('text007');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest003]:' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('AutoPlay = 0');
      done();
    });

    /**
     * @tc.name   imageDrawableDescriptorTest004
     * @tc.number imageDrawableDescriptorTest004
     * @tc.desc   Test the SetAnimationFrameDurations interface to set Outlier values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('imageDrawableDescriptorTest004', Level.LEVEL3, async (done: Function) => {
      console.info('imageDrawableDescriptorTest004 START');
      let PAGE_TAG = 'imageDrawableDescriptorTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('Button006'));
      await button.click();
      console.info('button6 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text008');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      console.info('[imageDrawableDescriptorTest004]:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1000,1000,1000,1000,');
      console.info('imageDrawableDescriptorTest001 END');
      done();
    });
  })
}