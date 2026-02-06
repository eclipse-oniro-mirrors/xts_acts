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

import { expect, describe, it, afterEach ,Level} from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function EmbeddedComponentOptionTest(){

  describe('EmbeddedComponentOptionTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testEmbeddedComponentOption001
     * @tc.number SUB_ARKUI_CAPI_EMBEDDEDCOMPONENTOPTION_0100
     * @tc.desc   testing EmbeddedComponentOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEmbeddedComponentOption001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestEmbeddedComponentOption';
      await Utils.pushPage(`EmbeddedComponentOption/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('text1_id'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('text_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text1_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}