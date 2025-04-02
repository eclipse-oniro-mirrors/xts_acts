/*
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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function animatorEventTest(){

  describe('AnimatorEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0100
     * @tc.name       : testKeyframeRegisterOnFinish_001
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeRegisterOnFinish_001', 0, async (done: Function) => {
      let PAGE_TAG = 'TestKeyframeRegisterOnFinish';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0200
     * @tc.name       : testKeyframeRegisterOnEvent_002
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeRegisterOnEvent_002', 0, async (done: Function) => {
      let PAGE_TAG = 'TestKeyframeRegisterOnEvent';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0300
     * @tc.name       : testAnimatorRegisterOnFrame_003
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorRegisterOnFrame_003', 0, async (done: Function) => {
      let PAGE_TAG = 'TestAnimatorRegisterOnFrame';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('create'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('showContent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0400
     * @tc.name       : testAnimatorRegisterOnFinish_004
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorRegisterOnFinish_004', 0, async (done: Function) => {
      let PAGE_TAG = 'TestAnimatorRegisterOnFinish';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('play'));
      await button.click();
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('finish'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnFinish').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0500
     * @tc.name       : testAnimatorRegisterOnCancel_005
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorRegisterOnCancel_005', 0, async (done: Function) => {
      let PAGE_TAG = 'TestAnimatorRegisterOnCancel';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('play'));
      await button.click();
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('cancel'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnCancel').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOR_EVENT_0600
     * @tc.name       : testAnimatorRegisterOnRepeat_006
     * @tc.desc       : testing Animator Event
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorRegisterOnRepeat_006', 0, async (done: Function) => {
      let PAGE_TAG = 'TestAnimatorRegisterOnRepeat';
      await Utils.pushPage(`animation/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('repeat'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnRepeat').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}