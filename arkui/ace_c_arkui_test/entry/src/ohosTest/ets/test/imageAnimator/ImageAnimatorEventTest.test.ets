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
import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function imageAnimatorEventTest() {

  describe('ImageAnimatorEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })

    /**
     * @tc.name   testImageAnimatorOnStart001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_EVENT_ON_START_0100
     * @tc.desc   test OnStart and OnFinish event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorOnStart001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ImageAnimatorOnCancelTest';
      await Utils.pushPage(`imageAnimator/${PAGE_TAG}`);
      let driver = await Driver.create()
      let point = await driver.findComponent(ON.id('start'));
      await point.click();
      await Utils.sleep(2000);
      point = await driver.findComponent(ON.id('cancel'));
      await point.click();
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnStart').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testImageAnimatorOnPause001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_EVENT_ON_START_0100
     * @tc.desc   test OnStart and OnPause event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorOnPause001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ImageAnimatorOnPauseTest';
      await Utils.pushPage(`imageAnimator/${PAGE_TAG}`);
      let driver = await Driver.create()
      let point = await driver.findComponent(ON.id('start'));
      await point.click();
      await Utils.sleep(2000);
      point = await driver.findComponent(ON.id('pause'));
      await point.click();
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('OnPause').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testImageAnimatorOnFinish001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_EVENT_ON_START_0100
     * @tc.desc   test OnStart and OnFinish event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorOnFinish001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ImageAnimatorOnFinishTest';
      await Utils.pushPage(`imageAnimator/${PAGE_TAG}`);
      let driver = await Driver.create()
      let point = await driver.findComponent(ON.id('start'));
      await point.click();
      await Utils.sleep(2000);
      point = await driver.findComponent(ON.id('stop'));
      await point.click();
      await Utils.sleep(1000);
       console.log("testImageAnimatorOnFinish001 00");
      expect(Utils.getComponentInfoByKey('OnFinish').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testImageAnimatorOnRepeat001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_EVENT_ON_START_0100
     * @tc.desc   test OnStart and OnRepeat event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorOnRepeat001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ImageAnimatorOnRepeatTest';
      await Utils.pushPage(`imageAnimator/${PAGE_TAG}`);
      let driver = await Driver.create()
      let point = await driver.findComponent(ON.id('start'));
      await point.click();
      await Utils.sleep(1000);
      point = await driver.findComponent(ON.id('repeat'));
      await point.click();
      await Utils.sleep(10000)
      expect(Utils.getComponentInfoByKey('OnRepeat').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}
