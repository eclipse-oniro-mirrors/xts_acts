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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';
import { Component, Driver, ON } from '@ohos.UiTest';
export default function imageDraggableEventTest() {

  describe('ImageDraggableEventTest', () => {

    let PAGE_TAG = 'ImageDraggableEventTest';

    /**
     * @tc.name   testImageDraggable006
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0600
     * @tc.desc   test image Draggable with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageDraggable006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`image/${PAGE_TAG}`);
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let imageTrue: Component = await driver.findComponent(ON.id('imageDragTrue'));
      let dropTrue: Component = await driver.findComponent(ON.id('dropImageAreaTrue'));
      await imageTrue.dragTo(dropTrue);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('textTrue').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })
  })
}
