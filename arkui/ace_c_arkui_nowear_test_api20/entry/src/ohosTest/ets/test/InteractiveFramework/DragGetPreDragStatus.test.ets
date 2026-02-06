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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';
import nativeRender from 'libnativerender.so';
import { Component, Driver, ON } from '@kit.TestKit';

export default function DragGetPreDragStatusTest() {

  describe('DragGetPreDragStatusTest', () => {

    let PAGE_TAG = 'DragGetPreDragStatusTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`InteractiveFramework/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   DragGetPreDragStatusTest001
     * @tc.number DragGetPreDragStatusTest001
     * @tc.desc   Test Drag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragGetPreDragStatusTest001', Level.LEVEL1, async (done: Function) => {
      console.info('DragGetPreDragStatusTest001 START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let textDragTest1: Component = await driver.findComponent(ON.id('textDragTest1'));
      let textDragTest2: Component = await driver.findComponent(ON.id('textDragTest2'));
      await textDragTest1.dragTo(textDragTest2);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('textDragTest1').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    })

    /**
     * @tc.name   DragGetPreDragStatusTest002
     * @tc.number DragGetPreDragStatusTest002
     * @tc.desc   Test Drag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragGetPreDragStatusTest002', Level.LEVEL1, async (done: Function) => {
      console.info('DragGetPreDragStatusTest002 START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let textDragTest2: Component = await driver.findComponent(ON.id('textDragTest2'));
      let point = await textDragTest2.getBoundsCenter();
      await driver.longClickAt({ x: point.x, y: point.y, displayId: 0 }, 3000);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('textDragTest2').$attrs.backgroundColor).assertEqual('#FF00FF00');
      done();
    })

    /**
     * @tc.name   DragGetPreDragStatusTest003
     * @tc.number DragGetPreDragStatusTest003
     * @tc.desc   Test Drag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DragGetPreDragStatusTest003', Level.LEVEL1, async (done: Function) => {
      console.info('DragGetPreDragStatusTest003 START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let dragBt3: Component = await driver.findComponent(ON.id('dragBt3'));
      let dropBt3: Component = await driver.findComponent(ON.id('dropBt3'));
      await dragBt3.dragTo(dropBt3);
      await Utils.sleep(2000);
      expect(nativeRender.Enum_ARKUI_DRAG_STATUS_STARTED()).assertEqual(0)
      done();
    })


  })
}