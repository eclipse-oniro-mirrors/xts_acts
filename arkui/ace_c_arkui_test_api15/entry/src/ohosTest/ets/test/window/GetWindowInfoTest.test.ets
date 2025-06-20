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

export default function getWindowInfoTest(){

  describe('GetWindowInfoTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GETWINDOW_INFO_0100
     * @tc.name       : testGetWindowInfo001
     * @tc.desc       : testing Window Info
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetWindowInfo001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetWindowInfo';
      await Utils.pushPage(`window/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id0'));
      await button1.click();
      await Utils.sleep(1000)
      let button2 = await driver.findComponent(ON.id('button_id1'));
      await button2.click();
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('button_id2'));
      await button3.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id0').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button_id1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button_id2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GETWINDOW_INFO_0200
     * @tc.name       : testHostWindowInfoGetName002
     * @tc.desc       : testing Window Info Get Name
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHostWindowInfoGetName002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestHostWindowInfoGetName';
      await Utils.pushPage(`window/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id0'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id0').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GETWINDOW_INFO_0300
     * @tc.name       : testHostWindowInfoDestroy003
     * @tc.desc       : testing Host Window Info Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHostWindowInfoDestroy003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestHostWindowInfoDestroy';
      await Utils.pushPage(`window/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id0'));
      await button1.click();
      await Utils.sleep(1000)
      let button2 = await driver.findComponent(ON.id('button_id1'));
      await button2.click();
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('button_id2'));
      await button3.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id0').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button_id1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button_id2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}