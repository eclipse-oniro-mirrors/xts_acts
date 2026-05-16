/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// import { beforeEach, describe, expect, it, Level, afterEach, beforeAll } from '@ohos/hypium';
// import Utils from '../common/Utils';
// import nativeFunc from 'libnativefunc.so'
// import nativeRender from 'libnativerender.so'
// // import { Driver, ON } from '@ohos.UiTest';
// import { Driver, ON, Component, Rect } from '@ohos.UiTest';
// import { JSON } from '@kit.ArkTS';
import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function nativeDragDropTest() {

  describe('nativeDragDropTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number    DragDropTest001
     * @tc.name      DragDropTest001
     * @tc.desc      DragDropTest001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('DragDropTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[DragDropTest001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'NativeDragDropTest';
      await Utils.pushPage(`nativeDragDropTest/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create();
      let dragVariable:Component = await driver.findComponent(ON.id('dragArea'));
      console.info('cxx1: ' + JSON.stringify(dragVariable));
      let dropVariable:Component = await driver.findComponent(ON.id('dropArea'));
      console.info('cxx2: ' + JSON.stringify(dropVariable));
      await dragVariable.dragTo(dropVariable);
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('dragArea');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[DragDropTest001] operation: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('ARKUI_DROP_OPERATION_MOVE');
      console.info('[DragDropTest001] END');
      done();
    });

    /**
     * @tc.number    DragDropTest002
     * @tc.name      DragDropTest002
     * @tc.desc      DragDropTest002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('DragDropTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[DragDropTest002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'NativeDragDropTest';
      await Utils.pushPage(`nativeDragDropTest/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver=  await Driver.create();
      let dragVariable:Component=await driver.findComponent(ON.id('dragArea'));
      let dropVariable:Component=await driver.findComponent(ON.id('dropArea'));
      let button:Component =await  driver.findComponent(ON.id('resetbutton'));
      let button1:Component =await driver.findComponent(ON.id('button1'));
      await button.click();
      await button1.click();
      await dragVariable.dragTo(dropVariable);
      await Utils.sleep(3000);
      let strJson1 = getInspectorByKey('dragArea');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[DragDropTest002] clip: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('ARKUI_DROP_OPERATION_COPY');
      console.info('[DragDropTest002] END');
      done();
    })
  })
}