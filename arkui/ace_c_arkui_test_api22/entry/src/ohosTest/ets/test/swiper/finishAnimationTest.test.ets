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

const SLEEP_TIME = 1000;
const SLEEP_TIME_2 = 2000;

export default function FinishAnimationTest(){

  describe('FinishAnimationTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.number FinishAnimationTest001
     * @tc.name FinishAnimationTest001
     * @tc.desc swiper FinishAnimation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FinishAnimationTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'finishAnimationTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('button1');
      let strJson3:string = getInspectorByKey('button3');
      console.log('FinishAnimationTest001: '+JSON.parse(strJsonNew).$attrs.label)
      console.log('FinishAnimationTest001: '+JSON.parse(strJson3).$attrs.label)
      expect(JSON.parse(strJsonNew).$attrs.label).assertEqual('StartStart');
      expect(JSON.parse(strJson3).$attrs.label).assertEqual('init');

      await Utils.sleep(SLEEP_TIME_2);
      strJsonNew = getInspectorByKey('button1');
      strJson3 = getInspectorByKey('button3');
      console.log('FinishAnimationTest001: '+JSON.parse(strJsonNew).$attrs.label)
      console.log('FinishAnimationTest001: strJson3 '+JSON.parse(strJson3).$attrs.label)
      expect(JSON.parse(strJsonNew).$attrs.label).assertEqual('EndEnd');
      expect(JSON.parse(strJson3).$attrs.label).assertEqual('0');
      await Utils.sleep(SLEEP_TIME);
      done();
    });

   /**
     * @tc.number FinishAnimationTest002
     * @tc.name FinishAnimationTest002
     * @tc.desc swiper FinishAnimation（nullptr）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FinishAnimationTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'finishAnimationTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('button2');
      console.log('FinishAnimationTest002: '+JSON.parse(strJsonNew).$attrs.label);
      expect(JSON.parse(strJsonNew).$attrs.label).assertEqual('401');
      await Utils.sleep(SLEEP_TIME);
      done();
    });
  })
}