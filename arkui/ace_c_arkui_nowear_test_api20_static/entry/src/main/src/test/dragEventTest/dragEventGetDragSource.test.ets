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

import { expect, describe, it, afterEach, Level, describe,beforeAll } from '../../../../hypium';
import { Component, Driver, ON,  PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import inspector from '@ohos.arkui.inspector'
export default function dragEventGetDragSourceTest() {

  let PAGE_TAG = 'dragEventGetDragSource';

  describe('dragEventGetDragSourceTest', (): void  => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api20.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

   

  /**
     * @tc.number   dragEventGetDragSource001
     * @tc.name     dragEventGetDragSource001
     * @tc.desc     dragEventGetDragSource001
     * @tc.level    Level.LEVEL1
     */
    it('dragEventGetDragSource001', Level.LEVEL1, async (done: () => void): Promise<void> => {
    console.info('dragEventGetDragSource001 START');
    let PAGE_TAG = 'dragEventGetDragSource';
    await Utils.pushPage(`dragEvent/dragEventGetDragSource`)
    await Utils.sleep(2000)
    let driver =  Driver.create();
    let grid = await driver.findComponent(ON.id('image'));
    let button = await driver.findComponent(ON.id('dragArea'));
    await (grid?.dragTo(button!) as Promise<void>);
    await Utils.sleep(1000);
    let strJson = inspector.getInspectorByKey('image');
    let obj = JSON.parseJsonElement(strJson);
    console.info("[dragEventGetDragSource_001]:" + JSON.stringify(obj.getElement("$attrs").getString("backgroundColor")));
    expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');
    await Utils.sleep(1000)
    console.info('dragEventGetDragSource_001 END');
    done();
  });
  })
}