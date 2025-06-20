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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from "../../MainAbility/common/Common"

let emitKey = 'emitUserAgent';

export default function previewBorderRadius() {
  describe('bindContextMenuPreviewBorderRadius', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindContextMenu/previewBorderRadius',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindContextMenuPreviewBorderRadius state success ' + JSON.stringify(pages));
        if (!('previewBorderRadius' == pages.name)) {
          console.info('get bindContextMenuPreviewBorderRadius state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push bindContextMenuPreviewBorderRadius page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindContextMenuPreviewBorderRadius page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
    * @tc.number    BindContextMenu_previewBorderRadius_001
    * @tc.name      BindContextMenu_previewBorderRadius_001
    * @tc.desc      set bindContextMenu previewBorderRadius:20
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('BindContextMenu_previewBorderRadius_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'BindContextMenu_previewBorderRadius_001';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let menu_1 = await driver.findComponent(ON.id('menu_1'));
      await menu_1.longClick();
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('text1');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('20');
      let btn1: Component = await driver.findComponent(ON.text('菜单选项'));
      btn1.click();
      console.info('[' + tagName + '] END============================');
      done();
    });
    /**
    * @tc.number    BindContextMenu_previewBorderRadius_002
    * @tc.name      BindContextMenu_previewBorderRadius_002
    * @tc.desc      set bindContextMenu previewBorderRadius:undefined
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('BindContextMenu_previewBorderRadius_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'BindContextMenu_previewBorderRadius_002';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let menu_2 = await driver.findComponent(ON.id('menu_2'));
      await menu_2.longClick();
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('text2');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('16');
      let btn1: Component = await driver.findComponent(ON.text('菜单选项'));
      btn1.click();
      console.info('[' + tagName + '] END============================');
      done();
    });
    /**
    * @tc.number    BindContextMenu_previewBorderRadius_003
    * @tc.name      BindContextMenu_previewBorderRadius_003
    * @tc.desc      set bindContextMenu previewBorderRadius:null
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('BindContextMenu_previewBorderRadius_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'BindContextMenu_previewBorderRadius_003';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let menu_3 = await driver.findComponent(ON.id('menu_3'));
      await menu_3.longClick();
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('text3');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('16');
      let btn1: Component = await driver.findComponent(ON.text('菜单选项'));
      btn1.click();
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}