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

import { beforeEach, describe, expect, it, Level  } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function StyledStringTest(){

  describe('StyledStringTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      let PAGE_TAG = 'styledString';
      await Utils.pushPage(`styledString/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0100
     * @tc.name       : StyledStringTest001
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testStyledString001', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('but1'));
      await Utils.sleep(500);
      await button.click();
      await Utils.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor'));
      await Utils.sleep(500);
      await richEditor.longClick();
      await Utils.sleep(500);
      let selection = await driver.findComponent(ON.text('全选'));
      await Utils.sleep(500);
      await selection?.click();
      await Utils.sleep(500);
      let copy = await driver.findComponent(ON.text('复制'));
      await Utils.sleep(500);
      await copy.click();
      await Utils.sleep(500);
      let richEditor2 = await driver.findComponent(ON.id('richEditor2'));
      await richEditor2.longClick();
      await Utils.sleep(500);
      let paste = await driver.findComponent(ON.text('粘贴'));
      await Utils.sleep(500);
      await paste.click();
      await Utils.sleep(500);
      let button2 = await driver.findComponent(ON.id('but2'));
      await button2.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textString');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testStyledString001] component obj is: " + JSON.stringify(obj));
      console.info("[testStyledString001] content is: " + JSON.stringify(obj.$attrs.content));
      await Utils.sleep(1000);
      expect(obj.$attrs.content).assertEqual('0');
      done()
    })
  })
}