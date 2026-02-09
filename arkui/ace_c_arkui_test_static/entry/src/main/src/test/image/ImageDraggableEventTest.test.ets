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

import { Component, Driver, ON } from '@ohos.UiTest';
import { ComponentInfo } from '../common/Interfaces';
import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
export default function imageDraggableEventTest() {

  describe('ImageDraggableEventTest', () => {

    let PAGE_TAG = 'ImageDraggableTest';

    
    
/**
     * @tc.number   testImageDraggable006
     * @tc.name     testImageDraggable006
     * @tc.desc     testImageDraggable006
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`image/${PAGE_TAG}`);
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let imageTrue: Component = await driver.findComponent(ON.id('imageDragTrue')) as Component;
      let dropTrue: Component = await driver.findComponent(ON.id('dropImageAreaTrue')) as Component;
      await imageTrue.dragTo(dropTrue);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textTrue');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })
  })
}
