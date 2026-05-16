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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function ConvertPositionFromWindowTest(){

  describe('ConvertPositionFromWindowTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   ConvertPositionFromWindowTest_001
     * @tc.number ConvertPositionFromWindowTest_001
     * @tc.desc   Test ConvertPositionFromWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConvertPositionFromWindowTest_001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ConvertPositionFromWindowTest';
      await Utils.pushPage(`node/${PAGE_TAG}`);
      await Utils.sleep(500)
      let driver = await Driver.create()
      await Utils.sleep(500)
      let button1 = await driver.findComponent(ON.id('btn_onClick5_id'));
      await button1.click();
      await Utils.sleep(500)
      expect(Utils.getComponentInfoByKey('btn_onClick5_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('btn_onClick1_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('btn_onClick9_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}